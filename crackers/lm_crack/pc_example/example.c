
     /*
          gcc example.c des.c -oexample
     */

#include <stdio.h>
#include <stdint.h>
#include <string.h>

#include <windows.h>

#include "des.h"

typedef uint32_t u32;
typedef uint8_t  u8;

typedef int (__cdecl *fn_init_subkeys)(void);
typedef int (__cdecl *fn_sse2_DES_set_key)(DES_cblock *key, DES_key_schedule *ks);

         void *lib;

         fn_init_subkeys init_subkeys;
         fn_sse2_DES_set_key sse2_DES_set_key;

void dump_hash(u8 hash[]) {
      
      u8 *p;

      for(p = hash;(p - hash) < 8;p++)
          printf("%.2X",*p);
      
      printf("\n");
}

int load_lib()
{
      if((lib = LoadLibrary("pc_des_set_key")) == 0)
          return(0);

      if((sse2_DES_set_key = (void*)GetProcAddress(lib,"sse2_DES_set_key")) == 0)
          return(0);
          
      if((init_subkeys = (void*) GetProcAddress(lib,"init_subkeys")) == 0)
          return(0);
          
      return(1);
}

int main(int argc,char *argv[])
{
      u32 i,j;
      DES_cblock deskey;
      DES_key_schedule ks1,ks2;
      u8 plaintext[8]={0};
      u8 hash1[8],hash2[8];
      
      u8 test_key[8]={0x01,0x23,0x00,0x67,0x89,0xff,0xcd,0xef};

      if(argc == 2) {
           
         if(!load_lib()) {
            printf("\nError loading pc_des_set_key.dll");
            return(0);
         }

         /* get plaintext */

         strncpy((u8*)&plaintext,argv[1],8);

         /* initialize the key schedules.. */

         init_subkeys();

         /* use the regular DES_set_key function first */

         DES_set_key((DES_cblock*)&test_key,&ks1);
         DES_ecb_encrypt( (DES_cblock*)&plaintext,&hash1,&ks1);

         fprintf(stdout,"\nCiphertext result of using DES_set_key():");
         dump_hash(hash1);

         /* now use the routine with precomputed schedules */

         sse2_DES_set_key((DES_cblock*)&test_key,&ks2);
         DES_ecb_encrypt((DES_cblock*)&plaintext,&hash2,&ks2);

         fprintf(stdout,"\nCiphertext result of using sse2_DES_set_key():");
         dump_hash(hash2);

      } else fprintf(stdout,"\n\tUsage:%s <PLAINTEXT>\n",argv[0]);
      return(0);
}
