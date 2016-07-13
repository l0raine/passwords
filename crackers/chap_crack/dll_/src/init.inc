
; jan 2009

        public InitKeyParams
;
; initialize the nt_response hash / challenge and NTLM bytes for either dictionary or brute force attack
;
InitKeyParams proc C uses esi edi ebx nt_response:dword, nt_challenge:dword

        mov  esi,[nt_response]
        lea  edi,[des_hash]
        movsd
        movsd

        mov  esi,[nt_challenge]
        lea  edi,[plaintext]
        movsd
        movsd

        ;int 3

        lodsd
        shl  eax,16
        and  eax,0FFFF0000h                         ; just incase ...
        mov  dword ptr[ntlm_bytes],eax

        ; perform the initial permutations and save a few cpu cycles
        invoke  des_ip,addr des_hash
        invoke  des_ip,addr plaintext

        ; pre-calculate most of the DES keys
        invoke  init_subkeys
        ret

InitKeyParams endp

        public InitBFKeyThread

        ; initialize the brute force attack thread

InitBFKeyThread proc C uses esi edi ebx thread_params:dword
	
        mov  ebx,[thread_params]
        mov  ecx,[ebx][THREAD_DATA.nAlphabetLen]

        ; load passwords remaining
        movq  xmm0,qword ptr[ebx][THREAD_DATA.remaining]
        movq  qword ptr[remaining],xmm0

        invoke  InitKeyParams, addr [ebx][THREAD_DATA.uCiphertext],
                               addr [ebx][THREAD_DATA.uSalt]

        ; store the alphabet
        lea  esi,[ebx][THREAD_DATA.wszAlphabet]
        lea  edi,[wszAlphabet]
        mov  ecx,[ebx][THREAD_DATA.nAlphabetLen]
        mov  dword ptr[nAlphabetLen],ecx
        rep  movsw

        lea  edi,[key_indexes]
        lea  esi,[ebx][THREAD_DATA.iStart]
        xor  ecx,ecx
        xor  edx,edx
init_indexes:
        lodsd
	test  eax,eax
	je  store_index

        dec  eax
	inc  edx
store_index:
	stosd
	inc  ecx
	cmp  ecx,MAX_PASSLEN            ; store up to MAX_PASSLEN
	jne  init_indexes

	mov  dword ptr[nPasswordLen],edx
	ret
InitBFKeyThread endp


