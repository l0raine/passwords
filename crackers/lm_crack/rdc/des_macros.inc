;
; this is the des F round, based on asm output using GCC from des routines in ssleay package
;
; with flag parameter being TRUE, this can include a second key schedule, allowing faster attack

des_ff macro dwl, dwr, offs, flag
   movdqa xmm0, [key_sx_three]
   pxor xmm0, [ebp]
   
   ;mov   eax,dword ptr[key_sx_three+offs]
   xor   ecx,ecx

   ;mov   edx,dword ptr[key_sx_three+offs+4]
   xor   ebx,ebx

   ;if flag eq TRUE
   ;   xor   eax,[ebp+offs]
   ;endif

   ;if flag eq TRUE
   ;   xor   edx,[ebp+offs+4]
   ;endif

   xor   eax,dwl
   xor   edx,dwl

   and   eax,0fcfcfcfch
   and   edx,0cfcfcfcfh

   mov   bl,al
   ror   edx,4

   mov   cl,ah
   xor   dwr,sbox1[ebx]

   ror   eax,16
   xor   dwr,sbox3[ecx]

   mov   bl,dl
   xor   dwr,sbox2[ebx]

   mov   cl,dh
   mov   bl,ah

   ror   edx,16
   xor   dwr,sbox4[ecx]

   mov   cl,dh
   xor   dwr,sbox7[ebx]

   and   eax,0ffh
   xor   dwr,sbox8[ecx]

   and   edx,0ffh
   xor   dwr,sbox5[eax]

   xor   dwr,sbox6[edx]
endm

; mmx 64-bit

bit_or_mmx_64 macro offs, flag
   movq   mm1,[esi+offs]             ; using pairs of registers here, instead of just 1 when moving/bit-oring data should be faster
   movq   mm2,[edx+offs+8]           ; not 100% sure though.

   if flag ne 0
      por   mm1,[ebp+offs]
      por   mm2,[ebx+offs+8]
   endif

   movq   [edi+offs],mm1
   movq   [ecx+offs+8],mm2
endm

; xmm 128-bit

bit_or_xmm_128 macro offs, flag       ; here is where i need help..never managed to get XMM to work as good as MMX
   movdqa   xmm1,[esi+offs]             ; which is bizarre given that twice as much data is moved in one operation
   movdqa   xmm2,[edx+offs+16]          ; compared with MMX...maybe somebody will know whats wrong.

   .if flag ne 0
      por   xmm1,[ebp+offs]
      por   xmm2,[ebx+offs+16]
   .endif

   movdqa   [edi+offs],xmm1
   movdqa   [ecx+offs+16],xmm2
endm

;
; move and bit-or key schedules using mmx/xmm
;
move_ks macro index,ks_memory,prev,next,flag

   mov   eax,[index]                       ; charset[index]
   mov   esi,dword ptr[ks_memory]          ; key schedules for current index

   shl   eax,7                             ; * 128 to get index

   .if flag ne 0                           ; length 7 has no previous, so just move
      lea   ebp,dword ptr[prev]            ; get key schedule from previous buffer
   .endif

   lea   edi,dword ptr[next]               ; load edi with buffer for combined key schedule
   add   esi,eax                           ; now we have ks_memory[index*128] or offset of key schedule for current character
                                           ; perhaps we could just increment index by 128, instead of having to shift it left
   mov   ecx,edi                           ; each time by 7? might be faster, haven't tested it out..yet.
   mov   edx,esi

   .if flag ne 0
       mov ebx,ebp
   .endif


IFDEF USE_XMM

   ;bit_or_xmm_128 00*16, flag
   ;bit_or_xmm_128 02*16, flag
   ;bit_or_xmm_128 04*16, flag
   ;bit_or_xmm_128 06*16, flag

ELSEIFDEF USE_MMX

   bit_or_mmx_64 00*08,flag
   bit_or_mmx_64 02*08,flag
   bit_or_mmx_64 04*08,flag
   bit_or_mmx_64 06*08,flag

   bit_or_mmx_64 08*08,flag
   bit_or_mmx_64 10*08,flag
   bit_or_mmx_64 12*08,flag
   bit_or_mmx_64 14*08,flag

ENDIF

endm

; **************************************
;
; update a key schedule index
; reset if necessary
;
; **************************************
update_and_test macro index, move_addr
   add   dword ptr [index],1
   cmp    dword ptr [index],eax           ; reached end of charset??
   jne    move_addr                       ; no, keep moving/or'ing
   and    dword ptr [index], 0            ; reset one index
endm

; **************************************
;
; for DES initial/final permutation
;
; **************************************
perm_op macro dwa,dwb,dwc,nInt1,nInt2
   rol   dwa,nInt1
   mov   dwb,dwa
   xor   dwa,dwc
   and   dwa,nInt2

   xor   dwb,dwa
   xor   dwc,dwa
endm