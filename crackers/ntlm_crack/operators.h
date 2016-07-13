
/*
<mmintrin.h>  MMX
<xmmintrin.h> SSE
<emmintrin.h> SSE2
<pmmintrin.h> SSE3
<tmmintrin.h> SSSE3
<smmintrin.h> SSE4.1
<nmmintrin.h> SSE4.2
<ammintrin.h> SSE4A
<wmmintrin.h> AES
<immintrin.h> AVX
*/

#include <tmmintrin.h>

#ifndef USE_AVX2

#define WORDS_PER_VECTOR 4

// logical
#define XOR(X, Y) _mm_xor_si128(X, Y)
#define OR(X, Y) _mm_or_si128(X, Y)
#define AND(X, Y) _mm_and_si128(X, Y)
#define NOT(X) XOR(X, SET1(-1))

// arithmetic
#define SUB(X, Y) _mm_sub_epi32(X, Y)
#define ADD(X, Y) _mm_add_epi32(X, Y)
#define MUL(X, Y) _mm_mullo_epi32(X, Y)

// comparison
#define CMPDEQ(X, Y) _mm_cmpeq_epi32(X, Y)
#define CMPDGT(X, Y) _mm_cmpgt_epi32(X, Y)
#define CMPDLT(X, Y) _mm_cmplt_epi32(X, Y)

// bits/mask
#define SELB(X, Y, Z) XOR((Z), AND((X), XOR((Y), (Z))))
#define MASKB(X) _mm_movemask_epi8(X)
#define MASKW(X) _mm_movemask_epi16(X)
#define SHUFD(X, N) _mm_shuffle_epi32(X, N)
#define SHUFB(X, N) _mm_shuffle_epi8(X, N)

// scaler
#define EXT(X, N) _mm_extract_epi32(X, N)
#define INS(X, Y, N) _mm_insert_epi32(X, Y, N)
#define SET(W, X, Y, Z) _mm_set_epi32(W, X, Y, Z)
#define SET1(T) _mm_set1_epi32(T)

// shift/rotate
#define SHL(X, Y) _mm_slli_epi32(X, Y)
#define SHR(X, Y) _mm_srli_epi32(X, Y)

#define ROL(X, N) OR(SHL(X, N), SHR(X, (32 - N)))
#define ROR(X, N) OR(SHR(X, N), SHL(X, (32 - N)))

#define SHLV(X, N) _mm_slli_si128(X, N)
#define SHRV(X, N) _mm_srli_si128(X, N)

#else

#define WORDS_PER_VECTOR 8

// logical
#define XOR(X, Y) _mm256_xor_si256(X, Y)
#define OR(X, Y) _mm256_or_si256(X, Y)
#define AND(X, Y) _mm256_and_si256(X, Y)
#define NOT(X) XOR(X, SET1(-1))

// arithmetic
#define SUB(X, Y) _mm256_sub_epi32(X, Y)
#define ADD(X, Y) _mm256_add_epi32(X, Y)
#define MUL(X, Y) _mm256_mullo_epi32(X, Y)

// comparison
#define CMPDEQ(X, Y) _mm256_cmpeq_epi32(X, Y)
#define CMPDGT(X, Y) _mm256_cmpgt_epi32(X, Y)
#define CMPDLT(X, Y) _mm256_cmplt_epi32(X, Y)

// bits/mask
#define SELB(X, Y, Z) XOR((Z), AND((X), XOR((Y), (Z))))
#define MASKB _mm256_movemask_epi8(X)
#define SHUFD(X, N) _mm256_shuffle_epi32(X, N)
#define SHUFB(X, N) _mm256_shuffle_epi8(X, N)

// scaler
#define EXT(X, N) _mm256_extract_epi32(X, N)
#define INS(X, Y, N) _mm256_insert_epi32(X, Y, N)
#define SET(S, T, U, V, W, X, Y, Z) _mm256_set_epi32(S, T, U, V, W, X, Y, Z)
#define SET1(T) _mm256_set1_epi32(T)

// shift/rotate
#define SHL(X, N) _mm256_slli_epi32(X, N)
#define SHR(X, N) _mm256_srli_epi32(X, N)

#define ROL(X, N) OR(SHL(X, N), SHR(X, (32 - N)))
#define ROR(X, N) OR(SHR(X, N), SHL(X, (32 - N)))

#define SHLV(X, N) _mm256_slli_si256(X, N)
#define SHRV(X, N) _mm256_srli_si256(X, N)

#endif

