
perm_op macro dwa,dwb,dwc,nInt1,nInt2

        rol   dwa,nInt1
        mov   dwb,dwa
        
        xor   dwa,dwc
        and   dwa,nInt2

        xor   dwb,dwa
        xor   dwc,dwa

        endm


des_ff macro dwl,dwr,offs
        
        mov   eax,dword ptr[ebp+offs]
        xor   ecx,ecx

        mov   edx,dword ptr[ebp+offs+4]
        xor   ebx,ebx

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
       

sse2_des_set_key macro

        lea  ebp,[key_schedule+00]
        lea  edi,[key_schedule+64]

        pxor  xmm0,xmm0
        pxor  xmm1,xmm1

        pxor  xmm2,xmm2
        pxor  xmm3,xmm3
        
        pxor  xmm4,xmm4
        pxor  xmm5,xmm5
        
        pxor  xmm6,xmm6
        pxor  xmm7,xmm7

        irp i,<0,2,4,6>

          xor  eax,eax
          mov  al,byte ptr[esi+i]           ; get a key byte

          xor  ebx,ebx
          mov  bl,byte ptr[esi+i+1]

          mov  ecx,[des_schedules+4*i]
          mov  edx,[des_schedules+4*i+4]

          rol  eax,7
          rol  ebx,7

          add  ecx,eax
          add  edx,ebx

          pxor  xmm0,[ecx+16*0]
          pxor  xmm1,[ecx+16*1]

          pxor  xmm0,[edx+16*0]
          pxor  xmm1,[edx+16*1]

          pxor  xmm2,[ecx+16*2]
          pxor  xmm3,[ecx+16*3]

          pxor  xmm2,[edx+16*2]
          pxor  xmm3,[edx+16*3]

          pxor  xmm4,[ecx+16*4]
          pxor  xmm5,[ecx+16*5]

          pxor  xmm4,[edx+16*4]
          pxor  xmm5,[edx+16*5]

          pxor  xmm6,[ecx+16*6]
          pxor  xmm7,[ecx+16*7]

          pxor  xmm6,[edx+16*6]
          pxor  xmm7,[edx+16*7]
        endm

        movdqa  [ebp+16*0],xmm0
        movdqa  [edi+16*0],xmm4

        movdqa  [ebp+16*1],xmm1
        movdqa  [edi+16*1],xmm5

        movdqa  [ebp+16*2],xmm2
        movdqa  [edi+16*2],xmm6

        movdqa  [ebp+16*3],xmm3
        movdqa  [edi+16*3],xmm7

        endm
      

string_to_key macro

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
        mov   [esi], ecx

        mov   eax,[edi+3]
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
        mov   [esi+4],ecx

        endm

        .code
        
DES_set_key proto C :dword,:dword

;
; this performs the DES initial permutation so we can avoid it later.
;
des_ip proc private uses esi edi ebx data_input:DWORD

        mov  edi,dword ptr[data_input]        ; hash after ip
        mov  esi,dword ptr[data_input]        ; hash before ip

        lodsd                                 ; load first part of hash
        xchg  eax,ebx
        lodsd		                      ; load second..
        xchg  eax,ebx

        perm_op  eax,edx,ebx,04,0f0f0f0f0h
        perm_op  ebx,eax,edx,20,0fff0000fh
        perm_op  eax,ebx,edx,14,033333333h
        perm_op  edx,eax,ebx,22,003fc03fch
        perm_op  eax,edx,ebx,09,0aaaaaaaah

        rol  ebx,1

        mov  eax,edx   ; save part a
        stosd
        mov  eax,ebx   ; save part b
        stosd
        ret

des_ip endp

;
; initialize DES keys and save in memory
; we do it here..which saves us some more cpu cycles
;
init_subkeys proc uses esi edi ebx

        local key[8]  :byte

        xor esi,esi
        and dword ptr[key+0],esi
        and dword ptr[key+4],esi

        .while esi < 8

               mov  edi,des_schedules[esi*4]
               xor  ebx,ebx

               .while ebx < 256
                      mov  byte ptr[key+esi],bl

                      invoke  DES_set_key,addr key,edi

                      add  edi,sizeof(DES_key_schedule)
                      inc  ebx
               .endw
               mov  byte ptr[key+esi],0
               inc  esi
        .endw
        ret
init_subkeys endp


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

key_indexes    dd MAX_PASSLEN dup (?)

.data

des_schedules dd offset index_one
              dd offset index_two
              dd offset index_three
              dd offset index_four
              dd offset index_five
              dd offset index_six
              dd offset index_seven
              dd offset index_eight

i_one         equ key_indexes+4*0
i_two         equ key_indexes+4*1
i_three       equ key_indexes+4*2
i_four        equ key_indexes+4*3
i_five        equ key_indexes+4*4
i_six         equ key_indexes+4*5
i_seven       equ key_indexes+4*6
i_eight       equ key_indexes+4*7

.data
     align 4
sbox1   dd   02080800h,00080000h,02000002h,02080802h
        dd   02000000h,00080802h,00080002h,02000002h
        dd   00080802h,02080800h,02080000h,00000802h
        dd   02000802h,02000000h,00000000h,00080002h
        dd   00080000h,00000002h,02000800h,00080800h
        dd   02080802h,02080000h,00000802h,02000800h
        dd   00000002h,00000800h,00080800h,02080002h
        dd   00000800h,02000802h,02080002h,00000000h
        dd   00000000h,02080802h,02000800h,00080002h
        dd   02080800h,00080000h,00000802h,02000800h
	dd   02080002h,00000800h,00080800h,02000002h
	dd   00080802h,00000002h,02000002h,02080000h
	dd   02080802h,00080800h,02080000h,02000802h
	dd   02000000h,00000802h,00080002h,00000000h
	dd   00080000h,02000000h,02000802h,02080800h
	dd   00000002h,02080002h,00000800h,00080802h

sbox2	dd   40108010h,00000000h,00108000h,40100000h
	dd   40000010h,00008010h,40008000h,00108000h
	dd   00008000h,40100010h,00000010h,40008000h
	dd   00100010h,40108000h,40100000h,00000010h
	dd   00100000h,40008010h,40100010h,00008000h
	dd   00108010h,40000000h,00000000h,00100010h
	dd   40008010h,00108010h,40108000h,40000010h
	dd   40000000h,00100000h,00008010h,40108010h
	dd   00100010h,40108000h,40008000h,00108010h
	dd   40108010h,00100010h,40000010h,00000000h
	dd   40000000h,00008010h,00100000h,40100010h
	dd   00008000h,40000000h,00108010h,40008010h
	dd   40108000h,00008000h,00000000h,40000010h
	dd   00000010h,40108010h,00108000h,40100000h
	dd   40100010h,00100000h,00008010h,40008000h
	dd   40008010h,00000010h,40100000h,00108000h

sbox3   dd   04000001h,04040100h,00000100h,04000101h
	dd   00040001h,04000000h,04000101h,00040100h
	dd   04000100h,00040000h,04040000h,00000001h
	dd   04040101h,00000101h,00000001h,04040001h
	dd   00000000h,00040001h,04040100h,00000100h
	dd   00000101h,04040101h,00040000h,04000001h
	dd   04040001h,04000100h,00040101h,04040000h
	dd   00040100h,00000000h,04000000h,00040101h
	dd   04040100h,00000100h,00000001h,00040000h
	dd   00000101h,00040001h,04040000h,04000101h
	dd   00000000h,04040100h,00040100h,04040001h
	dd   00040001h,04000000h,04040101h,00000001h
	dd   00040101h,04000001h,04000000h,04040101h
	dd   00040000h,04000100h,04000101h,00040100h
	dd   04000100h,00000000h,04040001h,00000101h
	dd   04000001h,00040101h,00000100h,04040000h

sbox4	dd   00401008h,10001000h,00000008h,10401008h
	dd   00000000h,10400000h,10001008h,00400008h
	dd   10401000h,10000008h,10000000h,00001008h
	dd   10000008h,00401008h,00400000h,10000000h
	dd   10400008h,00401000h,00001000h,00000008h
	dd   00401000h,10001008h,10400000h,00001000h
	dd   00001008h,00000000h,00400008h,10401000h
	dd   10001000h,10400008h,10401008h,00400000h
	dd   10400008h,00001008h,00400000h,10000008h
	dd   00401000h,10001000h,00000008h,10400000h
	dd   10001008h,00000000h,00001000h,00400008h
	dd   00000000h,10400008h,10401000h,00001000h
	dd   10000000h,10401008h,00401008h,00400000h
	dd   10401008h,00000008h,10001000h,00401008h
	dd   00400008h,00401000h,10400000h,10001008h
	dd   00001008h,10000000h,10000008h,10401000h

sbox5	dd   08000000h,00010000h,00000400h,08010420h
	dd   08010020h,08000400h,00010420h,08010000h
	dd   00010000h,00000020h,08000020h,00010400h
	dd   08000420h,08010020h,08010400h,00000000h
	dd   00010400h,08000000h,00010020h,00000420h
	dd   08000400h,00010420h,00000000h,08000020h
	dd   00000020h,08000420h,08010420h,00010020h
	dd   08010000h,00000400h,00000420h,08010400h
	dd   08010400h,08000420h,00010020h,08010000h
	dd   00010000h,00000020h,08000020h,08000400h
	dd   08000000h,00010400h,08010420h,00000000h
	dd   00010420h,08000000h,00000400h,00010020h
	dd   08000420h,00000400h,00000000h,08010420h
	dd   08010020h,08010400h,00000420h,00010000h
	dd   00010400h,08010020h,08000400h,00000420h
	dd   00000020h,00010420h,08010000h,08000020h

sbox6	dd   80000040h,00200040h,00000000h,80202000h
	dd   00200040h,00002000h,80002040h,00200000h
	dd   00002040h,80202040h,00202000h,80000000h
	dd   80002000h,80000040h,80200000h,00202040h
	dd   00200000h,80002040h,80200040h,00000000h
	dd   00002000h,00000040h,80202000h,80200040h
	dd   80202040h,80200000h,80000000h,00002040h
	dd   00000040h,00202000h,00202040h,80002000h
	dd   00002040h,80000000h,80002000h,00202040h
	dd   80202000h,00200040h,00000000h,80002000h
	dd   80000000h,00002000h,80200040h,00200000h
	dd   00200040h,80202040h,00202000h,00000040h
	dd   80202040h,00202000h,00200000h,80002040h
	dd   80000040h,80200000h,00202040h,00000000h
	dd   00002000h,80000040h,80002040h,80202000h
	dd   80200000h,00002040h,00000040h,80200040h

sbox7	dd   00004000h,00000200h,01000200h,01000004h
	dd   01004204h,00004004h,00004200h,00000000h
	dd   01000000h,01000204h,00000204h,01004000h
	dd   00000004h,01004200h,01004000h,00000204h
	dd   01000204h,00004000h,00004004h,01004204h
	dd   00000000h,01000200h,01000004h,00004200h
	dd   01004004h,00004204h,01004200h,00000004h
	dd   00004204h,01004004h,00000200h,01000000h
	dd   00004204h,01004000h,01004004h,00000204h
	dd   00004000h,00000200h,01000000h,01004004h
	dd   01000204h,00004204h,00004200h,00000000h
	dd   00000200h,01000004h,00000004h,01000200h
	dd   00000000h,01000204h,01000200h,00004200h
	dd   00000204h,00004000h,01004204h,01000000h
	dd   01004200h,00000004h,00004004h,01004204h
	dd   01000004h,01004200h,01004000h,00004004h

sbox8	dd   20800080h,20820000h,00020080h,00000000h
	dd   20020000h,00800080h,20800000h,20820080h
	dd   00000080h,20000000h,00820000h,00020080h
	dd   00820080h,20020080h,20000080h,20800000h
	dd   00020000h,00820080h,00800080h,20020000h
	dd   20820080h,20000080h,00000000h,00820000h
	dd   20000000h,00800000h,20020080h,20800080h
	dd   00800000h,00020000h,20820000h,00000080h
	dd   00800000h,00020000h,20000080h,20820080h
	dd   00020080h,20000000h,00000000h,00820000h
	dd   20800080h,20020080h,20020000h,00800080h
	dd   20820000h,00000080h,00800080h,20020000h
	dd   20820080h,00800000h,20800000h,20000080h
	dd   00820000h,00020080h,20020080h,20800000h
	dd   00000080h,20820000h,00820080h,00000000h
	dd   20000000h,20800080h,00020000h,00820080h


