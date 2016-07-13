; Copyright Svend Olaf Mikkelsen, 1998.
; svolaf@inet.uni2.dk
;
; Code and executables can be redistributed if the code is unchanged
; and acknowledgement is included.
;
; No responsibility is taken for possible errors in the code.
;
.586
.model flat,C

	public _str_to_key
	public str_to_key
	
_esi textequ <esp-4>
_edi textequ <esp-8>
_ebx textequ <esp-16>
_ecx textequ <esp-20>

.code

_str_to_key PROC NEAR
str_to_key PROC NEAR
 align 4
   mov   [_esi],esi
   mov   [_edi],edi
   mov   [_ebx],ebx
   mov   [_ecx],ecx

   mov   esi,[esp+4]
   mov   edi,[esp+8]

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

   mov   ecx,[_ecx]
   mov   esi,[_esi]
   mov   edi,[_edi]
   mov   ebx,[_ebx]
   ret
str_to_key ENDP
_str_to_key ENDP

	end
