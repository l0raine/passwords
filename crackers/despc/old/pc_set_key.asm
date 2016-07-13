.686
.xmm
.model flat,stdcall

include <windows.inc>
include <stdio.inc>
include <stdlib.inc>

includelib <kernel32.lib>
includelib <crtdll.lib>

DES_set_key proto C :dword,:dword

DES_key_schedule STRUCT
      key_data db 128 dup (?)
DES_key_schedule ENDS

.data?

align 16
index_one    DES_key_schedule 256 dup (<>)
align 16
index_two    DES_key_schedule 256 dup (<>)
align 16
index_three  DES_key_schedule 256 dup (<>)
align 16
index_four   DES_key_schedule 256 dup (<>)
align 16
index_five   DES_key_schedule 256 dup (<>)
align 16
index_six    DES_key_schedule 256 dup (<>)
align 16
index_seven  DES_key_schedule 256 dup (<>)
align 16
index_eight  DES_key_schedule 256 dup (<>)

public g_schedules
public _g_schedules

.data

_g_schedules label dword
g_schedules dd offset index_one
            dd offset index_two
            dd offset index_three
            dd offset index_four
            dd offset index_five
            dd offset index_six
            dd offset index_seven
            dd offset index_eight
            
key_indexes dd 8 dup (?)

i_one       equ key_indexes+4*0
i_two       equ key_indexes+4*1
i_three     equ key_indexes+4*2
i_four      equ key_indexes+4*3
i_five      equ key_indexes+4*4
i_six       equ key_indexes+4*5
i_seven     equ key_indexes+4*6
i_eight     equ key_indexes+4*7

.code

public DllMain

DllMain PROC stdcall uses esi edi ebx hModule:HANDLE, ul_reason_for_call:DWORD, lpReserved:LPVOID

            mov eax,TRUE
            ret

DllMain ENDP


comment #
/*

  pre-compute DES key schedules, from 0-256

 */

void init_subkeys()
{
      u32 byte_index,key_index;
      DES_key_schedule *ks;
      u8 key[8]={0};

      /* for each index of a 64-bit des key */

      for(key_index = 0; key_index < 8; key_index++) {

          ks = g_schedules[key_index];

          for(byte_index = 0; byte_index < 256; byte_index++,ks++) {
              key[key_index] = byte_index;
              DES_set_key(&key,ks);
          }
          key[key_index] = 0;
      }
}
#

public init_subkeys
public _init_subkeys

_init_subkeys:
init_subkeys proc C uses esi edi ebx

        local ks      :DES_key_schedule
        local key[8]  :byte

        lea edi,[key]
        xor eax,eax
        stosd
        stosd

        xor esi,esi
        
        .while esi < 8
            
            mov edi, g_schedules[esi*4]
            
            xor ebx,ebx
            
            .while ebx < 256
                lea ecx,[key]
                mov byte ptr[ecx+esi],bl

                invoke DES_set_key,ecx,edi

                add edi,sizeof(DES_key_schedule)
                inc ebx
            .endw
            lea ecx,[key]
            mov byte ptr[ecx+esi],0
            inc esi
        .endw
        ret
init_subkeys endp


public sse2_DES_set_key
public _sse2_DES_set_key

_sse2_DES_set_key:
sse2_DES_set_key proc C uses esi ebx edi ebp key:dword, key_schedule:dword

  mov   esi, [key_schedule]
  mov   edi, [key_schedule]

  pxor  xmm0, xmm0
  pxor  xmm1, xmm1
  pxor  xmm2, xmm2
  pxor  xmm3, xmm3

  mov   ebp, [key]
  add   edi, 64

  pxor  xmm4,xmm4
  pxor  xmm5,xmm5
  pxor  xmm6,xmm6
  pxor  xmm7,xmm7

  irp i,<0,2,4,6>
    xor   eax, eax
    mov   al, byte ptr[ebp+i]

    xor   ebx, ebx
    mov   bl, byte ptr[ebp+i+1]

    mov   ecx, [g_schedules+4*i]
    mov   edx, [g_schedules+4*i+4]

    rol   eax, 7
    rol   ebx, 7

    add   ecx, eax
    add   edx, ebx

    pxor  xmm0, [ecx+16*0]
    pxor  xmm1, [ecx+16*1]
    pxor  xmm0, [edx+16*0]
    pxor  xmm1, [edx+16*1]

    pxor  xmm2, [ecx+16*2]
    pxor  xmm3, [ecx+16*3]
    pxor  xmm2, [edx+16*2]
    pxor  xmm3, [edx+16*3]

    pxor  xmm4, [ecx+16*4]
    pxor  xmm5, [ecx+16*5]
    pxor  xmm4, [edx+16*4]
    pxor  xmm5, [edx+16*5]

    pxor  xmm6, [ecx+16*6]
    pxor  xmm7, [ecx+16*7]
    pxor  xmm6, [edx+16*6]
    pxor  xmm7, [edx+16*7]
  endm

  movdqa [esi+16*0],xmm0
  movdqa [edi+16*0],xmm4

  movdqa [esi+16*1],xmm1
  movdqa [edi+16*1],xmm5

  movdqa [esi+16*2],xmm2
  movdqa [edi+16*2],xmm6

  movdqa [esi+16*3],xmm3
  movdqa [edi+16*3],xmm7
  
  ret
sse2_DES_set_key endp

     end DllMain