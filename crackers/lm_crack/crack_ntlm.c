
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <time.h>

#ifdef DEBUG
#define dprintf printf
#else
#define dprintf
#endif

#define F(x, y, z)	((z) ^ ((x) & ((y) ^ (z))))
#define G(x, y, z)	(((x) & ((y) | (z))) | ((y) & (z)))
#define H(x, y, z)	((x) ^ (y) ^ (z))

#define S(f, a, b, c, d, x, t, s) \
	(a) += f((b), (c), (d)) + ptr[x] + (t); \
	(a) = (((a) << (s)) | (((a) & 0xffffffff) >> (32 - (s))));
  
wchar_t digits[] = L"0123456789";
wchar_t uppercase[] = L"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
wchar_t lowercase[] = L"abcdefghijklmnopqrstuvwxyz";
wchar_t symbols[] = L"!\"£$%^&*()_+{}:@~<>?|\\[];'#,./-=";

wchar_t alphabet[256];
size_t alpha_len;
uint64_t completed = 0;

uint32_t ntlm_hash[4];

// convert hex string to binary
size_t hex2bin(const wchar_t hex[], uint8_t bin[]) {
  size_t len, i;
  int number;
  
  len = wcslen(hex);
  dprintf("\nEntering hex2bin(%s, %i)", hex, len);
  
  if ((len % 2) != 0) {
    wprintf(L"\nInvalid length");
    return 0; 
  }
  
  for (i = 0;i < len;i++) {
    if (iswxdigit((int)hex[i]) == 0) {
      wprintf(L"\nInvalid character found at %i : %c", i, hex[i]);
      return 0; 
    }
  }
  
  for (i = 0;i < len / 2;i++) {
    swscanf(&hex[i * 2], L"%2x", &number);
    bin[i] = (uint8_t)number;
  } 
  dprintf("\nLeaving hex2bin(%i)", len / 2);
  return len / 2;
}

// convert string to number
uint64_t pw2cbn(const wchar_t pw[]) {
  uint64_t cbn = 0;
  uint64_t pwr = 1;
  size_t pw_len, idx;
  int i;
  
  pw_len = wcslen(pw);
  dprintf("\nEntering pw2cbn(%s, %i)", pw, pw_len);
  
  for (i = 0;i < pw_len;i++) {
    idx = wcschr(alphabet, pw[i]) - alphabet + 1;
    if (idx == 0) {
      return 0;
    }
    cbn += pwr * idx; 
    pwr *= alpha_len;
  } 
  dprintf("\nLeaving pw2cbn(%lld)", cbn);
  return cbn; 
}

// convert string to indexes
void cbn2idx(int idx[], uint64_t cbn) { 
  uint64_t pwr = alpha_len;
  int pw_len, i;
  
  dprintf("\nEntering cbn2idx(%lld)", cbn);
  
  for (pw_len = 1; cbn >= pwr; pw_len++) {
    cbn -= pwr; 
    pwr *= alpha_len;
  }
  
  for (i = 0; i < pw_len; i++) { 
    idx[i] = (cbn % alpha_len); 
    cbn /= alpha_len; 
  }
  dprintf("\nLeaving cbn2idx()");
}

// create all permutations of the alphabet up to value of end[]
void crack_ntlm(wchar_t start[], wchar_t end[]) {
  uint64_t start_cbn, end_cbn;
  uint32_t pw_idx[16], a, b, c, d, *ptr;
  wchar_t passw[64];
  int i, j, pw_len = wcslen(start);
  
  memset(passw, 0, sizeof(passw));
  wcsncpy(passw, start, sizeof(passw) / sizeof(wchar_t));
  ptr = (uint32_t*)passw;
  
  // set initially to -1
  for (i = 0;i < 16; i++) {
    pw_idx[i] = -1;
  }
  
  start_cbn = pw2cbn(start) - 1;
  end_cbn = pw2cbn(end);
  
  cbn2idx(pw_idx, start_cbn);
  
  ((uint8_t*)passw)[pw_len*2] = 0x80;
  ((uint32_t*)passw)[14] = pw_len * 2 * 8;
  wprintf(L"\nCurrent password length : %i", pw_len);
  
  do {
    completed++;
    //wprintf(L"\nTrying %s", passw);
    
    a = 0x67452301;
    b = 0xefcdab89;
    c = 0x98badcfe;
    d = 0x10325476;

    S(F, a, b, c, d, 0, 0, 3)
    S(F, d, a, b, c, 1, 0, 7)
    S(F, c, d, a, b, 2, 0, 11)
    S(F, b, c, d, a, 3, 0, 19)

    S(F, a, b, c, d, 4, 0, 3)
    S(F, d, a, b, c, 5, 0, 7)
    S(F, c, d, a, b, 6, 0, 11)
    S(F, b, c, d, a, 7, 0, 19)

    S(F, a, b, c, d, 8, 0, 3)
    S(F, d, a, b, c, 9, 0, 7)
    S(F, c, d, a, b, 10,0, 11)
    S(F, b, c, d, a, 11,0, 19)

    S(F, a, b, c, d, 12,0, 3)
    S(F, d, a, b, c, 13,0, 7)
    S(F, c, d, a, b, 14,0, 11)
    S(F, b, c, d, a, 15,0, 19)

    // ================================

    S(G, a, b, c, d, 0,  0x5a827999, 3)
    S(G, d, a, b, c, 4,  0x5a827999, 5)
    S(G, c, d, a, b, 8,  0x5a827999, 9)
    S(G, b, c, d, a, 12, 0x5a827999, 13)

    S(G, a, b, c, d, 1,  0x5a827999, 3)
    S(G, d, a, b, c, 5,  0x5a827999, 5)
    S(G, c, d, a, b, 9,  0x5a827999, 9)
    S(G, b, c, d, a, 13, 0x5a827999, 13)

    S(G, a, b, c, d, 2,  0x5a827999, 3)
    S(G, d, a, b, c, 6,  0x5a827999, 5)
    S(G, c, d, a, b, 10, 0x5a827999, 9)
    S(G, b, c, d, a, 14, 0x5a827999, 13)

    S(G, a, b, c, d, 3,  0x5a827999, 3)
    S(G, d, a, b, c, 7,  0x5a827999, 5)
    S(G, c, d, a, b, 11, 0x5a827999, 9)
    S(G, b, c, d, a, 15, 0x5a827999, 13)

    // =================================

    S(H, a, b, c, d, 0,  0x6ed9eba1, 3)
    S(H, d, a, b, c, 8,  0x6ed9eba1, 9)
    S(H, c, d, a, b, 4,  0x6ed9eba1, 11)
    S(H, b, c, d, a, 12, 0x6ed9eba1, 15)

    S(H, a, b, c, d, 2,  0x6ed9eba1, 3)
    S(H, d, a, b, c, 10, 0x6ed9eba1, 9)
    S(H, c, d, a, b, 6,  0x6ed9eba1, 11)
    S(H, b, c, d, a, 14, 0x6ed9eba1, 15)

    S(H, a, b, c, d, 1,  0x6ed9eba1, 3)
    S(H, d, a, b, c, 9,  0x6ed9eba1, 9)
    S(H, c, d, a, b, 5,  0x6ed9eba1, 11)
    S(H, b, c, d, a, 13, 0x6ed9eba1, 15)

    S(H, a, b, c, d, 3,  0x6ed9eba1, 3)
    S(H, d, a, b, c, 11, 0x6ed9eba1, 9)
    S(H, c, d, a, b, 7,  0x6ed9eba1, 11)
    S(H, b, c, d, a, 15, 0x6ed9eba1, 15)
    
 	  a += 0x67452301;
	  b += 0xefcdab89;
	  c += 0x98badcfe;
	  d += 0x10325476;
  
    if (a == ntlm_hash[0] 
      && b == ntlm_hash[1] 
      && c == ntlm_hash[2]
      && d == ntlm_hash[3]) {
      ((uint8_t*)passw)[pw_len*2] = 0;
      wprintf(L"\n\nFound password = \"%s\"", passw);
      return;
    }
    for (i = 0; ; i++) {
      if (++pw_idx[i] != alpha_len) {
        passw[i] = alphabet[ pw_idx[i] ];
        break;
      }
      if (i == pw_len - 1) {
        wprintf(L"\nCurrent password length : %i", ++pw_len);
        ((uint8_t*)passw)[pw_len*2] = 0x80;
        ((uint32_t*)passw)[14] = pw_len * 2 * 8;
      }
      pw_idx[i] = 0;
      passw[i] = alphabet[0];
    }
  } while (++start_cbn < end_cbn);
}

int wmain(int argc, wchar_t *argv[]) {
  clock_t start_time, current;
  float fTime, speedOverall;
  
  if (argc != 4) {
    wprintf(L"\nUsage: crack_ntlm <ntlm hash> <start pw> <end pw>\n");
    exit(1);
  }
  
  if (!hex2bin(argv[1], (uint8_t*)ntlm_hash)) {
    wprintf(L"\n  Invalid hash = %s", argv[1]);
    exit(2);
  }
  
  //wcscat(alphabet, digits);
  //wcscat(alphabet, uppercase);
  wcscat(alphabet, lowercase);
  //wcscat(alphabet, symbols);
  
  alpha_len = wcslen(alphabet);

  start_time = clock();
  crack_ntlm(argv[2], argv[3]);

  current = clock();
	fTime = 1.0f * (current - start_time) / CLOCKS_PER_SEC;
	speedOverall = (float)completed / fTime / 1000000;
  wprintf(L"\n\nCompleted: %lld %.2fM k/s", completed, speedOverall);
  
  return 0;
}

