


MAX_PASSLEN    equ 8

.data?

wszPassword    dw 64 dup (?)
nPasswordLen   dd ?

wszAlphabet    dw 256 dup (?)
nAlphabetLen   dd ?

key_iterations dd 2 dup (?)
remaining      dd 2 dup (?)


THREAD_DATA struct

        thread_id    dd ?

        iStart       dd 256 dup (?)
        wszStart     dw 256 dup (?)

        iEnd         dd 256 dup (?)
        wszEnd       dw 256 dup (?)

        wszAlphabet  dw 256 dup (?)
        nAlphabetLen dd ?

        total        dq ?
        complete     dq ?
        remaining    dq ?

        wszUsername  dw 256   dup (?)

        uCiphertext  db 256   dup (?)
        uSalt        db 256   dup (?)
        
        wszComment   dw 256   dup (?)

THREAD_DATA ends


            .code

; *************************************************************************
;
; Return the total number of passwords created by thread (multi-thread safe)
;
; QWORD GetIterations(void)
;
; *************************************************************************

                 public GetKeyIterations

GetKeyIterations proc C

        xor  eax,eax

        lock  cmpxchg dword ptr[key_iterations+0],eax
        xchg  eax,edx

        lock  cmpxchg dword ptr[key_iterations+4],eax
        xchg  eax,edx

        ret

GetKeyIterations endp

; *************************************************************************
;
; Return the current key indexes (multi-thread safe)
;
; *************************************************************************

              public GetBFKeyIndexes

GetBFKeyIndexes proc C uses edi pIndexes:dword

        xor  ecx,ecx
        mov  edi,[pIndexes]
        mov  eax,[nPasswordLen]
        stosd

        irp  i,<0,1,2,3,4,5,6,7>
             xor eax,eax
             lock cmpxchg dword ptr[key_indexes+4*i],eax
             mov dword ptr[edi+4*i],eax
        endm

        ret

GetBFKeyIndexes endp

