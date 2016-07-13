; DES_KEY.ASM
; DES_KEY.S
;
; Copyright Svend Olaf Mikkelsen, 1998.
; svolaf@inet.uni2.dk
; March 26, 1998.
;
; The DES_KEY.S file is automatically converted from DES_KEY.ASM.
; Due to limitations of the syntax converter used, macros are
; expanded before conversion and local variable names are lost.
;
; Replacement for the des_set_key procedure in libdes by Eric Young.
; This code is faster since it is in assembler and 4K tables are used.
;
; To use the procedure: Compile the libdes set_key.c file with
; #define des_set_key des_set_key_org
;
; The (nice) code for key permuted choice 1 is taken from libdes.
;
; This version of DES_KEY can be freely used by libdes users.
; Code and executables can be redistributed if the code is unchanged
; and acknowledgement is included.
;
; No responsibility is taken for possible errors in the code.
;
; Included in DESKEY1.ZIP:
; DES_KEY.ASM
; DES_KEY.OBJ    Compiled with masm 6.00B
; DES_KEY.S

    .386
    .model flat,C

    public DES_set_key
    public _DES_set_key

    .data

    ; Table for key permuted choice 2, PC-2:

key_compress_permu dword 000000000h, 010000000h, 000100000h, 010100000h
    dword 000000008h, 010000008h, 000100008h, 010100008h
    dword 000008000h, 010008000h, 000108000h, 010108000h
    dword 000008008h, 010008008h, 000108008h, 010108008h
    dword 000000000h, 010000000h, 000100000h, 010100000h
    dword 000000008h, 010000008h, 000100008h, 010100008h
    dword 000008000h, 010008000h, 000108000h, 010108000h
    dword 000008008h, 010008008h, 000108008h, 010108008h
    dword 000000080h, 010000080h, 000100080h, 010100080h
    dword 000000088h, 010000088h, 000100088h, 010100088h
    dword 000008080h, 010008080h, 000108080h, 010108080h
    dword 000008088h, 010008088h, 000108088h, 010108088h
    dword 000000080h, 010000080h, 000100080h, 010100080h
    dword 000000088h, 010000088h, 000100088h, 010100088h
    dword 000008080h, 010008080h, 000108080h, 010108080h
    dword 000008088h, 010008088h, 000108088h, 010108088h
    dword 000002000h, 010002000h, 000102000h, 010102000h
    dword 000002008h, 010002008h, 000102008h, 010102008h
    dword 00000A000h, 01000A000h, 00010A000h, 01010A000h
    dword 00000A008h, 01000A008h, 00010A008h, 01010A008h
    dword 000002000h, 010002000h, 000102000h, 010102000h
    dword 000002008h, 010002008h, 000102008h, 010102008h
    dword 00000A000h, 01000A000h, 00010A000h, 01010A000h
    dword 00000A008h, 01000A008h, 00010A008h, 01010A008h
    dword 000002080h, 010002080h, 000102080h, 010102080h
    dword 000002088h, 010002088h, 000102088h, 010102088h
    dword 00000A080h, 01000A080h, 00010A080h, 01010A080h
    dword 00000A088h, 01000A088h, 00010A088h, 01010A088h
    dword 000002080h, 010002080h, 000102080h, 010102080h
    dword 000002088h, 010002088h, 000102088h, 010102088h
    dword 00000A080h, 01000A080h, 00010A080h, 01010A080h
    dword 00000A088h, 01000A088h, 00010A088h, 01010A088h
    dword 000000000h, 000000000h, 000000400h, 000000400h
    dword 000200000h, 000200000h, 000200400h, 000200400h
    dword 004000000h, 004000000h, 004000400h, 004000400h
    dword 004200000h, 004200000h, 004200400h, 004200400h
    dword 000000040h, 000000040h, 000000440h, 000000440h
    dword 000200040h, 000200040h, 000200440h, 000200440h
    dword 004000040h, 004000040h, 004000440h, 004000440h
    dword 004200040h, 004200040h, 004200440h, 004200440h
    dword 000800000h, 000800000h, 000800400h, 000800400h
    dword 000A00000h, 000A00000h, 000A00400h, 000A00400h
    dword 004800000h, 004800000h, 004800400h, 004800400h
    dword 004A00000h, 004A00000h, 004A00400h, 004A00400h
    dword 000800040h, 000800040h, 000800440h, 000800440h
    dword 000A00040h, 000A00040h, 000A00440h, 000A00440h
    dword 004800040h, 004800040h, 004800440h, 004800440h
    dword 004A00040h, 004A00040h, 004A00440h, 004A00440h
    dword 000000800h, 000000800h, 000000C00h, 000000C00h
    dword 000200800h, 000200800h, 000200C00h, 000200C00h
    dword 004000800h, 004000800h, 004000C00h, 004000C00h
    dword 004200800h, 004200800h, 004200C00h, 004200C00h
    dword 000000840h, 000000840h, 000000C40h, 000000C40h
    dword 000200840h, 000200840h, 000200C40h, 000200C40h
    dword 004000840h, 004000840h, 004000C40h, 004000C40h
    dword 004200840h, 004200840h, 004200C40h, 004200C40h
    dword 000800800h, 000800800h, 000800C00h, 000800C00h
    dword 000A00800h, 000A00800h, 000A00C00h, 000A00C00h
    dword 004800800h, 004800800h, 004800C00h, 004800C00h
    dword 004A00800h, 004A00800h, 004A00C00h, 004A00C00h
    dword 000800840h, 000800840h, 000800C40h, 000800C40h
    dword 000A00840h, 000A00840h, 000A00C40h, 000A00C40h
    dword 004800840h, 004800840h, 004800C40h, 004800C40h
    dword 004A00840h, 004A00840h, 004A00C40h, 004A00C40h
    dword 000000000h, 020000000h, 000000020h, 020000020h
    dword 000000000h, 020000000h, 000000020h, 020000020h
    dword 000001000h, 020001000h, 000001020h, 020001020h
    dword 000001000h, 020001000h, 000001020h, 020001020h
    dword 000080000h, 020080000h, 000080020h, 020080020h
    dword 000080000h, 020080000h, 000080020h, 020080020h
    dword 000081000h, 020081000h, 000081020h, 020081020h
    dword 000081000h, 020081000h, 000081020h, 020081020h
    dword 000000004h, 020000004h, 000000024h, 020000024h
    dword 000000004h, 020000004h, 000000024h, 020000024h
    dword 000001004h, 020001004h, 000001024h, 020001024h
    dword 000001004h, 020001004h, 000001024h, 020001024h
    dword 000080004h, 020080004h, 000080024h, 020080024h
    dword 000080004h, 020080004h, 000080024h, 020080024h
    dword 000081004h, 020081004h, 000081024h, 020081024h
    dword 000081004h, 020081004h, 000081024h, 020081024h
    dword 008000000h, 028000000h, 008000020h, 028000020h
    dword 008000000h, 028000000h, 008000020h, 028000020h
    dword 008001000h, 028001000h, 008001020h, 028001020h
    dword 008001000h, 028001000h, 008001020h, 028001020h
    dword 008080000h, 028080000h, 008080020h, 028080020h
    dword 008080000h, 028080000h, 008080020h, 028080020h
    dword 008081000h, 028081000h, 008081020h, 028081020h
    dword 008081000h, 028081000h, 008081020h, 028081020h
    dword 008000004h, 028000004h, 008000024h, 028000024h
    dword 008000004h, 028000004h, 008000024h, 028000024h
    dword 008001004h, 028001004h, 008001024h, 028001024h
    dword 008001004h, 028001004h, 008001024h, 028001024h
    dword 008080004h, 028080004h, 008080024h, 028080024h
    dword 008080004h, 028080004h, 008080024h, 028080024h
    dword 008081004h, 028081004h, 008081024h, 028081024h
    dword 008081004h, 028081004h, 008081024h, 028081024h
    dword 000000000h, 040000000h, 000040000h, 040040000h
    dword 000000010h, 040000010h, 000040010h, 040040010h
    dword 080000000h, 0C0000000h, 080040000h, 0C0040000h
    dword 080000010h, 0C0000010h, 080040010h, 0C0040010h
    dword 000400000h, 040400000h, 000440000h, 040440000h
    dword 000400010h, 040400010h, 000440010h, 040440010h
    dword 080400000h, 0C0400000h, 080440000h, 0C0440000h
    dword 080400010h, 0C0400010h, 080440010h, 0C0440010h
    dword 000004000h, 040004000h, 000044000h, 040044000h
    dword 000004010h, 040004010h, 000044010h, 040044010h
    dword 080004000h, 0C0004000h, 080044000h, 0C0044000h
    dword 080004010h, 0C0004010h, 080044010h, 0C0044010h
    dword 000404000h, 040404000h, 000444000h, 040444000h
    dword 000404010h, 040404010h, 000444010h, 040444010h
    dword 080404000h, 0C0404000h, 080444000h, 0C0444000h
    dword 080404010h, 0C0404010h, 080444010h, 0C0444010h
    dword 000000000h, 040000000h, 000040000h, 040040000h
    dword 000000010h, 040000010h, 000040010h, 040040010h
    dword 080000000h, 0C0000000h, 080040000h, 0C0040000h
    dword 080000010h, 0C0000010h, 080040010h, 0C0040010h
    dword 000400000h, 040400000h, 000440000h, 040440000h
    dword 000400010h, 040400010h, 000440010h, 040440010h
    dword 080400000h, 0C0400000h, 080440000h, 0C0440000h
    dword 080400010h, 0C0400010h, 080440010h, 0C0440010h
    dword 000004000h, 040004000h, 000044000h, 040044000h
    dword 000004010h, 040004010h, 000044010h, 040044010h
    dword 080004000h, 0C0004000h, 080044000h, 0C0044000h
    dword 080004010h, 0C0004010h, 080044010h, 0C0044010h
    dword 000404000h, 040404000h, 000444000h, 040444000h
    dword 000404010h, 040404010h, 000444010h, 040444010h
    dword 080404000h, 0C0404000h, 080444000h, 0C0444000h
    dword 080404010h, 0C0404010h, 080444010h, 0C0444010h
    dword 000000000h, 000000000h, 004000000h, 004000000h
    dword 000200000h, 000200000h, 004200000h, 004200000h
    dword 000000000h, 000000000h, 004000000h, 004000000h
    dword 000200000h, 000200000h, 004200000h, 004200000h
    dword 040000000h, 040000000h, 044000000h, 044000000h
    dword 040200000h, 040200000h, 044200000h, 044200000h
    dword 040000000h, 040000000h, 044000000h, 044000000h
    dword 040200000h, 040200000h, 044200000h, 044200000h
    dword 000001000h, 000001000h, 004001000h, 004001000h
    dword 000201000h, 000201000h, 004201000h, 004201000h
    dword 000001000h, 000001000h, 004001000h, 004001000h
    dword 000201000h, 000201000h, 004201000h, 004201000h
    dword 040001000h, 040001000h, 044001000h, 044001000h
    dword 040201000h, 040201000h, 044201000h, 044201000h
    dword 040001000h, 040001000h, 044001000h, 044001000h
    dword 040201000h, 040201000h, 044201000h, 044201000h
    dword 000000008h, 000000008h, 004000008h, 004000008h
    dword 000200008h, 000200008h, 004200008h, 004200008h
    dword 000000008h, 000000008h, 004000008h, 004000008h
    dword 000200008h, 000200008h, 004200008h, 004200008h
    dword 040000008h, 040000008h, 044000008h, 044000008h
    dword 040200008h, 040200008h, 044200008h, 044200008h
    dword 040000008h, 040000008h, 044000008h, 044000008h
    dword 040200008h, 040200008h, 044200008h, 044200008h
    dword 000001008h, 000001008h, 004001008h, 004001008h
    dword 000201008h, 000201008h, 004201008h, 004201008h
    dword 000001008h, 000001008h, 004001008h, 004001008h
    dword 000201008h, 000201008h, 004201008h, 004201008h
    dword 040001008h, 040001008h, 044001008h, 044001008h
    dword 040201008h, 040201008h, 044201008h, 044201008h
    dword 040001008h, 040001008h, 044001008h, 044001008h
    dword 040201008h, 040201008h, 044201008h, 044201008h
    dword 000000000h, 000000010h, 000000400h, 000000410h
    dword 000080000h, 000080010h, 000080400h, 000080410h
    dword 000000000h, 000000010h, 000000400h, 000000410h
    dword 000080000h, 000080010h, 000080400h, 000080410h
    dword 008000000h, 008000010h, 008000400h, 008000410h
    dword 008080000h, 008080010h, 008080400h, 008080410h
    dword 008000000h, 008000010h, 008000400h, 008000410h
    dword 008080000h, 008080010h, 008080400h, 008080410h
    dword 000002000h, 000002010h, 000002400h, 000002410h
    dword 000082000h, 000082010h, 000082400h, 000082410h
    dword 000002000h, 000002010h, 000002400h, 000002410h
    dword 000082000h, 000082010h, 000082400h, 000082410h
    dword 008002000h, 008002010h, 008002400h, 008002410h
    dword 008082000h, 008082010h, 008082400h, 008082410h
    dword 008002000h, 008002010h, 008002400h, 008002410h
    dword 008082000h, 008082010h, 008082400h, 008082410h
    dword 000000040h, 000000050h, 000000440h, 000000450h
    dword 000080040h, 000080050h, 000080440h, 000080450h
    dword 000000040h, 000000050h, 000000440h, 000000450h
    dword 000080040h, 000080050h, 000080440h, 000080450h
    dword 008000040h, 008000050h, 008000440h, 008000450h
    dword 008080040h, 008080050h, 008080440h, 008080450h
    dword 008000040h, 008000050h, 008000440h, 008000450h
    dword 008080040h, 008080050h, 008080440h, 008080450h
    dword 000002040h, 000002050h, 000002440h, 000002450h
    dword 000082040h, 000082050h, 000082440h, 000082450h
    dword 000002040h, 000002050h, 000002440h, 000002450h
    dword 000082040h, 000082050h, 000082440h, 000082450h
    dword 008002040h, 008002050h, 008002440h, 008002450h
    dword 008082040h, 008082050h, 008082440h, 008082450h
    dword 008002040h, 008002050h, 008002440h, 008002450h
    dword 008082040h, 008082050h, 008082440h, 008082450h
    dword 000000000h, 080000000h, 000000000h, 080000000h
    dword 000000080h, 080000080h, 000000080h, 080000080h
    dword 000100000h, 080100000h, 000100000h, 080100000h
    dword 000100080h, 080100080h, 000100080h, 080100080h
    dword 010000000h, 090000000h, 010000000h, 090000000h
    dword 010000080h, 090000080h, 010000080h, 090000080h
    dword 010100000h, 090100000h, 010100000h, 090100000h
    dword 010100080h, 090100080h, 010100080h, 090100080h
    dword 000004000h, 080004000h, 000004000h, 080004000h
    dword 000004080h, 080004080h, 000004080h, 080004080h
    dword 000104000h, 080104000h, 000104000h, 080104000h
    dword 000104080h, 080104080h, 000104080h, 080104080h
    dword 010004000h, 090004000h, 010004000h, 090004000h
    dword 010004080h, 090004080h, 010004080h, 090004080h
    dword 010104000h, 090104000h, 010104000h, 090104000h
    dword 010104080h, 090104080h, 010104080h, 090104080h
    dword 000040000h, 080040000h, 000040000h, 080040000h
    dword 000040080h, 080040080h, 000040080h, 080040080h
    dword 000140000h, 080140000h, 000140000h, 080140000h
    dword 000140080h, 080140080h, 000140080h, 080140080h
    dword 010040000h, 090040000h, 010040000h, 090040000h
    dword 010040080h, 090040080h, 010040080h, 090040080h
    dword 010140000h, 090140000h, 010140000h, 090140000h
    dword 010140080h, 090140080h, 010140080h, 090140080h
    dword 000044000h, 080044000h, 000044000h, 080044000h
    dword 000044080h, 080044080h, 000044080h, 080044080h
    dword 000144000h, 080144000h, 000144000h, 080144000h
    dword 000144080h, 080144080h, 000144080h, 080144080h
    dword 010044000h, 090044000h, 010044000h, 090044000h
    dword 010044080h, 090044080h, 010044080h, 090044080h
    dword 010144000h, 090144000h, 010144000h, 090144000h
    dword 010144080h, 090144080h, 010144080h, 090144080h
    dword 000000000h, 000400000h, 000008000h, 000408000h
    dword 000000004h, 000400004h, 000008004h, 000408004h
    dword 020000000h, 020400000h, 020008000h, 020408000h
    dword 020000004h, 020400004h, 020008004h, 020408004h
    dword 000800000h, 000C00000h, 000808000h, 000C08000h
    dword 000800004h, 000C00004h, 000808004h, 000C08004h
    dword 020800000h, 020C00000h, 020808000h, 020C08000h
    dword 020800004h, 020C00004h, 020808004h, 020C08004h
    dword 000000020h, 000400020h, 000008020h, 000408020h
    dword 000000024h, 000400024h, 000008024h, 000408024h
    dword 020000020h, 020400020h, 020008020h, 020408020h
    dword 020000024h, 020400024h, 020008024h, 020408024h
    dword 000800020h, 000C00020h, 000808020h, 000C08020h
    dword 000800024h, 000C00024h, 000808024h, 000C08024h
    dword 020800020h, 020C00020h, 020808020h, 020C08020h
    dword 020800024h, 020C00024h, 020808024h, 020C08024h
    dword 000000800h, 000400800h, 000008800h, 000408800h
    dword 000000804h, 000400804h, 000008804h, 000408804h
    dword 020000800h, 020400800h, 020008800h, 020408800h
    dword 020000804h, 020400804h, 020008804h, 020408804h
    dword 000800800h, 000C00800h, 000808800h, 000C08800h
    dword 000800804h, 000C00804h, 000808804h, 000C08804h
    dword 020800800h, 020C00800h, 020808800h, 020C08800h
    dword 020800804h, 020C00804h, 020808804h, 020C08804h
    dword 000000820h, 000400820h, 000008820h, 000408820h
    dword 000000824h, 000400824h, 000008824h, 000408824h
    dword 020000820h, 020400820h, 020008820h, 020408820h
    dword 020000824h, 020400824h, 020008824h, 020408824h
    dword 000800820h, 000C00820h, 000808820h, 000C08820h
    dword 000800824h, 000C00824h, 000808824h, 000C08824h
    dword 020800820h, 020C00820h, 020808820h, 020C08820h
    dword 020800824h, 020C00824h, 020808824h, 020C08824h



    .code


DES_set_key:
_DES_set_key:

    ; 0   ptr key       [in]
    ; 4   ptr keysetup  [out]

    push esi
    push edi
    push ebp
    push ebx
    push ecx

    sub esp,28

    lw textequ <dword ptr [esp]>
    hgh textequ <dword ptr [esp+4]>
    lwr textequ <dword ptr [esp+8]>
    hghr textequ <dword ptr [esp+12]>

    lw_y textequ <dword ptr [esp+16]>
    hgh_y textequ <dword ptr [esp+20]>
    hgh_save textequ <dword ptr [esp+24]>

    ; key in eax,edx
    mov ebx,[esp+24+28]
    mov eax,[ebx]
    mov edx,[ebx+4]

    ; Key permuted choice 1, PC-1.
    ; Code taken from Eric Youngs libdes and translated to assembler.
    ; Not Pentium optimized.
    ; Eric Young was inspired by John Fletcher.

    mov       ecx,edx
    shr       ecx,4
    xor       ecx,eax
    and       ecx,0f0f0f0fh
    xor       eax,ecx
    shl       ecx,4
    xor       edx,ecx

    mov       ecx,eax
    shl       ecx,18
    xor       ecx,eax
    and       ecx,0cccc0000h
    xor       eax,ecx
    shr       ecx,18
    xor       eax,ecx

    mov       ecx,edx
    shl       ecx,18
    xor       ecx,edx
    and       ecx,0cccc0000h
    xor       edx,ecx
    shr       ecx,18
    xor       edx,ecx

    mov       ecx,edx
    shr       ecx,1
    xor       ecx,eax
    and       ecx,55555555h
    xor       eax,ecx
    add       ecx,ecx
    xor       edx,ecx

    mov       ecx,eax
    shr       ecx,8
    xor       ecx,edx
    and       ecx,00ff00ffh
    xor       edx,ecx
    shl       ecx,8
    xor       eax,ecx

    mov       ecx,edx
    shr       ecx,1
    xor       ecx,eax
    and       ecx,55555555h
    xor       eax,ecx
    add       ecx,ecx
    xor       edx,ecx

    mov       ecx,edx
    and       ecx,000000ffh
    shl       ecx,16
    mov       ebx,edx
    and       ebx,0000ff00h
    or        ecx,ebx
    and       edx,00ff0000h
    shr       edx,16
    or        ecx,edx
    mov       edx,eax
    and       edx,0f0000000h
    shr       edx,4
    or        ecx,edx
    mov       edx,ecx

    and       eax,0fffffffh

    ; Save low and high part of key after PC-1, as well as low and
    ; high part rotated 14 bits:

    mov lw,eax
    mov ebx,eax
    shl eax,14
    mov hgh,edx
    shl edx,14
    mov ecx,hgh
    shr ebx,14
    ;nop
    shr ecx,14
    or eax,ebx
    or edx,ecx
    mov lwr,eax
    mov hghr,edx

km2 macro r1,r2,h1,h2,h3,h4,l1,l2,l3,l4,s1,s2,s3,s4,x1,x2,x3,x4

    ; key setup macro, 2 rounds
    mov eax,h1
    mov ebx,h2
    shr eax,s1
    mov ecx,h3
    shr ebx,s2
    and eax,07Fh
    shr ecx,s3
    mov edx,h4
    shr edx,s4
    and ebx,07Fh
    and ecx,07Fh
    mov esi,dword ptr key_compress_permu [eax*4+3*512]
    and edx,07Fh
    mov edi,dword ptr key_compress_permu [ebx*4+2*512]
    or esi,edi
    mov edi,dword ptr key_compress_permu [ecx*4+1*512]
    or esi,edi
    mov edi,dword ptr key_compress_permu [edx*4+0*512]
    or esi,edi
    mov ebp,dword ptr key_compress_permu [eax*4+x1*512]
    mov eax,l1
    mov edi,dword ptr key_compress_permu [ebx*4+x2*512]
    or ebp,edi
    mov edi,dword ptr key_compress_permu [ecx*4+x3*512]
    or ebp,edi
    mov edi,dword ptr key_compress_permu [edx*4+x4*512]
    shr eax,s1
    mov ebx,l2
    shr ebx,s2
    and eax,07Fh
    mov ecx,l3
    or ebp,edi
    mov edi,dword ptr key_compress_permu [eax*4+7*512]
    and ebx,07Fh
    shr ecx,s3
    mov eax,dword ptr key_compress_permu [eax*4+x1*512+2048]
    and ecx,07Fh
    mov edx,dword ptr key_compress_permu [ebx*4+x2*512+2048]
    or eax,edx
    mov edx,l4
    shr edx,s4
    mov ebx,dword ptr key_compress_permu [ebx*4+6*512]
    and edx,07Fh
    or edi,ebx
    mov ebx,dword ptr key_compress_permu [ecx*4+5*512]
    ;nop
    or edi,ebx
    mov ebx,dword ptr key_compress_permu [edx*4+4*512]
    or edi,ebx
    mov ebx,dword ptr key_compress_permu [ecx*4+x3*512+2048]
    or eax,ebx
    mov ebx,dword ptr key_compress_permu [edx*4+x4*512+2048]
    or eax,ebx
    mov ebx,[esp+28+28]
    mov ecx,esi
    mov edx,ebp
    xor ecx,edi
    xor edx,eax
    and ecx,0000FFFFh
    and edx,0000FFFFh
    xor esi,ecx
    xor edi,ecx
    xor ebp,edx
    xor eax,edx

    ror edi,16
    rol esi,4
    mov dword ptr [ebx+r1*8-8],edi
    mov dword ptr [ebx+r1*8-4],esi

    ror eax,16
    rol ebp,4
    mov dword ptr [ebx+r2*8-8],eax
    mov dword ptr [ebx+r2*8-4],ebp

    endm

km3 macro r1,r2,r3,h1,h2,h3,h4,l1,l2,l3,l4,s1,s2,s3,s4,x1,x2,x3,x4,y1,y2,y3,y4

    ; key setup macro, 3 rounds
    mov eax,h1
    mov ebx,h2
    shr eax,s1
    mov ecx,h3
    shr ebx,s2
    and eax,07Fh
    shr ecx,s3
    mov edx,h4
    shr edx,s4
    and ebx,07Fh
    and ecx,07Fh
    mov ebp,dword ptr key_compress_permu [eax*4+y1*512]
    and edx,07Fh
    mov esi,dword ptr key_compress_permu [ebx*4+y2*512]
    or ebp,esi
    mov esi,dword ptr key_compress_permu [ecx*4+y3*512]
    or ebp,esi
    mov esi,dword ptr key_compress_permu [edx*4+y4*512]
    or ebp,esi
    mov esi,dword ptr key_compress_permu [eax*4+3*512]
    mov lw_y,ebp
    mov edi,dword ptr key_compress_permu [ebx*4+2*512]
    or esi,edi
    mov edi,dword ptr key_compress_permu [ecx*4+1*512]
    or esi,edi
    mov edi,dword ptr key_compress_permu [edx*4+0*512]
    or esi,edi
    mov ebp,dword ptr key_compress_permu [eax*4+x1*512]
    mov edi,dword ptr key_compress_permu [ebx*4+x2*512]
    mov eax,l1
    or ebp,edi
    mov edi,dword ptr key_compress_permu [ecx*4+x3*512]
    or ebp,edi
    mov edi,dword ptr key_compress_permu [edx*4+x4*512]
    or ebp,edi
    mov ecx,l3
    shr eax,s1
    mov ebx,l2
    shr ebx,s2
    and eax,07Fh
    shr ecx,s3
    and ebx,07Fh
    and ecx,07Fh
    mov edx,l4
    shr edx,s4
    mov edi,dword ptr key_compress_permu [eax*4+y1*512+2048]
    mov hgh_save,esi
    and edx,07Fh
    mov esi,dword ptr key_compress_permu [ebx*4+y2*512+2048]
    ;nop
    or edi,esi
    mov esi,dword ptr key_compress_permu [ecx*4+y3*512+2048]
    or edi,esi
    mov esi,dword ptr key_compress_permu [edx*4+y4*512+2048]
    or edi,esi
    mov esi,dword ptr key_compress_permu [ebx*4+6*512]
    mov hgh_y,edi
    mov edi,dword ptr key_compress_permu [eax*4+7*512]
    or edi,esi
    mov esi,dword ptr key_compress_permu [ecx*4+5*512]
    or edi,esi
    mov esi,dword ptr key_compress_permu [edx*4+4*512]
    or edi,esi
    mov eax,dword ptr key_compress_permu [eax*4+x1*512+2048]
    mov ebx,dword ptr key_compress_permu [ebx*4+x2*512+2048]
    ;nop
    or eax,ebx
    mov ebx,dword ptr key_compress_permu [ecx*4+x3*512+2048]
    or eax,ebx
    mov ebx,dword ptr key_compress_permu [edx*4+x4*512+2048]
    or eax,ebx

    mov ebx,[esp+28+28]
    mov esi,hgh_save

    mov ecx,esi
    mov edx,ebp
    xor ecx,edi
    xor edx,eax
    and ecx,0000FFFFh
    and edx,0000FFFFh
    xor esi,ecx
    xor edi,ecx
    xor ebp,edx
    xor eax,edx

    ror edi,16
    rol esi,4
    mov dword ptr [ebx+r1*8-8],edi
    mov edi,hgh_y
    mov dword ptr [ebx+r1*8-4],esi
    mov esi,lw_y

    ror eax,16
    rol ebp,4
    mov dword ptr [ebx+r2*8-8],eax
    mov ecx,esi
    mov dword ptr [ebx+r2*8-4],ebp
    xor ecx,edi

    and ecx,0000FFFFh
    ;nop

    xor esi,ecx
    xor edi,ecx

    ror edi,16
    rol esi,4
    mov dword ptr [ebx+r3*8-8],edi
    mov dword ptr [ebx+r3*8-4],esi

    endm

    km3 1,5,9,hgh,hgh,hgh,hghr,lw,lw,lw,lwr,1,8,15,8,0,3,2,1,1,0,3,2
    km2 2,13,hgh,hgh,hgh,hghr,lw,lw,lw,lwr,2,9,16,9,2,1,0,3
    km2 3,14,hgh,hgh,hgh,hghr,lw,lw,lw,lwr,4,11,18,11,2,1,0,3
    km2 4,15,hgh,hgh,hgh,hghr,lw,lw,lw,lwr,6,13,20,13,2,1,0,3
    km2 6,10,hgh,hgh,hghr,hghr,lw,lw,lwr,lwr,10,17,10,17,0,3,2,1
    km2 7,11,hgh,hgh,hghr,hghr,lw,lw,lwr,lwr,12,19,12,19,0,3,2,1
    km3 8,12,16,hgh,hgh,hghr,hghr,lw,lw,lwr,lwr,14,21,14,21,0,3,2,1,1,0,3,2

    mov eax,0
    add esp,28

    pop ecx
    pop ebx
    pop ebp
    pop edi
    pop esi

    retn

    end

