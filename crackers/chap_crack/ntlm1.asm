;
; md4
;

.686
.xmm
.model flat,C

             A_CONSTANT equ 067452301h
             B_CONSTANT equ 0EFCDAB89h
             C_CONSTANT equ 098BADCFEh
             D_CONSTANT equ 010325476h

ff           macro dwa,dwb,dwc,dwd,x,s

             mov edi,dwc
             add dwa,[esi+4*x]

             xor edi,dwd
             and edi,dwb

             xor edi,dwd
             lea dwa,[dwa+edi]

             rol dwa,s
endm

; +++++++++++++++++++++++++++++++++++++

gg           macro dwa,dwb,dwc,dwd,x,s

             mov edi,dwc
             mov ebp,dwc
             
             and edi,dwd
             or  ebp,dwd
          
             and ebp,dwb
             or  edi,ebp
             
             lea dwa,[dwa+edi+05a827999h]
             add dwa,[esi+4*x]

             rol dwa,s
endm

; ++++++++++++++++++++++++++++++++++++

hh           macro dwa,dwb,dwc,dwd,x,s

             mov edi,dwc
             xor edi,dwd

             add dwa,[esi+4*x]
             xor edi,dwb

             lea dwa,[dwa+edi+06ed9eba1h]
             rol dwa,s
endm

; ++++++++++++++++++++++++++++++++++++

rep_movsb macro
		local store_data
		
		test ecx,ecx
		je end_copy
store_data:
		mov al,byte ptr[esi]
		inc esi
		
		mov byte ptr[edi],al
		inc edi
		
		dec ecx
		jnz store_data
end_copy:
endm

.code
             public ntlm1_hash
ntlm1_hash:
             mov   [esp-4],edi
             mov   [esp-8],esi
             mov   [esp-12],ebp
             mov   [esp-16],ebx

             lea   edi,[esp-80]
             mov   edx,32

             pxor     xmm0,xmm0       ; zero initialize buffer
             movdqu   [edi+00],xmm0
             movdqu   [edi+16],xmm0
             movdqu   [edi+32],xmm0
             movdqu   [edi+48],xmm0

             mov   esi,[esp+4]        ; unicode data
             mov   ecx,[esp+8]        ; unicode length
             cmp   ecx,32             ; max length of 16 unicode bytes processed
             cmova ecx,edx

             lea   edx,[ecx*8]
             mov   dword ptr[edi+56],edx      ; store number of bits
             rep_movsb
             mov   byte ptr [edi],80h         ; store end bit
             
             lea   esi,[esp-80]

             mov   eax,A_CONSTANT
             mov   ebx,B_CONSTANT
             mov   ecx,C_CONSTANT
             mov   edx,D_CONSTANT
          
             ; ===========================
          
             ff   eax, ebx, ecx, edx, 00, 03
             ff   edx, eax, ebx, ecx, 01, 07
             ff   ecx, edx, eax, ebx, 02, 11
             ff   ebx, ecx, edx, eax, 03, 19
          
             ff   eax, ebx, ecx, edx, 04, 03
             ff   edx, eax, ebx, ecx, 05, 07
             ff   ecx, edx, eax, ebx, 06, 11
             ff   ebx, ecx, edx, eax, 07, 19
          
             ff   eax, ebx, ecx, edx, 08, 03
             ff   edx, eax, ebx, ecx, 09, 07
             ff   ecx, edx, eax, ebx, 10, 11
             ff   ebx, ecx, edx, eax, 11, 19
          
             ff   eax, ebx, ecx, edx, 12, 03
             ff   edx, eax, ebx, ecx, 13, 07
             ff   ecx, edx, eax, ebx, 14, 11
             ff   ebx, ecx, edx, eax, 15, 19
          
             ; ===========================
          
             gg   eax, ebx, ecx, edx, 00, 03
             gg   edx, eax, ebx, ecx, 04, 05
             gg   ecx, edx, eax, ebx, 08, 09
             gg   ebx, ecx, edx, eax, 12, 13
          
             gg   eax, ebx, ecx, edx, 01, 03
             gg   edx, eax, ebx, ecx, 05, 05
             gg   ecx, edx, eax, ebx, 09, 09
             gg   ebx, ecx, edx, eax, 13, 13
          
             gg   eax, ebx, ecx, edx, 02, 03
             gg   edx, eax, ebx, ecx, 06, 05
             gg   ecx, edx, eax, ebx, 10, 09
             gg   ebx, ecx, edx, eax, 14, 13

             gg   eax, ebx, ecx, edx, 03, 03
             gg   edx, eax, ebx, ecx, 07, 05
             gg   ecx, edx, eax, ebx, 11, 09
             gg   ebx, ecx, edx, eax, 15, 13
          
             ; ===========================
          
             hh   eax, ebx, ecx, edx, 00, 03
             hh   edx, eax, ebx, ecx, 08, 09
             hh   ecx, edx, eax, ebx, 04, 11
             hh   ebx, ecx, edx, eax, 12, 15
          
             hh   eax, ebx, ecx, edx, 02, 03
             hh   edx, eax, ebx, ecx, 10, 09
             hh   ecx, edx, eax, ebx, 06, 11
             hh   ebx, ecx, edx, eax, 14, 15

             hh   eax, ebx, ecx, edx, 01, 03
             hh   edx, eax, ebx, ecx, 09, 09
             hh   ecx, edx, eax, ebx, 05, 11
             hh   ebx, ecx, edx, eax, 13, 15
          
             hh   eax, ebx, ecx, edx, 03, 03
             hh   edx, eax, ebx, ecx, 11, 09
             hh   ecx, edx, eax, ebx, 07, 11
             hh   ebx, ecx, edx, eax, 15, 15
          
             add  eax,A_CONSTANT
             add  ebx,B_CONSTANT
             add  ecx,C_CONSTANT
             add  edx,D_CONSTANT

             mov  edi,[esp+12]          ; digest buffer
             mov  [edi+0],eax
             mov  [edi+4],ebx
             mov  [edi+8],ecx
             mov  [edi+12],edx

             mov  esi,[esp-8]
             mov  ebp,[esp-12]
             mov  ebx,[esp-16]
             mov  edi,[esp-4]

             ret
          
             end