
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <time.h>
#include <wchar.h>
#include <ctype.h>
#include <wctype.h>
#include <windows.h>
#include <emmintrin.h>

#define MAX_PWD 32
#define MAX_ALPHA 256

char *alphabets[]=
{ "0123456789",                       // numeric
  "abcdefghijklmnopqrstuvwxyz",       // lowercase alpha
  "ABCDEFGHIJKLMNOPQRSTUVWXYZ",       // uppercase alpha
  "!\"$%^&*()_+{}:@~<>?|\\[];'#,./-=" // symbols
};

char alphabet[MAX_ALPHA+1];
uint32_t alpha_len;

DES_LONG lm_hash[2];

char     pwd[MAX_PWD+1], start_pwd[MAX_PWD+1], end_pwd[MAX_PWD+1];

uint32_t pwd_idx[16];

static __int64 start_cbn, end_cbn, total_cbn;
volatile __int64 computed;

time_t start_time, e_time;


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
  
  printf ("  [ starting on : %s", asctime (timeinfo) );
  printf ("  [ start pwd   : \"%s\"\n", start_pwd);
  printf ("  [ end pwd     : \"%s\"\n", end_pwd);
  printf ("  [ alphabet    : \"%s\"\n", alphabet);
  printf ("  [ total pwd   : %I64i\n\n", total_cbn);
  
  start_time = time(0);
  
  hThread=CreateThread (NULL, 0, (LPTHREAD_START_ROUTINE)crack_lm, NULL, 0, NULL);
  
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
