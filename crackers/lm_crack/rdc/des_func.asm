

.686
.xmm
.model flat, C

des_ks struct
  x db 128 dup (?)
des_ks ends

.data?

align 16
ks1 des_ks 256 dup (<>)
align 16
ks2 des_ks 256 dup (<>)
align 16
ks3 des_ks 256 dup (<>)
align 16
ks4 des_ks 256 dup (<>)
align 16
ks5 des_ks 256 dup (<>)
align 16
ks6 des_ks 256 dup (<>)
align 16
ks7 des_ks 256 dup (<>)
align 16
ks8 des_ks 256 dup (<>)

; combination of ks1 + ks2
ks12 des_ks 256*256 dup (<>)

plaintext  db 8 dup (?)
ciphertext db 8 dup (?)

iterations dd 2 dup (?)

key_idx dd 8 dup (?)

charlen dd ?
sqrlen  dd ?

.data

ks_tbl dd offset ks1
       dd offset ks2
       dd offset ks3
       dd offset ks4
       dd offset ks5
       dd offset ks6
       dd offset ks7

.data

sbox1 label dword
  dd   02080800h,00080000h,02000002h,02080802h
  dd   02000000h,00080802h,00080002h,02000002h
  dd   00080802h,02080800h,02080000h,00000802h
  dd   02000802h,02000000h,00000000h,00080002h
  dd   00080000h,00000002h,02000800h,00080800h
  dd   02080802h,02080000h,00000802h,02000800h
  dd   00000002h,00000800h,00080800h,02080002h
	dd   00000800h,02000802h,02080002h,00000000h
	dd   00000000h,02080802h,02000800h,00080002h
	dd   02080800h,00080000h,00000802h,02000800h
	dd   02080002h,00000800h,00080800h,02000002h
	dd   00080802h,00000002h,02000002h,02080000h
	dd   02080802h,00080800h,02080000h,02000802h
	dd   02000000h,00000802h,00080002h,00000000h
	dd   00080000h,02000000h,02000802h,02080800h
	dd   00000002h,02080002h,00000800h,00080802h

sbox2	label dword
  dd   40108010h,00000000h,00108000h,40100000h
	dd   40000010h,00008010h,40008000h,00108000h
	dd   00008000h,40100010h,00000010h,40008000h
	dd   00100010h,40108000h,40100000h,00000010h
	dd   00100000h,40008010h,40100010h,00008000h
	dd   00108010h,40000000h,00000000h,00100010h
	dd   40008010h,00108010h,40108000h,40000010h
	dd   40000000h,00100000h,00008010h,40108010h
	dd   00100010h,40108000h,40008000h,00108010h
	dd   40108010h,00100010h,40000010h,00000000h
	dd   40000000h,00008010h,00100000h,40100010h
	dd   00008000h,40000000h,00108010h,40008010h
	dd   40108000h,00008000h,00000000h,40000010h
	dd   00000010h,40108010h,00108000h,40100000h
	dd   40100010h,00100000h,00008010h,40008000h
	dd   40008010h,00000010h,40100000h,00108000h

sbox3 label dword
  dd   04000001h,04040100h,00000100h,04000101h
	dd   00040001h,04000000h,04000101h,00040100h
	dd   04000100h,00040000h,04040000h,00000001h
	dd   04040101h,00000101h,00000001h,04040001h
	dd   00000000h,00040001h,04040100h,00000100h
	dd   00000101h,04040101h,00040000h,04000001h
	dd   04040001h,04000100h,00040101h,04040000h
	dd   00040100h,00000000h,04000000h,00040101h
	dd   04040100h,00000100h,00000001h,00040000h
	dd   00000101h,00040001h,04040000h,04000101h
	dd   00000000h,04040100h,00040100h,04040001h
	dd   00040001h,04000000h,04040101h,00000001h
	dd   00040101h,04000001h,04000000h,04040101h
	dd   00040000h,04000100h,04000101h,00040100h
	dd   04000100h,00000000h,04040001h,00000101h
	dd   04000001h,00040101h,00000100h,04040000h

sbox4	label dword
  dd   00401008h,10001000h,00000008h,10401008h
	dd   00000000h,10400000h,10001008h,00400008h
	dd   10401000h,10000008h,10000000h,00001008h
	dd   10000008h,00401008h,00400000h,10000000h
	dd   10400008h,00401000h,00001000h,00000008h
	dd   00401000h,10001008h,10400000h,00001000h
	dd   00001008h,00000000h,00400008h,10401000h
	dd   10001000h,10400008h,10401008h,00400000h
	dd   10400008h,00001008h,00400000h,10000008h
	dd   00401000h,10001000h,00000008h,10400000h
	dd   10001008h,00000000h,00001000h,00400008h
	dd   00000000h,10400008h,10401000h,00001000h
	dd   10000000h,10401008h,00401008h,00400000h
	dd   10401008h,00000008h,10001000h,00401008h
	dd   00400008h,00401000h,10400000h,10001008h
	dd   00001008h,10000000h,10000008h,10401000h

sbox5	label dword
  dd   08000000h,00010000h,00000400h,08010420h
	dd   08010020h,08000400h,00010420h,08010000h
	dd   00010000h,00000020h,08000020h,00010400h
	dd   08000420h,08010020h,08010400h,00000000h
	dd   00010400h,08000000h,00010020h,00000420h
	dd   08000400h,00010420h,00000000h,08000020h
	dd   00000020h,08000420h,08010420h,00010020h
	dd   08010000h,00000400h,00000420h,08010400h
	dd   08010400h,08000420h,00010020h,08010000h
	dd   00010000h,00000020h,08000020h,08000400h
	dd   08000000h,00010400h,08010420h,00000000h
	dd   00010420h,08000000h,00000400h,00010020h
	dd   08000420h,00000400h,00000000h,08010420h
	dd   08010020h,08010400h,00000420h,00010000h
	dd   00010400h,08010020h,08000400h,00000420h
	dd   00000020h,00010420h,08010000h,08000020h

sbox6	label dword
  dd   80000040h,00200040h,00000000h,80202000h
	dd   00200040h,00002000h,80002040h,00200000h
	dd   00002040h,80202040h,00202000h,80000000h
	dd   80002000h,80000040h,80200000h,00202040h
	dd   00200000h,80002040h,80200040h,00000000h
	dd   00002000h,00000040h,80202000h,80200040h
	dd   80202040h,80200000h,80000000h,00002040h
	dd   00000040h,00202000h,00202040h,80002000h
	dd   00002040h,80000000h,80002000h,00202040h
	dd   80202000h,00200040h,00000000h,80002000h
	dd   80000000h,00002000h,80200040h,00200000h
	dd   00200040h,80202040h,00202000h,00000040h
	dd   80202040h,00202000h,00200000h,80002040h
	dd   80000040h,80200000h,00202040h,00000000h
	dd   00002000h,80000040h,80002040h,80202000h
	dd   80200000h,00002040h,00000040h,80200040h

sbox7 label dword
  dd   00004000h,00000200h,01000200h,01000004h
	dd   01004204h,00004004h,00004200h,00000000h
	dd   01000000h,01000204h,00000204h,01004000h
	dd   00000004h,01004200h,01004000h,00000204h
	dd   01000204h,00004000h,00004004h,01004204h
	dd   00000000h,01000200h,01000004h,00004200h
	dd   01004004h,00004204h,01004200h,00000004h
	dd   00004204h,01004004h,00000200h,01000000h
	dd   00004204h,01004000h,01004004h,00000204h
	dd   00004000h,00000200h,01000000h,01004004h
	dd   01000204h,00004204h,00004200h,00000000h
	dd   00000200h,01000004h,00000004h,01000200h
	dd   00000000h,01000204h,01000200h,00004200h
	dd   00000204h,00004000h,01004204h,01000000h
	dd   01004200h,00000004h,00004004h,01004204h
	dd   01000004h,01004200h,01004000h,00004004h

sbox8	label dword
  dd   20800080h,20820000h,00020080h,00000000h
	dd   20020000h,00800080h,20800000h,20820080h
	dd   00000080h,20000000h,00820000h,00020080h
	dd   00820080h,20020080h,20000080h,20800000h
	dd   00020000h,00820080h,00800080h,20020000h
	dd   20820080h,20000080h,00000000h,00820000h
	dd   20000000h,00800000h,20020080h,20800080h
	dd   00800000h,00020000h,20820000h,00000080h
	dd   00800000h,00020000h,20000080h,20820080h
	dd   00020080h,20000000h,00000000h,00820000h
	dd   20800080h,20020080h,20020000h,00800080h
	dd   20820000h,00000080h,00800080h,20020000h
	dd   20820080h,00800000h,20800000h,20000080h
	dd   00820000h,00020080h,20020080h,20800000h
	dd   00000080h,20820000h,00820080h,00000000h
	dd   20000000h,20800080h,00020000h,00820080h
  
des_f macro dwl, dwr, x
   mov   eax, [ks3+4*x]
   xor   ecx, ecx

   mov   edx, [ks3+4*x+4]
   xor   ebx, ebx

   xor   eax, [ebp+4*x]
   xor   edx, [ebp+4*x+4]
      
   xor   eax, dwl
   xor   edx, dwl

   and   eax, 0fcfcfcfch
   and   edx, 0cfcfcfcfh

   mov   bl, al
   ror   edx, 4

   mov   cl, ah
   xor   dwr, sbox1[ebx]

   ror   eax, 16
   xor   dwr, sbox3[ecx]

   mov   bl, dl
   xor   dwr, sbox2[ebx]

   mov   cl, dh
   mov   bl, ah

   ror   edx, 16
   xor   dwr, sbox4[ecx]

   mov   cl, dh
   xor   dwr, sbox7[ebx]

   and   eax, 0ffh
   xor   dwr, sbox8[ecx]

   and   edx, 0ffh
   xor   dwr, sbox5[eax]

   xor   dwr, sbox6[edx]
endm

upd_ks macro idx
  mov   eax, [key_idx+4*idx]          ; get key index
  mov   esi, dword ptr[ks_tbl+4*idx]  ; get key schedule buffer
  shl   eax, 7                        ; *= 128 to get schedule

  pxor    xmm0, xmm0
  pxor    xmm1, xmm1
  pxor    xmm2, xmm2
  pxor    xmm3, xmm3

  mov     ebp, [key]
  add     edi, 64

  pxor    xmm4, xmm4
  pxor    xmm5, xmm5
  pxor    xmm6, xmm6
  pxor    xmm7, xmm7
    
  pxor    xmm0, [ecx+16*0]
  pxor    xmm1, [ecx+16*1]
  pxor    xmm0, [edx+16*0]
  pxor    xmm1, [edx+16*1]

  pxor    xmm2, [ecx+16*2]
  pxor    xmm3, [ecx+16*3]
  pxor    xmm2, [edx+16*2]
  pxor    xmm3, [edx+16*3]

  pxor    xmm4, [ecx+16*4]
  pxor    xmm5, [ecx+16*5]
  pxor    xmm4, [edx+16*4]
  pxor    xmm5, [edx+16*5]

  pxor    xmm6, [ecx+16*6]
  pxor    xmm7, [ecx+16*7]
  pxor    xmm6, [edx+16*6]
  pxor    xmm7, [edx+16*7]

  movdqa  [esi+16*0], xmm0
  movdqa  [edi+16*0], xmm4

  movdqa  [esi+16*1], xmm1
  movdqa  [edi+16*1], xmm5

  movdqa  [esi+16*2], xmm2
  movdqa  [edi+16*2], xmm6

  movdqa  [esi+16*3], xmm3
  movdqa  [edi+16*3], xmm7
endm

; perform initial permutation on ciphertext
perm_op macro x0, x1, x2, i1, i2
  rol    x0, i1
  mov    x1, x0
  xor    x0, x2
  and    x0, i2

  xor    x1, x0
  xor    x2, x0
endm

.code

; void des_ip (void *in, void *out)
des_ip proc
  pushad
  mov    esi, ecx
  mov    edi, edx
  
  lodsd
  xchg   eax, ebx
  lodsd
  xchg   eax, ebx

  perm_op eax, edx, ebx, 04, 0f0f0f0f0h
  perm_op ebx, eax, edx, 20, 0fff0000fh
  perm_op eax, ebx, edx, 14, 033333333h
  perm_op edx, eax, ebx, 22, 003fc03fch
  perm_op eax, edx, ebx, 09, 0aaaaaaaah

  rol    ebx,1

  xchg   eax, edx
  stosd
  xchg   eax, ebx
  stosd
  popad
  ret
des_ip ENDP

; void init_des (void *ciphertext, void *plaintext)
init_des proc
  pushad
  ; perform initial permutation on ciphertext
  mov    ecx, [esp+4]
  lea    edx, [ciphertext]
  call   des_ip

  mov    ecx, [esp+8]
  lea    edx, [plaintext]
  call   des_ip
  popad
  ret
init_des endp

init_ks proc
  pushad
  sub    esp, 128 + 8
  mov    edi, esp
  ; memset (key, 0, sizeof (key));
  xor    eax, eax
  stosd
  stosd
  ; memset (&ks, 0, sizeof (ks));
  push   128
  pop    ecx
  rep    stosb

  xor    ebx, ebx
  
  .while esi < 8
    mov   edi, [ks_tbl+4*esi]
    xor   ebx, ebx
            
    .while ebx < 256
      lea  ecx,[key]
      mov  byte ptr[ecx+esi],bl

      invoke DES_set_key, ecx, edi

      add  edi, sizeof des_ks
      inc  ebx
    .endw
    lea   ecx,[key]
    mov   byte ptr[ecx+esi],0
    inc   esi
  .endw
  ret
init_subkeys endp

    
upd_idx macro idx, lbl
  add    dword ptr [key_idx+4*idx], 1
  cmp    dword ptr [key_idx+4*idx], eax
  jne    lbl
  and    dword ptr [key_idx+4*idx], 0
endm


attack_des proc
l7:
    upd_ks 7
l6:
    upd_ks 6
l5:
    upd_ks 5
l4:
    upd_ks 4
l3:
    upd_ks 3

    mov    eax, [sqrlen]
    lea    ebp, [ks12]
    mov    [l_ctr], eax

des_loop:
    mov    esi, dword ptr[plaintext]
    mov    edi, dword ptr[plaintext+4]

    des_f  esi, edi, 00
    des_f  edi, esi, 02
    des_f  esi, edi, 04
    des_f  edi, esi, 06
    
    des_f  esi, edi, 08
    des_f  edi, esi, 10
    des_f  esi, edi, 12
    des_f  edi, esi, 14

    des_f  esi, edi, 16
    des_f  edi, esi, 18
    des_f  esi, edi, 20
    des_f  edi, esi, 22

    des_f  esi, edi, 24
    des_f  edi, esi, 26
    des_f  esi, edi, 28

    cmp    edi, dword ptr[ciphertext]
    jne    upd_ctr

    des_f  edi, esi, 30

    cmp    esi, dword ptr[ciphertext+4]
    je     xit_attack

upd_ctr:
    sub    dword ptr [l_ctr], 1
    lea    ebp, [ebp+128]
    jne    des_loop

upd_itr:
    mov    ebx, [sqrlen]
    mov    eax, [charlen]

    add    dword ptr[iterations+0], ebx
    adc    dword ptr[iterations+4], 0

    upd_idx 3, l3

    upd_idx 4, l4

    upd_idx 5, l5

    upd_idx 6, l6

    upd_idx 7, l7
xit_attack:
    ret
attack_des endp

    end

