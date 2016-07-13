

// example of attacking DES with precomputed key schedules
// Odzhan

#include <windows.h>

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>

#include "des.h"

#pragma comment (lib, "user32.lib")

DES_key_schedule ks_tblx[8][256];

char* lm (char *pwd);

attack_t atk_opt;

size_t hex2bin (void *bin, char hex[]) {
  size_t  len, i;
  int     x;
  uint8_t *p=(uint8_t*)bin;
  
  len = strlen (hex);
  
  if ((len & 1) != 0) {
    return 0; 
  }
  
  for (i=0; i<len; i++) {
    if (isxdigit((int)hex[i]) == 0) {
      return 0; 
    }
  }
  
  for (i=0; i<len / 2; i++) {
    sscanf (&hex[i * 2], "%2x", &x);
    p[i] = (uint8_t)x;
  } 
  return len / 2;
} 

void cbn2idx (uint64_t cbn, uint32_t idx[]) { 
  size_t alpha_len=strlen(atk_opt.alpha);
  uint64_t pwr = alpha_len;
  int      pw_len, i;
  
  for (pw_len=1; cbn>=pwr; pw_len++) {
    cbn -= pwr; 
    pwr *= atk_opt.alpha_len;
  }
  
  for (i=0; i<8; i++) {
    if (i<=pw_len) {
      idx[i] = (cbn % atk_opt.alpha_len); 
      cbn /= atk_opt.alpha_len;
    } else {
      idx[i] = -1;
    }
  }
}

uint64_t pw2cbn(const char pw[]) {
  uint64_t cbn = 0;
  uint64_t pwr = 1;
  size_t pw_len, idx;
  int i;
  
  pw_len = strlen(pw);
  
  for (i = 0;i < pw_len;i++) {
    idx = strchr(atk_opt.alpha, pw[i]) - atk_opt.alpha + 1;
    if (idx == 0) {
      return 0;
    }
    cbn += pwr * idx; 
    pwr *= atk_opt.alpha_len;
  } 
  return cbn; 
}

void cbn2pw (char pw[], uint64_t cbn) { 
  uint64_t pwr = atk_opt.alpha_len;
  int      pw_len, i;
  
  for (pw_len=1; cbn>=pwr; pw_len++) {
    cbn -= pwr; 
    pwr *= atk_opt.alpha_len;
  }
  pw[pw_len] = 0;
  
  for (i=0; i<pw_len; i++) { 
    pw[i] = atk_opt.alpha[(cbn % atk_opt.alpha_len)]; 
    cbn /= atk_opt.alpha_len; 
  }
}

/**
 *
 *  create DES keys for every index of a 64-bit value
 *
 */ 
void DES_init_keys (void) {
  uint8_t key[8];
  int i, j;
  
  memset (key, 0, sizeof(key));
  
  for (i=0; i<8; i++) {
    for (j=0; j<256; j++) {
      key[i] = j;
      DES_set_key ((DES_cblock*)&key, &ks_tblx[i][j]);
    }
    key[i] = 0;
  }
}

void DES_init_skeys (char s[]) {
  uint8_t key[8];
  int i, j;
  
  memset (key, 0, sizeof(key));
  
  for (i=0; i<8; i++) {
    for (j=0; j<atk_opt.alpha_len; j++) {
      key[i] = atk_opt.alpha[j];
      DES_set_key ((DES_cblock*)&key, &ks_tblx[i][j]);
    }
    key[i] = 0;
  }
}
/**
 *
 *  create DES keys for an alphabet
 *
 */ 
void pc_set_key (uint8_t key[], DES_key_schedule *ks) {
  int i, j;
  DES_LONG *src, *dst;
  dst = (DES_LONG*)ks;
  
  for (i=0; i<32; i++) {
    dst[i] = 0;
  }
  
  for (i=0; i<8; i++) {
    src = (DES_LONG*)&ks_tblx[i][key[i]];
    
    for (j=0; j<32; j++) {
      dst[j] |= src[j];
    }
  }
}

// process up to 2 characters first
// save key schedules on second round in ks_sqr
void pre_crack (void)
{
  int i1, i2;
  DES_key_schedule ks;
  DES_key_schedule *kp;
  des_blk          ptext={0x4B, 0x47, 0x53, 0x21, 0x40, 0x23, 0x24, 0x25};
  des_blk          hash;
  char             pwd[8];
  DES_cblock       key;
  size_t           mem_size;
  
  atk_opt.sqrlen = atk_opt.alpha_len * atk_opt.alpha_len;
  
  mem_size = atk_opt.sqrlen*sizeof(DES_key_schedule);
  mem_size += 1024;
  
  atk_opt.ks_sqr = malloc(mem_size);
  
  memset (pwd, 0, sizeof(pwd));
  
  DES_init_keys();
  
  if (atk_opt.ks_sqr!=NULL)
  {
    kp=(DES_key_schedule*)atk_opt.ks_sqr;
    
    goto one;
    do {
      pwd[1] = atk_opt.alpha[atk_opt.pwd_idx[1]];
      do {
    one:
        pwd[0] = atk_opt.alpha[atk_opt.pwd_idx[0]];
        
        DES_str_to_key (&pwd, (uint8_t*)&key);
        DES_set_key (&key, &ks);
        
        //pc_set_key (pwd, &ks);
        
        if (atk_opt.pwd_idx[1]>=0) {
          memcpy (kp, &ks, sizeof(DES_key_schedule));
          kp++;
        }

        DES_ecb_encrypt ((DES_cblock*)ptext.v8, 
          (DES_cblock*)hash.v8, &ks);
        
        //atk_opt.iter++;
        
        if (memcmp (atk_opt.cipher.v8, hash.v8, 8)==0) {
          printf ("\n Found password : %s", pwd);
          atk_opt.pwd_found=1;
          return;
        }
      } while (++atk_opt.pwd_idx[0] < atk_opt.alpha_len);
      atk_opt.pwd_idx[0]=0;
    } while (++atk_opt.pwd_idx[1] < atk_opt.alpha_len);
    atk_opt.pwd_idx[1]=0;
  }
}

void dump_ks (DES_key_schedule *ks)
{
  int i;
  DES_LONG *p=(DES_LONG*)ks;
  
  for (i=0; i<sizeof(DES_key_schedule)/sizeof(DES_LONG); i++)
  {
    if ((i % 8)==0) putchar('\n');
    printf ("%08X, ", ((DES_LONG*)p)[i]);
  }
}

void dump_hex (char s[], void *data, int len)
{
  int i;
  uint8_t *p=(uint8_t*)data;
  
  for (i=0; i<len; i++)
  {
    if ((i % 8)==0) putchar('\n');
    printf ("%02X, ", ((uint8_t*)p)[i]);
  }
}

int main(int argc, char *argv[]) 
{
  uint64_t pwd_cbn;
  des_blk lm_hash;
  int match, i, ctr;
  DES_key_schedule ks;
  DWORD start_tick, end_tick, speed;
  
  // zero initialize structure
  memset (&atk_opt, 0, sizeof (atk_opt));
    
  if (argc==2) {
    DES_init_keys();
    printf ("\n  Lanman hash : %s\n", lm (argv[1]));
  
  } else if (argc==3) {

    lm_hash.v32[0] = 0; 
    lm_hash.v32[1] = 0;
    
    // just test parameters
    strcpy (atk_opt.alpha, "0123456789");
    atk_opt.alpha_len = strlen (atk_opt.alpha);
    CharToOem (atk_opt.alpha, atk_opt.alpha);
    
    // set plaintext to what used to generate LM hashes
    //hex2bin (atk_opt.plain.v8, "KGS!@#$%");
    strncpy (atk_opt.plain.v8, "KGS!@#$%", 8);
    // set ciphertext to user input, assumes correct length
    hex2bin (atk_opt.cipher.v8, argv[1]);
    
    // setup key schedules
    init_skeys_x86(atk_opt.alpha, atk_opt.alpha_len);
    
    // convert password to combinations
    pwd_cbn=0; //pw2cbn (argv[2]);
    strncpy (atk_opt.pwd, argv[2], 7);
    
    // convert to indexes
    cbn2idx (pwd_cbn, atk_opt.pwd_idx);
    
    pre_crack();
    
    printf ("\ncompleted %lld", atk_opt.iter);
    do_ip((DES_LONG*)&atk_opt.plain.v8, (DES_LONG*)&atk_opt.pt.v8);
    do_ip((DES_LONG*)&atk_opt.cipher.v8, (DES_LONG*)&atk_opt.ct.v8);

    init_attack (&atk_opt);
  
    printf ("\n%i:%i:%i:%i:%i:%i:%i", 
      atk_opt.pwd_idx[0], atk_opt.pwd_idx[1], 
      atk_opt.pwd_idx[2], atk_opt.pwd_idx[3],
      atk_opt.pwd_idx[4], atk_opt.pwd_idx[5],
      atk_opt.pwd_idx[6]);
      
    start_tick=GetTickCount();
  
    attack_des(&atk_opt);
    
    end_tick=GetTickCount();
    
    free (atk_opt.ks_sqr);
    
    printf ("\n%i:%i:%i:%i:%i:%i:%i", 
      atk_opt.pwd_idx[0], atk_opt.pwd_idx[1], 
      atk_opt.pwd_idx[2], atk_opt.pwd_idx[3],
      atk_opt.pwd_idx[4], atk_opt.pwd_idx[5],
      atk_opt.pwd_idx[6]);
    
    end_tick = end_tick - start_tick;
    end_tick /= 1000;
    if (end_tick >= 1) {
      speed=(atk_opt.iter/end_tick);
    } else {
      speed=atk_opt.iter;
    }
    printf("\n Completed: %lld %ld M k/s", atk_opt.iter, speed);
  
  } else {
    printf ("\n  usage: des_test <pwd in digits> | <pwd hash> <pwd in digits>");
  }
  return 0;
}

char* lm (char *pwd) 
{
  DES_cblock       key;
  DES_key_schedule ks;
  const char       ptext[]="KGS!@#$%";
  static char      hash[8+1];
  uint8_t          pw[7+1], ctext[8];
  int              i;
  
  memset (pw, 0, sizeof (pw));
  strncpy (pw, pwd, 7);
  CharToOem (CharUpper (pw), pw);
  
  DES_str_to_key (&pw[0], (uint8_t*)&key);
  DES_set_key (&key, &ks);
  
  dump_ks (&ks);
  dump_hex ("plaintext", (void*)ptext, 8);
  
  DES_ecb_encrypt ((DES_cblock*)ptext, 
    (DES_cblock*)&ctext[0], &ks);
    
  for (i=0; i<8; i++) {
    _snprintf (&hash[i*2], 2, "%02X", ((uint8_t*)ctext)[i]);
  }
  return hash;
}

