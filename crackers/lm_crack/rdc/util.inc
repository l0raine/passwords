.code
; *****************************************************************************************
; arghhhhhhhhhhh!!!
;
; ..this calculates total iterations for minlen,maxlen and number of characters
;
;
; *****************************************************************************************
calc_total_iterations proc private uses esi edi ebx minlen:DWORD,maxlen:DWORD,char_num:DWORD

   local string_length:REAL8

   fldz
   fstp qword ptr [g_total_iterations]   ; zero initialize total

   push dword ptr [char_num]
   fild dword ptr [esp]
   pop eax
   fstp qword ptr [string_length]

   mov ebx,[minlen]
   sub esp,20
calc_loop:
   mov [esp+16],ebx
   fild dword ptr [esp+16]              ; load i integer onto fpu stack
   fstp qword ptr [esp+8]               ; store as floating point on cpu stack
   fld qword ptr [string_length]        ; load number of characters on fpu stack
   fstp qword ptr [esp]                 ; store on cpu stack
   call pow

   fadd qword ptr[g_total_iterations]   ; add total to contents of fpu stack
   fstp qword ptr[g_total_iterations]   ; save total
   add ebx,1                            ; i++
   cmp ebx,[maxlen]                     ; while(i <= maxlen)
   jbe calc_loop

   ret
calc_total_iterations endp

; *****************************************************************************
;	BOOL IsValidHash (
;			lpszHash, 		; null terminated ascii hash
;
;	Returns TRUE for valid hash, FALSE for invalid.
; *****************************************************************************
IsValidHash PROC private USES esi szHash:DWORD
   mov   esi,[szHash]
   or    eax,255
   .while byte ptr [esi] != 0 && eax != FALSE
      lodsb
      .if (al >= 'A' && al <= 'F') || (al >= 'a' && al <= 'f') || (al >= '0' && al <= '9')
         mov   al,TRUE
      .else
         mov   al,FALSE
      .endif
   .endw
   ret
IsValidHash ENDP
; *****************************************************************************
;	BOOL StoreAsciiHash (
;			lpszAsciiHash,	; pointer/offset to ascii hash
;			lpHashStruc,	; pointer to MDSTRUCTURE (hashlen / 4)
;			nHashLen,	; length of ascii hash
;                       bEndian         ; 1 or 0 for byte order
;
;	Returns TRUE for valid hash stored, FALSE for invalid hash, not stored.
; *****************************************************************************
StoreAsciiHash proc private uses esi edi ebx lpszAsciiHash:DWORD,lpHashStruc:DWORD,nHashLen:DWORD,bEndian:DWORD
   mov   esi, [lpszAsciiHash]
   invoke IsValidHash,esi

   .if eax == TRUE		      ; valid hash supplied?
      mov   edi,[lpHashStruc]
      mov   ecx,[nHashLen]
      shr   ecx,3                ; divide by 8
      .while ecx != 0
         xor    eax,eax
         cdq
         push   8
         pop    ebx
         .while ebx != 0
            shl   edx,4
            lodsb
            or   al,' '          ; convert to lowercase
            .if al >= 'a'
               sub   al,'a'-10-'0'
            .endif
            lea   edx,[edx+eax-'0']
            dec   ebx
         .endw
            xchg   eax,edx
            .if [bEndian] == TRUE
               bswap   eax
            .endif
            stosd
            dec    ecx
      .endw
      push 1
      pop  eax
   .endif
   ret
StoreAsciiHash ENDP