
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

// precompute DES key schedules for alphabet
void DES_init_keys (char alphabet[]) 
{
  DES_cblock key;
  int i, j;
  int alpha_len=strlen(alphabet);
  
  memset (key, 0, sizeof(key));
  
  // for 64-bit key
  for (i=0; i<8; i++) {
    // create 256 key schedules
    for (j=0; j<alpha_len; j++) {
      key[i] = alphabet[j];
      DES_set_key (&key, &ks_tbl[i][j]);
    }
    // clear byte
    key[i] = 0;
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
  
  for (i=0; i<8; i++) {
    // get schedule based on index
    src = (DES_LONG*)&ks_tbl[i][key_idx[i]];
    
    // bit or with destination
    for (j=0; j<32; j++) {
      dst[j] |= src[j];
    }
  }
}

// convert password to key indexes
int pwd2idx (uint32_t pwd_idx[], char pwd[], 
  char alphabet[])
{
  uint32_t idx, pwd_len;
  int i;
  
  pwd_len=strlen (pwd);
  
  for (i= 0; i<pwd_len; i++) {
    idx = strchr(alphabet, pwd[i]) - alphabet + 1;
    if (idx == 0) {
      return 0;
    }
    pwd_idx[i] = idx - 1;
  }
  return 1;
}

// ########################################################
int main (int argc, char *argv[])
{
  DES_cblock       pt, key;
  DES_cblock       ct1, ct2;
  DES_key_schedule ks1, ks2;
  char             *alphanum="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  int              i;
  char             pwd[16];
  uint32_t         pwd_idx[16];
  
  if (argc!=3) {
    printf ("  usage: dt <plaintext> <key>\n");
    return 0;
  }
  
  // clear pt + key
  memset (pt, 0, sizeof (pt));
  memset (key, 0, sizeof (key));
  memset (pwd, 0, sizeof (pwd));
  memset (&pwd_idx, 0, sizeof (pwd_idx));
  
  // copy input from user
  strncpy (pt, argv[1], sizeof(pt));
  strncpy (pwd, argv[2], sizeof(key));
  
  // convert key to uppercase
  for (i=0; i<strlen(argv[2]); i++) {
    pwd[i] = toupper(argv[2][i]);
    key[i] = toupper(argv[2][i]);
  }
  
  // encrypt plaintext using regular DES encryption
  DES_set_key (&key, &ks1);
  DES_ecb_encrypt (&pt, &ct1, &ks1, DES_ENCRYPT);
  
  // encrypt plaintext using precomputed schedules
  // first, initialize key schedules based on alphabet
  printf ("\n1] setting up keys for %s", alphanum);
  DES_init_keys(alphanum);
  // convert the password to indexes using alphabet
  printf ("\n2] converting \"%s\" to indexes", pwd);
  pwd2idx (pwd_idx, pwd, alphanum);
  // now set the key schedule based on key indexes
  printf ("\n3] deriving key schedule based on indexes");
  DES_set_keyx (pwd_idx, &ks2);
  // and encrypt
  printf ("\n4] encrypting..");
  DES_ecb_encrypt (&pt, &ct2, &ks2, DES_ENCRYPT);
  
  // now compare..
  printf ("\n  ct1==ct2 : %s", 
    memcmp (ct1, ct2, sizeof(DES_cblock))==0 ? "TRUE" : "FALSE");
  
  return 0;
}
