
// DES using precomputed key schedules
//
// Odzhan

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include <openssl/des.h>

#pragma comment (lib, "advapi32.lib")
#pragma comment (lib, "user32.lib")

DES_key_schedule ks_tbl[8][256];

// precompute DES key schedules
void DES_init_keys (void) 
{
  DES_cblock key;
  int i, j;
  
  memset (key, 0, sizeof(key));
  
  // for 64-bit key
  for (i=0; i<8; i++) {
    // create 256 key schedules
    for (j=0; j<256; j++) {
      key[i] = j;
      DES_set_key (&key, &ks_tbl[i][j]);
    }
    // clear byte
    key[i] = 0;
  }
}

// generate key schedule from precomputed keys
void DES_set_keyx (DES_cblock *key, DES_key_schedule *ks) 
{
  DES_LONG *src, *dst;
  int i, j;
  uint8_t *x;
  
  dst = (DES_LONG*)ks;
  x   = (uint8_t* )key;
  
  for (i=0; i<32; i++) {
    dst[i] = 0;
  }
  
  for (i=0; i<8; i++) {
    // get key schedule from array according to key value
    src = (DES_LONG*)&ks_tbl[i][x[i]];
    
    // bit or with destination
    for (j=0; j<32; j++) {
      dst[j] |= src[j];
    }
  }
}

// ########################################################
int main (int argc, char *argv[])
{
  DES_cblock       pt, key;
  DES_cblock       ct1, ct2;
  DES_key_schedule ks1, ks2;
  
  if (argc!=3) {
    printf ("  usage: dt <plaintext> <key>\n");
    return 0;
  }
  
  // clear pt + key
  memset (pt, 0, sizeof (pt));
  memset (key, 0, sizeof (key));
  
  // copy input from user
  strncpy (pt, argv[1], sizeof(pt));
  strncpy (key, argv[1], sizeof(key));
  
  // encrypt plaintext
  DES_set_key (&key, &ks1);
  DES_ecb_encrypt (&pt, &ct1, &ks1, DES_ENCRYPT);
  
  // encrypt plaintext using precomputed schedules
  DES_init_keys();   // only needs to be called once
  DES_set_keyx (&key, &ks2);
  DES_ecb_encrypt (&pt, &ct2, &ks2, DES_ENCRYPT);
  
  printf ("  ct1==ct2 : %s", 
    memcmp (ct1, ct2, sizeof(DES_cblock))==0 ? "TRUE" : "FALSE");
  
  return 0;
}
