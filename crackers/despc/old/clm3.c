/**

vs2010

start pwd : A
end pwd   : ZZZZZZZ
alphabet  : ABCDEFGHIJKLMNOPQRSTUVWXYZ
total pwd : 8353082582

password found: ZZZZZZ
 Completed: 321272406 4.08M k/s
 
intel compiler

start pwd : A
end pwd   : ZZZZZZZ
alphabet  : ABCDEFGHIJKLMNOPQRSTUVWXYZ
total pwd : 8353082582

password found: ZZZZZZ
 Completed: 321272406 5.68M k/s
 
 */
 
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <ctype.h>
#include <string.h>
#include <time.h>

#include "des.h"

#define MAX_PWD 7

char alphabet[]="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
int alpha_len;

DES_cblock lm_hash;

char pwd[8], start_pwd[8], end_pwd[8];
DES_key_schedule ks_tbl[8][256];

uint64_t start_cbn, end_cbn, total_cbn, completed;

/**
 *
 *  convert hexadecimal string to binary
 *
 */
int lm2bin(char lm[], uint8_t bin[]) {
  int len, i, x;

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
uint64_t pwd2cbn(char pwd[]) {
  uint64_t cbn = 0;
  uint64_t pwr = 1;
  int pw_len, idx, i;
  
  pw_len = strlen(pwd);
  
  for (i=0; i<pw_len; i++) {
    idx = strchr(alphabet, pwd[i]) - alphabet + 1;
    if (idx == 0) {
      return 0;
    }
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
void cbn2idx (int idx[], uint64_t cbn) 
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
  int i, j;
  int alpha_len=strlen(alphabet);
  
  memset (str, 0, sizeof(str));
  
  // for 64-bit key
  for (i=0; i<8; i++) {
    // create 256 key schedules
    for (j=0; j<alpha_len; j++) {
      str[i] = alphabet[j];
      DES_str_to_key (str, (uint8_t*)&key);
      DES_set_key (&key, &ks_tbl[i][j]);
    }
    // clear byte
    str[i] = 0;
  }
}

// generate key schedule from precomputed keys
void DES_set_keyx (uint32_t *key_idx, 
  DES_key_schedule *ks) 
{
  DES_LONG *src, *dst;
  int i, j;

  dst = (DES_LONG*)ks;
  
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

#define DES_SET_KEY(key_idx) { \
  s = &ks_tbl[key_idx-1][idx[key_idx-1]]; \
  p = &ks[key_idx]; \
  d = &ks[key_idx-1]; \
  for (i=0; i<(sizeof(DES_key_schedule)/sizeof(DES_LONG)); i++) { \
    ((DES_LONG*)d)[i+0] = ((DES_LONG*)p)[i+0] | ((DES_LONG*)s)[i+0]; \
  } \
}

// basic function to generate passwords and test
int crack_lm (void) 
{
  uint32_t         idx[8];
  int              i, found=0;
  const char       pt[]="KGS!@#$%";
  DES_cblock       key, ct;
  DES_key_schedule ks[8];
  DES_key_schedule *s, *p, *d;
  
  // zero initialize key schedules
  for (i=0; i<8; i++) 
    memset (&ks[i], 0, sizeof (DES_key_schedule));
  
  // set indexes to -1
  for (i=0; i<8; i++) 
    idx[i] = -1;
  
  // zero password
  for (i=0; i<8; i++) 
    pwd[i] = 0;
  
  // convert combinations to indexes
  cbn2idx(idx, start_cbn);
  
  completed=0;
  
  goto check_pw;
  
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
check_pw:
                DES_SET_KEY(1);
                
                DES_ecb_encrypt ((DES_cblock*)pt, 
                  &ct, &ks[0], DES_ENCRYPT);
                
                completed++;
                
                // check if it matches our hash
                if (memcmp (ct, lm_hash, 
                  sizeof(DES_cblock))==0) 
                {
                  for (i=0; i<8; i++) {
                    if (idx[i]==-1) break;
                    pwd[i] = alphabet[idx[i]];
                  }
                  found++;
                  goto exit_crack;
                }
                             
              } while (++idx[0] < alpha_len);
              idx[0] = 0;
            } while (++idx[1] < alpha_len);
            idx[1] = 0;
          } while (++idx[2] < alpha_len);
          idx[2] = 0;
        } while (++idx[3] < alpha_len);
        idx[3] = 0;
      } while (++idx[4] < alpha_len);
      idx[4] = 0;
    } while (++idx[5] < alpha_len);
    idx[5] = 0;
  } while (++idx[6] < alpha_len);
exit_crack:
  return found;
}

int main(int argc, char *argv[]) 
{
  clock_t start_time;
  float fTime, speed;
  
  if (argc != 2) {
    printf("\n  Usage: clm <hash>\n");
    exit(1);
  }
  
  // convert hash to binary
  if (!lm2bin(argv[1], lm_hash)) {
    printf("\n  Invalid hash = %s", argv[1]);
    exit(2);
  }
  
  memset (start_pwd, 0, sizeof (start_pwd));
  memset (end_pwd, 0, sizeof (end_pwd));
  
  strncpy (start_pwd, "A", MAX_PWD);
  strncpy (end_pwd, "ZZZZZZZ", MAX_PWD);
  
  alpha_len = strlen(alphabet);
  start_cbn = pwd2cbn(start_pwd);
  end_cbn = pwd2cbn(end_pwd);
  
  start_cbn--;
  total_cbn = end_cbn - start_cbn;
  
  // precompute key schedules
  DES_init_keys();
  
  printf ("\nstart pwd : %s", start_pwd);
  printf ("\nend pwd   : %s",   end_pwd);
  printf ("\nalphabet  : %s",  alphabet);
  printf ("\ntotal pwd : %lld\n",  total_cbn);
  
  start_time = clock();
  
  if (crack_lm()) {
    printf ("\npassword found: %s", pwd);
  } else {
    printf ("\nunable to find password");
  }
  
  fTime = 1.0f * (clock() - start_time) / CLOCKS_PER_SEC;
  speed = (float)completed / fTime / 1000000;
  
  printf("\n Completed: %lld %.2fM k/s", completed, speed);
  return 0;
}
