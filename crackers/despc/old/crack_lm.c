
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <ctype.h>
#include <string.h>
#include <wchar.h>
#include <time.h>

#include "des.h"

char start_pw[256], end_pw[256];
char alphabet[256];
size_t alpha_len;
uint64_t start_cbn, end_cbn, total_cbn;
uint64_t completed;
uint32_t hash[8];
const char ptext[]="KGS!@#$%";

DES_key_schedule ks[8];
DES_key_schedule ks_tbl[8][256];

#define DES_SET_KEY(idx) { \
  s = &ks_tbl[idx-1][key_idx[idx-1]]; \
  p = &ks[idx]; \
  d = &ks[idx-1]; \
  for (i = 0;i < (sizeof(DES_key_schedule) / sizeof(DES_LONG)); i++) { \
    ((DES_LONG*)d)[i+0] = ((DES_LONG*)p)[i+0] | ((DES_LONG*)s)[i+0]; \
  } \
}

/**
 *
 *  convert hexadecimal string to binary
 *
 */
size_t hex2bin(const char hex[], uint8_t bin[]) {
  size_t len, i;
  int number;
  
  len = strlen(hex);
  
  if ((len % 2) != 0) {
    return 0; 
  }
  
  for (i = 0;i < len;i++) {
    if (isxdigit((int)hex[i]) == 0) {
      return 0; 
    }
  }
  
  for (i = 0;i < len / 2;i++) {
    sscanf(&hex[i * 2], "%2x", &number);
    bin[i] = (uint8_t)number;
  } 
  return len / 2;
} 

/**
 *
 *  convert password string to combination index
 *
 */ 
uint64_t pw2cbn(const char pw[]) {
  uint64_t cbn = 0;
  uint64_t pwr = 1;
  size_t pw_len, idx;
  int i;
  
  pw_len = strlen(pw);
  
  for (i = 0;i < pw_len;i++) {
    idx = strchr(alphabet, pw[i]) - alphabet + 1;
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
 *  create DES keys for an alphabet
 *
 */ 
void DES_init_keys(const char s[]) {
  uint8_t key[8], pw[8];
  size_t i, j, len;
  
  len = strlen(s);
  
  for (i = 0; i < 8; i++) {
    memset(pw, 0, sizeof(pw));
    for (j = 0; j < len; j++) {
      pw[i] = s[j];
      DES_str_to_key(pw, key);
      DES_set_key(key, &ks_tbl[i][j]);
    }
  }
}
    
void dump_pw(uint32_t idx[]) {
  int i;
  printf("\n");
  for (i = 0;i < 8 && idx[i] != -1;i++) {
    printf("%c", alphabet[ idx[i] ]);
  }
}

void lm_fast(DES_LONG ptext[], DES_LONG ctext[]) {
  int i;
  DES_LONG rx[2];
  uint32_t key_idx[16];
  DES_key_schedule *s, *p, *d;
  DES_LONG l, r, t, u;
  const uint8_t *des_SP = (const uint8_t *)DES_SPtrans;
  DES_LONG *x;
  DES_LONG p1, p2;
  DES_LONG c1, c2;
  DES_key_schedule buf_one;
  
  p1 = ptext[0];
  p2 = ptext[1];
  IP(p1, p2);
  p1 = ROTATE(p1, 29) & 0xffffffffL;
  p2 = ROTATE(p2, 29) & 0xffffffffL;
                
  c1 = ctext[0];
  c2 = ctext[1];
  IP(c1, c2);
  c1 = ROTATE(c1, 29) & 0xffffffffL;
  c2 = ROTATE(c2, 29) & 0xffffffffL;
                
  completed = 0;
  for (i = 0;i < 16;i++) {
    key_idx[i] = -1; //alpha_len;
  }
  key_idx[0] = 0;
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

                r = p1;
                l = p2;

                x = ks[0].ks->deslong;
                
                D_ENCRYPT(l, r,  0);
                D_ENCRYPT(r, l,  2);
                D_ENCRYPT(l, r,  4);
                D_ENCRYPT(r, l,  6);
                D_ENCRYPT(l, r,  8);
                D_ENCRYPT(r, l, 10);
                D_ENCRYPT(l, r, 12);
                D_ENCRYPT(r, l, 14);
                D_ENCRYPT(l, r, 16);
                D_ENCRYPT(r, l, 18);
                D_ENCRYPT(l, r, 20);
                D_ENCRYPT(r, l, 22);
                D_ENCRYPT(l, r, 24);
                D_ENCRYPT(r, l, 26);
                D_ENCRYPT(l, r, 28);
                
                if (c1 == l) {
                  D_ENCRYPT(r, l, 30);
                  if (c2 == r) {
                    printf("\nFound password");
                    dump_pw(key_idx);
                    return;
                  }
                }
                
                completed++;                
              } while (++key_idx[0] < alpha_len);
              key_idx[0] = 0;
            } while (++key_idx[1] < alpha_len);
            key_idx[1] = 0;
          } while (++key_idx[2] < alpha_len);
          key_idx[2] = 0;
        } while (++key_idx[3] < alpha_len);
        key_idx[3] = 0;
      } while (++key_idx[4] < alpha_len);
      key_idx[4] = 0;
    } while (++key_idx[5] < alpha_len);
    key_idx[5] = 0;
  } while (++key_idx[6] < alpha_len);
}

void main(int argc, char *argv[]) {
  clock_t start_time, current;
  float fTime, speedOverall;
  
  printf("\n  LM hash cracker v0.1"
         "\n  Copyright (c) 2005, 2007  \n");
    
  if (argc != 5) {
    printf("\n  Usage: %s [options] <hash> <start> <end>\n", argv[0]);
    exit(1);
  }
  
  if (!hex2bin(argv[1], hash)) {
    printf("\n  Invalid hash = %s", argv[1]);
    exit(2);
  }
  
  strncpy(start_pw, argv[2], sizeof(start_pw));
  strncpy(end_pw, argv[3], sizeof(end_pw));
  strncpy(alphabet, argv[4], sizeof(alphabet));
  
  alpha_len = strlen(alphabet);
  start_cbn = pw2cbn(start_pw);
  end_cbn = pw2cbn(end_pw);
  
  start_cbn--;
  total_cbn = end_cbn - start_cbn;
  
  DES_init_keys(alphabet);
  
  start_time = clock();
  lm_fast((DES_LONG*)ptext, (DES_LONG*)hash);
  current = clock();
	fTime = 1.0f * (current - start_time) / CLOCKS_PER_SEC;
	speedOverall = (float)completed / fTime / 1000000;
  printf("\n Completed: %lld %.2fM k/s", completed, speedOverall);
}
