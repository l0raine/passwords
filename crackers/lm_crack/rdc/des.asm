
.586
.model flat,C

public str_to_key
public _str_to_key

public des_set_key
public _des_set_key

public des_encrypt
public _des_encrypt

;*********************************************************
;
; DES macros & constants
;
;*********************************************************

DES_ENCRYPT   equ   1
DES_DECRYPT   equ   0

reg_num         equ       4

_esi            textequ   <esp-4>
_edi            textequ   <esp-8>
_ebp            textequ   <esp-12>
_ebx            textequ   <esp-16>

reg_space       equ       reg_num*4

km2 macro r1,r2,h1,h2,h3,h4,l1,l2,l3,l4,s1,s2,s3,s4,x1,x2,x3,x4
   mov   eax,h1
   mov   ebx,h2

   mov   ecx,h3
   mov   edx,h4

   shr   eax,s1
   shr   ebx,s2

   shr   ecx,s3
   shr   edx,s4

   and   eax,127
   and   ebx,127
	
   ;##########################################################
   mov   esi,dword ptr kbox1[eax*4+03*512]
   and   ecx,127

   or   esi,dword ptr kbox1[ebx*4+02*512]
   and   edx,127

   or   esi,dword ptr kbox1[ecx*4+01*512]
   mov   ebp,dword ptr kbox1[eax*4+x1*512]

   or   esi,dword ptr kbox1[edx*4+00*512]
   mov   eax,l1

   or   ebp,dword ptr kbox1[ebx*4+x2*512]
   shr   eax,s1

   or   ebp,dword ptr kbox1[ecx*4+x3*512]
   mov   ebx,l2

   or   ebp,dword ptr kbox1[edx*4+x4*512]
   shr   ebx,s2

   and   eax,127
   mov   ecx,l3
   ;##########################################################
   mov   edi, dword ptr kbox1[eax*4+07*512]
   and   ebx, 127

   mov   eax, dword ptr kbox1[eax*4+x1*512+2048]
   shr   ecx, s3

   or   eax, dword ptr kbox1[ebx*4+x2*512+2048]
   and   ecx, 127

   or   edi,dword ptr kbox1[ebx*4+06*512]
   mov   edx,l4

   or   edi,dword ptr kbox1[ecx*4+05*512]
   shr   edx,s4

   or   eax,dword ptr kbox1[ecx*4+x3*512+2048]
   and   edx,127

   or   edi,dword ptr kbox1[edx*4+04*512]
   mov   ecx,esi

   or   eax,dword ptr kbox1[edx*4+x4*512+2048]
   xor   ecx,edi

   mov   edx,ebp
   and   ecx,0000ffffh

   xor   edx,eax
   xor   edi,ecx

   and   edx,0000ffffh
   ror   edi,16

   xor   ebp,edx
   xor   esi,ecx

   xor   eax,edx
   rol   esi,4
   mov   ebx,[esp+8]

   mov   dword ptr [ebx+r1*8-8],edi
   mov   dword ptr [ebx+r1*8-4],esi

   ror   eax, 16
   rol   ebp, 4

   mov   dword ptr [ebx+r2*8-8],eax
   mov   dword ptr [ebx+r2*8-4],ebp
endm
;#####################################################################################################
km3 macro r1,r2,r3,h1,h2,h3,h4,l1,l2,l3,l4,s1,s2,s3,s4,x1,x2,x3,x4,y1,y2,y3,y4
   mov   eax,h1
   mov   ebx,h2

   mov   ecx,h3
   mov   edx,h4

   shr   eax,s1
   shr   ebx,s2

   shr   ecx,s3
   shr   edx,s4

   and   eax,127
   and   ebx,127
	
   ;###########################################################
   mov   ebp,dword ptr kbox1[eax*4+y1*512]
   and   ecx,127

   or   ebp,dword ptr kbox1[ebx*4+y2*512]
   and   edx,127

   or   ebp,dword ptr kbox1[ecx*4+y3*512]
   mov   esi,dword ptr kbox1[eax*4+03*512]

   or   ebp,dword ptr kbox1[edx*4+y4*512]
   or   esi,dword ptr kbox1[ebx*4+02*512]

   mov   lw_y,ebp
   or   esi,dword ptr kbox1[ecx*4+01*512]

   mov   ebp,dword ptr kbox1[eax*4+x1*512]
   or   esi,dword ptr kbox1[edx*4+00*512]

   or   ebp,dword ptr kbox1[ebx*4+x2*512]
   mov   eax,l1

   or   ebp,dword ptr kbox1[ecx*4+x3*512]
   shr   eax,s1

   or   ebp,dword ptr kbox1[edx*4+x4*512]
   and   eax,127

   mov   ebx,l2
   mov   ecx,l3

   shr   ebx,s2
   shr   ecx,s3
   ;##################################################################
   mov   edi,dword ptr kbox1[eax*4+y1*512+2048]
   mov   edx,l4

   and   ebx,127
   shr   edx,s4

   and   ecx,127
   or   edi,dword ptr kbox1[ebx*4+y2*512+2048]

   and   edx,127
   or   edi,dword ptr kbox1[ecx*4+y3*512+2048]

   or   edi,dword ptr kbox1[edx*4+y4*512+2048]
   and   eax,-1

   mov   hgh_y,edi
   and	ebx,-1

   mov   edi,dword ptr kbox1[eax*4+07*512]
   and   ecx,-1

   or   edi,dword ptr kbox1[ebx*4+06*512]
   and   edx,-1

   or   edi,dword ptr kbox1[ecx*4+05*512]
   and   eax,-1

   or   edi,dword ptr kbox1[edx*4+04*512]
   and  ebx,-1

   mov   eax,dword ptr kbox1[eax*4+x1*512+2048]
   and   ecx,-1

   or   eax,dword ptr kbox1[ebx*4+x2*512+2048]
   and   edx,-1

   or   eax,dword ptr kbox1[ecx*4+x3*512+2048]
   mov   ecx,esi

   or   eax,dword ptr kbox1[edx*4+x4*512+2048]
   xor   ecx,edi

   mov   edx,ebp
   and   ecx,0000ffffh

   xor   edx,eax
   xor   esi,ecx

   and   edx,0000ffffh
   xor   edi,ecx

   xor   ebp,edx
   ror   edi,16

   xor   eax,edx
   mov   ebx,[esp+8]  ; key schedule

   mov   dword ptr[ebx+r1*8-8],edi

   rol   esi,4
   mov   edi,hgh_y

   mov   dword ptr[ebx+r1*8-4],esi
   ror   eax,16

   mov   esi,lw_y
   rol   ebp,4

   mov   dword ptr[ebx+r2*8-8],eax
   mov   ecx,esi

   mov   dword ptr[ebx+r2*8-4],ebp
   xor   ecx,edi

   and   ecx,0000ffffh
   xor   edi,ecx

   and   eax,-1
   xor   esi,ecx

   rol   esi,4
   ror   edi,16

   mov   dword ptr[ebx+r3*8-8],edi
   mov   dword ptr[ebx+r3*8-4],esi
endm

des_ff macro dwl,dwr,poffs
   mov   eax,[ebp+poffs]
   xor   ecx,ecx

   mov   edx,[ebp+poffs+4]
   xor   eax,dwl

   xor   ebx,ebx
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

perm_op macro dwa,dwb,dwc,n1,n2
   rol   dwa,n1
   mov   dwb,dwa
   xor   dwa,dwc
   and   dwa,n2

   xor   dwb,dwa
   xor   dwc,dwa
endm

key_perm macro dwa,dwd,dwc,n1,n2,pN
   mov   dwc,dwd
if pN eq 1 or pN eq 3
   shr   dwc,n1
endif
if pN eq 2
   shl   dwc,n1
endif
   xor   dwc,dwa
   and   dwc,n2
   xor   dwa,dwc
if pN eq 1
   shl   dwc,n1
endif
if pN eq 2
   shr   dwc,n1
endif
if pN eq 3
   add   dwc,dwc
endif
   xor   dwd,dwc
ENDM

lw	 textequ <dword ptr [esp-(reg_space+4)]>
hgh	 textequ <dword ptr [esp-(reg_space+8)]>
lwr	 textequ <dword ptr [esp-(reg_space+12)]>
hghr	 textequ <dword ptr [esp-(reg_space+16)]>

lw_y	 textequ <dword ptr [esp-(reg_space+20)]>
hgh_y 	 textequ <dword ptr [esp-(reg_space+24)]>
hgh_save textequ <dword ptr [esp-(reg_space+28)]>

.code
align 4
_des_encrypt PROC NEAR
des_encrypt PROC NEAR
align 4
   mov   [_esi],esi
   mov   [_edi],edi
   mov   [_ebx],ebx
   mov   [_ebp],ebp

   mov   ebp,[esp+8]                     ; key schedule
   mov   edx,[esp+4]                     ; plaintext
   mov   eax,[edx]
   mov   edi,[edx+4]

   perm_op   eax,esi,edi,04,0f0f0f0f0h		; initial permutation
   perm_op   edi,eax,esi,20,0fff0000fh
   perm_op   eax,edi,esi,14,033333333h
   perm_op   esi,eax,edi,22,003fc03fch
   perm_op   eax,esi,edi,09,0aaaaaaaah

   rol   edi,1

   cmp   dword ptr[esp+12], DES_ENCRYPT
   jne   decrypt_block

   des_ff   esi,edi,00*04
   des_ff   edi,esi,02*04
   des_ff   esi,edi,04*04
   des_ff   edi,esi,06*04

   des_ff   esi,edi,08*04
   des_ff   edi,esi,10*04
   des_ff   esi,edi,12*04
   des_ff   edi,esi,14*04

   des_ff   esi,edi,16*04
   des_ff   edi,esi,18*04
   des_ff   esi,edi,20*04
   des_ff   edi,esi,22*04

   des_ff   esi,edi,24*04
   des_ff   edi,esi,26*04
   des_ff   esi,edi,28*04
   des_ff   edi,esi,30*04

   jmp      final_permutation
decrypt_block:
   des_ff   esi,edi,30*04
   des_ff   edi,esi,28*04
   des_ff   esi,edi,26*04
   des_ff   edi,esi,24*04

   des_ff   esi,edi,22*04
   des_ff   edi,esi,20*04
   des_ff   esi,edi,18*04
   des_ff   edi,esi,16*04

   des_ff   esi,edi,14*04
   des_ff   edi,esi,12*04
   des_ff   esi,edi,10*04
   des_ff   edi,esi,08*04

   des_ff   esi,edi,06*04
   des_ff   edi,esi,04*04
   des_ff   esi,edi,02*04
   des_ff   edi,esi,00*04
final_permutation:
   ror   esi,1

   perm_op   edi,eax,esi,32,0aaaaaaaah	; final permutation
   perm_op   eax,edi,esi,23,003fc03fch
   perm_op   edi,eax,esi,10,033333333h
   perm_op   esi,edi,eax,18,0fff0000fh
   perm_op   edi,esi,eax,12,0f0f0f0f0h

   ror   eax,4
                     
   mov   edi,[esp+4]                  ; plaintext
   mov   ebp,[_ebp]
   mov   [edi],eax
   mov   ebx,[_ebx]
   mov   [edi+4],esi
   mov   edi,[_edi]
   mov   esi,[_esi]

   ret
des_encrypt ENDP
_des_encrypt ENDP

_des_set_key PROC NEAR
des_set_key PROC NEAR
align 4
   mov   [_esi],esi
   mov   [_edi],edi
   mov   [_ebp],ebp
   mov   [_ebx],ebx

   mov   edi,[esp+4]

   mov   eax,[edi]
   mov   edx,[edi+4]
	
   key_perm eax,edx,ecx,04,00f0f0f0fh,1
   key_perm eax,eax,ecx,18,0cccc0000h,2
   key_perm edx,edx,ecx,18,0cccc0000h,2
   key_perm eax,edx,ecx,01,055555555h,3
   key_perm edx,eax,ecx,08,000ff00ffh,1
   key_perm eax,edx,ecx,01,055555555h,3

   mov   ecx,edx
   mov   ebx,edx

   and   ecx,255
   and   ebx,0ff00h

   shl   ecx,16
   and   edx,0ff0000h

   add   ecx,ebx
   shr   edx,16

   add   ecx,edx
   mov   edx,eax

   and   edx,0f0000000h
   and   eax,00fffffffh

   shr   edx,4
   add   edx,ecx

   ; Save low and high part of key after PC-1, as well as low and
   ; high part rotated 14 bits:

   mov   lw,eax
   mov   hgh,edx
   mov   ebx,eax

   shl   eax,14
   shl   edx,14
   shr   ebx,14

   mov   ecx,hgh
   add   eax,ebx
   shr   ecx,14

   mov   lwr,eax
   add   edx,ecx
   mov   hghr,edx

   km3 01,05,09, hgh,hgh,hgh, hghr, lw,lw,lw, lwr, 01,08,15,08, 00,03,02,01, 01,00,03,02
   km2 02,13,	 hgh,hgh,hgh, hghr, lw,lw,lw, lwr, 02,09,16,09, 02,01,00,03
   km2 03,14,	 hgh,hgh,hgh, hghr, lw,lw,lw, lwr, 04,11,18,11, 02,01,00,03
   km2 04,15,	 hgh,hgh,hgh, hghr, lw,lw,lw, lwr, 06,13,20,13, 02,01,00,03
   km2 06,10,	 hgh,hgh,hghr,hghr, lw,lw,lwr,lwr, 10,17,10,17, 00,03,02,01
   km2 07,11,	 hgh,hgh,hghr,hghr, lw,lw,lwr,lwr, 12,19,12,19, 00,03,02,01
   km3 08,12,16, hgh,hgh,hghr,hghr, lw,lw,lwr,lwr, 14,21,14,21, 00,03,02,01, 01,00,03,02

   mov   esi,[_esi]
   mov   edi,[_edi]
   mov   ebp,[_ebp]
   mov   ebx,[_ebx]

   ret
des_set_key ENDP
_des_set_key ENDP

_str_to_key PROC NEAR
str_to_key PROC NEAR
 align 4
   mov   [_esi],esi
   mov   [_edi],edi
   mov   [_ebx],ebx

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

   mov   esi,[_esi]
   mov   edi,[_edi]
   mov   ebx,[_ebx]
   ret
str_to_key ENDP
_str_to_key ENDP

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

;#######################################################
kbox1   dd   000000000h,010000000h,000100000h,010100000h
        dd   000000008h,010000008h,000100008h,010100008h
        dd   000008000h,010008000h,000108000h,010108000h
        dd   000008008h,010008008h,000108008h,010108008h
        dd   000000000h,010000000h,000100000h,010100000h
        dd   000000008h,010000008h,000100008h,010100008h
        dd   000008000h,010008000h,000108000h,010108000h
        dd   000008008h,010008008h,000108008h,010108008h
        dd   000000080h,010000080h,000100080h,010100080h
        dd   000000088h,010000088h,000100088h,010100088h
        dd   000008080h,010008080h,000108080h,010108080h
        dd   000008088h,010008088h,000108088h,010108088h
        dd   000000080h,010000080h,000100080h,010100080h
        dd   000000088h,010000088h,000100088h,010100088h
        dd   000008080h,010008080h,000108080h,010108080h
        dd   000008088h,010008088h,000108088h,010108088h

kbox2   dd   000002000h,010002000h,000102000h,010102000h
        dd   000002008h,010002008h,000102008h,010102008h
        dd   00000A000h,01000A000h,00010A000h,01010A000h
        dd   00000A008h,01000A008h,00010A008h,01010A008h
        dd   000002000h,010002000h,000102000h,010102000h
        dd   000002008h,010002008h,000102008h,010102008h
        dd   00000A000h,01000A000h,00010A000h,01010A000h
        dd   00000A008h,01000A008h,00010A008h,01010A008h
        dd   000002080h,010002080h,000102080h,010102080h
        dd   000002088h,010002088h,000102088h,010102088h
        dd   00000A080h,01000A080h,00010A080h,01010A080h
        dd   00000A088h,01000A088h,00010A088h,01010A088h
        dd   000002080h,010002080h,000102080h,010102080h
        dd   000002088h,010002088h,000102088h,010102088h
        dd   00000A080h,01000A080h,00010A080h,01010A080h
        dd   00000A088h,01000A088h,00010A088h,01010A088h

kbox3   dd   000000000h,000000000h,000000400h,000000400h
        dd   000200000h,000200000h,000200400h,000200400h
        dd   004000000h,004000000h,004000400h,004000400h
        dd   004200000h,004200000h,004200400h,004200400h
        dd   000000040h,000000040h,000000440h,000000440h
        dd   000200040h,000200040h,000200440h,000200440h
        dd   004000040h,004000040h,004000440h,004000440h
        dd   004200040h,004200040h,004200440h,004200440h
        dd   000800000h,000800000h,000800400h,000800400h
        dd   000A00000h,000A00000h,000A00400h,000A00400h
        dd   004800000h,004800000h,004800400h,004800400h
        dd   004A00000h,004A00000h,004A00400h,004A00400h
        dd   000800040h,000800040h,000800440h,000800440h
        dd   000A00040h,000A00040h,000A00440h,000A00440h
        dd   004800040h,004800040h,004800440h,004800440h
        dd   004A00040h,004A00040h,004A00440h,004A00440h

kbox4   dd   000000800h,000000800h,000000C00h,000000C00h
        dd   000200800h,000200800h,000200C00h,000200C00h
        dd   004000800h,004000800h,004000C00h,004000C00h
        dd   004200800h,004200800h,004200C00h,004200C00h
        dd   000000840h,000000840h,000000C40h,000000C40h
        dd   000200840h,000200840h,000200C40h,000200C40h
        dd   004000840h,004000840h,004000C40h,004000C40h
        dd   004200840h,004200840h,004200C40h,004200C40h
        dd   000800800h,000800800h,000800C00h,000800C00h
        dd   000A00800h,000A00800h,000A00C00h,000A00C00h
        dd   004800800h,004800800h,004800C00h,004800C00h
        dd   004A00800h,004A00800h,004A00C00h,004A00C00h
        dd   000800840h,000800840h,000800C40h,000800C40h
        dd   000A00840h,000A00840h,000A00C40h,000A00C40h
        dd   004800840h,004800840h,004800C40h,004800C40h
        dd   004A00840h,004A00840h,004A00C40h,004A00C40h

kbox5   dd   000000000h,020000000h,000000020h,020000020h
        dd   000000000h,020000000h,000000020h,020000020h
        dd   000001000h,020001000h,000001020h,020001020h
        dd   000001000h,020001000h,000001020h,020001020h
        dd   000080000h,020080000h,000080020h,020080020h
        dd   000080000h,020080000h,000080020h,020080020h
        dd   000081000h,020081000h,000081020h,020081020h
        dd   000081000h,020081000h,000081020h,020081020h
        dd   000000004h,020000004h,000000024h,020000024h
        dd   000000004h,020000004h,000000024h,020000024h
        dd   000001004h,020001004h,000001024h,020001024h
        dd   000001004h,020001004h,000001024h,020001024h
        dd   000080004h,020080004h,000080024h,020080024h
        dd   000080004h,020080004h,000080024h,020080024h
        dd   000081004h,020081004h,000081024h,020081024h
        dd   000081004h,020081004h,000081024h,020081024h

kbox6   dd   008000000h,028000000h,008000020h,028000020h
        dd   008000000h,028000000h,008000020h,028000020h
        dd   008001000h,028001000h,008001020h,028001020h
        dd   008001000h,028001000h,008001020h,028001020h
        dd   008080000h,028080000h,008080020h,028080020h
        dd   008080000h,028080000h,008080020h,028080020h
        dd   008081000h,028081000h,008081020h,028081020h
        dd   008081000h,028081000h,008081020h,028081020h
        dd   008000004h,028000004h,008000024h,028000024h
        dd   008000004h,028000004h,008000024h,028000024h
        dd   008001004h,028001004h,008001024h,028001024h
        dd   008001004h,028001004h,008001024h,028001024h
        dd   008080004h,028080004h,008080024h,028080024h
        dd   008080004h,028080004h,008080024h,028080024h
        dd   008081004h,028081004h,008081024h,028081024h
        dd   008081004h,028081004h,008081024h,028081024h

kbox7   dd   000000000h,040000000h,000040000h,040040000h
        dd   000000010h,040000010h,000040010h,040040010h
        dd   080000000h,0C0000000h,080040000h,0C0040000h
        dd   080000010h,0C0000010h,080040010h,0C0040010h
        dd   000400000h,040400000h,000440000h,040440000h
        dd   000400010h,040400010h,000440010h,040440010h
        dd   080400000h,0C0400000h,080440000h,0C0440000h
        dd   080400010h,0C0400010h,080440010h,0C0440010h
        dd   000004000h,040004000h,000044000h,040044000h
        dd   000004010h,040004010h,000044010h,040044010h
        dd   080004000h,0C0004000h,080044000h,0C0044000h
        dd   080004010h,0C0004010h,080044010h,0C0044010h
        dd   000404000h,040404000h,000444000h,040444000h
        dd   000404010h,040404010h,000444010h,040444010h
        dd   080404000h,0C0404000h,080444000h,0C0444000h
        dd   080404010h,0C0404010h,080444010h,0C0444010h
             
kbox8   dd   000000000h,040000000h,000040000h,040040000h
        dd   000000010h,040000010h,000040010h,040040010h
        dd   080000000h,0C0000000h,080040000h,0C0040000h
        dd   080000010h,0C0000010h,080040010h,0C0040010h
        dd   000400000h,040400000h,000440000h,040440000h
        dd   000400010h,040400010h,000440010h,040440010h
        dd   080400000h,0C0400000h,080440000h,0C0440000h
        dd   080400010h,0C0400010h,080440010h,0C0440010h
        dd   000004000h,040004000h,000044000h,040044000h
        dd   000004010h,040004010h,000044010h,040044010h
        dd   080004000h,0C0004000h,080044000h,0C0044000h
        dd   080004010h,0C0004010h,080044010h,0C0044010h
        dd   000404000h,040404000h,000444000h,040444000h
        dd   000404010h,040404010h,000444010h,040444010h
        dd   080404000h,0C0404000h,080444000h,0C0444000h
        dd   080404010h,0C0404010h,080444010h,0C0444010h

kbox9   dd   000000000h,000000000h,004000000h,004000000h
        dd   000200000h,000200000h,004200000h,004200000h
        dd   000000000h,000000000h,004000000h,004000000h
        dd   000200000h,000200000h,004200000h,004200000h
        dd   040000000h,040000000h,044000000h,044000000h
        dd   040200000h,040200000h,044200000h,044200000h
        dd   040000000h,040000000h,044000000h,044000000h
        dd   040200000h,040200000h,044200000h,044200000h
        dd   000001000h,000001000h,004001000h,004001000h
        dd   000201000h,000201000h,004201000h,004201000h
        dd   000001000h,000001000h,004001000h,004001000h
        dd   000201000h,000201000h,004201000h,004201000h
        dd   040001000h,040001000h,044001000h,044001000h
        dd   040201000h,040201000h,044201000h,044201000h
        dd   040001000h,040001000h,044001000h,044001000h
        dd   040201000h,040201000h,044201000h,044201000h

kbox10  dd   000000008h,000000008h,004000008h,004000008h
        dd   000200008h,000200008h,004200008h,004200008h
        dd   000000008h,000000008h,004000008h,004000008h
        dd   000200008h,000200008h,004200008h,004200008h
        dd   040000008h,040000008h,044000008h,044000008h
        dd   040200008h,040200008h,044200008h,044200008h
        dd   040000008h,040000008h,044000008h,044000008h
        dd   040200008h,040200008h,044200008h,044200008h
        dd   000001008h,000001008h,004001008h,004001008h
        dd   000201008h,000201008h,004201008h,004201008h
        dd   000001008h,000001008h,004001008h,004001008h
        dd   000201008h,000201008h,004201008h,004201008h
        dd   040001008h,040001008h,044001008h,044001008h
        dd   040201008h,040201008h,044201008h,044201008h
        dd   040001008h,040001008h,044001008h,044001008h
        dd   040201008h,040201008h,044201008h,044201008h

kbox11  dd   000000000h,000000010h,000000400h,000000410h
        dd   000080000h,000080010h,000080400h,000080410h
        dd   000000000h,000000010h,000000400h,000000410h
        dd   000080000h,000080010h,000080400h,000080410h
        dd   008000000h,008000010h,008000400h,008000410h
        dd   008080000h,008080010h,008080400h,008080410h
        dd   008000000h,008000010h,008000400h,008000410h
        dd   008080000h,008080010h,008080400h,008080410h
        dd   000002000h,000002010h,000002400h,000002410h
        dd   000082000h,000082010h,000082400h,000082410h
        dd   000002000h,000002010h,000002400h,000002410h
        dd   000082000h,000082010h,000082400h,000082410h
        dd   008002000h,008002010h,008002400h,008002410h
        dd   008082000h,008082010h,008082400h,008082410h
        dd   008002000h,008002010h,008002400h,008002410h
        dd   008082000h,008082010h,008082400h,008082410h

kbox12  dd   000000040h,000000050h,000000440h,000000450h
        dd   000080040h,000080050h,000080440h,000080450h
        dd   000000040h,000000050h,000000440h,000000450h
        dd   000080040h,000080050h,000080440h,000080450h
        dd   008000040h,008000050h,008000440h,008000450h
        dd   008080040h,008080050h,008080440h,008080450h
        dd   008000040h,008000050h,008000440h,008000450h
        dd   008080040h,008080050h,008080440h,008080450h
        dd   000002040h,000002050h,000002440h,000002450h
        dd   000082040h,000082050h,000082440h,000082450h
        dd   000002040h,000002050h,000002440h,000002450h
        dd   000082040h,000082050h,000082440h,000082450h
        dd   008002040h,008002050h,008002440h,008002450h
        dd   008082040h,008082050h,008082440h,008082450h
        dd   008002040h,008002050h,008002440h,008002450h
        dd   008082040h,008082050h,008082440h,008082450h

kbox13  dd   000000000h,080000000h,000000000h,080000000h
        dd   000000080h,080000080h,000000080h,080000080h
        dd   000100000h,080100000h,000100000h,080100000h
        dd   000100080h,080100080h,000100080h,080100080h
        dd   010000000h,090000000h,010000000h,090000000h
        dd   010000080h,090000080h,010000080h,090000080h
        dd   010100000h,090100000h,010100000h,090100000h
        dd   010100080h,090100080h,010100080h,090100080h
        dd   000004000h,080004000h,000004000h,080004000h
        dd   000004080h,080004080h,000004080h,080004080h
        dd   000104000h,080104000h,000104000h,080104000h
        dd   000104080h,080104080h,000104080h,080104080h
        dd   010004000h,090004000h,010004000h,090004000h
        dd   010004080h,090004080h,010004080h,090004080h
        dd   010104000h,090104000h,010104000h,090104000h
        dd   010104080h,090104080h,010104080h,090104080h

kbox14  dd   000040000h,080040000h,000040000h,080040000h
        dd   000040080h,080040080h,000040080h,080040080h
        dd   000140000h,080140000h,000140000h,080140000h
        dd   000140080h,080140080h,000140080h,080140080h
        dd   010040000h,090040000h,010040000h,090040000h
        dd   010040080h,090040080h,010040080h,090040080h
        dd   010140000h,090140000h,010140000h,090140000h
        dd   010140080h,090140080h,010140080h,090140080h
        dd   000044000h,080044000h,000044000h,080044000h
        dd   000044080h,080044080h,000044080h,080044080h
        dd   000144000h,080144000h,000144000h,080144000h
        dd   000144080h,080144080h,000144080h,080144080h
        dd   010044000h,090044000h,010044000h,090044000h
        dd   010044080h,090044080h,010044080h,090044080h
        dd   010144000h,090144000h,010144000h,090144000h
        dd   010144080h,090144080h,010144080h,090144080h

kbox15  dd   000000000h,000400000h,000008000h,000408000h
        dd   000000004h,000400004h,000008004h,000408004h
        dd   020000000h,020400000h,020008000h,020408000h
        dd   020000004h,020400004h,020008004h,020408004h
        dd   000800000h,000C00000h,000808000h,000C08000h
        dd   000800004h,000C00004h,000808004h,000C08004h
        dd   020800000h,020C00000h,020808000h,020C08000h
        dd   020800004h,020C00004h,020808004h,020C08004h
        dd   000000020h,000400020h,000008020h,000408020h
        dd   000000024h,000400024h,000008024h,000408024h
        dd   020000020h,020400020h,020008020h,020408020h
        dd   020000024h,020400024h,020008024h,020408024h
        dd   000800020h,000C00020h,000808020h,000C08020h
        dd   000800024h,000C00024h,000808024h,000C08024h
        dd   020800020h,020C00020h,020808020h,020C08020h
        dd   020800024h,020C00024h,020808024h,020C08024h

kbox16  dd   000000800h,000400800h,000008800h,000408800h
        dd   000000804h,000400804h,000008804h,000408804h
        dd   020000800h,020400800h,020008800h,020408800h
        dd   020000804h,020400804h,020008804h,020408804h
        dd   000800800h,000C00800h,000808800h,000C08800h
        dd   000800804h,000C00804h,000808804h,000C08804h
        dd   020800800h,020C00800h,020808800h,020C08800h
        dd   020800804h,020C00804h,020808804h,020C08804h
        dd   000000820h,000400820h,000008820h,000408820h
        dd   000000824h,000400824h,000008824h,000408824h
        dd   020000820h,020400820h,020008820h,020408820h
        dd   020000824h,020400824h,020008824h,020408824h
        dd   000800820h,000C00820h,000808820h,000C08820h
        dd   000800824h,000C00824h,000808824h,000C08824h
        dd   020800820h,020C00820h,020808820h,020C08820h
        dd   020800824h,020C00824h,020808824h,020C08824h

        end