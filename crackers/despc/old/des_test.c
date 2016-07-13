

// example of attacking DES with precomputed key schedules
// Odzhan

#include <windows.h>

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>

#include "des.h"

#pragma comment (lib, "user32.lib")

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
    idx[i] = (cbn % atk_opt.alpha_len); 
    cbn /= atk_opt.alpha_len;
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

//DES_key_schedule ks1[256], ks2[256], ks3[256], ks4[256], ks5[256], ks6[256], ks7[256], ks8[256];
//DES_key_schedule *ks_tblx[]={&ks1[0],&ks2[0],&ks3[0],&ks4[0],&ks5[0],&ks6[0],&ks7[0],&ks8[0]};

DES_key_schedule ks_tblx[8][256];

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
  
  atk_opt.sqrlen = atk_opt.alpha_len * atk_opt.alpha_len;
  
  atk_opt.ks_sqr = malloc(atk_opt.sqrlen*sizeof(DES_key_schedule));
  
  memset (pwd, 0, sizeof(pwd));
  
  DES_init_keys();
  
  if (atk_opt.ks_sqr!=NULL)
  {
    kp=(DES_key_schedule*)atk_opt.ks_sqr;
    
    i2=-1, i1=0;
    goto one;
    do {
      pwd[1] = atk_opt.alpha[i2];
      do {
    one:
        pwd[0] = atk_opt.alpha[i1];
        
        pc_set_key (pwd, &ks);
        if (i2>=0) {
          memcpy (kp++, &ks, sizeof(DES_key_schedule));
        }

        DES_ecb_encrypt ((DES_cblock*)ptext.v8, 
          (DES_cblock*)hash.v8, &ks);
        
        atk_opt.iter++;
        
        if (memcmp (atk_opt.cipher.v8, hash.v8, 8)==0) {
          printf ("\n Found password : %s", pwd);
          atk_opt.pwd_found=1;
          return;
        }
      } while (++i1 < atk_opt.alpha_len);
      i1=0;
    } while (++i2 < atk_opt.alpha_len);
  }
}

/*
void init_ksx (attack_t *ap)
{
  int i, j, k;
  DES_key_schedule *ks, *x, *y;
  uint8_t pwd[8];
  DES_cblock key;
  
  ap->sqr_len = (ap->alpha_len*ap->alpha_len);
  
  DES_init_keys ();
  
  // allocate memory for alpha_len sqaured times sizeof DES_key_schedule
  ap->ks_sqr = malloc (ap->sqr_len*sizeof(DES_key_schedule));
  
  if (ap->ks_sqr!=NULL) {
    // prepare ks_sqr by xor'ing ks1 against ks2 and saving in ks_sqr
    ks = (DES_key_schedule*)ap->ks_sqr;
    
    x = (DES_key_schedule*)&ks_tblx[0]; // ks1
    y = (DES_key_schedule*)&ks_tblx[1]; // ks2
    
    // for all ks1
    for (i=0; i<ap->alpha_len; i++, x++) {
      // xor against ks2
      for (j=0; j<ap->alpha_len; j++, y++) {
        // and save in ks_sqr
        for (k=0; k<sizeof(DES_key_schedule)/sizeof(DES_LONG); k++) {
          ((DES_LONG*)ks)[k] = ((DES_LONG*)x)[k] | ((DES_LONG*)y)[k];
        }
        ks++;
      }
    }
  } else {
    printf ("\n  malloc() failed");
  }
} */

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
  int match, i;
  DES_key_schedule ks;

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
    init_keys_x86();
    
    // convert password to combinations
    pwd_cbn=pw2cbn (argv[2]);
    strncpy (atk_opt.pwd, argv[2], 7);
    
    // convert to indexes
    cbn2idx (pwd_cbn, atk_opt.pwd_idx);
    
    pre_crack();
    exit(0);
    
    // now use schedules to compute lm hash
    pc_set_key_x86 (&atk_opt.pwd, &ks);
    
    dump_ks (&ks);
    dump_hex ("plaintext", (void*)atk_opt.plain.v8, 8);
    
    DES_ecb_encrypt ((DES_cblock*)atk_opt.plain.v8, 
      (DES_cblock*)lm_hash.v8, &ks);
    
    // check if they match
    match=(memcmp (lm_hash.v8, atk_opt.cipher.v8, 8)!=0);
    printf ("  Test %s", match ? "failed" : "succeeded");
    
    printf ("\n result is %08X %08X instead of %08X %08X", 
      lm_hash.v32[0], lm_hash.v32[1],
      atk_opt.cipher.v32[0], atk_opt.cipher.v32[1]);
      
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

