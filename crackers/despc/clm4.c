/**
  Copyright © 2015 Odzhan. All Rights Reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are
  met:

  1. Redistributions of source code must retain the above copyright
  notice, this list of conditions and the following disclaimer.

  2. Redistributions in binary form must reproduce the above copyright
  notice, this list of conditions and the following disclaimer in the
  documentation and/or other materials provided with the distribution.

  3. The name of the author may not be used to endorse or promote products
  derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY AUTHORS "AS IS" AND ANY EXPRESS OR
  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT,
  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
  ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
  POSSIBILITY OF SUCH DAMAGE. */
 
#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <ctype.h>
#include <string.h>
#include <time.h>

#include <windows.h>

#ifdef _MSC_VER
#include <intrin.h>
#elif defined (__GNUC__)
#include <x86intrin.h>
#endif

#include "des_locl.h"
#include "spr.h"

#define MAX_PWD 7
#define MAX_ALPHA 256

DES_key_schedule ks_tbl[8][256];
DES_key_schedule ks[8];

char *alphabets[]=
{ "0123456789",                          // numeric
  "ABCDEFGHIJKLMNOPQRSTUVWXYZ",          // alpha
  " !\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"  // symbols
};

char alphabet[MAX_ALPHA+1];
uint32_t alpha_len;

DES_LONG lm_hash[2];

char     pwd[MAX_PWD+1], start_pwd[MAX_PWD+1], end_pwd[MAX_PWD+1];

uint32_t pwd_idx[16];

static __int64 start_cbn, end_cbn, total_cbn;
volatile __int64 computed;

time_t start_time, e_time;

//#pragma intrinsic (_InterlockedCompareExchange64)

/**
 *
 *  convert hexadecimal string to binary
 *
 */
int lm2bin(char lm[], void *in) {
  int     len, i, x;
  uint8_t *bin=(uint8_t*)in;
  
  len = strlen(lm);
  
  // lm hashes are 16 bytes
  if (len!=16) {
    return 0;
  }
  
  // of hexadecimal characters
  for (i=0; i<len; i++) {
    if (isxdigit((int)lm[i]) == 0) {
      return 0; 
    }
  }
  
  // convert to binary
  for (i=0; i<len/2; i++) {
    sscanf(&lm[i * 2], "%2x", &x);
    bin[i] = (uint8_t)x;
  } 
  return 1;
} 

/**
 *
 *  convert password to combinations
 *
 */ 
uint64_t pwd2cbn(char s[]) {
  uint64_t cbn = 0;
  uint64_t pwr = 1;
  int      pw_len, i, idx;
  char     *p;
  
  // get password length
  pw_len = strlen(s);
  
  // for password length
  for (i=0; i<pw_len; i++) {
    // get position of character in alphabet
    p = strchr(alphabet, s[i]);
    if (p == NULL) {
      // if character not found, return 0
      return 0;
    }
    // subtract alphabet address+1 from pointer
    idx = (p - alphabet + 1);
    // add 
    cbn += pwr * idx;
    // raise power    
    pwr *= alpha_len;
  } 
  return cbn; 
}

/**
 *
 *  convert combinations to indexes
 *
 */ 
void cbn2idx (uint32_t idx[], uint64_t cbn) 
{
  uint64_t pwr = alpha_len;
  int      pw_len, i;
  
  // determine the password length
  for (pw_len=1; cbn>=pwr; pw_len++) {
    cbn -= pwr; 
    pwr *= alpha_len;
  }
  
  // create indexes for number
  for (i=0; i<pw_len; i++) { 
    idx[i] = (cbn % alpha_len); 
    cbn /= alpha_len; 
  }
}

/**
 *
 *  old function used by LM hashes to create key from string
 *
 */ 
void DES_str_to_key (char str[], uint8_t key[]) 
{
  int i;

  key[0] = str[0] >> 1;
  key[1] = ((str[0] & 0x01) << 6) | (str[1] >> 2);
  key[2] = ((str[1] & 0x03) << 5) | (str[2] >> 3);
  key[3] = ((str[2] & 0x07) << 4) | (str[3] >> 4);
  key[4] = ((str[3] & 0x0F) << 3) | (str[4] >> 5);
  key[5] = ((str[4] & 0x1F) << 2) | (str[5] >> 6);
  key[6] = ((str[5] & 0x3F) << 1) | (str[6] >> 7);
  key[7] = str[6] & 0x7F;

  for (i = 0;i < 8;i++) {
      key[i] = (key[i] << 1);
  }
  DES_set_odd_parity ((DES_cblock*)key);
}

// precompute DES key schedules for alphabet
void DES_init_keys (void) 
{
  DES_cblock key;
  char       str[8];
  uint32_t   i, j;

  memset (str, 0, sizeof(str));
  
  // for 64-bit key
  for (i=0; i<8; i++) {
    // create alpha_len key schedules
    // that's one for each character at current key index i
    for (j=0; j<alpha_len; j++) {
      str[i] = alphabet[j];
      DES_str_to_key (str, (uint8_t*)&key);
      DES_set_key (&key, &ks_tbl[i][j]);
    }
    // clear byte
    str[i] = 0;
  }
}

// generate DES key schedule from precomputed keys
// as a function is slower, significantly more than using SSE2
void DES_set_keyx (uint32_t *key_idx, 
  DES_key_schedule *ks_out) 
{
  DES_LONG *src, *dst;
  int i, j;

  dst = (DES_LONG*)ks_out;
  
  for (i=0; i<32; i++) {
    dst[i] = 0;
  }
  
  for (i=0; i<MAX_PWD; i++) {
    if (key_idx[i]==-1) break;
    // get schedule based on index
    src = (DES_LONG*)&ks_tbl[i][key_idx[i]];
    
    // bit or with destination
    for (j=0; j<32; j++) {
      dst[j] |= src[j];
    }
  }
}

// set key using macro, faster using SSE2
#ifdef SSE2
#include <emmintrin.h>

#define DES_SET_KEY(key_idx) { \
  __m128i *sks = (__m128i*)&ks_tbl[key_idx-1][pwd_idx[key_idx-1]]; \
  __m128i *pks = (__m128i*)&ks[key_idx]; \
  __m128i *dks = (__m128i*)&ks[key_idx-1]; \
  if (key_idx == 7) { \
    for (j=0; j<sizeof(DES_key_schedule)/sizeof(__m128i); j++) { \
      dks[j] = sks[j]; \
    } \
  } else { \
    for (j=0; j<sizeof(DES_key_schedule)/sizeof(__m128i); j++) { \
      dks[j] = _mm_or_si128(sks[j], pks[j]); \
    } \
  } \
}
#else
#define DES_SET_KEY(key_idx) { \
  DES_LONG *sks = (DES_LONG*)&ks_tbl[key_idx-1][pwd_idx[key_idx-1]]; \
  DES_LONG *pks = (DES_LONG*)&ks[key_idx]; \
  DES_LONG *dks = (DES_LONG*)&ks[key_idx-1]; \
  if (key_idx == 7) { \
    for (j=0; j<(sizeof(DES_key_schedule)/sizeof(DES_LONG)); j++) { \
      dks[j] = sks[j]; \
    } \
  } else { \
    for (j=0; j<(sizeof(DES_key_schedule)/sizeof(DES_LONG)); j++) { \
      dks[j] = pks[j] | sks[j]; \
    } \
  } \
}
#endif

// basic function to generate passwords
// will encrypt known plaintext with DES and compare with LM ciphertext
DWORD crack_lm (LPVOID lpParam) 
{
  const char       pt[]="KGS!@#$%";
  DES_LONG         p1, p2;
  DES_LONG         c1, c2;
  DES_LONG         *x=(DES_LONG*)pt;
  uint64_t         total=total_cbn, i, j, sqr_len=alpha_len*alpha_len;
  
  register DES_LONG l, r, t, u;
#ifdef DES_PTR
  register const unsigned char *des_SP = (const unsigned char *)DES_SPtrans;
#endif
  register DES_LONG *s;
  
  // zero initialize key schedules
  for (i=0; i<8; i++) {
    memset (&ks[i], 0, sizeof (DES_key_schedule));
  }

  // set indexes to -1
  for (i=0; i<8; i++) 
    pwd_idx[i] = -1;
  
  // zero password
  for (i=0; i<8; i++) 
    pwd[i] = 0;
  
  // convert combinations to indexes
  cbn2idx(pwd_idx, start_cbn);
  
  computed=0;
  
  // perform initial permutation on plaintext
  p1 = x[0];
  p2 = x[1];
  IP(p1, p2);
  p1 = ROTATE(p1, 29) & 0xffffffffL;
  p2 = ROTATE(p2, 29) & 0xffffffffL;
                
  // perform initial permutation on ciphertext
  c1 = lm_hash[0];
  c2 = lm_hash[1];
  IP(c1, c2);
  c1 = ROTATE(c1, 29) & 0xffffffffL;
  c2 = ROTATE(c2, 29) & 0xffffffffL;
  
  // set initial key schedules
  for (i=MAX_PWD; i>0; i--) {
    if (pwd_idx[i-1] == -1) continue;
    //printf ("\nsetting %i\n", pwd_idx[i-1]);
    DES_SET_KEY(i);
  }
  
  goto compute_lm;
  
  do {
    DES_SET_KEY(7);
    do {
      DES_SET_KEY(6);
      do {
        DES_SET_KEY(5);
        do {
          DES_SET_KEY(4);
          do {
            DES_SET_KEY(3);
            do {
              DES_SET_KEY(2);
              do {
                DES_SET_KEY(1);
compute_lm:                
                r = p1;
                l = p2;
                
                s = ks->ks->deslong;

                D_ENCRYPT(l, r, 0);     /* 1 */
                D_ENCRYPT(r, l, 2);     /* 2 */
                D_ENCRYPT(l, r, 4);     /* 3 */
                D_ENCRYPT(r, l, 6);     /* 4 */
                D_ENCRYPT(l, r, 8);     /* 5 */
                D_ENCRYPT(r, l, 10);    /* 6 */
                D_ENCRYPT(l, r, 12);    /* 7 */
                D_ENCRYPT(r, l, 14);    /* 8 */
                D_ENCRYPT(l, r, 16);    /* 9 */
                D_ENCRYPT(r, l, 18);    /* 10 */
                D_ENCRYPT(l, r, 20);    /* 11 */
                D_ENCRYPT(r, l, 22);    /* 12 */
                D_ENCRYPT(l, r, 24);    /* 13 */
                D_ENCRYPT(r, l, 26);    /* 14 */
                D_ENCRYPT(l, r, 28);    /* 15 */

                computed++;
                
                if (c1 == l) {
                  D_ENCRYPT(r, l, 30);
                  if (c2 == r) {
                    for (i=0; i<MAX_PWD; i++) {
                      if (pwd_idx[i]==-1) break;
                      pwd[i] = alphabet[pwd_idx[i]];
                    }
                    return 1; // return found
                  }
                }                             
                
                if (--total == 0) return 0;
              } while (++pwd_idx[0] < alpha_len);
              pwd_idx[0] = 0;
            } while (++pwd_idx[1] < alpha_len);
            pwd_idx[1] = 0;
          } while (++pwd_idx[2] < alpha_len);
          pwd_idx[2] = 0;
        } while (++pwd_idx[3] < alpha_len);
        pwd_idx[3] = 0;
      } while (++pwd_idx[4] < alpha_len);
      pwd_idx[4] = 0;
    } while (++pwd_idx[5] < alpha_len);
    pwd_idx[5] = 0;
  } while (++pwd_idx[6] < alpha_len);
  
  return 0; // return not found
}

void show_stats (void) 
{
  uint32_t days, hours, minutes, seconds; 
  uint64_t cbn_cmp, eta, pct;
  uint64_t speed;
  uint64_t t;

  t = (time(0) - start_time);

  if (t==0) return;
  
  #ifdef _MSC_VER
    cbn_cmp=_InterlockedCompareExchange64(&computed, 0, -1);
  #elif defined(__GNUC__)
    cbn_cmp=__sync_val_compare_and_swap(&computed, 0, -1);
  #endif
  
  if (cbn_cmp==0) return;
  
  pct = (100 * cbn_cmp) / total_cbn;
    
  // time remaining is : (total combinations - completed) / average k/s
  eta = (total_cbn - cbn_cmp) / (cbn_cmp / t);
  // average keys per second is completed/seconds elapsed
  speed = (cbn_cmp/t);
  
  days=0;
  hours=0;
  minutes=0;

  seconds = eta;
  if (seconds>=60) {
    minutes = (seconds / 60);
    seconds %= 60;
    if (minutes>=60) {
      hours = minutes / 60;
      minutes %= 60;
      if (hours>=24) {
        days = hours/24;
        hours %= 24;
      }
    }
  }
  
  printf ("\r  [ processed %I64u keys out of %I64i at %.2fM k/s "
          ": %I64u%% complete. ETA: %u days %02u hours %02u minutes %02u seconds     ",
    cbn_cmp, total_cbn, (float)speed/1000/1000, pct, days, hours, minutes, seconds);
}

void usage(void)
{
  printf("  [ usage: clm [options] <hash>\n\n");
  printf("       -a <index>     can be combination of 3\n"
         "                      0=numeric\n" 
         "                      1=uppercase alpha\n"
         "                      2=symbols\n\n");
  printf("       -c <alphabet>  custom alphabet to use\n");
  printf("       -s <start>     start password\n");
  printf("       -e <end>       end password\n\n");
  exit(1);
}

char* getparam (int argc, char *argv[], int *i)
{
  int n=*i;
  if (argv[n][2] != 0) {
    return &argv[n][2];
  }
  if ((n+1) < argc) {
    *i=n+1;
    return argv[n+1];
  }
  printf ("  [ %c%c requires parameter\n", argv[n][0], argv[n][1]);
  exit (0);
}

/**F*****************************************************************/
void setw (SHORT X) 
/**
 * PURPOSE : set max width of console buffer
 *
 * RETURN :  Nothing
 *
 * NOTES :   None
 *
 *F*/
{
  CONSOLE_SCREEN_BUFFER_INFO csbi;
  
  GetConsoleScreenBufferInfo (GetStdHandle (STD_OUTPUT_HANDLE), &csbi);
  
  if (X <= csbi.dwSize.X) return;
  csbi.dwSize.X = X;
  SetConsoleScreenBufferSize (GetStdHandle (STD_OUTPUT_HANDLE), csbi.dwSize);
}

int main(int argc, char *argv[]) 
{
  time_t rawtime;
  struct tm * timeinfo;
  
  HANDLE hThread;
  DWORD found=0;
  
  int len, i;
  
  char *a_idx=NULL, *c_ab=NULL;
  char *e_pwd=NULL, *s_pwd=NULL, *h_in=NULL;
  char opt;
  
  setw (300);
  
  printf ("\n  [ clm - crack lanman hash\n\n");
  
  if (argc < 2) {
    usage();
  }
  
  for (i=1; i<argc; i++) 
  {
    if (argv[i][0]=='-' || argv[i][0]=='/')
    {
      opt=argv[i][1];
      switch (opt) {
        // use alphabet index
        case 'a':
          a_idx=getparam (argc, argv, &i);
          break;
        // use custom alphabet
        case 'c':
          c_ab=getparam (argc, argv, &i);
          break;
        // specify end password
        case 'e':
          e_pwd=getparam (argc, argv, &i);
          break;
        // specify start password
        case 's':
          s_pwd=getparam (argc, argv, &i);
          break;
        case 'h':
        case '?':
          usage();
          break;
        default:
          printf ("  [ unknown option %c", opt);
          break;
      }
    } else {
      h_in=argv[i];
    }
  }
  
  // got a hash?
  if (h_in==NULL) {
    printf ("  [ no hash specified\n");
    return 0;
  }

  // convert to binary
  if (!lm2bin(h_in, lm_hash)) {
    printf("\n  Invalid hash = %s", h_in);
    return 0;
  }
  
  // if alphabet specified, add each
  if (a_idx!=NULL) {
    len=strlen (a_idx);
    if (len>3) {
      printf ("  [ makes no sense to add > 3 alphabets\n");
      usage();
    }
    for (i=0; i<len; i++) {
      if (!isdigit (a_idx[i])) {
        printf ("  [ invalid alphabet selection\n");
        usage();
      }
      if (a_idx[i] < '0' || a_idx[i] > '2') {
        printf ("  [ invalid alphabet index\n");
        usage();
      }
      strncat (alphabet, alphabets[a_idx[i] - '0'], 
        MAX_ALPHA - strlen(alphabet));
    }
  } else 
  // custom alphabet? we don't check for duplicate characters
  if (c_ab!=NULL) {
    strncpy (alphabet, c_ab, MAX_ALPHA);
  } else {
  // no alphabet provided, just use alpha+numeric
    strncat (alphabet, alphabets[0], MAX_ALPHA);
    strncat (alphabet, alphabets[1], MAX_ALPHA - strlen (alphabet));
  }

  alpha_len = strlen (alphabet);
  
  // zero passwords
  memset (start_pwd, 0, sizeof (start_pwd));
  memset (end_pwd, 0, sizeof (end_pwd));
  
  // if no start, just set to first in alphabet
  if (s_pwd!=NULL) {
    strncpy (start_pwd, s_pwd, MAX_PWD);
  } else {
    start_pwd[0] = alphabet[0];
  }
  
  // if no end, set to end of alphabet
  if (e_pwd!=NULL) {
    strncpy (end_pwd, e_pwd, MAX_PWD);
  } else {
    for (i=0; i<MAX_PWD; i++) {
      end_pwd[i] = alphabet[alpha_len-1];
    }
  }
  
  // set start combination
  if ((start_cbn = pwd2cbn(start_pwd))==0) {
    printf ("  [ invalid start password\n");
    return 0;
  }
  
  // set end combination
  if ((end_cbn = pwd2cbn(end_pwd))==0) {
    printf ("  [ invalid end password\n");
    return 0;
  }
  
  // make sure start doesn't come after end
  if (start_cbn > end_cbn) {
    printf ("  [ invalid start and end passwords\n");
    return 0;
  }
  
  // subtract 1
  start_cbn--;
  // subtract start and end for total
  total_cbn = end_cbn - start_cbn;
  
  // precompute key schedules
  DES_init_keys();

  time ( &rawtime );
  timeinfo = localtime ( &rawtime );
  
  printf ("  [ starting on : %s",        asctime (timeinfo));
  printf ("  [ start pwd   : \"%s\"\n",  start_pwd);
  printf ("  [ end pwd     : \"%s\"\n",  end_pwd);
  printf ("  [ alphabet    : \"%s\"\n",  alphabet);
  printf ("  [ total pwd   : %I64i\n\n", total_cbn);
  
  start_time = time(0);
  
  hThread=CreateThread (NULL, 0, (LPTHREAD_START_ROUTINE)crack_lm, NULL, 0, NULL);
  
  SetThreadPriority (hThread, THREAD_PRIORITY_HIGHEST);
  
  do {
    i=WaitForSingleObject (hThread, 3*1000);
    // thread ended?
    if (i==WAIT_OBJECT_0 || i==WAIT_FAILED) {
      // was password found?
      GetExitCodeThread(hThread, &found);
      show_stats();
      if (found) {
        printf ("\n  [ password    : \"%s\"\n", pwd);
      }
      break;
    } else if (i==WAIT_TIMEOUT) {
      // update stats
      show_stats();
    }
  } while (1);
  
  e_time = clock();
  
  time ( &rawtime );
  timeinfo = localtime ( &rawtime );
  printf ("\n  [ ending on   : %s", asctime (timeinfo) );

  return 0;
}
