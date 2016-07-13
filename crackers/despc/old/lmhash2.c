


#include <stdio.h>
#include <string.h>
#include <stdint.h>

#include <windows.h>

#include "des.h"

#pragma comment(lib, "user32.lib")
#pragma comment(lib, "advapi32.lib")

#define MAX_LM_PW 7

void lmhash(char passw[]) {
  char pw[MAX_LM_PW+1];
  uint8_t key[8], ctext[8];
  DES_key_schedule ks;
  const char ptext[]="KGS!@#$%";
  int i;
  
  memset(pw, 0, sizeof(pw));
  strncpy(pw, passw, MAX_LM_PW);
  CharToOem(CharUpper(pw), pw);
  
  DES_str_to_key(pw, key);
  DES_set_key(key, &ks);
  DES_ecb_encrypt(ptext, ctext, &ks);
  
  for (i = 0;i < 8;i++) {
      printf("%02X", ctext[i]);
  }
}

int main(int argc, char *argv[]) {
    char passw[MAX_LM_PW+1];
    
    if (argc != 2) {
        printf("\nUsage: lmhash <password>\n");
        return 0;
    }
    
    memset(passw, 0, sizeof(passw));
    strncpy(passw, argv[1], MAX_LM_PW*2);
    
    lmhash(passw);
    lmhash(&passw[7]);
    return 0;
}
