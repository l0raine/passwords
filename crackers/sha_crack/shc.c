/**
 *   SHA-1 password cracker v0.1
 *   Copyright (C) 2015 Odzhan
 *
 *   This program is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
 
#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <time.h>
#include <wchar.h>
#include <ctype.h>
#include <wctype.h>
#include <windows.h>
#include <intrin.h>

#include "operators.h"

#define MAX_PW 2

#define MAX_PWD 16
#define MAX_ALPHA 256
#define MAX_ALPHA_SETS 4

char *alphabets[MAX_ALPHA_SETS]=
{ "0123456789",                         // numeric
  "abcdefghijklmnopqrstuvwxyz",         // lowercase alpha
  "ABCDEFGHIJKLMNOPQRSTUVWXYZ",         // uppercase alpha
  " !\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~" // symbols
};

char alphabet[MAX_ALPHA+1];
uint32_t alpha_len;

uint32_t ntlm_hash[4];
__m128i mm_hash[4];

char start_pwd[MAX_PWD+1], end_pwd[MAX_PWD+1];

uint32_t pwd_idx[MAX_PW*WORDS_PER_VECTOR][MAX_PWD+1];
uint32_t pwd_len[MAX_PW*WORDS_PER_VECTOR];
uint8_t pwd[MAX_PW*WORDS_PER_VECTOR][64];

static uint64_t start_cbn, end_cbn, total_cbn;
volatile uint64_t computed;

time_t start_time, e_time;


/**
 *
 *  convert hexadecimal string to binary
 *
 */
int ntlm2bin(char ntlm[], void *out) {
  int     len, i, x;
  uint8_t *bin=(uint8_t*)out;
  
  len = strlen(ntlm);
  
  // ntntlm hashes are 32 bytes
  if (len!=32) {
    return 0;
  }
  
  // of hexadecimal characters
  for (i=0; i<len; i++) {
    if (isxdigit((int)ntlm[i]) == 0) {
      return 0; 
    }
  }
  
  // convert to binary
  for (i=0; i<len/2; i++) {
    sscanf(&ntlm[i * 2], "%2x", &x);
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
  int pw_len, i, idx;
  char *p;
  
  pw_len = strlen(s);
  
  for (i=0; i<pw_len; i++) {
    p = strchr(alphabet, s[i]);
    if (p == NULL) {
      return 0;
    }
    idx = (p - alphabet + 1);
    cbn += pwr * idx; 
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
  
  for (pw_len=1; cbn>=pwr; pw_len++) {
    cbn -= pwr; 
    pwr *= alpha_len;
  }
  
  for (i=0; i<pw_len; i++) { 
    idx[i] = (cbn % alpha_len); 
    cbn /= alpha_len; 
  }
}

char *cbn2pwd(uint64_t cbn, char s[]) {  
  uint64_t pwr = alpha_len; 
  size_t slen, idx;
  
  for (slen = 1;cbn >= pwr; slen++) {
    cbn -= pwr; 
    pwr *= alpha_len;
  }
  
  for (idx = 0;idx < slen;idx++) { 
    s[idx] = alphabet[ (cbn % alpha_len) ]; 
    cbn /= alpha_len; 
  }
  s[slen] = 0; 
  return s; 
}

#define F(b, c, d)	XOR((d), AND((b), XOR((c), (d))))
#define G(b, c, d)	OR(AND((b), OR((c), (d))), AND((c), (d)))
#define	H(b, c, d)	XOR((b), XOR((c), (d))) 

#define S(FF, A, B, C, D, x, t, s) { \
  for (j=0, i=0; i<MAX_PW; i++) { \
    if (x < 3 || x == 14) { \
      p1 = (uint32_t*)&pwd[j++][0]; \
      p2 = (uint32_t*)&pwd[j++][0]; \
      p3 = (uint32_t*)&pwd[j++][0]; \
      p4 = (uint32_t*)&pwd[j++][0]; \
      tmp = SET(p4[x], p3[x], p2[x], p1[x]); \
      (A[i]) = ADD((A[i]), ADD(FF((B[i]), (C[i]), (D[i])), ADD(tmp, SET1(t)))); \
    } else { \
      (A[i]) = ADD(ADD((A[i]), FF((B[i]), (C[i]), (D[i]))), SET1(t)); \
    } \
	  (A[i]) = ROL((A[i]), (s)); \
  } \
};

DWORD crack_ntlm (LPVOID lpParam)
{
  // initialize
  __m128i A[MAX_PW], B[MAX_PW], C[MAX_PW], D[MAX_PW];
  __m128i tmp;
  uint32_t *p1, *p2, *p3, *p4, mask1, mask2;
  uint32_t uint0, uint1, uint2, uint3;
  
  uint64_t vector_cbn  = ((total_cbn - (total_cbn % (MAX_PW*WORDS_PER_VECTOR))) / (MAX_PW*WORDS_PER_VECTOR));
  uint64_t start_count = start_cbn;
  int i, j;
  char pw[32];
  char *p;
  
  //printf ("\nwill compute %I64u each vector", vector_cbn);
  
  // initialize password buffers
  for (i=0; i<MAX_PW*WORDS_PER_VECTOR; i++) 
  {
    memset (pw, 0, sizeof(pw));
    
    cbn2pwd(start_count, pw);       // get the start password
    //printf ("\n start password for vector %i is %s", i, pw);
    
    strncpy(&pwd[i][0], pw, 32);    // copy password into local buffer 
    pwd_len[i] = strlen(pw);        // save length of password
    
    pwd[i][pwd_len[i]] = 0x80;      // add the end bit
    
    ((uint32_t*)pwd[i])[14] = pwd_len[i] * 8; // add the length in bits
    
    for (j = 0;j < MAX_PWD;j++) {     // initially set indexes to -1
      pwd_idx[i][j] = -1;
    }
    
    cbn2idx(&pwd_idx[i][0], start_count);     // now the correct indexes
    
    if (start_count + vector_cbn < end_cbn) {      // is this below the end?
      start_count += vector_cbn + 1;
    } else {
      start_count = end_cbn;
    }
    //cbn2pwd(start_count-1, pw);       // get the last password 
    //printf (" - %s", pw);
  }
  
  // now do the heavy work
  do {
    /**putchar('\n');
    for (i=0; i<MAX_PW*4; i++) {
      printf ("\n%i = %s", i, pwd[i]);
    }*/
    
    for (i = 0;i < MAX_PW;i++) {
      A[i] = SET1(0x67452301);
      B[i] = SET1(0xefcdab89);
      C[i] = SET1(0x98badcfe);
      D[i] = SET1(0x10325476);
    }
    
    S(F, A, B, C, D,  0, 0,  3);
    S(F, D, A, B, C,  1, 0,  7);
    S(F, C, D, A, B,  2, 0, 11);
    S(F, B, C, D, A,  3, 0, 19);
    S(F, A, B, C, D,  4, 0,  3);
    S(F, D, A, B, C,  5, 0,  7);
    S(F, C, D, A, B,  6, 0, 11);
    S(F, B, C, D, A,  7, 0, 19);
    S(F, A, B, C, D,  8, 0,  3);
    S(F, D, A, B, C,  9, 0,  7);
    S(F, C, D, A, B, 10, 0, 11);
    S(F, B, C, D, A, 11, 0, 19);
    S(F, A, B, C, D, 12, 0,  3);
    S(F, D, A, B, C, 13, 0,  7);
    S(F, C, D, A, B, 14, 0, 11);
    S(F, B, C, D, A, 15, 0, 19);

    S(G, A, B, C, D,  0, 0x5a827999,  3);
    S(G, D, A, B, C,  4, 0x5a827999,  5);
    S(G, C, D, A, B,  8, 0x5a827999,  9);
    S(G, B, C, D, A, 12, 0x5a827999, 13);
    S(G, A, B, C, D,  1, 0x5a827999,  3);
    S(G, D, A, B, C,  5, 0x5a827999,  5);
    S(G, C, D, A, B,  9, 0x5a827999,  9);
    S(G, B, C, D, A, 13, 0x5a827999, 13);
    S(G, A, B, C, D,  2, 0x5a827999,  3);
    S(G, D, A, B, C,  6, 0x5a827999,  5);
    S(G, C, D, A, B, 10, 0x5a827999,  9);
    S(G, B, C, D, A, 14, 0x5a827999, 13);
    S(G, A, B, C, D,  3, 0x5a827999,  3);
    S(G, D, A, B, C,  7, 0x5a827999,  5);
    S(G, C, D, A, B, 11, 0x5a827999,  9);
    S(G, B, C, D, A, 15, 0x5a827999, 13);

    S(H, A, B, C, D,  0, 0x6ed9eba1,  3);
    S(H, D, A, B, C,  8, 0x6ed9eba1,  9);
    S(H, C, D, A, B,  4, 0x6ed9eba1, 11);
    S(H, B, C, D, A, 12, 0x6ed9eba1, 15);
    S(H, A, B, C, D,  2, 0x6ed9eba1,  3);
    S(H, D, A, B, C, 10, 0x6ed9eba1,  9);
    S(H, C, D, A, B,  6, 0x6ed9eba1, 11);
    S(H, B, C, D, A, 14, 0x6ed9eba1, 15);
    S(H, A, B, C, D,  1, 0x6ed9eba1,  3);
    S(H, D, A, B, C,  9, 0x6ed9eba1,  9);
    S(H, C, D, A, B,  5, 0x6ed9eba1, 11);
    S(H, B, C, D, A, 13, 0x6ed9eba1, 15);
    S(H, A, B, C, D,  3, 0x6ed9eba1,  3);
    S(H, D, A, B, C, 11, 0x6ed9eba1,  9);
    S(H, C, D, A, B,  7, 0x6ed9eba1, 11);
    S(H, B, C, D, A, 15, 0x6ed9eba1, 15);

    for (i=0; i<MAX_PW; i++) {
      A[i] = ADD(A[i], SET1(0x67452301));
      B[i] = ADD(B[i], SET1(0xefcdab89));
      C[i] = ADD(C[i], SET1(0x98badcfe));
      D[i] = ADD(D[i], SET1(0x10325476));
    }
    
    computed += MAX_PW*4;
    
    /**
     * check results
     */
     
    for (i=0, j=0; i<MAX_PW; i++, j += 4) 
    {     
      mask1 = MASKB(CMPDEQ(A[i], mm_hash[0]));
      //mask2 = MASKB(CMPDEQ(B[i], mm_hash[1]));
      
      /**
      uint0 = _mm_cvtsi128_si32(A[i]);
      uint1 = _mm_cvtsi128_si32(_mm_shuffle_epi32(A[i], 0x39));
      uint2 = _mm_cvtsi128_si32(_mm_shuffle_epi32(A[i], 0x4e));
      uint3 = _mm_cvtsi128_si32(_mm_shuffle_epi32(A[i], 0x93));
      
      if (uint0 == ntlm_hash[i]) {
        pw = &pwd[j];
      } else if (uint1 == ntlm_hash[i]) {
        pw = &pwd[j+1];
        j += 1;
      } else if (uint2 == ntlm_hash[i]) {
        pw = &pwd[j+2];
        j += 2;
      } else if (uint3 == ntlm_hash[i]) {
        pw = &pwd[j+3];
        j += 3;
      }
      */
      if (mask1 != 0) {
        mask2 = MASKB(CMPDEQ(B[i], mm_hash[1]));
        
        if ((mask1 & 15) && (mask2 & 15)) {
          pwd[j][pwd_len[j]] = 0;
          printf("\nFound password : %s", pwd[j]);
          return 1;            
        } else 
        if (((mask1 & 0xFF00) && (mask2 & 0xFF00))) {
          pwd[j+1][pwd_len[j+1]] = 0;
          printf("\nFound password : %s", pwd[j+1]);
          return 1;            
        } else 
        if (((mask1 & 0xFF0000) && (mask2 & 0xFF0000))) {
          pwd[j+2][pwd_len[j+2]] = 0;
          printf("\nFound password : %s", pwd[j+2]);
          return 1;
        } else
        if (((mask1 & 0xFF000000) && (mask2 & 0xFF000000))) {
          pwd[j+3][pwd_len[j+3]] = 0;
          printf("\nFound password : %s", pwd[j+3]);
          return 1;
        }
      }
    }
    /**
     *
     *  update passwords  
     *
     */
    for (i=0; i<MAX_PW*4; i++) 
    {
      p = (char*)&pwd[i];
      for (j=0; ; j++) {
        if (++pwd_idx[i][j] != alpha_len) {
          p[j] = alphabet[ pwd_idx[i][j] ];
          break;
        }
        pwd_idx[i][j] = 0;
        p[j] = alphabet[0];
      }
      // have we reached new length?
      if (j == pwd_len[i]) {
        // update bits and length
        ++pwd_len[i];
        ((uint8_t*)p)[pwd_len[i]] = 0x80;
        ((uint32_t*)p)[14] = pwd_len[i] * 8;
      }
    }
    start_cbn += MAX_PW*4;
  } while (start_cbn < end_cbn);
  return 0;
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
  if (seconds>60) {
    minutes = (seconds / 60);
    seconds %= 60;
    if (minutes>60) {
      hours = minutes / 60;
      minutes %= 60;
      if (hours>24) {
        days = hours/24;
        hours %= 24;
      }
    }
  }
  
  printf ("\r  [ processed %I64u keys out of %I64u at %.2fM k/s "
          ": %I64u%% complete. ETA: %u days %02u hours %02u minutes %02u seconds     ",
    cbn_cmp, total_cbn, (float)speed/1000/1000, pct, days, hours, minutes, seconds);
}

void usage(void)
{
  printf("  [ usage: cnt [options] <hash>\n\n");
  printf("       -a <index>     can be combination of 3\n"
         "                      0=numeric\n" 
         "                      1=lowercase alpha\n" 
         "                      2=uppercase alpha\n"
         "                      3=symbols\n\n");
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
  
  printf ("\n  [ cnt - crack ntlm hash\n\n");
  
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
  if (!ntlm2bin(h_in, ntlm_hash)) {
    printf("  [ invalid hash = %s\n", h_in);
    return 0;
  }
  
  // initialize hash to find
  for (i=0; i<4; i++) {
    mm_hash[i] = SET1(ntlm_hash[i]);
  }
  
  // if alphabet specified, add each
  if (a_idx!=NULL) {
    len=strlen (a_idx);
    if (len>MAX_ALPHA_SETS) {
      printf ("  [ makes no sense to add > %i alphabets\n", MAX_ALPHA_SETS);
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
  // no alphabet provided, just use lowercase/uppercase alpha+numeric
    strncat (alphabet, alphabets[0], MAX_ALPHA);
    strncat (alphabet, alphabets[1], MAX_ALPHA - strlen (alphabet));
    strncat (alphabet, alphabets[2], MAX_ALPHA - strlen (alphabet));
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
    printf ("  [ invalid start and end passwords %llu > %llu\n", end_cbn, start_cbn);
    return 0;
  }
  
  // subtract 1
  start_cbn--;
  // subtract start and end for total
  total_cbn = end_cbn - start_cbn;
  
  time ( &rawtime );
  timeinfo = localtime ( &rawtime );
  
  printf ("  [ starting on : %s", asctime (timeinfo) );
  printf ("  [ start pwd   : \"%s\"\n", start_pwd);
  printf ("  [ end pwd     : \"%s\"\n", end_pwd);
  printf ("  [ alphabet    : \"%s\"\n", alphabet);
  printf ("  [ total pwd   : %I64u\n\n", total_cbn);
  
  start_time = time(0);
  
  hThread=CreateThread (NULL, 0, (LPTHREAD_START_ROUTINE)crack_ntlm, NULL, 0, NULL);
  
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
