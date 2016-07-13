
.686
.xmm
.model flat, c

public des_initialize
public des_permutate
public chap_is_valid_pw

; initial/final permutation
perm macro x1, x2, x3, n1, n2
  rol x1, n1
  mov x2, x1
  
  xor x1, x3
  and x1, n2
  
  xor x2, x1
  xor x3, x1
endm

; 1 round of DES encrypting 64-bits of plaintext
des_round macro x1, x2, x
  mov eax, [ebp+x*4]
  xor ecx, ecx
  
  mov edx, [ebp+x*4+4]
  xor ebx, ebx
  
  xor eax, x1
  xor edx, x1
  
  and eax, 0fcfcfcfch
  and edx, 0cfcfcfcfh
  
  mov bl, al
  ror edx, 4
  
  mov cl, ah
  xor x2, sbox0[ebx] ; u & 255
  
  mov bl, dl
  xor x2, sbox1[ebx] ; t & 255
          ;  
  xor x2, sbox2[ecx] ; u >> 8
  
  ror eax, 16
  
  mov cl, dh
  xor x2, sbox3[ecx]
  
  ror edx, 16
  
  mov bl, ah
  xor x2, sbox6[ebx]
  
  mov cl, dh           ; 
  xor x2, sbox7[ecx]
  
  and eax, 0ffh
  xor x2, sbox4[eax]
  
  and edx, 0ffh
  xor x2, sbox5[edx]
endm

; SSE2 version of DES_set_key using precomputed schedules
sse2_des_set_key macro
  lea ebp, [ks+00]
  lea edi, [ks+64]

  pxor xmm0, xmm0
  pxor xmm1, xmm1

  pxor xmm2, xmm2
  pxor xmm3, xmm3

  pxor xmm4, xmm4
  pxor xmm5, xmm5

  pxor xmm6, xmm6
  pxor xmm7, xmm7

  irp i, <0, 2, 4, 6>
    xor eax, eax
    mov al, byte ptr[esi+i]

    xor ebx, ebx
    mov bl, byte ptr[esi+i+1]

    mov ecx, [ks_tbl+4*i]
    mov edx, [ks_tbl+4*i+4]

    rol eax, 7
    rol ebx, 7

    add ecx, eax
    add edx, ebx

    pxor xmm0, [ecx+16*0]
    pxor xmm1, [ecx+16*1]

    pxor xmm0, [edx+16*0]
    pxor xmm1, [edx+16*1]

    pxor xmm2, [ecx+16*2]
    pxor xmm3, [ecx+16*3]

    pxor xmm2, [edx+16*2]
    pxor xmm3, [edx+16*3]

    pxor xmm4, [ecx+16*4]
    pxor xmm5, [ecx+16*5]

    pxor xmm4, [edx+16*4]
    pxor xmm5, [edx+16*5]

    pxor xmm6, [ecx+16*6]
    pxor xmm7, [ecx+16*7]

    pxor xmm6, [edx+16*6]
    pxor xmm7, [edx+16*7]
  endm

  movdqa [ebp+16*0], xmm0
  movdqa [edi+16*0], xmm4

  movdqa [ebp+16*1], xmm1
  movdqa [edi+16*1], xmm5

  movdqa [ebp+16*2], xmm2
  movdqa [edi+16*2], xmm6

  movdqa [ebp+16*3], xmm3
  movdqa [edi+16*3], xmm7
endm

;
des_string_to_key macro
  xor ecx, ecx
  bswap eax
  mov ebx, eax
  and ebx, 0FE000000h
  or ecx, ebx
  rol ecx, 8
  shl eax, 7
  mov ebx, eax
  and ebx, 0FE000000h
  or ecx, ebx
  rol ecx, 8
  shl eax, 7
  mov ebx, eax
  and ebx, 0FE000000h
  or ecx, ebx
  rol ecx, 8
  shl eax, 7
  mov ebx, eax
  and ebx, 0FE000000h
  or ecx, ebx
  rol ecx, 8
  shl eax, 7
  bswap ecx
  mov [esi], ecx
  mov eax, [edi+3]
  xor ecx, ecx
  bswap eax
  rol eax, 4
  mov ebx, eax
  and ebx, 0FE000000h
  or ecx, ebx
  rol ecx, 8
  shl eax, 7
  mov ebx, eax
  and ebx, 0FE000000h
  or ecx, ebx
  rol ecx, 8
  shl eax, 7
  mov ebx, eax
  and ebx, 0FE000000h
  or ecx, ebx
  rol ecx, 8
  shl eax, 7
  mov ebx, eax
  and ebx, 0FE000000h
  or ecx, ebx
  rol ecx, 8
  shl eax, 7
  bswap ecx
  mov [esi+4], ecx
endm

.code

DES_set_key proto C :dword,:dword

;
; this performs the DES initial permutation so we can avoid it later.
;
des_permutate proc uses esi edi ebx input:dword, output:dword
  mov esi, [input]
  mov edi, [output]

  lodsd
  xchg eax, ebx
  lodsd
  xchg eax, ebx

  perm  eax, edx, ebx, 04, 0f0f0f0f0h
  perm  ebx, eax, edx, 20, 0fff0000fh
  perm  eax, ebx, edx, 14, 033333333h
  perm  edx, eax, ebx, 22, 003fc03fch
  perm  eax, edx, ebx, 09, 0aaaaaaaah

  rol ebx,1

  mov eax, edx
  stosd
  mov eax, ebx
  stosd
  ret
des_permutate endp

;
; initialize DES keys and save in memory
;
des_initialize proc uses esi edi ebx
  local key[8] :byte

  xor esi,esi
  and dword ptr[key+0], esi
  and dword ptr[key+4], esi

  .while esi < 8
    mov edi, ks_tbl[esi*4]
    xor ebx, ebx

    .while ebx < 256
      mov byte ptr[key+esi], bl

      invoke DES_set_key, addr key, edi

      add edi, sizeof(DES_key_schedule)
      inc ebx
    .endw
    mov  byte ptr[key+esi],0
    inc  esi
  .endw
  ret
des_initialize endp

A_CONSTANT equ 067452301h
B_CONSTANT equ 0EFCDAB89h
C_CONSTANT equ 098BADCFEh
D_CONSTANT equ 010325476h

; ++++++++++++++++++++++++++++++++++++

ff macro x1, x2, x3, x4, x, s
  mov edi, x3
  add x1, [esi+4*x]

  xor edi, x4
  and edi, x2

  xor edi, x4
  lea x1, [x1+edi]

  rol x1, s
endm

; +++++++++++++++++++++++++++++++++++++

gg macro x1, x2, x3, x4, x, s
  mov edi, x3
  mov ebp, x3

  and edi, x4
  or ebp, x4

  and ebp, x2
  or edi, ebp

  lea x1, [x1+edi+05a827999h]
  add x1, [esi+4*x]

  rol x1, s
endm

; ++++++++++++++++++++++++++++++++++++

hh macro x1, x2, x3, x4, x, s
  mov edi, x3
  xor edi, x4

  add x1, [esi+4*x]
  xor edi, x2

  lea x1, [x1+edi+06ed9eba1h]
  rol x1, s
endm

chap_is_valid_pw proc uses ebx ebp esi edi pw:dword, pw_len:dword
  mov esi, [pw]
  mov eax, [pw_len]
  mov byte ptr[esi+2*eax], 80h
  shl eax, 3
  mov dword ptr[esi+56], eax

  mov eax, A_CONSTANT
  mov ebx, B_CONSTANT
  mov ecx, C_CONSTANT
  mov edx, D_CONSTANT

  ; ===========================

  irp i, <0, 4, 8, 12>
    ff  eax, ebx, ecx, edx, %i+0, 03
    ff  edx, eax, ebx, ecx, %i+1, 07
    ff  ecx, edx, eax, ebx, %i+2, 11
    ff  ebx, ecx, edx, eax, %i+3, 19
  endm
       
  ; ===========================

  gg  eax, ebx, ecx, edx, 00, 03
  gg  edx, eax, ebx, ecx, 04, 05
  gg  ecx, edx, eax, ebx, 08, 09
  gg  ebx, ecx, edx, eax, 12, 13

  gg  eax, ebx, ecx, edx, 01, 03
  gg  edx, eax, ebx, ecx, 05, 05
  gg  ecx, edx, eax, ebx, 09, 09
  gg  ebx, ecx, edx, eax, 13, 13

  gg  eax, ebx, ecx, edx, 02, 03
  gg  edx, eax, ebx, ecx, 06, 05
  gg  ecx, edx, eax, ebx, 10, 09
  gg  ebx, ecx, edx, eax, 14, 13

  gg  eax, ebx, ecx, edx, 03, 03
  gg  edx, eax, ebx, ecx, 07, 05
  gg  ecx, edx, eax, ebx, 11, 09
  gg  ebx, ecx, edx, eax, 15, 13

  ; ===========================

  hh  eax, ebx, ecx, edx, 00, 03
  hh  edx, eax, ebx, ecx, 08, 09
  hh  ecx, edx, eax, ebx, 04, 11
  hh  ebx, ecx, edx, eax, 12, 15

  hh  eax, ebx, ecx, edx, 02, 03
  hh  edx, eax, ebx, ecx, 10, 09
  hh  ecx, edx, eax, ebx, 06, 11
  hh  ebx, ecx, edx, eax, 14, 15

  hh  eax, ebx, ecx, edx, 01, 03
  hh  edx, eax, ebx, ecx, 09, 09
  hh  ecx, edx, eax, ebx, 05, 11
  hh  ebx, ecx, edx, eax, 13, 15

  hh  eax, ebx, ecx, edx, 03, 03
  hh  edx, eax, ebx, ecx, 11, 09

  lea edi, [edx+D_CONSTANT]
  and edi, 0FFFF0000h
  cmp edi, dword ptr[ntlm_bytes]
  jne @exit_is_valid

  hh  ecx, edx, eax, ebx, 07, 11
  hh  ebx, ecx, edx, eax, 15, 15

  add eax, A_CONSTANT
  add ebx, B_CONSTANT

  lea esi, [des_key]
  lea edi, [ntlm_hash]

  mov dword ptr[edi+0], eax
  mov dword ptr[edi+4], ebx

  des_string_to_key
  sse2_des_set_key

  mov esi, dword ptr[plaintext+0]
  mov edi, dword ptr[plaintext+4]

  irp i, <0, 4, 8, 12, 16, 20, 24>
    des_round  esi, edi, (i+0)
    des_round  edi, esi, (i+2)
  endm

  des_round  esi, edi, 28
  
  mov eax, edi
  sub eax, dword ptr[des_hash+0]
  jnz @exit_is_valid

  des_round  edi, esi,30

  mov eax, esi
  sub eax, dword ptr[des_hash+4]
@exit_is_valid:
  ret
chap_is_valid_pw endp
     
DES_key_schedule struct
  key_data db 128 dup (?)
DES_key_schedule ends

.data?

; thread parameters
plaintext      db 8  dup (?)
des_hash       db 8  dup (?)
ntlm_bytes     db 4  dup (?)

; during processing
des_key        db 8  dup (?)
ntlm_hash      db 8  dup (?)
ntlm_buffers   db 64 dup (?)

ks db 128 dup (?)

ks_one DES_key_schedule 256 dup (<>)
ks_two DES_key_schedule 256 dup (<>)
ks_three DES_key_schedule 256 dup (<>)
ks_four DES_key_schedule 256 dup (<>)
ks_five DES_key_schedule 256 dup (<>)
ks_six DES_key_schedule 256 dup (<>)
ks_seven DES_key_schedule 256 dup (<>)
ks_eight DES_key_schedule 256 dup (<>)

.data

ks_tbl dd offset ks_one
       dd offset ks_two
       dd offset ks_three
       dd offset ks_four
       dd offset ks_five
       dd offset ks_six
       dd offset ks_seven
       dd offset ks_eight

sbox1 dd 02080800h, 00080000h, 02000002h, 02080802h
      dd 02000000h, 00080802h, 00080002h, 02000002h
      dd 00080802h, 02080800h, 02080000h, 00000802h
      dd 02000802h, 02000000h, 00000000h, 00080002h
      dd 00080000h, 00000002h, 02000800h, 00080800h
      dd 02080802h, 02080000h, 00000802h, 02000800h
      dd 00000002h, 00000800h, 00080800h, 02080002h
      dd 00000800h, 02000802h, 02080002h, 00000000h
      dd 00000000h, 02080802h, 02000800h, 00080002h
      dd 02080800h, 00080000h, 00000802h, 02000800h
      dd 02080002h, 00000800h, 00080800h, 02000002h
      dd 00080802h, 00000002h, 02000002h, 02080000h
      dd 02080802h, 00080800h, 02080000h, 02000802h
      dd 02000000h, 00000802h, 00080002h, 00000000h
      dd 00080000h, 02000000h, 02000802h, 02080800h
      dd 00000002h, 02080002h, 00000800h, 00080802h

sbox2 dd 40108010h, 00000000h, 00108000h, 40100000h
      dd 40000010h, 00008010h, 40008000h, 00108000h
      dd 00008000h, 40100010h, 00000010h, 40008000h
      dd 00100010h, 40108000h, 40100000h, 00000010h
      dd 00100000h, 40008010h, 40100010h, 00008000h
      dd 00108010h, 40000000h, 00000000h, 00100010h
      dd 40008010h, 00108010h, 40108000h, 40000010h
      dd 40000000h, 00100000h, 00008010h, 40108010h
      dd 00100010h, 40108000h, 40008000h, 00108010h
      dd 40108010h, 00100010h, 40000010h, 00000000h
      dd 40000000h, 00008010h, 00100000h, 40100010h
      dd 00008000h, 40000000h, 00108010h, 40008010h
      dd 40108000h, 00008000h, 00000000h, 40000010h
      dd 00000010h, 40108010h, 00108000h, 40100000h
      dd 40100010h, 00100000h, 00008010h, 40008000h
      dd 40008010h, 00000010h, 40100000h, 00108000h

sbox3 dd 04000001h, 04040100h, 00000100h, 04000101h
      dd 00040001h, 04000000h, 04000101h, 00040100h
      dd 04000100h, 00040000h, 04040000h, 00000001h
      dd 04040101h, 00000101h, 00000001h, 04040001h
      dd 00000000h, 00040001h, 04040100h, 00000100h
      dd 00000101h, 04040101h, 00040000h, 04000001h
      dd 04040001h, 04000100h, 00040101h, 04040000h
      dd 00040100h, 00000000h, 04000000h, 00040101h
      dd 04040100h, 00000100h, 00000001h, 00040000h
      dd 00000101h, 00040001h, 04040000h, 04000101h
      dd 00000000h, 04040100h, 00040100h, 04040001h
      dd 00040001h, 04000000h, 04040101h, 00000001h
      dd 00040101h, 04000001h, 04000000h, 04040101h
      dd 00040000h, 04000100h, 04000101h, 00040100h
      dd 04000100h, 00000000h, 04040001h, 00000101h
      dd 04000001h, 00040101h, 00000100h, 04040000h

sbox4 dd 00401008h, 10001000h, 00000008h, 10401008h
      dd 00000000h, 10400000h, 10001008h, 00400008h
      dd 10401000h, 10000008h, 10000000h, 00001008h
      dd 10000008h, 00401008h, 00400000h, 10000000h
      dd 10400008h, 00401000h, 00001000h, 00000008h
      dd 00401000h, 10001008h, 10400000h, 00001000h
      dd 00001008h, 00000000h, 00400008h, 10401000h
      dd 10001000h, 10400008h, 10401008h, 00400000h
      dd 10400008h, 00001008h, 00400000h, 10000008h
      dd 00401000h, 10001000h, 00000008h, 10400000h
      dd 10001008h, 00000000h, 00001000h, 00400008h
      dd 00000000h, 10400008h, 10401000h, 00001000h
      dd 10000000h, 10401008h, 00401008h, 00400000h
      dd 10401008h, 00000008h, 10001000h, 00401008h
      dd 00400008h, 00401000h, 10400000h, 10001008h
      dd 00001008h, 10000000h, 10000008h, 10401000h

sbox5 dd 08000000h, 00010000h, 00000400h, 08010420h
      dd 08010020h, 08000400h, 00010420h, 08010000h
      dd 00010000h, 00000020h, 08000020h, 00010400h
      dd 08000420h, 08010020h, 08010400h, 00000000h
      dd 00010400h, 08000000h, 00010020h, 00000420h
      dd 08000400h, 00010420h, 00000000h, 08000020h
      dd 00000020h, 08000420h, 08010420h, 00010020h
      dd 08010000h, 00000400h, 00000420h, 08010400h
      dd 08010400h, 08000420h, 00010020h, 08010000h
      dd 00010000h, 00000020h, 08000020h, 08000400h
      dd 08000000h, 00010400h, 08010420h, 00000000h
      dd 00010420h, 08000000h, 00000400h, 00010020h
      dd 08000420h, 00000400h, 00000000h, 08010420h
      dd 08010020h, 08010400h, 00000420h, 00010000h
      dd 00010400h, 08010020h, 08000400h, 00000420h
      dd 00000020h, 00010420h, 08010000h, 08000020h

sbox6 dd 80000040h, 00200040h, 00000000h, 80202000h
      dd 00200040h, 00002000h, 80002040h, 00200000h
      dd 00002040h, 80202040h, 00202000h, 80000000h
      dd 80002000h, 80000040h, 80200000h, 00202040h
      dd 00200000h, 80002040h, 80200040h, 00000000h
      dd 00002000h, 00000040h, 80202000h, 80200040h
      dd 80202040h, 80200000h, 80000000h, 00002040h
      dd 00000040h, 00202000h, 00202040h, 80002000h
      dd 00002040h, 80000000h, 80002000h, 00202040h
      dd 80202000h, 00200040h, 00000000h, 80002000h
      dd 80000000h, 00002000h, 80200040h, 00200000h
      dd 00200040h, 80202040h, 00202000h, 00000040h
      dd 80202040h, 00202000h, 00200000h, 80002040h
      dd 80000040h, 80200000h, 00202040h, 00000000h
      dd 00002000h, 80000040h, 80002040h, 80202000h
      dd 80200000h, 00002040h, 00000040h, 80200040h

sbox7 dd 00004000h, 00000200h, 01000200h, 01000004h
      dd 01004204h, 00004004h, 00004200h, 00000000h
      dd 01000000h, 01000204h, 00000204h, 01004000h
      dd 00000004h, 01004200h, 01004000h, 00000204h
      dd 01000204h, 00004000h, 00004004h, 01004204h
      dd 00000000h, 01000200h, 01000004h, 00004200h
      dd 01004004h, 00004204h, 01004200h, 00000004h
      dd 00004204h, 01004004h, 00000200h, 01000000h
      dd 00004204h, 01004000h, 01004004h, 00000204h
      dd 00004000h, 00000200h, 01000000h, 01004004h
      dd 01000204h, 00004204h, 00004200h, 00000000h
      dd 00000200h, 01000004h, 00000004h, 01000200h
      dd 00000000h, 01000204h, 01000200h, 00004200h
      dd 00000204h, 00004000h, 01004204h, 01000000h
      dd 01004200h, 00000004h, 00004004h, 01004204h
      dd 01000004h, 01004200h, 01004000h, 00004004h

sbox8 dd 20800080h, 20820000h, 00020080h, 00000000h
      dd 20020000h, 00800080h, 20800000h, 20820080h
      dd 00000080h, 20000000h, 00820000h, 00020080h
      dd 00820080h, 20020080h, 20000080h, 20800000h
      dd 00020000h, 00820080h, 00800080h, 20020000h
      dd 20820080h, 20000080h, 00000000h, 00820000h
      dd 20000000h, 00800000h, 20020080h, 20800080h
      dd 00800000h, 00020000h, 20820000h, 00000080h
      dd 00800000h, 00020000h, 20000080h, 20820080h
      dd 00020080h, 20000000h, 00000000h, 00820000h
      dd 20800080h, 20020080h, 20020000h, 00800080h
      dd 20820000h, 00000080h, 00800080h, 20020000h
      dd 20820080h, 00800000h, 20800000h, 20000080h
      dd 00820000h, 00020080h, 20020080h, 20800000h
      dd 00000080h, 20820000h, 00820080h, 00000000h
      dd 20000000h, 20800080h, 00020000h, 00820080h
      
      end