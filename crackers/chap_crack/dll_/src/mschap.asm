
.686
.xmm
.model flat,stdcall

           .data

; thread parameters
plaintext      db 8  dup (?)
des_hash       db 8  dup (?)
ntlm_bytes     db 4  dup (?)

; during processing
des_key        db 8  dup (?)
ntlm_hash      db 8  dup (?)
ntlm_buffers   db 64 dup (?)

               align 16

key_schedule   db 128 dup (?)

include module.inc
include des.inc
include md4.inc
include password.inc
include init.inc

           .code

           _ebx textequ <esp-4>
           _ebp textequ <esp-8>
           _esi textequ <esp-12>
           _edi textequ <esp-16>

           public IsPasswordValid
           
           ; given a pre-formatted MD4 buffer, generate the NTLM bytes
           ; if equal to those internally, generate the DES hash and compare with nt_response
           ; return true or false if found
IsPasswordValid:

        mov  dword ptr[_esi],esi
        mov  dword ptr[_edi],edi

        mov  esi,[esp+4]                         ; password to test

        mov  dword ptr[_ebx],ebx
        mov  dword ptr[_ebp],ebp

        mov  eax,A_CONSTANT                  ; assuming our password is already converted to UNICODE
        mov  ebx,B_CONSTANT                  ; create an NTLM hash using the MD4 algorithm
        mov  ecx,C_CONSTANT
        mov  edx,D_CONSTANT

        ; ===========================

        irp i,<0,4,8,12>
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

        lea edi,[edx+D_CONSTANT]

        ;int 3

        and  edi,0FFFF0000h                        ; check last 16 bits with
        cmp  edi,dword ptr[ntlm_bytes]             ; our ntlm_bytes
        jne  not_found

        hh  ecx, edx, eax, ebx, 07, 11
        hh  ebx, ecx, edx, eax, 15, 15

        add  eax,A_CONSTANT                        ; finish what we need to create 1st 8-Byte DES key.
        add  ebx,B_CONSTANT

        lea  esi,[des_key]
        lea  edi,[ntlm_hash]

        mov  dword ptr[edi+0],eax
        mov  dword ptr[edi+4],ebx

        string_to_key                           ; create DES odd parity key
        sse2_des_set_key                        ; create a key schedule from key

        mov  esi,dword ptr[plaintext+0]
        mov  edi,dword ptr[plaintext+4]

        irp i,<0,4,8,12,16,20,24>
          des_ff  esi,edi,(i+0)*4
          des_ff  edi,esi,(i+2)*4
        endm

        des_ff  esi,edi,28*04

        cmp  edi,dword ptr[des_hash+0]          ; check the first part
        jne  not_found

        des_ff  edi,esi,30*04

        cmp  esi,dword ptr[des_hash+4]          ; now second to be sure.
        mov  eax,1
        je  end_check
not_found:
        xor  eax,eax
end_check:
        add  dword ptr [key_iterations+0],1
        adc  dword ptr [key_iterations+4],0

        mov  ebx,[_ebx]
        mov  ebp,[_ebp]

        mov  esi,[_esi]
        mov  edi,[_edi]
        ret


  public BFKeyThread

BFKeyThread proc C uses esi edi ebx

        push dword ptr[nAlphabetLen]
        push MAX_PASSLEN
        push dword ptr[nPasswordLen]
        call bf_hash
        ret

BFKeyThread endp

DllMain proc hinstDLL:DWORD, fdwReason:DWORD, lpReserved:DWORD
        mov eax,1
        ret
DllMain endp

     end DllMain