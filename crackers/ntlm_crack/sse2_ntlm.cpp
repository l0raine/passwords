
#define _CRT_SECURE_NO_WARNINGS
#define UNICODE

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <time.h>
#include <wchar.h>
#include <ctype.h>
#include <wctype.h>
#include <emmintrin.h>

#ifdef DEBUG
#define dprintf printf
#else
#define dprintf
#endif

extern uint64_t completed;
extern wchar_t alphabet[];
extern uint32_t alpha_len;
extern uint32_t ntlm_hash[];
extern __m128i mm_hash[];
extern uint64_t start_cbn, end_cbn, total_cbn;

#define MAX_PW 2

#define F(b, c, d)	XOR((d), AND((b), XOR((c), (d))))
#define G(b, c, d)	OR(AND((b), OR((c), (d))), AND((c), (d)))
#define	H(b, c, d)	XOR((b), XOR((c), (d))) 

#define S(FF, A, B, C, D, x, t, s) { \
  for (int i = 0;i < MAX_PW;i++) { \
    if (x < 8 || x == 14) { \
      uint32_t *p1 = key[i][0]; \
      uint32_t *p2 = key[i][1]; \
      uint32_t *p3 = key[i][2]; \
      uint32_t *p4 = key[i][3]; \
      __m128i tmp = SET(p4[x], p3[x], p2[x], p1[x]); \
      (A[i]) = ADD((A[i]), ADD(FF((B[i]), (C[i]), (D[i])), ADD(tmp, SET1(t)))); \
    } else { \
      (A[i]) = ADD(ADD((A[i]), FF((B[i]), (C[i]), (D[i]))), SET1(t)); \
    } \
	  (A[i]) = ROL((A[i]), (s)); \
  } \
};

// convert string to number
uint64_t pwd2cbn(const wchar_t pwd[]) {
  uint64_t cbn = 0;
  uint64_t pwr = 1;
  size_t pwd_len, idx;
  int i;
  
  pwd_len = wcslen(pwd);
  
  for (i = 0;i < pwd_len;i++) {
    idx = wcschr(alphabet, pwd[i]) - alphabet + 1;
    if (idx == 0) {
      return 0;
    }
    cbn += pwr * idx; 
    pwr *= alpha_len;
  }
  return cbn; 
}

// convert string to indexes
void cbn2idx(uint32_t idx[], uint64_t cbn) { 
  uint64_t pwr = alpha_len;
  int pwd_len, i;
  
  for (pwd_len = 1; cbn >= pwr; pwd_len++) {
    cbn -= pwr; 
    pwr *= alpha_len;
  }
  
  for (i = 0; i < pwd_len; i++) { 
    idx[i] = (cbn % alpha_len); 
    cbn /= alpha_len; 
  }
}

// convert string to indexes
wchar_t *cbn2pwd(uint64_t cbn, wchar_t pwd[]) {  
  uint64_t pwr = alpha_len; 
  size_t pwd_len, idx;
  
  for (pwd_len = 1;cbn >= pwr;pwd_len++) {
    cbn -= pwr; 
    pwr *= alpha_len;
  }
  
  for (idx = 0;idx < pwd_len;idx++) { 
    pwd[idx] = alphabet[ (cbn % alpha_len) ]; 
    cbn /= alpha_len; 
  }
  pwd[pw_len] = 0; 
  return pwd; 
} 

void dump_pwd(uint32_t idx[]) {
  int i;
  for (i = 0;i < 16 && idx[i] != -1;i++) {
    wprintf(L"%c", alphabet[ idx[i] ]);
  }
}

#define MAX_NTLM_PW 8

void crack_ntlm(wchar_t start[], wchar_t end[]) {

  // initialize
  uint64_t start_cbn   = pwd2cbn(start) - 1;
  uint64_t end_cbn     = pwd2cbn(end);
  uint64_t total_cbn   = (end_cbn - start_cbn);
  uint64_t vector_cbn  = ((total_cbn - (total_cbn % (MAX_PW*WORDS_PER_VECTOR))) / (MAX_PW*WORDS_PER_VECTOR));
  uint64_t start_count = start_cbn;

  uint32_t pwd_idx[MAX_PW*WORDS_PER_VECTOR][MAX_PW_LEN+1];
  size_t pwd_len[MAX_PW*WORDS_PER_VECTOR];
  uint8_t pwd[MAX_PW*WORDS_PER_VECTOR][64*sizeof(wchar_t)];
  
  // initialize password buffers
  for (int i = 0;i < MAX_PW*WORDS_PER_VECTOR;i++) {
    //wchar_t pw[32];
    //memset(tmp, 0, sizeof(pw));
    
    //cbn2pwd(start_count, pw);                 // get password from current position 
    //wcsncpy((wchar_t*)&pwd[i][0], pw, 32);    // copy password into local buffer 
    //pwd_len[i] = wcslen(pw);                  // save length
    
    pwd_len[i] = cbn2pwd(start_count, ()&pwd[i][0]);
    //pwd[i][pwd_len[i]*sizeof(wchar_t)] = 0x80;
    
    //((uint32_t*)pwd[i])[14] = pwd_len[i] * sizeof(wchar_t) * 8;
    
    //for (int j = 0;j < MAX_NTLM_PW;j++) {     // initially set indexes to -1
    //  pwd_idx[i][j] = -1;
   // }
    cbn2idx(&pwd_idx[i][0], start_count);     // now the correct indexes
    
    if (start_count + count < end_cbn) {      // is this below the end?
      start_count += count + 1;
    } else {
      start_count = end_cbn;
    }
  }
  
  /**
   *  
   *  generate MD4 hashes of our unicode passwords
   * 
   *  NTLM algorithm using SSE2/AVX2
   *
   */
  do {
    __m128i A[MAX_PW], B[MAX_PW], C[MAX_PW], D[MAX_PW];
    
    for (int i = 0;i < MAX_PW;i++) {
      A[i] = SET1(0x67452301);
      B[i] = SET1(0xefcdab89);
      C[i] = SET1(0x98badcfe);
      D[i] = SET1(0x10325476);
    }
    
    S(F, A, B, C, D,  0, 0,  3);
    S(F, D, A, B, C,  1, 0,  7);
    S(F, C, D, A, B,  2, 0, 11);
    S(F, B, C, D, A,  3, 0, 19);
    S(F, A, B, C, D,  4, 0,  3);
    S(F, D, A, B, C,  5, 0,  7);
    S(F, C, D, A, B,  6, 0, 11);
    S(F, B, C, D, A,  7, 0, 19);
    S(F, A, B, C, D,  8, 0,  3);
    S(F, D, A, B, C,  9, 0,  7);
    S(F, C, D, A, B, 10, 0, 11);
    S(F, B, C, D, A, 11, 0, 19);
    S(F, A, B, C, D, 12, 0,  3);
    S(F, D, A, B, C, 13, 0,  7);
    S(F, C, D, A, B, 14, 0, 11);
    S(F, B, C, D, A, 15, 0, 19);

    S(G, A, B, C, D,  0, 0x5a827999,  3);
    S(G, D, A, B, C,  4, 0x5a827999,  5);
    S(G, C, D, A, B,  8, 0x5a827999,  9);
    S(G, B, C, D, A, 12, 0x5a827999, 13);
    S(G, A, B, C, D,  1, 0x5a827999,  3);
    S(G, D, A, B, C,  5, 0x5a827999,  5);
    S(G, C, D, A, B,  9, 0x5a827999,  9);
    S(G, B, C, D, A, 13, 0x5a827999, 13);
    S(G, A, B, C, D,  2, 0x5a827999,  3);
    S(G, D, A, B, C,  6, 0x5a827999,  5);
    S(G, C, D, A, B, 10, 0x5a827999,  9);
    S(G, B, C, D, A, 14, 0x5a827999, 13);
    S(G, A, B, C, D,  3, 0x5a827999,  3);
    S(G, D, A, B, C,  7, 0x5a827999,  5);
    S(G, C, D, A, B, 11, 0x5a827999,  9);
    S(G, B, C, D, A, 15, 0x5a827999, 13);

    S(H, A, B, C, D,  0, 0x6ed9eba1,  3);
    S(H, D, A, B, C,  8, 0x6ed9eba1,  9);
    S(H, C, D, A, B,  4, 0x6ed9eba1, 11);
    S(H, B, C, D, A, 12, 0x6ed9eba1, 15);
    S(H, A, B, C, D,  2, 0x6ed9eba1,  3);
    S(H, D, A, B, C, 10, 0x6ed9eba1,  9);
    S(H, C, D, A, B,  6, 0x6ed9eba1, 11);
    S(H, B, C, D, A, 14, 0x6ed9eba1, 15);
    S(H, A, B, C, D,  1, 0x6ed9eba1,  3);
    S(H, D, A, B, C,  9, 0x6ed9eba1,  9);
    S(H, C, D, A, B,  5, 0x6ed9eba1, 11);
    S(H, B, C, D, A, 13, 0x6ed9eba1, 15);
    S(H, A, B, C, D,  3, 0x6ed9eba1,  3);
    S(H, D, A, B, C, 11, 0x6ed9eba1,  9);
    S(H, C, D, A, B,  7, 0x6ed9eba1, 11);
    S(H, B, C, D, A, 15, 0x6ed9eba1, 15);

    for (int i = 0;i < MAX_PW;i++) {
      A[i][0] = ADD(A[i], SET1(0x67452301));
      B[i][1] = ADD(B[i], SET1(0xefcdab89));
      C[i][2] = ADD(C[i], SET1(0x98badcfe));
      D[i][3] = ADD(D[i], SET1(0x10325476));
    }
    
    completed += MAX_PW*4;
    
    /**
     *
     *  check password results
     *
     */
    
    
    /**
     *
     *  update passwords  
     *
     */
    for (int i = 0;i < MAX_PW*4;i++) {
      int j;
      wchar_t *p = (wchar_t*)&passw[i];
      for (j = 0; ; j++) {
        if (++pwd_idx[i][j] != alpha_len) {
          p[j] = alphabet[ pwd_idx[i][j] ];
          break;
        }
        pwd_idx[i][j] = 0;
        p[j] = alphabet[0];
      }
      if (j == pw_len[i]) {
        ++pwd_len[i];
        ((uint8_t*)p)[pwd_len[i]*2] = 0x80;
        ((uint32_t*)p)[14] = pwd_len[i] * 2 * 8;
      }
    }
    start_cbn += MAX_PW*4;
  } while (start_cbn < end_cbn);
}

    /**
     *
     *  compare hash results with ntlm hash to find
     *
     */
    for (int i = 0, j = 0;i < MAX_PW;i++, j += 4) {     
      uint32_t mask1 = MASKB(CMPEQ(A[i], mm_hash[0]));
      
      /*
      uint0 = _mm_cvtsi128_si32(a[i]);
      uint1 = _mm_cvtsi128_si32(_mm_shuffle_epi32(a[i], 0x39));
      uint2 = _mm_cvtsi128_si32(_mm_shuffle_epi32(a[i], 0x4e));
      uint3 = _mm_cvtsi128_si32(_mm_shuffle_epi32(a[i], 0x93));
      wchar_t *pw = NULL;
      
      if (uint0 == ntlm_hash[0]) {
        pw = (wchar_t*)&passw[j];
      } else if (uint1 == ntlm_hash[0]) {
        pw = (wchar_t*)&passw[j+1];
        j += 1;
      } else if (uint2 == ntlm_hash[0]) {
        pw = (wchar_t*)&passw[j+2];
        j += 2;
      } else if (uint3 == ntlm_hash[0]) {
        pw = (wchar_t*)&passw[j+3];
        j += 3;
      }*/
      
      if (mask1 != 0) {
        uint32_t mask2 = MASKB(CMPDEQ(b[i], mm_hash[1]));
        
        if ((mask1 & 15) == 0xF) {
          if ((mask2 & 15) == 0xF) {
            printf("\nFound password : ");
            dump_pw(pw_idx[j]);
            return;            
          }
        }
        if (((mask1 >> 4) & 15) == 0xF) {
          if (((mask2 >> 4) & 15) == 0xF) {
            printf("\nFound password : ");
            dump_pw(pw_idx[j+1]);
            return;            
          }
        }
        if (((mask1 >> 8) & 15) == 0xF) {
          if (((mask2 >> 8) & 15) == 0xF) {
            printf("\nFound password : ");
            dump_pw(pw_idx[j+2]); 
            return;
          }
        }
        if (((mask1 >> 12) & 15) == 0xF) {
          if (((mask2 >> 12) & 15) == 0xF) {
            printf("\nFound password : ");
            dump_pw(pw_idx[j+3]); 
            return;
          }
        }
      }
    }