
.code

bf_hash proc uses esi edi ebx min_len:dword,max_len:dword,alphabet_len:dword

        lea esi,[key_indexes]                  ; internal key indexes
        mov edi,[min_len]

@update_length:
	mov dword ptr[nPasswordLen],edi        ; current minimum length of password
        lea ecx,[wszPassword]
        lea eax,[edi*2]                        ; UNICODE length
        mov byte ptr [wszPassword+eax],80h     ; store end bit
        lea eax,[eax*8]                        ; number of bits
        xor ebx,ebx
        mov dword ptr[wszPassword+56],eax      ; save..
@update_password:
        mov edx,dword ptr[esi+4*ebx]           ; get index
        mov ax,word ptr[2*edx+wszAlphabet]     ; get character from alphabet
        mov word ptr[ecx+2*ebx],ax             ; save
        inc ebx
        cmp ebx,edi
        jne @update_password                   ; inefficient, but it works.

        push ecx
        call IsPasswordValid                   ; check it..
        pop ecx                                ; have good pass ?
        dec eax                                ;
        jz  exit_bf                            ; yay, found it! :P

        sub dword ptr[remaining],1             ; decrease remaining
        jz end_bf		               ; check for underflow..						;

continue:
        xor edx,edx
        xor ebx,ebx
        mov eax,[alphabet_len]
        lea ecx,[wszPassword]
@update_index:
        inc dword ptr[esi+4*edx]               ; update the index
        cmp dword ptr[esi+4*edx],eax           ; at the end of alphabet?
        jne @update_password

        mov dword ptr[esi+4*edx],0             ; reset to start

increase:
        inc edx                                ; do for current length of password
        cmp edx,edi
        jne @update_index

        inc edi                                ; increase minimum length

        cmp edi,[max_len]                      ; reached max?
        jna @update_length
        or eax,-1                              ; not found..
end_bf:
        cmp dword ptr[remaining+4],0           ; if zero, exit
	je exit_bf
	                                       ; else subtract 1 off the top
	sub dword ptr[remaining+4],1
	jmp continue                           ; keep going..
exit_bf:
        cmp eax,-1
        setne al
        ret
bf_hash endp

