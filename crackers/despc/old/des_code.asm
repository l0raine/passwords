

.686
.xmm
.model flat, c

	option casemap:none

	.nolist
	.nocref
WIN32_LEAN_AND_MEAN equ 1
	include windows.inc
include stdio.inc

	.list
	.cref

include des.inc

extern DES_set_key :proc
extern DES_str_to_key :proc

  .data
  hexit db 10,"%ld ", 0
  
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
align 16
kx1 des_ks <>
align 16
kx2 des_ks <>
align 16
kx3 des_ks <>
align 16
kx4 des_ks <>
align 16
kx5 des_ks <>
align 16
kx6 des_ks <>
align 16
kx7 des_ks <>
align 16
kx8 des_ks <>
   
.data

ks_tbl label dword
  dd offset ks1
  dd offset ks2
  dd offset ks3
  dd offset ks4
  dd offset ks5
  dd offset ks6
  dd offset ks7
  dd offset ks8
     
ks label dword
  dd offset kx1
  dd offset kx2
  dd offset kx3
  dd offset kx4
  dd offset kx5
  dd offset kx6
  dd offset kx7
  dd offset kx8
   
.data
align 16
bozo dd 256 dup (?)
; where to store attack parameters
ap attack_t <>

l_ctr dd ?

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
   mov   eax, dword ptr[kx3+4*x]
   xor   ecx, ecx

   mov   edx, dword ptr[kx3+4*x+4]
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

comment ~
#define DES_SET_KEY1(idx) { \
  s = &ks_tbl[idx-1][key_idx[idx-1]]; \
  p = &ks[idx]; \
  d = &ks[idx-1]; \
  for (i = 0;i < (sizeof(DES_key_schedule) / sizeof(DES_LONG)); i++) { \
    ((DES_LONG*)d)[i+0] = ((DES_LONG*)p)[i+0] | ((DES_LONG*)s)[i+0]; \
  } \
}
~
upd_ks macro idx
  local loop_j

  mov    eax, [ap.pwd_idx+(4*idx)-4] ; get key index
  rol    eax, 7                      ; *= 128
  
  mov    esi, [ks_tbl+(4*idx)-4]     ; get key schedule 
  add    esi, eax                    ; esi=&ks_tbl[i][key[i]]
  
  mov    ebx, [ks+(4*idx)]           ; previous key schedule
  mov    edi, [ks+(4*idx)-4]         ; destination key schedule

  xor    edx, edx                    ; j=0
loop_j:
ifdef SSE
  movdqa xmm0, [esi+edx]
  por    xmm0, [ebx+edx]
  movdqa [edi+edx], xmm0
  add    edx, 16
  cmp    edx, 128
  jnz    loop_j
elseifdef MMX
  movq   mm0, [esi+8*edx]
  por    mm0, [ebx+8*edx]
  movq   [edi+8*edx], mm0
  add    edx, 1
  cmp    edx, 128/8
  jnz    loop_j
else
  mov    eax, [esi+4*edx]  ; s
  or     eax, [ebx+4*edx]  ; p
  mov    [edi+4*edx], eax  ; d
  add    edx, 1
  cmp    edx, 128/4
  jnz    loop_j
endif

  endm

.code

  public init_des
  public _init_des
  
; void init_des (void *ciphertext, void *plaintext);
_init_des:
init_des proc
  pushad
  mov    esi, edx
  
  popad
  ret
init_des endp

  public init_attack
  public _init_attack
  
; void init_ks(attack_t *ap);
_init_attack:
init_attack proc
  pushad
  ;int 3
  mov    esi, [esp+32+4] ; copy attack parameters
  lea    edi, [ap]
  push   sizeof attack_t
  pop    ecx
  rep    movsb  
  popad
  ret
init_attack endp
    
upd_idx macro idx, lbl
  add    dword ptr [ap.pwd_idx+(4*idx)-4], 1
  cmp    dword ptr [ap.pwd_idx+(4*idx)-4], eax
  jne    lbl
  and    dword ptr [ap.pwd_idx+(4*idx)-4], 0
endm

  public attack_des
  public _attack_des
; void attack_des ();  
_attack_des:
attack_des proc
    pushad
    jmp    l3
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

    mov    eax, [ap.sqrlen]
    mov    ebp, [ap.ks_sqr]
    mov    [l_ctr], eax

des_loop:    
    mov    esi, dword ptr[ap.pt]
    mov    edi, dword ptr[ap.pt+4]

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

    cmp    edi, dword ptr[ap.ct]
    jne    upd_ctr
    
    des_f  edi, esi, 30
    
    cmp    esi, dword ptr[ap.ct+4]
    je     xit_attack

upd_ctr:
    sub    dword ptr [l_ctr], 1
    lea    ebp, [ebp+128]
    jne    des_loop

    mov    ebx, [ap.sqrlen]
    mov    eax, [ap.alpha_len]
    
    add    dword ptr[ap.iter+0], ebx
    adc    dword ptr[ap.iter+4], 0
    
    upd_idx 3, l3

    upd_idx 4, l4

    upd_idx 5, l5

    upd_idx 6, l6

    upd_idx 7, l7
xit_attack:
    mov   edi, [esp+32+4]
    lea   esi, [ap]
    push  sizeof attack_t
    pop   ecx
    rep   movsb
    popad
    ret
attack_des endp

comment ~
void DES_init_keys (void) {
  uint8_t key[8];
  int i, j;
  
  memset (key, 0, sizeof(key));
  
  for (i=0; i<8; i++) {
    for (j=0; j<256; j++) {
      key[i] = j;
      DES_set_key ((DES_cblock*)&key, &ks_tblx[i][j]);
    }
    key[i] = 0;
  }
}
~
; initialize key schedules
  public _init_keys_x86
  public init_keys_x86
; void init_keys_x86 (void);
_init_keys_x86:
init_keys_x86 proc
  pushad
  ; DES_cblock key;
  ; memset (key, 0, sizeof (key));
  xor    eax, eax
  push   eax
  push   eax
  mov    ebx, esp
  
  xor    esi, esi   ; i = 0
loop_i:
  xor    edi, edi
  mov    ebp, [ks_tbl+4*esi]
loop_j:
  ; key[i] = j;
  mov    eax, edi
  mov    byte ptr[ebx+esi], al
  
  ; DES_set_key ((DES_cblock*)&key, &ks_tblx[i][j]);
  push   ebp
  push   ebx
  call   DES_set_key
  add    esp, 2*4
  
  add    ebp, 128            ; ks++
  inc    edi                 ; j++
  cmp    edi, 256            ; j<256
  jnz    loop_j
  
  mov    byte ptr[ebx+esi], 0
  
  inc    esi                 ; i++
  cmp    esi, 8              ; i<8
  jnz    loop_i
  
  pop    eax
  pop    eax
  popad
  ret
init_keys_x86 endp

_str_to_key:
str_to_key proc
  pushad
  mov   esi, [esp+32+4]
  mov   edi, [esp+32+8]

  mov   eax,[esi]
  xor   ecx,ecx
  bswap   eax
  mov   ebx,eax
  and   ebx,0FE000000h
  or   ecx,ebx
  rol   ecx,8
  shl   eax,7
  mov   ebx,eax
  and   ebx,0FE000000h
  or   ecx,ebx
  rol   ecx,8
  shl   eax,7
  mov   ebx,eax
  and   ebx,0FE000000h
  or   ecx,ebx
  rol   ecx,8
  shl   eax,7
  mov   ebx,eax
  and   ebx,0FE000000h
  or   ecx,ebx
  rol   ecx,8
  shl   eax,7
  bswap   ecx
  mov   [edi], ecx

  mov   eax,[esi+3]
  xor   ecx,ecx
  bswap   eax
  rol   eax,4
  mov   ebx,eax
  and   ebx,0FE000000h
  or   ecx,ebx
  rol   ecx,8
  shl   eax,7
  mov   ebx,eax
  and   ebx,0FE000000h
  or	ecx,ebx
  rol   ecx,8
  shl   eax,7
  mov   ebx,eax
  and   ebx,0FE000000h
  or   ecx,ebx
  rol   ecx,8
  shl   eax,7
  mov   ebx,eax
  and   ebx,0FE000000h
  or   ecx,ebx
  rol   ecx,8
  shl   eax,7
  bswap   ecx
  mov   [edi+4],ecx
  popad
  ret 8
str_to_key ENDP

; initialize key schedules
  public _init_skeys_x86
  public init_skeys_x86
; void init_keys_x86 (void);
_init_skeys_x86:
init_skeys_x86 proc
  pushad
  ;int 3
  mov    ecx, [esp+32+4]  ; alpha
  mov    edx, [esp+32+8]  ; alpha_len
  ; DES_cblock key;
  ; memset (key, 0, sizeof (key));
  xor    eax, eax
  push   eax
  push   eax
  push   eax
  push   eax
  mov    ebx, esp
  
  push   edx        ; [esp] = alpha_len
  xor    esi, esi   ; i = 0
loop_i:
  xor    edi, edi
  mov    ebp, [ks_tbl+4*esi]
loop_j:
  ; key[i] = alpha[j];
  mov    al, [ecx+edi]
  mov    byte ptr[ebx+esi], al
  
  pushad
  ; str_to_key
  lea    eax, [ebx+8]
  push   eax
  push   ebx
  call   DES_str_to_key
  add    esp, 2*4
  
  ; DES_set_key ((DES_cblock*)&key, &ks_tblx[i][j]);
  push   ebp
  push   eax
  call   DES_set_key
  add    esp, 2*4
  popad
  
  add    ebp, 128            ; ks++
  inc    edi                 ; j++
  cmp    edi, [esp]          ; j<alpha_len
  jnz    loop_j
  
  mov    byte ptr[ebx+esi], 0
  
  inc    esi                 ; i++
  cmp    esi, 8              ; i<8
  jnz    loop_i
  
  add    esp, 5*4
  popad
  ret
init_skeys_x86 endp

comment ~
void pc_set_key (uint8_t key[], 
  DES_key_schedule *ks) {
  
  int i, j;
  DES_LONG *src, *dst;
  dst = (DES_LONG*)ks;
  
  for (i=0; i<32; i++) {
    dst[i] = 0;
  }
  
  for (i=0; i<8; i++) {
    src = (DES_LONG*)&ks_tblx[i][key[i]];
    
    for (j=0; j<32; j++) {
      dst[j] |= src[j];
    }
  }
}
~ 
  public _pc_set_key_x86
  public pc_set_key_x86
; void pc_set_key_x86 (void *key, void *ks);
_pc_set_key_x86:
pc_set_key_x86 proc
    pushad
    mov    esi, [esp+32+4] ; key
    mov    ecx, [esp+32+8] ; key schedule
    ; memset (ks, 0, sizeof (DES_key_schedule));
    pushad
    mov    edi, ecx
    push   128/4
    pop    ecx
    xor    eax, eax
    rep    stosd
    popad
    xor    edi, edi          ; i=0
loop_i:
    ; load index
    movzx  eax, byte ptr[esi+edi]
    mov    ebx, [ks_tbl+4*edi] ; key array of ks for this index
    shl    eax, 7            ; *= 128
    add    ebx, eax          ; ebx=&ks_tbl[i][key[i]]
    cdq                      ; j=0
loop_j:
    mov    eax, [ebx+4*edx]
    or     [ecx+4*edx], eax
    inc    edx
    cmp    edx, 128/4
    jnz    loop_j
    
    inc    edi
    cmp    edi, 8
    jnz    loop_i
    popad
    ret
pc_set_key_x86 endp


    end

