

        A_CONSTANT equ 067452301h
        B_CONSTANT equ 0EFCDAB89h
        C_CONSTANT equ 098BADCFEh
        D_CONSTANT equ 010325476h


ff      macro dwa,dwb,dwc,dwd,x,s

        mov edi,dwc
        add dwa,[esi+4*x]

        xor edi,dwd
        and edi,dwb

        xor edi,dwd
        lea dwa,[dwa+edi]

        rol dwa,s
endm

; +++++++++++++++++++++++++++++++++++++

gg      macro dwa,dwb,dwc,dwd,x,s

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

hh      macro dwa,dwb,dwc,dwd,x,s

        mov edi,dwc
        xor edi,dwd

        add dwa,[esi+4*x]
        xor edi,dwb

        lea dwa,[dwa+edi+06ed9eba1h]
        rol dwa,s
endm

.code

;
; instead of calculating the length of password/end bit during crack
; we do it here..which saves us some more cpu cycles
;
init_ntlm_buffers proc uses edi ebx min_len:dword, max_len:dword

        lea  edi,[ntlm_buffers]
        mov  ecx,[max_len]
        mov  ebx,[min_len]

        .while  ecx != 0
                mov  byte ptr[edi+2*ebx],80h
                lea  edx,[ebx*2]                       ; calculate UNICODE length
                shl  edx,3                             ; calculate bits
                mov  dword ptr[edi+56],edx             ; save
                add  edi,64                            ; advance 64-bytes
                inc  ebx
                dec  ecx
        .endw

        ret
init_ntlm_buffers endp

