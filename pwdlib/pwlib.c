
/**
 *
 * pwlib - Password Library
 *
 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>

// context
typedef struct _PWL_CTX {
  uint64_t start_cbn;
  uint64_t end_cbn;
  
  // current password
  union {
    char a[256];
    wchar_t w[256];
  } pw;
  
  // alphabet
  union {
    char a[256];
    wchar_t w[256];
  } alpha;

  // used to track distribution of key space
  int32_t job_idx;
} PWL_CTX, *PPWL_CTX;

// convert hex string to binary
size_t hex2bin (const char hex[], uint8_t bin[]) {
  size_t len, i;
  int    number;
  
  len = strlen (hex);
  
  if ((len & 1) != 0) {
    return 0; 
  }
  
  for (i=0; i<len; i++) {
    if (isxdigit ((int)hex[i]) == 0) {
      return 0; 
    }
  }
  
  for (i=0; i<len/2; i++) {
    sscanf (&hex[i*2], "%2x", &number);
    bin[i] = (uint8_t)number;
  } 
  return len/2;
}

// convert string to number
uint64_t pw2cbn (const char pw[], char alphabet[]) {
  uint64_t cbn = 0;
  uint64_t pwr = 1;
  size_t   pw_len, idx, alpha_len;
  int      i;
  
  pw_len = strlen (pw);
  alpha_len = strlen (alphabet);
  
  for (i=0; i<pw_len; i++) {
    idx = strchr (alphabet, pw[i]) - alphabet + 1;
    if (idx == 0) {
      return 0;
    }
    cbn += pwr * idx; 
    pwr *= alpha_len;
  }
  return cbn; 
}

// convert number to indexes
void cbn2idx (int idx[], char alphabet[], uint64_t cbn) { 
  size_t alpha_len=strlen(alphabet);
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

// convert number to string
void cbn2pw (char pw[], char alphabet[], uint64_t cbn) { 
  size_t alpha_len=strlen(alphabet);
  uint64_t pwr = alpha_len;
  int      pw_len, i;
  
  for (pw_len=1; cbn>=pwr; pw_len++) {
    cbn -= pwr; 
    pwr *= alpha_len;
  }
  pw[pw_len] = 0;
  
  for (i = 0; i < pw_len; i++) { 
    pw[i] = alphabet[(cbn % alpha_len)]; 
    cbn /= alpha_len; 
  }
}

int32_t cpus (void) {
#ifdef _WIN32
  SYSTEM_INFO sysinfo;
  GetSystemInfo(&sysinfo);
  return (int32_t) sysinfo.dwNumberOfProcessors;
#else
  return (int32_t) sysconf(_SC_NPROCESSORS_ONLN);
#endif
}

// create all permutations of the alphabet up to value of end_pw[]
void perm(char start[], char end[]) {
  uint64_t start_cbn, end_cbn;
  int32_t idx[32];
  int32_t i;
  
  memset(idx, -1, sizeof(idx) / sizeof(int));
  
  start_cbn = pw2cbn(start) - 1;
  end_cbn = pw2cbn(end);
  
  cbn2idx(idx, start_cbn);
  
  do {
    dump_idx(idx);
    
    for (i = 0;;i++) {
      if (++idx[i] != alpha_len) {
        break;
      }  
      idx[i] = 0;
    }
  } while (++start_cbn < end_cbn);
}

/**
 *
 *  unoptimized brute force algorithm v2
 *  reasonably fast but with some unnecessary code
 *
 */
void bf2(int min_len, int max_len, int (*is_valid_pw)(char pw[])) {
  int start, end, i;
  int pass_idx[8];
  char passw[8];
  
  memset(passw, 0, sizeof(passw));
  
  for (i = 0;i < max_len;i++) {
    pass_idx[i] = (i < min_len) ? 0 : -1;
  }
  
  while (min_len <= max_len) {
    // create password
    for (i = 0;i < min_len;i++) {
      passw[i] = alphabet[ pass_idx[i] ];
    }
    if (is_valid_pw(passw)) {
      printf("\nFound password = %s", passw);
      return;
    }
    // increase index 
    for (i = 0;;i++) {
      if (++pass_idx[i] != alpha_len) {
        break;
      }
      pass_idx[i] = 0;
    }
    if (i == min_len) {
      min_len++;
    }
  }
}

void bf8(char start_pw[], char end_pw[]) {
  uint64_t start_cbn, end_cbn;
  size_t pw_len;
  int pw_idx[32];
  
  memset(pw_idx, 0, sizeof(pw_idx) / sizeof(int));
  
  // get combination values of pw strings
  start_cbn = pw2cbn(start_pw);
  end_cbn = pw2cbn(end_pw);
  
  // 1st one hasn't been tried.
  start_cbn--;
  
  // get index values of start pw
  pw2idx(start_pw, pw_idx);
  
  do {
    dump_key(pw_idx);
  } while (++start_cbn < end_cbn);
}

/**
 *
 *  unoptimized brute force algorithm v3
 *  harder to initialize but generally faster
 *  limited to 7 character passwords here
 *
 */
void bf3(int min_len, int max_len, int (*is_valid_pw)(char pw[])) {
  int i, j;
  int pw[8];
  char passw[8], alpha[256];
  
  memset(alpha, 0, sizeof(alpha));
  memset(passw, 0, sizeof(passw));
  
  for (i = 0, j = alpha_len;i < alpha_len;i++) {
    alpha[i] = alphabet[--j];
  }
  
  for (i = 0;i < sizeof(pw) / sizeof(int);i++) {
    pw[i] = (i < max_len) ? alpha_len : 0;
  }
  
  for (i = 0;i < min_len;i++) {
    passw[i] = alpha[--pw[i]];
  }
  
  goto start;
  
  do {
    passw[6] = alpha[pw[6]];
    do {
      passw[5] = alpha[pw[5]];
      do {
        passw[4] = alpha[pw[4]];
        do {
          passw[3] = alpha[pw[3]];
          do {
            passw[2] = alpha[pw[2]];
            do {
              passw[1] = alpha[pw[1]];
              do {
                passw[0] = alpha[pw[0]];
              start:
                if (is_valid_pw(passw)) {
                  printf("\nFound password = %s", passw);
                  return;
                }
              } while (--pw[0] >= 0);
              pw[0] = alpha_len - 1;
            } while (--pw[1] >= 0);
            pw[1] = alpha_len - 1;
          } while (--pw[2] >= 0);
          pw[2] = alpha_len - 1;
        } while (--pw[3] >= 0);
        pw[3] = alpha_len - 1;
      } while (--pw[4] >= 0);
      pw[4] = alpha_len - 1;
    } while (--pw[5] >= 0);
    pw[5] = alpha_len - 1;
  } while (--pw[6] >= 0);
}

/**
 *
 *  Based on "Cyclical Increment of Passwords"
 *    http://www.insidepro.com/doc/003e.shtml
 *
 *  easiest to initialize
 *  faster execution
 *  
 *
 */
void bf4(int min_len, int max_len, int (*is_valid_pw)(char pw[])) {
  uint8_t idx[256], passw[256], *pw, c;
  int i, j;
  
  memset(passw, 0, sizeof(passw));
  memset(idx, 0, sizeof(idx));
  
  // initialize indexes
  for (i = 0, j = 0;alphabet[i] != 0;i++) {
    idx[j] = alphabet[i];
    if (alphabet[i] == 0) {
      break;
    }
    j = alphabet[i];
  }
  
  // set initial password
  for (i = 0;i < min_len;i++) {
    passw[i] = alphabet[0];
  }
  
  // compute all passwords
  do {
    if (is_valid_pw(passw)) {
      printf("\nFound password = %s", passw);
      return;
    }
    for (j = 0;;j++) {
      passw[j] = idx[passw[j]];
      if (passw[j] != 0) {
        break;
      }  
      passw[j] = idx[passw[j]];
    }
    if (j == min_len) {
      min_len++;
    }
  } while (min_len <= max_len);
}

/**
  Iterations = 113522234
  BF6 : Milliseconds elapsed = 45085
  BF7 : Milliseconds elapsed = 45443
  BF1 : Milliseconds elapsed = 48719
  BF2 : Milliseconds elapsed = 45396
  BF3 : Milliseconds elapsed = 45038
  BF4 : Milliseconds elapsed = 45053
  BF5 : Milliseconds elapsed = 44990
*/

/**
 *
 *  Based on "Cyclical Increment of Passwords"
 *    http://www.insidepro.com/doc/003e.shtml
 *
 */
void bf5(char start_passw[], char end_passw[], int (*is_valid_pw)(char pw[])) {
  uint8_t idx[256], passw[256];
  uint64_t start, end;
  int i, j;
  
  memset(passw, 0, sizeof(passw));
  strcpy(passw, start_passw);
  memset(idx, 0, sizeof(idx));
  
  // initialize indexes
  for (i = 0, j = 0;alphabet[i] != 0;i++) {
    idx[j] = alphabet[i];
    if (alphabet[i] == 0) {
      break;
    }
    j = alphabet[i];
  }
  
  start = pws2cbn(start_passw);
  end = pws2cbn(end_passw);
  
  start--;
  
  do {
    if (is_valid_pw(passw)) {
      printf("\nFound password = %s", passw);
      break;
    }
    for (j = 0;;j++) {
      passw[j] = idx[passw[j]];
      if (passw[j] != 0) {
        break;
      }
      passw[j] = idx[passw[j]];
    }
  } while (++start < end);
}

/**
 *
 *  Based on "Cyclical Increment of Passwords"
 *    http://www.insidepro.com/doc/003e.shtml
 *
 */
void bf5W(wchar_t start_passw[], wchar_t end_passw[], int (*is_valid_pw)(wchar_t pw[])) {
  wchar_t idx[256], passw[256];
  uint64_t start, end;
  int i, j;
  
  memset(passw, 0, sizeof(passw));
  wcscpy(passw, start_passw);
  memset(idx, 0, sizeof(idx));
  
  // initialize indexes
  for (i = 0, j = 0;alphabetW[i] != 0;i++) {
    idx[j] = alphabetW[i];
    if (alphabetW[i] == 0) {
      break;
    }
    j = alphabetW[i];
  }
  
  start = pws2cbnW(start_passw);
  end = pws2cbnW(end_passw);
  
  start--;
  
  do {
    if (chap_is_valid_pw(passw) == 0) {
      wprintf(L"\nFound password = %s", passw);
      break;
    }
    for (j = 0;;j++) {
      passw[j] = idx[passw[j]];
      if (passw[j] != 0) {
        break;
      }
      passw[j] = idx[passw[j]];
    }
  } while (++start < end);
}

void bf7(uint64_t total, int (*is_valid_pw)(char pw[])) {
  char passw[8];
  uint8_t idx[256];
  int i, j;
  
  memset(passw, 0, sizeof(passw));
  memset(idx, 0, sizeof(idx));
  
  // initialize indexes
  for (i = 0, j = 0;alphabet[i] != 0;i++) {
    idx[j] = alphabet[i];
    if (alphabet[i] == 0) {
      break;
    }
    j = alphabet[i];
  }
        while (--total != 0)
        {
                 __asm
                 {
                     pushad
                     lea edi, [passw]
                     lea ebx, [idx]
                 L1: movzx eax,byte ptr [edi]
                     xlat
                     cmp al,0
                     je L3
                     mov [edi],al
                     jmp L5

                 L3: xlat
                     stosb
                     jmp L1

                 L5: popad
                 }
    if(is_valid_pw(passw)) {
      printf("\nFound password = %s", passw);
      return;
    }
    } 
  /*
  while (--total != 0) {
    __asm {
      pushad
      lea edi, [passw]
      lea ebx, [idx]
    L1:
      movzx eax, byte ptr [edi]
      mov al, byte ptr[eax+ebx]
      mov byte ptr [edi], al
      test al, al
      jnz L2
      
      mov al, byte ptr[eax+ebx]
      mov byte ptr[edi], al
      inc edi
      jmp L1
    L2:
      popad
    }*/
}



int main (int argc, char *argv[])
{
  int i;
  if (argc != 2) {
    return 0;
  }
  i=atoi(argv[1]);
  if ((i & 1) == 0) printf ("\nok");
  return 0;
}
