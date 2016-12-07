; mark_description "Intel(R) C++ Compiler XE for applications running on IA-32, Version 15.0.0.108 Build 20140726";
; mark_description "-Fa -O3 -fast -GS-";
	.686P
 	.387
	OPTION DOTNAME
	ASSUME	CS:FLAT,DS:FLAT,SS:FLAT
;ident "-defaultlib:libcpmt"
;ident "-defaultlib:uuid.lib"
	INCLUDELIB <libmmt>
	INCLUDELIB <LIBCMT>
	INCLUDELIB <libirc>
	INCLUDELIB <svml_dispmt>
	INCLUDELIB <OLDNAMES>
	INCLUDELIB <libdecimal>
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _main
TXTST0:
; -- Begin  _main
;_main	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _main
; mark_begin;
IF @Version GE 800
  .MMX
ELSEIF @Version GE 612
  .MMX
  MMWORD TEXTEQU <QWORD>
ENDIF
IF @Version GE 800
  .XMM
ELSEIF @Version GE 614
  .XMM
  XMMWORD TEXTEQU <OWORD>
ENDIF
       ALIGN     16
	PUBLIC _main
_main	PROC NEAR 
; parameter 1: 8 + ebp
; parameter 2: 12 + ebp
.B1.1:                          ; Preds .B1.0
        push      ebp                                           ;540.1
        mov       ebp, esp                                      ;540.1
        and       esp, -128                                     ;540.1
        push      esi                                           ;540.1
        push      edi                                           ;540.1
        push      ebx                                           ;540.1
        sub       esp, 756                                      ;540.1
        push      0                                             ;540.1
        push      6142                                          ;540.1
        push      3                                             ;540.1
        call      ___intel_new_feature_proc_init                ;540.1
                                ; LOE
.B1.221:                        ; Preds .B1.1
        add       esp, 12                                       ;540.1
        stmxcsr   DWORD PTR [esp]                               ;540.1
        mov       DWORD PTR [8+esp], 559105867                  ;548.18
        or        DWORD PTR [esp], 32832                        ;540.1
        ldmxcsr   DWORD PTR [esp]                               ;540.1
        mov       DWORD PTR [12+esp], 623125312                 ;548.18
        mov       BYTE PTR [16+esp], 0                          ;548.18
        push      -11                                           ;561.3
        call      DWORD PTR [__imp__GetStdHandle@4]             ;561.3
                                ; LOE eax
.B1.220:                        ; Preds .B1.221
        mov       edx, eax                                      ;561.3
                                ; LOE edx
.B1.2:                          ; Preds .B1.220
        lea       eax, DWORD PTR [616+esp]                      ;561.3
        push      eax                                           ;561.3
        push      edx                                           ;561.3
        call      DWORD PTR [__imp__GetConsoleScreenBufferInfo@8] ;561.3
                                ; LOE
.B1.3:                          ; Preds .B1.2
        movsx     eax, WORD PTR [616+esp]                       ;561.3
        cmp       eax, 300                                      ;561.3
        jl        .B1.208       ; Prob 11%                      ;561.3
                                ; LOE
.B1.4:                          ; Preds .B1.209 .B1.3
        push      OFFSET FLAT: il0_peep_printf_format_0         ;563.3
        call      _puts                                         ;563.3
                                ; LOE
.B1.222:                        ; Preds .B1.4
        add       esp, 4                                        ;563.3
                                ; LOE
.B1.5:                          ; Preds .B1.222
        mov       ecx, DWORD PTR [8+ebp]                        ;539.5
        cmp       ecx, 2                                        ;565.14
        jl        .B1.124       ; Prob 22%                      ;565.14
                                ; LOE ecx
.B1.7:                          ; Preds .B1.5
        xor       ebx, ebx                                      ;546.36
        mov       esi, 1                                        ;546.36
        xor       edi, edi                                      ;557.14
        mov       eax, DWORD PTR [12+ebp]                       ;539.5
        mov       DWORD PTR [24+esp], esi                       ;546.36
        mov       DWORD PTR [652+esp], ebx                      ;546.36
        mov       DWORD PTR [36+esp], edi                       ;557.26
        mov       DWORD PTR [28+esp], ebx                       ;558.14
        mov       DWORD PTR [32+esp], ebx                       ;558.27
        mov       DWORD PTR [40+esp], edi                       ;569.8
        mov       edi, eax                                      ;569.8
                                ; LOE ebx esi edi
.B1.8:                          ; Preds .B1.7 .B1.10
        mov       ecx, DWORD PTR [edi+esi*4]                    ;571.9
        movsx     edx, BYTE PTR [ecx]                           ;571.9
        mov       eax, edx                                      ;571.21
        and       eax, -3                                       ;571.21
        cmp       eax, 45                                       ;571.21
        je        .B1.155       ; Prob 16%                      ;571.21
                                ; LOE edx ecx ebx esi edi
.B1.9:                          ; Preds .B1.8
        mov       ebx, ecx                                      ;604.7
                                ; LOE ebx esi edi
.B1.10:                         ; Preds .B1.185 .B1.186 .B1.179 .B1.180 .B1.173
                                ;       .B1.174 .B1.166 .B1.167 .B1.274 .B1.273
                                ;       .B1.9
        inc       esi                                           ;569.21
        cmp       esi, DWORD PTR [8+ebp]                        ;569.15
        jl        .B1.8         ; Prob 82%                      ;569.15
                                ; LOE ebx esi edi
.B1.11:                         ; Preds .B1.10
        mov       edi, DWORD PTR [40+esp]                       ;
        test      ebx, ebx                                      ;609.13
        je        .B1.153       ; Prob 12%                      ;609.13
                                ; LOE rdi ebx edi dil
.B1.12:                         ; Preds .B1.11
        mov       edx, ebx                                      ;615.8
        mov       ecx, edx                                      ;615.8
        and       edx, -16                                      ;615.8
        pxor      xmm0, xmm0                                    ;615.8
        pcmpeqb   xmm0, XMMWORD PTR [edx]                       ;615.8
        pmovmskb  eax, xmm0                                     ;615.8
        and       ecx, 15                                       ;615.8
        shr       eax, cl                                       ;615.8
        bsf       eax, eax                                      ;615.8
        jne       L2            ; Prob 60%                      ;615.8
        mov       eax, edx                                      ;615.8
        add       edx, ecx                                      ;615.8
        call      ___intel_sse4_strlen                          ;615.8
L2:                                                             ;
                                ; LOE rdi eax ebx edi dil
.B1.223:                        ; Preds .B1.12
        mov       esi, eax                                      ;615.8
        cmp       esi, 16                                       ;615.8
        je        .B1.15        ; Prob 32%                      ;615.8
                                ; LOE rdi ebx esi edi dil
.B1.13:                         ; Preds .B1.225 .B1.223
        push      ebx                                           ;616.5
        push      OFFSET FLAT: ??_C@_0BF@A@?6?5?5Invalid?5hash?5?$DN?5?$CFs?$AA@ ;616.5
        call      _printf                                       ;616.5
                                ; LOE
.B1.14:                         ; Preds .B1.13
        xor       eax, eax                                      ;617.12
        add       esp, 764                                      ;617.12
        pop       ebx                                           ;617.12
        pop       edi                                           ;617.12
        pop       esi                                           ;617.12
        mov       esp, ebp                                      ;617.12
        pop       ebp                                           ;617.12
        ret                                                     ;617.12
                                ; LOE
.B1.15:                         ; Preds .B1.223
        xor       eax, eax                                      ;615.8
        mov       DWORD PTR [40+esp], edi                       ;615.8
        mov       edi, eax                                      ;615.8
                                ; LOE ebx esi edi
.B1.16:                         ; Preds .B1.15 .B1.17
        movsx     ecx, BYTE PTR [edi+ebx]                       ;615.8
        push      ecx                                           ;615.8
        call      _isxdigit                                     ;615.8
                                ; LOE eax ebx esi edi
.B1.225:                        ; Preds .B1.16
        add       esp, 4                                        ;615.8
        test      eax, eax                                      ;615.8
        je        .B1.13        ; Prob 20%                      ;615.8
                                ; LOE ebx esi edi
.B1.17:                         ; Preds .B1.225
        inc       edi                                           ;615.8
        cmp       edi, esi                                      ;615.8
        jl        .B1.16        ; Prob 82%                      ;615.8
                                ; LOE ebx esi edi
.B1.18:                         ; Preds .B1.17
        mov       eax, esi                                      ;615.8
        shr       eax, 31                                       ;615.8
        add       esi, eax                                      ;615.8
        sar       esi, 1                                        ;615.8
        mov       edi, DWORD PTR [40+esp]                       ;
        test      esi, esi                                      ;615.8
        jle       .B1.23        ; Prob 10%                      ;615.8
                                ; LOE rdi ebx esi edi dil
.B1.19:                         ; Preds .B1.18
        xor       edx, edx                                      ;615.8
        lea       eax, DWORD PTR [648+esp]                      ;615.8
        mov       DWORD PTR [40+esp], edi                       ;615.8
        mov       edi, ebx                                      ;615.8
        mov       DWORD PTR [20+esp], esi                       ;615.8
        mov       ebx, eax                                      ;615.8
        mov       esi, edx                                      ;615.8
                                ; LOE ebx esi edi
.B1.20:                         ; Preds .B1.21 .B1.19
        push      ebx                                           ;615.8
        push      OFFSET FLAT: ??_C@_03A@?$CF2x?$AA@            ;615.8
        lea       ecx, DWORD PTR [edi+esi*2]                    ;615.8
        push      ecx                                           ;615.8
        call      _sscanf                                       ;615.8
                                ; LOE ebx esi edi
.B1.226:                        ; Preds .B1.20
        add       esp, 12                                       ;615.8
                                ; LOE ebx esi edi
.B1.21:                         ; Preds .B1.226
        mov       ecx, DWORD PTR [648+esp]                      ;615.8
        mov       BYTE PTR [esp+esi], cl                        ;615.8
        inc       esi                                           ;615.8
        cmp       esi, DWORD PTR [20+esp]                       ;615.8
        jl        .B1.20        ; Prob 82%                      ;615.8
                                ; LOE ebx esi edi
.B1.22:                         ; Preds .B1.21
        mov       edi, DWORD PTR [40+esp]                       ;
                                ; LOE rdi edi dil
.B1.23:                         ; Preds .B1.18 .B1.22
        mov       esi, DWORD PTR [12+esp]                       ;622.8
        mov       eax, esi                                      ;623.3
        shr       eax, 4                                        ;623.3
        mov       ecx, DWORD PTR [8+esp]                        ;621.8
        xor       eax, ecx                                      ;623.3
        and       eax, 252645135                                ;623.3
        xor       ecx, eax                                      ;623.3
        shl       eax, 4                                        ;623.3
        xor       esi, eax                                      ;623.3
        mov       eax, ecx                                      ;623.3
        shr       eax, 16                                       ;623.3
        xor       eax, esi                                      ;623.3
        movzx     eax, ax                                       ;623.3
        xor       esi, eax                                      ;623.3
        shl       eax, 16                                       ;623.3
        xor       ecx, eax                                      ;623.3
        mov       eax, esi                                      ;623.3
        shr       eax, 2                                        ;623.3
        xor       eax, ecx                                      ;623.3
        and       eax, 858993459                                ;623.3
        xor       ecx, eax                                      ;623.3
        shl       eax, 2                                        ;623.3
        xor       esi, eax                                      ;623.3
        mov       eax, ecx                                      ;623.3
        shr       eax, 8                                        ;623.3
        xor       eax, esi                                      ;623.3
        and       eax, 16711935                                 ;623.3
        xor       esi, eax                                      ;623.3
        shl       eax, 8                                        ;623.3
        xor       ecx, eax                                      ;623.3
        mov       eax, esi                                      ;623.3
        shr       eax, 1                                        ;623.3
        xor       eax, ecx                                      ;623.3
        and       eax, 1431655765                               ;623.3
        xor       ecx, eax                                      ;624.8
        add       eax, eax                                      ;625.8
        mov       ebx, DWORD PTR [4+esp]                        ;629.8
        xor       esi, eax                                      ;625.8
        ror       ecx, 29                                       ;624.8
        mov       DWORD PTR [20+esp], ecx                       ;624.8
        mov       ecx, ebx                                      ;630.3
        shr       ecx, 4                                        ;630.3
        mov       eax, DWORD PTR [esp]                          ;628.8
        xor       ecx, eax                                      ;630.3
        and       ecx, 252645135                                ;630.3
        xor       eax, ecx                                      ;630.3
        shl       ecx, 4                                        ;630.3
        xor       ebx, ecx                                      ;630.3
        mov       ecx, eax                                      ;630.3
        shr       ecx, 16                                       ;630.3
        xor       ecx, ebx                                      ;630.3
        movzx     ecx, cx                                       ;630.3
        xor       ebx, ecx                                      ;630.3
        shl       ecx, 16                                       ;630.3
        xor       eax, ecx                                      ;630.3
        mov       ecx, ebx                                      ;630.3
        shr       ecx, 2                                        ;630.3
        xor       ecx, eax                                      ;630.3
        and       ecx, 858993459                                ;630.3
        xor       eax, ecx                                      ;630.3
        shl       ecx, 2                                        ;630.3
        xor       ebx, ecx                                      ;630.3
        mov       ecx, eax                                      ;630.3
        shr       ecx, 8                                        ;630.3
        xor       ecx, ebx                                      ;630.3
        and       ecx, 16711935                                 ;630.3
        xor       ebx, ecx                                      ;630.3
        shl       ecx, 8                                        ;630.3
        xor       eax, ecx                                      ;630.3
        mov       ecx, ebx                                      ;630.3
        shr       ecx, 1                                        ;630.3
        xor       ecx, eax                                      ;630.3
        and       ecx, 1431655765                               ;630.3
        xor       eax, ecx                                      ;631.8
        add       ecx, ecx                                      ;632.8
        xor       ebx, ecx                                      ;632.8
        ror       eax, 29                                       ;631.8
        mov       DWORD PTR [316+esp], eax                      ;631.8
        mov       eax, 240                                      ;635.3
        ror       esi, 29                                       ;625.8
        ror       ebx, 29                                       ;632.8
        mov       BYTE PTR [592+esp], 0                         ;635.3
                                ; LOE eax ebx esi edi
.B1.213:                        ; Preds .B1.213 .B1.23
        pxor      xmm0, xmm0                                    ;635.3
        movups    XMMWORD PTR [336+esp+eax], xmm0               ;635.3
        movups    XMMWORD PTR [320+esp+eax], xmm0               ;635.3
        movups    XMMWORD PTR [304+esp+eax], xmm0               ;635.3
        movups    XMMWORD PTR [288+esp+eax], xmm0               ;635.3
        movups    XMMWORD PTR [272+esp+eax], xmm0               ;635.3
        sub       eax, 80                                       ;635.3
        jne       .B1.213       ; Prob 66%                      ;635.3
                                ; LOE eax ebx esi edi
.B1.212:                        ; Preds .B1.213
        pxor      xmm0, xmm0                                    ;635.3
        movups    XMMWORD PTR [336+esp], xmm0                   ;635.3
                                ; LOE ebx esi edi
.B1.24:                         ; Preds .B1.212
        test      edi, edi                                      ;638.14
        je        .B1.148       ; Prob 12%                      ;638.14
                                ; LOE ebx esi edi
.B1.25:                         ; Preds .B1.24
        mov       edx, edi                                      ;639.9
        mov       ecx, edx                                      ;639.9
        and       edx, -16                                      ;639.9
        pxor      xmm0, xmm0                                    ;639.9
        pcmpeqb   xmm0, XMMWORD PTR [edx]                       ;639.9
        pmovmskb  eax, xmm0                                     ;639.9
        and       ecx, 15                                       ;639.9
        shr       eax, cl                                       ;639.9
        bsf       eax, eax                                      ;639.9
        jne       L3            ; Prob 60%                      ;639.9
        mov       eax, edx                                      ;639.9
        add       edx, ecx                                      ;639.9
        call      ___intel_sse4_strlen                          ;639.9
L3:                                                             ;
                                ; LOE eax ebx esi edi
.B1.227:                        ; Preds .B1.25
        mov       ecx, eax                                      ;639.9
        cmp       ecx, 3                                        ;640.13
        jg        .B1.123       ; Prob 22%                      ;640.13
                                ; LOE ecx ebx esi edi
.B1.26:                         ; Preds .B1.227
        test      ecx, ecx                                      ;644.17
        jle       .B1.33        ; Prob 10%                      ;644.17
                                ; LOE ecx ebx esi edi
.B1.27:                         ; Preds .B1.26
        xor       eax, eax                                      ;644.10
        mov       DWORD PTR [esp], ecx                          ;644.10
        mov       DWORD PTR [600+esp], ebx                      ;644.10
        mov       ebx, eax                                      ;644.10
        mov       DWORD PTR [320+esp], esi                      ;644.10
                                ; LOE ebx edi
.B1.28:                         ; Preds .B1.31 .B1.27
        movsx     esi, BYTE PTR [edi]                           ;645.21
        push      esi                                           ;645.12
        call      _isdigit                                      ;645.12
                                ; LOE eax ebx esi edi
.B1.228:                        ; Preds .B1.28
        add       esp, 4                                        ;645.12
        test      eax, eax                                      ;645.12
        je        .B1.115       ; Prob 22%                      ;645.12
                                ; LOE ebx esi edi
.B1.29:                         ; Preds .B1.228
        add       esi, -48                                      ;649.22
        cmp       esi, 2                                        ;649.22
        ja        .B1.107       ; Prob 22%                      ;649.22
                                ; LOE ebx edi
.B1.30:                         ; Preds .B1.29
        lea       edx, DWORD PTR [336+esp]                      ;654.21
        mov       ecx, edx                                      ;654.21
        and       edx, -16                                      ;654.21
        pxor      xmm0, xmm0                                    ;654.21
        pcmpeqb   xmm0, XMMWORD PTR [edx]                       ;654.21
        pmovmskb  eax, xmm0                                     ;654.21
        and       ecx, 15                                       ;654.21
        shr       eax, cl                                       ;654.21
        bsf       eax, eax                                      ;654.21
        jne       L4            ; Prob 60%                      ;654.21
        mov       eax, edx                                      ;654.21
        add       edx, ecx                                      ;654.21
        call      ___intel_sse4_strlen                          ;654.21
L4:                                                             ;
                                ; LOE eax ebx edi
.B1.229:                        ; Preds .B1.30
        mov       ecx, eax                                      ;654.21
        lea       eax, DWORD PTR [336+esp]                      ;653.7
        movzx     esi, BYTE PTR [edi]                           ;653.7
        neg       ecx                                           ;653.7
        add       ecx, 256                                      ;653.7
        mov       edx, DWORD PTR [_alphabets-192+esi*4]         ;653.7
        call      ___intel_sse4_strncat                         ;653.7
                                ; LOE ebx edi
.B1.31:                         ; Preds .B1.229
        inc       ebx                                           ;644.22
        inc       edi                                           ;644.22
        cmp       ebx, DWORD PTR [esp]                          ;644.17
        jl        .B1.28        ; Prob 82%                      ;644.17
                                ; LOE ebx edi
.B1.32:                         ; Preds .B1.31
        mov       ebx, DWORD PTR [600+esp]                      ;
        mov       esi, DWORD PTR [320+esp]                      ;
                                ; LOE ebx esi
.B1.33:                         ; Preds .B1.26 .B1.149 .B1.271 .B1.32
        pxor      xmm0, xmm0                                    ;667.3
        movq      QWORD PTR [672+esp], xmm0                     ;667.3
                                ; LOE ebx esi
.B1.34:                         ; Preds .B1.33
        pxor      xmm0, xmm0                                    ;668.3
        movq      QWORD PTR [656+esp], xmm0                     ;668.3
                                ; LOE ebx esi
.B1.35:                         ; Preds .B1.34
        cmp       DWORD PTR [32+esp], 0                         ;671.14
        je        .B1.37        ; Prob 32%                      ;671.14
                                ; LOE ebx esi
.B1.36:                         ; Preds .B1.35
        mov       eax, 7                                        ;672.5
        lea       edx, DWORD PTR [672+esp]                      ;672.5
        mov       ecx, DWORD PTR [32+esp]                       ;672.5
        call      ___intel_ssse3_strncpy                        ;672.5
        jmp       .B1.38        ; Prob 100%                     ;672.5
                                ; LOE ebx esi
.B1.37:                         ; Preds .B1.35
        movzx     eax, BYTE PTR [336+esp]                       ;674.20
        mov       BYTE PTR [672+esp], al                        ;674.5
                                ; LOE ebx esi
.B1.38:                         ; Preds .B1.36 .B1.37
        lea       edx, DWORD PTR [336+esp]                      ;677.15
        mov       ecx, edx                                      ;677.15
        and       edx, -16                                      ;677.15
        pxor      xmm0, xmm0                                    ;677.15
        pcmpeqb   xmm0, XMMWORD PTR [edx]                       ;677.15
        pmovmskb  eax, xmm0                                     ;677.15
        and       ecx, 15                                       ;677.15
        shr       eax, cl                                       ;677.15
        bsf       eax, eax                                      ;677.15
        jne       L5            ; Prob 60%                      ;677.15
        mov       eax, edx                                      ;677.15
        add       edx, ecx                                      ;677.15
        call      ___intel_sse4_strlen                          ;677.15
L5:                                                             ;
                                ; LOE eax ebx esi
.B1.230:                        ; Preds .B1.38
        cmp       DWORD PTR [28+esp], 0                         ;680.14
        je        .B1.40        ; Prob 32%                      ;680.14
                                ; LOE eax ebx esi
.B1.39:                         ; Preds .B1.230
        mov       eax, 7                                        ;681.5
        lea       edx, DWORD PTR [656+esp]                      ;681.5
        mov       ecx, DWORD PTR [28+esp]                       ;681.5
        call      ___intel_ssse3_strncpy                        ;681.5
        jmp       .B1.41        ; Prob 100%                     ;681.5
                                ; LOE ebx esi
.B1.40:                         ; Preds .B1.230
        movzx     eax, BYTE PTR [335+esp+eax]                   ;684.20
        mov       BYTE PTR [656+esp], al                        ;684.7
        mov       BYTE PTR [657+esp], al                        ;684.7
        mov       BYTE PTR [658+esp], al                        ;684.7
        mov       BYTE PTR [659+esp], al                        ;684.7
        mov       BYTE PTR [660+esp], al                        ;684.7
        mov       BYTE PTR [661+esp], al                        ;684.7
        mov       BYTE PTR [662+esp], al                        ;684.7
                                ; LOE ebx esi
.B1.41:                         ; Preds .B1.39 .B1.40
        lea       edx, DWORD PTR [672+esp]                      ;689.20
        mov       ecx, edx                                      ;689.20
        and       edx, -16                                      ;689.20
        pxor      xmm0, xmm0                                    ;689.20
        pcmpeqb   xmm0, XMMWORD PTR [edx]                       ;689.20
        pmovmskb  eax, xmm0                                     ;689.20
        and       ecx, 15                                       ;689.20
        shr       eax, cl                                       ;689.20
        bsf       eax, eax                                      ;689.20
        jne       L6            ; Prob 60%                      ;689.20
        mov       eax, edx                                      ;689.20
        add       edx, ecx                                      ;689.20
        call      ___intel_sse4_strlen                          ;689.20
L6:                                                             ;
                                ; LOE eax ebx esi
.B1.232:                        ; Preds .B1.41
        mov       DWORD PTR [8+esp], eax                        ;689.20
        lea       edx, DWORD PTR [336+esp]                      ;689.20
        mov       ecx, edx                                      ;689.20
        and       edx, -16                                      ;689.20
        pxor      xmm0, xmm0                                    ;689.20
        pcmpeqb   xmm0, XMMWORD PTR [edx]                       ;689.20
        pmovmskb  eax, xmm0                                     ;689.20
        and       ecx, 15                                       ;689.20
        shr       eax, cl                                       ;689.20
        bsf       eax, eax                                      ;689.20
        jne       L7            ; Prob 60%                      ;689.20
        mov       eax, edx                                      ;689.20
        add       edx, ecx                                      ;689.20
        call      ___intel_sse4_strlen                          ;689.20
L7:                                                             ;
                                ; LOE eax ebx esi
.B1.231:                        ; Preds .B1.232
        mov       DWORD PTR [36+esp], eax                       ;689.20
        cmp       DWORD PTR [8+esp], 0                          ;689.20
        jle       .B1.46        ; Prob 4%                       ;689.20
                                ; LOE ebx esi
.B1.42:                         ; Preds .B1.231
        xor       ecx, ecx                                      ;689.20
        lea       eax, DWORD PTR [336+esp]                      ;689.20
        cdq                                                     ;689.20
        mov       eax, DWORD PTR [36+esp]                       ;689.20
        xor       edi, edi                                      ;689.20
        mov       DWORD PTR [esp], ecx                          ;689.20
        mov       DWORD PTR [32+esp], edx                       ;689.20
        cdq                                                     ;689.20
        mov       DWORD PTR [600+esp], ebx                      ;689.20
        mov       DWORD PTR [608+esp], ecx                      ;689.20
        mov       DWORD PTR [4+esp], 1                          ;689.20
        mov       DWORD PTR [28+esp], edx                       ;689.20
        mov       DWORD PTR [320+esp], esi                      ;689.20
        mov       esi, ecx                                      ;689.20
        mov       ebx, DWORD PTR [esp]                          ;689.20
                                ; LOE ebx esi edi
.B1.43:                         ; Preds .B1.234 .B1.42
        movsx     edx, BYTE PTR [672+esp+ebx]                   ;689.20
        lea       eax, DWORD PTR [336+esp]                      ;689.20
        mov       ecx, eax                                      ;689.20
        and       ecx, 15                                       ;689.20
        and       eax, -16                                      ;689.20
        push      eax                                           ;689.20
        pxor      xmm2, xmm2                                    ;689.20
        movd      xmm1, edx                                     ;689.20
        pshufb    xmm1, xmm2                                    ;689.20
        movdqa    xmm0, XMMWORD PTR [eax]                       ;689.20
        pcmpeqb   xmm2, xmm0                                    ;689.20
        pcmpeqb   xmm0, xmm1                                    ;689.20
        pmovmskb  edx, xmm0                                     ;689.20
        pmovmskb  eax, xmm2                                     ;689.20
        shr       edx, cl                                       ;689.20
        shr       eax, cl                                       ;689.20
        test      edx, edx                                      ;689.20
        jne       L8            ; Prob 25%                      ;689.20
        test      eax, eax                                      ;689.20
        je        L11           ; Prob 25%                      ;689.20
        jmp       L10           ; Prob 100%                     ;689.20
L8:                                                             ;
        bsf       edx, edx                                      ;689.20
        bsf       eax, eax                                      ;689.20
        jz        L9            ; Prob 50%                      ;689.20
        cmp       edx, eax                                      ;689.20
        jg        L10           ; Prob 25%                      ;689.20
L9:                                                             ;
        pop       eax                                           ;689.20
        add       eax, ecx                                      ;689.20
        add       eax, edx                                      ;689.20
        jmp       L12           ; Prob 25%                      ;689.20
L10:                                                            ;
        pop       edx                                           ;689.20
        xor       eax, eax                                      ;689.20
        jmp       L12           ; Prob 100%                     ;689.20
L11:                                                            ;
        pop       eax                                           ;689.20
        call      ___intel_sse4_strchr                          ;689.20
L12:                                                            ;
                                ; LOE eax ebx esi edi
.B1.233:                        ; Preds .B1.43
        test      eax, eax                                      ;689.20
        je        .B1.46        ; Prob 20%                      ;689.20
                                ; LOE eax ebx esi edi
.B1.44:                         ; Preds .B1.233
        push      esi                                           ;689.20
        cdq                                                     ;689.20
        push      DWORD PTR [8+esp]                             ;689.20
        mov       ecx, edx                                      ;689.20
        lea       edx, DWORD PTR [344+esp]                      ;689.20
        sub       eax, edx                                      ;689.20
        sbb       ecx, DWORD PTR [40+esp]                       ;689.20
        add       eax, 1                                        ;689.20
        adc       ecx, 0                                        ;689.20
        push      ecx                                           ;689.20
        push      eax                                           ;689.20
        call      __allmul                                      ;689.20
                                ; LOE eax edx ebx esi edi
.B1.235:                        ; Preds .B1.44
        push      esi                                           ;689.20
        push      DWORD PTR [8+esp]                             ;689.20
        push      DWORD PTR [36+esp]                            ;689.20
        push      DWORD PTR [48+esp]                            ;689.20
        add       DWORD PTR [624+esp], eax                      ;689.20
        adc       edi, edx                                      ;689.20
        call      __allmul                                      ;689.20
                                ; LOE eax edx ebx edi
.B1.234:                        ; Preds .B1.235
        inc       ebx                                           ;689.20
        mov       esi, edx                                      ;689.20
        mov       DWORD PTR [4+esp], eax                        ;689.20
        cmp       ebx, DWORD PTR [8+esp]                        ;689.20
        jl        .B1.43        ; Prob 82%                      ;689.20
                                ; LOE ebx esi edi
.B1.45:                         ; Preds .B1.234
        mov       eax, DWORD PTR [608+esp]                      ;689.51
        mov       ebx, DWORD PTR [600+esp]                      ;
        or        eax, edi                                      ;689.51
        mov       esi, DWORD PTR [320+esp]                      ;
        jne       .B1.48        ; Prob 50%                      ;689.51
                                ; LOE rbx rsi ebx esi edi bl bh sil
.B1.46:                         ; Preds .B1.233 .B1.231 .B1.45
        push      OFFSET FLAT: il0_peep_printf_format_3         ;690.5
        call      _puts                                         ;690.5
                                ; LOE
.B1.47:                         ; Preds .B1.46
        xor       eax, eax                                      ;691.12
        add       esp, 760                                      ;691.12
        pop       ebx                                           ;691.12
        pop       edi                                           ;691.12
        pop       esi                                           ;691.12
        mov       esp, ebp                                      ;691.12
        pop       ebp                                           ;691.12
        ret                                                     ;691.12
                                ; LOE
.B1.48:                         ; Preds .B1.45
        lea       edx, DWORD PTR [656+esp]                      ;695.18
        mov       ecx, edx                                      ;695.18
        and       edx, -16                                      ;695.18
        pxor      xmm0, xmm0                                    ;695.18
        pcmpeqb   xmm0, XMMWORD PTR [edx]                       ;695.18
        pmovmskb  eax, xmm0                                     ;695.18
        and       ecx, 15                                       ;695.18
        shr       eax, cl                                       ;695.18
        bsf       eax, eax                                      ;695.18
        jne       L13           ; Prob 60%                      ;695.18
        mov       eax, edx                                      ;695.18
        add       edx, ecx                                      ;695.18
        call      ___intel_sse4_strlen                          ;695.18
L13:                                                            ;
                                ; LOE rbx rsi eax ebx esi edi bl bh sil
.B1.237:                        ; Preds .B1.48
        mov       edx, eax                                      ;695.18
        test      edx, edx                                      ;695.18
        jle       .B1.105       ; Prob 4%                       ;695.18
                                ; LOE rbx rsi edx ebx esi edi bl bh sil
.B1.49:                         ; Preds .B1.237
        xor       eax, eax                                      ;695.18
        xor       ecx, ecx                                      ;695.18
        mov       DWORD PTR [8+esp], eax                        ;695.18
        mov       eax, 1                                        ;695.18
        mov       DWORD PTR [esp], ecx                          ;695.18
        mov       DWORD PTR [320+esp], esi                      ;695.18
        mov       DWORD PTR [12+esp], ecx                       ;695.18
        mov       DWORD PTR [4+esp], edi                        ;695.18
        mov       edi, eax                                      ;695.18
        mov       DWORD PTR [16+esp], edx                       ;695.18
        mov       DWORD PTR [600+esp], ebx                      ;695.18
        mov       ebx, ecx                                      ;695.18
        mov       esi, DWORD PTR [esp]                          ;695.18
                                ; LOE ebx esi edi
.B1.50:                         ; Preds .B1.239 .B1.49
        movsx     edx, BYTE PTR [656+esp+esi]                   ;695.18
        lea       eax, DWORD PTR [336+esp]                      ;695.18
        mov       ecx, eax                                      ;695.18
        and       ecx, 15                                       ;695.18
        and       eax, -16                                      ;695.18
        push      eax                                           ;695.18
        pxor      xmm2, xmm2                                    ;695.18
        movd      xmm1, edx                                     ;695.18
        pshufb    xmm1, xmm2                                    ;695.18
        movdqa    xmm0, XMMWORD PTR [eax]                       ;695.18
        pcmpeqb   xmm2, xmm0                                    ;695.18
        pcmpeqb   xmm0, xmm1                                    ;695.18
        pmovmskb  edx, xmm0                                     ;695.18
        pmovmskb  eax, xmm2                                     ;695.18
        shr       edx, cl                                       ;695.18
        shr       eax, cl                                       ;695.18
        test      edx, edx                                      ;695.18
        jne       L14           ; Prob 25%                      ;695.18
        test      eax, eax                                      ;695.18
        je        L17           ; Prob 25%                      ;695.18
        jmp       L16           ; Prob 100%                     ;695.18
L14:                                                            ;
        bsf       edx, edx                                      ;695.18
        bsf       eax, eax                                      ;695.18
        jz        L15           ; Prob 50%                      ;695.18
        cmp       edx, eax                                      ;695.18
        jg        L16           ; Prob 25%                      ;695.18
L15:                                                            ;
        pop       eax                                           ;695.18
        add       eax, ecx                                      ;695.18
        add       eax, edx                                      ;695.18
        jmp       L18           ; Prob 25%                      ;695.18
L16:                                                            ;
        pop       edx                                           ;695.18
        xor       eax, eax                                      ;695.18
        jmp       L18           ; Prob 100%                     ;695.18
L17:                                                            ;
        pop       eax                                           ;695.18
        call      ___intel_sse4_strchr                          ;695.18
L18:                                                            ;
                                ; LOE eax ebx esi edi
.B1.238:                        ; Preds .B1.50
        test      eax, eax                                      ;695.18
        je        .B1.105       ; Prob 20%                      ;695.18
                                ; LOE eax ebx esi edi
.B1.51:                         ; Preds .B1.238
        push      ebx                                           ;695.18
        cdq                                                     ;695.18
        push      edi                                           ;695.18
        mov       ecx, edx                                      ;695.18
        lea       edx, DWORD PTR [344+esp]                      ;695.18
        sub       eax, edx                                      ;695.18
        sbb       ecx, DWORD PTR [40+esp]                       ;695.18
        add       eax, 1                                        ;695.18
        adc       ecx, 0                                        ;695.18
        push      ecx                                           ;695.18
        push      eax                                           ;695.18
        call      __allmul                                      ;695.18
                                ; LOE eax edx ebx esi edi
.B1.240:                        ; Preds .B1.51
        push      DWORD PTR [28+esp]                            ;695.18
        push      DWORD PTR [40+esp]                            ;695.18
        push      ebx                                           ;695.18
        push      edi                                           ;695.18
        add       DWORD PTR [24+esp], eax                       ;695.18
        adc       DWORD PTR [28+esp], edx                       ;695.18
        call      __allmul                                      ;695.18
                                ; LOE eax edx esi
.B1.239:                        ; Preds .B1.240
        inc       esi                                           ;695.18
        mov       edi, eax                                      ;695.18
        mov       ebx, edx                                      ;695.18
        cmp       esi, DWORD PTR [16+esp]                       ;695.18
        jl        .B1.50        ; Prob 82%                      ;695.18
                                ; LOE ebx esi edi
.B1.52:                         ; Preds .B1.239
        mov       eax, DWORD PTR [8+esp]                        ;695.47
        mov       edi, DWORD PTR [4+esp]                        ;
        mov       ebx, DWORD PTR [600+esp]                      ;
        mov       esi, DWORD PTR [320+esp]                      ;
        or        eax, DWORD PTR [12+esp]                       ;695.47
        je        .B1.105       ; Prob 22%                      ;695.47
                                ; LOE rbx rsi rdi ebx esi edi bl bh sil dil
.B1.53:                         ; Preds .B1.52
        mov       edx, DWORD PTR [608+esp]                      ;701.19
        mov       eax, edi                                      ;701.19
        sub       edx, DWORD PTR [8+esp]                        ;701.19
        sbb       eax, DWORD PTR [12+esp]                       ;701.19
        jb        .B1.54        ; Prob 62%                      ;701.19
                                ; LOE rbx rsi rdi eax edx ebx esi edi bl bh sil dil
.B1.216:                        ; Preds .B1.53
        or        edx, eax                                      ;701.19
        jne       .B1.103       ; Prob 38%                      ;701.19
                                ; LOE rbx rsi rdi ebx esi edi bl bh sil dil
.B1.54:                         ; Preds .B1.53 .B1.216
        mov       eax, DWORD PTR [8+esp]                        ;695.8
        sub       eax, DWORD PTR [608+esp]                      ;695.8
        mov       edx, DWORD PTR [12+esp]                       ;695.8
        sbb       edx, edi                                      ;695.8
        add       eax, 1                                        ;695.8
        mov       DWORD PTR [324+esp], eax                      ;695.8
        lea       eax, DWORD PTR [280+esp]                      ;711.13
        adc       edx, 0                                        ;695.8
        mov       DWORD PTR [596+esp], edx                      ;695.8
        push      eax                                           ;711.13
        call      DWORD PTR [__imp__GetSystemInfo@4]            ;711.13
                                ; LOE rbx rsi rdi ebx esi edi bl bh sil dil
.B1.55:                         ; Preds .B1.54
        mov       eax, DWORD PTR [300+esp]                      ;711.13
        cdq                                                     ;711.13
        mov       DWORD PTR [644+esp], eax                      ;711.13
        sub       eax, DWORD PTR [24+esp]                       ;713.3
        mov       eax, edx                                      ;713.3
        sbb       eax, DWORD PTR [652+esp]                      ;713.3
        jae       .B1.57        ; Prob 50%                      ;713.3
                                ; LOE rbx rsi rdi edx ebx esi edi bl bh sil dil
.B1.56:                         ; Preds .B1.55
        mov       DWORD PTR [652+esp], edx                      ;713.3
        jmp       .B1.58        ; Prob 100%                     ;713.3
                                ; LOE rbx rsi rdi ebx esi edi bl bh sil dil
.B1.57:                         ; Preds .B1.55
        mov       eax, DWORD PTR [24+esp]                       ;713.3
        mov       DWORD PTR [644+esp], eax                      ;713.3
                                ; LOE rbx rsi rdi ebx esi edi bl bh sil dil
.B1.58:                         ; Preds .B1.56 .B1.57
        mov       eax, DWORD PTR [644+esp]                      ;717.3
        sub       eax, DWORD PTR [324+esp]                      ;717.3
        mov       edx, DWORD PTR [652+esp]                      ;717.3
        sbb       edx, DWORD PTR [596+esp]                      ;717.3
        jb        .B1.61        ; Prob 50%                      ;717.3
                                ; LOE rbx rsi rdi ebx esi edi bl bh sil dil
.B1.60:                         ; Preds .B1.58
        mov       eax, DWORD PTR [324+esp]                      ;717.3
        mov       edx, DWORD PTR [596+esp]                      ;717.3
        mov       DWORD PTR [644+esp], eax                      ;717.3
        mov       DWORD PTR [652+esp], edx                      ;717.3
                                ; LOE rbx rsi rdi ebx esi edi bl bh sil dil
.B1.61:                         ; Preds .B1.58 .B1.60
        push      DWORD PTR [652+esp]                           ;721.29
        push      DWORD PTR [648+esp]                           ;721.29
        push      DWORD PTR [604+esp]                           ;721.29
        push      DWORD PTR [336+esp]                           ;721.29
        call      __aulldiv                                     ;721.29
                                ; LOE rbx rsi rdi eax edx ebx esi edi bl bh sil dil
.B1.241:                        ; Preds .B1.61
        mov       DWORD PTR [4+esp], eax                        ;721.29
        lea       eax, DWORD PTR [328+esp]                      ;724.3
        mov       DWORD PTR [esp], edx                          ;721.29
        push      eax                                           ;724.3
        call      __time64                                      ;724.3
                                ; LOE rbx rsi rdi ebx esi edi bl bh sil dil
.B1.62:                         ; Preds .B1.241
        lea       eax, DWORD PTR [332+esp]                      ;725.14
        push      eax                                           ;725.14
        call      __localtime64                                 ;725.14
                                ; LOE rbx rsi rdi eax ebx esi edi bl bh sil dil
.B1.243:                        ; Preds .B1.62
        push      eax                                           ;728.42
        call      _asctime                                      ;728.42
                                ; LOE rbx rsi rdi eax ebx esi edi bl bh sil dil
.B1.63:                         ; Preds .B1.243
        push      eax                                           ;728.3
        push      OFFSET FLAT: ??_C@_0BF@A@?5?5?$FL?5starting?5on?5?3?5?$CFs?$AA@ ;728.3
        call      _printf                                       ;728.3
                                ; LOE rbx rsi rdi ebx esi edi bl bh sil dil
.B1.64:                         ; Preds .B1.63
        lea       eax, DWORD PTR [692+esp]                      ;729.3
        push      eax                                           ;729.3
        push      OFFSET FLAT: ??_C@_0BI@A@?5?5?$FL?5start?5pwd?5?5?5?3?5?$CC?$CFs?$CC?6?$AA@ ;729.3
        call      _printf                                       ;729.3
                                ; LOE rbx rsi rdi ebx esi edi bl bh sil dil
.B1.65:                         ; Preds .B1.64
        lea       eax, DWORD PTR [684+esp]                      ;730.3
        push      eax                                           ;730.3
        push      OFFSET FLAT: ??_C@_0BI@A@?5?5?$FL?5end?5pwd?5?5?5?5?5?3?5?$CC?$CFs?$CC?6?$AA@ ;730.3
        call      _printf                                       ;730.3
                                ; LOE rbx rsi rdi ebx esi edi bl bh sil dil
.B1.66:                         ; Preds .B1.65
        lea       eax, DWORD PTR [372+esp]                      ;731.3
        push      eax                                           ;731.3
        push      OFFSET FLAT: ??_C@_0BI@A@?5?5?$FL?5alphabet?5?5?5?5?3?5?$CC?$CFs?$CC?6?$AA@ ;731.3
        call      _printf                                       ;731.3
                                ; LOE rbx rsi rdi ebx esi edi bl bh sil dil
.B1.67:                         ; Preds .B1.66
        push      DWORD PTR [640+esp]                           ;732.3
        push      DWORD PTR [372+esp]                           ;732.3
        push      OFFSET FLAT: ??_C@_0BJ@A@?5?5?$FL?5total?5pwd?5?5?5?3?5?$CFI64u?6?$AA@ ;732.3
        call      _printf                                       ;732.3
                                ; LOE rbx rsi rdi ebx esi edi bl bh sil dil
.B1.68:                         ; Preds .B1.67
        push      DWORD PTR [56+esp]                            ;733.3
        push      DWORD PTR [64+esp]                            ;733.3
        push      OFFSET FLAT: ??_C@_0BJ@A@?5?5?$FL?5thread?5cbn?5?5?3?5?$CFI64u?6?$AA@ ;733.3
        call      _printf                                       ;733.3
                                ; LOE rbx rsi rdi ebx esi edi bl bh sil dil
.B1.69:                         ; Preds .B1.68
        push      DWORD PTR [720+esp]                           ;734.3
        push      DWORD PTR [716+esp]                           ;734.3
        push      OFFSET FLAT: ??_C@_0BK@A@?5?5?$FL?5thread?5cnt?5?5?3?5?$CFI64u?6?6?$AA@ ;734.3
        call      _printf                                       ;734.3
                                ; LOE rbx rsi rdi ebx esi edi bl bh sil dil
.B1.244:                        ; Preds .B1.69
        add       esp, 80                                       ;734.3
                                ; LOE rbx rsi rdi ebx esi edi bl bh sil dil
.B1.70:                         ; Preds .B1.244
        add       DWORD PTR [608+esp], -1                       ;707.3
        mov       edx, DWORD PTR [652+esp]                      ;738.15
        adc       edi, -1                                       ;707.3
        xor       eax, eax                                      ;707.3
        sub       edx, eax                                      ;738.15
        jb        .B1.80        ; Prob 10%                      ;738.15
                                ; LOE rbx rsi edx ebx esi edi bl bh sil
.B1.217:                        ; Preds .B1.70
        or        edx, DWORD PTR [644+esp]                      ;738.15
        je        .B1.80        ; Prob 10%                      ;738.15
                                ; LOE rbx rsi ebx esi edi bl bh sil
.B1.71:                         ; Preds .B1.217
        xor       edx, edx                                      ;738.8
        add       DWORD PTR [8+esp], -1                         ;752.36
        pxor      xmm2, xmm2                                    ;
        adc       DWORD PTR [12+esp], -1                        ;752.36
        mov       DWORD PTR [16+esp], edx                       ;
        mov       DWORD PTR [604+esp], edx                      ;
        mov       DWORD PTR [600+esp], ebx                      ;
        mov       ebx, edx                                      ;
        mov       DWORD PTR [320+esp], esi                      ;
                                ; LOE ebx edi xmm2
.B1.72:                         ; Preds .B1.78 .B1.71
        mov       edx, 384                                      ;740.5
        lea       esi, DWORD PTR [_t_blk+ebx]                   ;740.5
                                ; LOE edx ebx esi edi xmm2
.B1.215:                        ; Preds .B1.215 .B1.72
        movups    XMMWORD PTR [esi+edx], xmm2                   ;740.5
        movups    XMMWORD PTR [-16+esi+edx], xmm2               ;740.5
        movups    XMMWORD PTR [-32+esi+edx], xmm2               ;740.5
        movups    XMMWORD PTR [-48+esi+edx], xmm2               ;740.5
        sub       edx, 64                                       ;740.5
        jne       .B1.215       ; Prob 83%                      ;740.5
                                ; LOE edx ebx esi edi xmm2
.B1.214:                        ; Preds .B1.215
        movups    XMMWORD PTR [esi], xmm2                       ;740.5
                                ; LOE ebx esi edi xmm2
.B1.73:                         ; Preds .B1.214
        mov       edx, DWORD PTR [316+esp]                      ;742.5
        lea       eax, DWORD PTR [_t_blk+ebx]                   ;748.5
        mov       DWORD PTR [_t_blk+264+ebx], edx               ;742.5
        mov       edx, DWORD PTR [600+esp]                      ;743.5
        mov       DWORD PTR [_t_blk+268+ebx], edx               ;743.5
        mov       ecx, DWORD PTR [20+esp]                       ;745.5
        mov       edx, DWORD PTR [320+esp]                      ;746.5
        mov       DWORD PTR [_t_blk+272+ebx], ecx               ;745.5
        mov       ecx, 256                                      ;748.5
        mov       DWORD PTR [_t_blk+276+ebx], edx               ;746.5
        lea       edx, DWORD PTR [336+esp]                      ;748.5
        call      ___intel_sse4_strncat                         ;748.5
                                ; LOE ebx esi edi xmm2
.B1.74:                         ; Preds .B1.73
        mov       edx, DWORD PTR [608+esp]                      ;750.5
        mov       DWORD PTR [_t_blk+368+ebx], edx               ;750.5
        mov       edx, DWORD PTR [604+esp]                      ;751.12
        add       edx, 1                                        ;751.12
        mov       ecx, DWORD PTR [16+esp]                       ;751.12
        adc       ecx, 0                                        ;751.12
        neg       edx                                           ;751.18
        neg       ecx                                           ;751.18
        add       edx, DWORD PTR [644+esp]                      ;751.18
        add       ecx, DWORD PTR [652+esp]                      ;751.18
        mov       DWORD PTR [_t_blk+372+ebx], edi               ;750.5
        or        edx, ecx                                      ;751.18
        jne       .B1.76        ; Prob 50%                      ;751.18
                                ; LOE ebx esi edi xmm2
.B1.75:                         ; Preds .B1.74
        mov       edx, DWORD PTR [8+esp]                        ;752.7
        mov       edi, DWORD PTR [12+esp]                       ;752.7
        mov       DWORD PTR [608+esp], edx                      ;752.7
        mov       DWORD PTR [_t_blk+376+ebx], edx               ;752.7
        mov       DWORD PTR [_t_blk+380+ebx], edi               ;752.7
        jmp       .B1.77        ; Prob 100%                     ;752.7
                                ; LOE ebx esi edi xmm2
.B1.76:                         ; Preds .B1.74
        mov       edx, DWORD PTR [608+esp]                      ;754.34
        add       edx, DWORD PTR [4+esp]                        ;754.34
        mov       DWORD PTR [608+esp], edx                      ;754.34
        adc       edi, DWORD PTR [esp]                          ;754.34
        mov       DWORD PTR [_t_blk+376+ebx], edx               ;754.7
        mov       DWORD PTR [_t_blk+380+ebx], edi               ;754.7
                                ; LOE ebx esi edi xmm2
.B1.77:                         ; Preds .B1.75 .B1.76
        xor       edx, edx                                      ;766.17
        push      edx                                           ;766.17
        push      edx                                           ;766.17
        push      esi                                           ;766.17
        push      OFFSET FLAT: _crack_thread                    ;766.17
        push      edx                                           ;766.17
        push      edx                                           ;766.17
        mov       ecx, DWORD PTR [632+esp]                      ;756.27
        sub       ecx, DWORD PTR [_t_blk+368+ebx]               ;756.27
        mov       DWORD PTR [_t_blk+384+ebx], ecx               ;756.5
        sbb       edi, DWORD PTR [_t_blk+372+ebx]               ;756.27
        mov       DWORD PTR [_t_blk+388+ebx], edi               ;756.5
        call      DWORD PTR [__imp__CreateThread@24]            ;766.17
                                ; LOE eax ebx
.B1.245:                        ; Preds .B1.77
        mov       edx, eax                                      ;766.17
        pxor      xmm2, xmm2                                    ;
                                ; LOE edx ebx xmm2
.B1.78:                         ; Preds .B1.245
        mov       eax, DWORD PTR [604+esp]                      ;766.5
        mov       ecx, DWORD PTR [_t_blk+376+ebx]               ;771.11
        add       ecx, 1                                        ;771.30
        mov       DWORD PTR [24+esp+eax*4], edx                 ;766.5
        mov       edi, DWORD PTR [_t_blk+380+ebx]               ;771.11
        adc       edi, 0                                        ;771.30
        add       eax, 1                                        ;738.27
        mov       DWORD PTR [604+esp], eax                      ;738.27
        add       ebx, 400                                      ;738.27
        cdq                                                     ;738.13
        sub       eax, DWORD PTR [644+esp]                      ;738.15
        mov       DWORD PTR [16+esp], edx                       ;738.13
        mov       DWORD PTR [608+esp], ecx                      ;771.30
        sbb       edx, DWORD PTR [652+esp]                      ;738.15
        jb        .B1.72        ; Prob 82%                      ;738.15
                                ; LOE ebx edi xmm2
.B1.80:                         ; Preds .B1.78 .B1.70 .B1.217
        push      0                                             ;774.16
        call      __time64                                      ;774.16
                                ; LOE eax edx
.B1.246:                        ; Preds .B1.80
        add       esp, 4                                        ;774.16
                                ; LOE eax edx
.B1.81:                         ; Preds .B1.246
        mov       DWORD PTR [_start_time], eax                  ;774.3
        xor       eax, eax                                      ;776.42
        mov       DWORD PTR [_start_time+4], edx                ;774.3
        mov       edx, DWORD PTR [652+esp]                      ;776.42
        sub       edx, eax                                      ;776.42
        jb        .B1.99        ; Prob 10%                      ;776.42
                                ; LOE edx
.B1.218:                        ; Preds .B1.81
        or        edx, DWORD PTR [644+esp]                      ;776.42
        je        .B1.99        ; Prob 10%                      ;776.42
                                ; LOE
.B1.82:                         ; Preds .B1.218
        mov       ebx, DWORD PTR [644+esp]                      ;791.25
        movss     xmm0, DWORD PTR [_2il0floatpacket.8]          ;785.9
        movss     DWORD PTR [640+esp], xmm0                     ;785.9
        mov       DWORD PTR [664+esp], ebx                      ;785.9
                                ; LOE
.B1.83:                         ; Preds .B1.219 .B1.82
        push      3000                                          ;778.7
        push      0                                             ;778.7
        lea       eax, DWORD PTR [32+esp]                       ;778.7
        push      eax                                           ;778.7
        push      DWORD PTR [656+esp]                           ;778.7
        call      DWORD PTR [__imp__WaitForMultipleObjects@16]  ;778.7
                                ; LOE eax
.B1.247:                        ; Preds .B1.83
        mov       ebx, eax                                      ;778.7
                                ; LOE ebx
.B1.84:                         ; Preds .B1.247
        mov       eax, ebx                                      ;780.9
        mov       ecx, ebx                                      ;780.13
        cdq                                                     ;780.9
        sub       ecx, DWORD PTR [644+esp]                      ;780.13
        sbb       edx, DWORD PTR [652+esp]                      ;780.13
        jb        .B1.128       ; Prob 7%                       ;780.13
                                ; LOE ebx
.B1.85:                         ; Preds .B1.84
        push      0                                             ;791.7
        call      __time64                                      ;791.7
                                ; LOE eax edx
.B1.248:                        ; Preds .B1.85
        add       esp, 4                                        ;791.7
                                ; LOE eax edx
.B1.86:                         ; Preds .B1.248
        sub       eax, DWORD PTR [_start_time]                  ;791.7
        mov       ecx, eax                                      ;791.7
        sbb       edx, DWORD PTR [_start_time+4]                ;791.7
        or        ecx, edx                                      ;791.7
        je        .B1.97        ; Prob 28%                      ;791.7
                                ; LOE eax edx
.B1.87:                         ; Preds .B1.86
        cmp       DWORD PTR [664+esp], 0                        ;791.7
        jbe       .B1.97        ; Prob 10%                      ;791.7
                                ; LOE eax edx
.B1.88:                         ; Preds .B1.87
        xor       ebx, ebx                                      ;791.7
        mov       ecx, OFFSET FLAT: _t_blk+392                  ;
        xor       esi, esi                                      ;791.7
        mov       DWORD PTR [320+esp], esi                      ;
        xor       edi, edi                                      ;791.7
        mov       DWORD PTR [668+esp], ebx                      ;
        mov       esi, ecx                                      ;
        mov       DWORD PTR [316+esp], edx                      ;
        mov       DWORD PTR [20+esp], eax                       ;
                                ; LOE esi edi
.B1.89:                         ; Preds .B1.90 .B1.88
        xor       ebx, ebx                                      ;791.7
        mov       eax, -1                                       ;791.7
        xor       ecx, ecx                                      ;791.7
        mov       edx, eax                                      ;791.7
        lock      
        cmpxchg8b QWORD PTR [esi]                               ;791.7
                                ; LOE eax edx esi edi
.B1.90:                         ; Preds .B1.89
        add       DWORD PTR [668+esp], eax                      ;791.7
        adc       DWORD PTR [320+esp], edx                      ;791.7
        inc       edi                                           ;791.7
        add       esi, 400                                      ;791.7
        cmp       edi, DWORD PTR [664+esp]                      ;791.7
        jb        .B1.89        ; Prob 82%                      ;791.7
                                ; LOE esi edi
.B1.91:                         ; Preds .B1.90
        mov       ebx, DWORD PTR [668+esp]                      ;
        mov       ecx, ebx                                      ;791.7
        mov       esi, DWORD PTR [320+esp]                      ;
        or        ecx, esi                                      ;791.7
        mov       edx, DWORD PTR [316+esp]                      ;
        mov       eax, DWORD PTR [20+esp]                       ;
        je        .B1.97        ; Prob 28%                      ;791.7
                                ; LOE rax rdx rbx rsi eax edx ebx esi al dl bl ah dh bh sil
.B1.92:                         ; Preds .B1.91
        push      edx                                           ;791.7
        push      eax                                           ;791.7
        push      esi                                           ;791.7
        push      ebx                                           ;791.7
        call      __aulldiv                                     ;791.7
                                ; LOE rbx rsi eax edx ebx esi bl bh sil
.B1.251:                        ; Preds .B1.92
        mov       DWORD PTR [4+esp], eax                        ;791.7
        mov       DWORD PTR [esp], edx                          ;791.7
        push      edx                                           ;791.7
        push      eax                                           ;791.7
        mov       edi, DWORD PTR [332+esp]                      ;791.37
        sub       edi, ebx                                      ;791.37
        mov       ecx, DWORD PTR [604+esp]                      ;791.37
        sbb       ecx, esi                                      ;791.37
        push      ecx                                           ;791.7
        push      edi                                           ;791.7
        call      __aulldiv                                     ;791.7
                                ; LOE rbx rsi eax ebx esi bl bh sil
.B1.250:                        ; Preds .B1.251
        mov       DWORD PTR [16+esp], eax                       ;791.7
        cmp       eax, 60                                       ;791.7
        jb        .B1.95        ; Prob 38%                      ;791.7
                                ; LOE rbx rsi ebx esi bl bh sil
.B1.93:                         ; Preds .B1.250
        mov       eax, -2004318071                              ;791.7
        mov       ecx, DWORD PTR [16+esp]                       ;791.7
        mul       ecx                                           ;791.7
        shr       edx, 5                                        ;791.7
        mov       eax, edx                                      ;791.7
        shl       eax, 6                                        ;791.7
        mov       DWORD PTR [8+esp], edx                        ;791.7
        lea       edi, DWORD PTR [edx*4]                        ;791.7
        sub       eax, edi                                      ;791.7
        sub       ecx, eax                                      ;791.7
        mov       DWORD PTR [16+esp], ecx                       ;791.7
        cmp       edx, 60                                       ;791.7
        jae       .B1.125       ; Prob 0%                       ;791.7
                                ; LOE rdx rbx rsi edx ebx esi dl bl dh bh sil
.B1.94:                         ; Preds .B1.93
        xor       edx, edx                                      ;791.7
        xor       edi, edi                                      ;791.7
        mov       DWORD PTR [12+esp], edi                       ;791.7
        jmp       .B1.96        ; Prob 100%                     ;791.7
                                ; LOE rbx rsi ebx esi edi bl bh sil
.B1.95:                         ; Preds .B1.250
        xor       edx, edx                                      ;791.7
        xor       edi, edi                                      ;791.7
        mov       DWORD PTR [12+esp], edi                       ;791.7
        mov       DWORD PTR [8+esp], edi                        ;791.7
                                ; LOE rbx rsi ebx esi edi bl bh sil
.B1.96:                         ; Preds .B1.126 .B1.127 .B1.94 .B1.95
        add       esp, -52                                      ;791.7
        mov       DWORD PTR [esp], OFFSET FLAT: ??_C@_0HP@A@?$AN?5?5?$FL?5processed?5?$CFI64u?5keys?5out?5of?5?$CFI64i?5at?5?$CF?42fM?5k?1s?5?3?5?$CFI64u?$CF?$CF?5complete?4?5ETA?3?5?$CFu?5days?5?$CF02u?5hours?5?$CF02u?5minutes?5?$CF02u?5seconds?5?5?5?5?5?$AA@ ;791.7
        mov       DWORD PTR [4+esp], ebx                        ;791.7
        mov       DWORD PTR [8+esp], esi                        ;791.7
        mov       eax, DWORD PTR [376+esp]                      ;791.7
        mov       DWORD PTR [12+esp], eax                       ;791.7
        mov       ecx, DWORD PTR [648+esp]                      ;791.7
        mov       DWORD PTR [16+esp], ecx                       ;791.7
        mov       eax, DWORD PTR [56+esp]                       ;791.7
        mov       DWORD PTR [652+esp], eax                      ;791.7
        mov       eax, DWORD PTR [52+esp]                       ;791.7
        mov       DWORD PTR [656+esp], eax                      ;791.7
        fild      QWORD PTR [652+esp]                           ;791.7
        shr       eax, 31                                       ;791.7
        fadd      QWORD PTR [_2il0floatpacket.9+eax*8]          ;791.7
        fstp      DWORD PTR [660+esp]                           ;791.7
        movss     xmm0, DWORD PTR [660+esp]                     ;791.7
        mulss     xmm0, DWORD PTR [692+esp]                     ;791.7
        cvtss2sd  xmm0, xmm0                                    ;791.7
        movsd     QWORD PTR [20+esp], xmm0                      ;791.7
        push      esi                                           ;791.7
        push      ebx                                           ;791.7
        push      0                                             ;791.7
        push      100                                           ;791.7
        call      __allmul                                      ;791.7
                                ; LOE eax edx edi
.B1.254:                        ; Preds .B1.96
        push      DWORD PTR [648+esp]                           ;791.7
        push      DWORD PTR [380+esp]                           ;791.7
        push      edx                                           ;791.7
        push      eax                                           ;791.7
        call      __aulldiv                                     ;791.7
                                ; LOE eax edx edi
.B1.253:                        ; Preds .B1.254
        mov       DWORD PTR [28+esp], eax                       ;791.7
        mov       DWORD PTR [32+esp], edx                       ;791.7
        mov       DWORD PTR [36+esp], edi                       ;791.7
        mov       ecx, DWORD PTR [64+esp]                       ;791.7
        mov       DWORD PTR [40+esp], ecx                       ;791.7
        mov       ebx, DWORD PTR [60+esp]                       ;791.7
        mov       DWORD PTR [44+esp], ebx                       ;791.7
        mov       esi, DWORD PTR [68+esp]                       ;791.7
        mov       DWORD PTR [48+esp], esi                       ;791.7
        call      _printf                                       ;791.7
                                ; LOE
.B1.252:                        ; Preds .B1.253
        add       esp, 52                                       ;791.7
                                ; LOE
.B1.97:                         ; Preds .B1.87 .B1.129 .B1.252 .B1.91 .B1.86
                                ;      
        xor       eax, eax                                      ;776.42
        mov       edx, DWORD PTR [652+esp]                      ;776.42
        sub       edx, eax                                      ;776.42
        jb        .B1.99        ; Prob 18%                      ;776.42
                                ; LOE edx
.B1.219:                        ; Preds .B1.97
        or        edx, DWORD PTR [644+esp]                      ;776.42
        jne       .B1.83        ; Prob 82%                      ;776.42
                                ; LOE
.B1.99:                         ; Preds .B1.219 .B1.97 .B1.81 .B1.270 .B1.218
                                ;      
        lea       eax, DWORD PTR [328+esp]                      ;796.3
        push      eax                                           ;796.3
        call      __time64                                      ;796.3
                                ; LOE
.B1.100:                        ; Preds .B1.99
        lea       eax, DWORD PTR [332+esp]                      ;797.14
        push      eax                                           ;797.14
        call      __localtime64                                 ;797.14
                                ; LOE eax
.B1.256:                        ; Preds .B1.100
        push      eax                                           ;798.37
        call      _asctime                                      ;798.37
                                ; LOE eax
.B1.101:                        ; Preds .B1.256
        push      eax                                           ;798.3
        push      OFFSET FLAT: ??_C@_0BG@A@?6?5?5?$FL?5ending?5on?5?5?5?3?5?$CFs?$AA@ ;798.3
        call      _printf                                       ;798.3
                                ; LOE
.B1.102:                        ; Preds .B1.101
        xor       eax, eax                                      ;800.10
        add       esp, 776                                      ;800.10
        pop       ebx                                           ;800.10
        pop       edi                                           ;800.10
        pop       esi                                           ;800.10
        mov       esp, ebp                                      ;800.10
        pop       ebp                                           ;800.10
        ret                                                     ;800.10
                                ; LOE
.B1.103:                        ; Preds .B1.216
        push      OFFSET FLAT: il0_peep_printf_format_1         ;702.5
        call      _puts                                         ;702.5
                                ; LOE
.B1.104:                        ; Preds .B1.103
        xor       eax, eax                                      ;703.12
        add       esp, 760                                      ;703.12
        pop       ebx                                           ;703.12
        pop       edi                                           ;703.12
        pop       esi                                           ;703.12
        mov       esp, ebp                                      ;703.12
        pop       ebp                                           ;703.12
        ret                                                     ;703.12
                                ; LOE
.B1.105:                        ; Preds .B1.238 .B1.52 .B1.237
        push      OFFSET FLAT: il0_peep_printf_format_2         ;696.5
        call      _puts                                         ;696.5
                                ; LOE
.B1.106:                        ; Preds .B1.105
        xor       eax, eax                                      ;697.12
        add       esp, 760                                      ;697.12
        pop       ebx                                           ;697.12
        pop       edi                                           ;697.12
        pop       esi                                           ;697.12
        mov       esp, ebp                                      ;697.12
        pop       ebp                                           ;697.12
        ret                                                     ;697.12
                                ; LOE
.B1.107:                        ; Preds .B1.29
        push      OFFSET FLAT: il0_peep_printf_format_4         ;650.9
        call      _puts                                         ;650.9
                                ; LOE
.B1.108:                        ; Preds .B1.107
        push      OFFSET FLAT: il0_peep_printf_format_5         ;651.9
        call      _puts                                         ;651.9
                                ; LOE
.B1.109:                        ; Preds .B1.108
        push      OFFSET FLAT: il0_peep_printf_format_6         ;651.9
        call      _puts                                         ;651.9
                                ; LOE
.B1.110:                        ; Preds .B1.109
        push      OFFSET FLAT: il0_peep_printf_format_7         ;651.9
        call      _puts                                         ;651.9
                                ; LOE
.B1.111:                        ; Preds .B1.110
        push      OFFSET FLAT: il0_peep_printf_format_8         ;651.9
        call      _puts                                         ;651.9
                                ; LOE
.B1.112:                        ; Preds .B1.111
        push      OFFSET FLAT: il0_peep_printf_format_9         ;651.9
        call      _puts                                         ;651.9
                                ; LOE
.B1.113:                        ; Preds .B1.120 .B1.112
        push      64                                            ;651.9
        push      OFFSET FLAT: ??_C@_0EB@A@?5?5?5?5?5?5?5?9t?5?$DMthreads?$DO?5?5?5number?5of?5threads?5?$CIshould?5not?5exceed?5?$CFi?$CJ?6?6?$AA@ ;651.9
        call      _printf                                       ;651.9
                                ; LOE
.B1.260:                        ; Preds .B1.113
        add       esp, 32                                       ;651.9
                                ; LOE
.B1.114:                        ; Preds .B1.275 .B1.260
        push      1                                             ;651.9
        call      _exit                                         ;651.9
                                ; LOE
.B1.115:                        ; Preds .B1.228
        push      OFFSET FLAT: il0_peep_printf_format_10        ;646.9
        call      _puts                                         ;646.9
                                ; LOE
.B1.116:                        ; Preds .B1.115
        push      OFFSET FLAT: il0_peep_printf_format_11        ;647.9
        call      _puts                                         ;647.9
                                ; LOE
.B1.117:                        ; Preds .B1.116
        push      OFFSET FLAT: il0_peep_printf_format_12        ;647.9
        call      _puts                                         ;647.9
                                ; LOE
.B1.118:                        ; Preds .B1.117
        push      OFFSET FLAT: il0_peep_printf_format_13        ;647.9
        call      _puts                                         ;647.9
                                ; LOE
.B1.119:                        ; Preds .B1.118
        push      OFFSET FLAT: il0_peep_printf_format_14        ;647.9
        call      _puts                                         ;647.9
                                ; LOE
.B1.120:                        ; Preds .B1.119
        push      OFFSET FLAT: il0_peep_printf_format_15        ;647.9
        call      _puts                                         ;647.9
        jmp       .B1.113       ; Prob 100%                     ;647.9
                                ; LOE
.B1.123:                        ; Preds .B1.227
        push      OFFSET FLAT: il0_peep_printf_format_16        ;641.7
        call      _puts                                         ;641.7
                                ; LOE
.B1.262:                        ; Preds .B1.123
        add       esp, 4                                        ;641.7
                                ; LOE
.B1.124:                        ; Preds .B1.5 .B1.262
        call      _usage                                        ;642.7
                                ; LOE
.B1.125:                        ; Preds .B1.93                  ; Infreq
        mov       eax, -2004318071                              ;791.7
        mov       ecx, edx                                      ;791.7
        mul       ecx                                           ;791.7
        shr       edx, 5                                        ;791.7
        mov       eax, edx                                      ;791.7
        shl       eax, 6                                        ;791.7
        mov       DWORD PTR [12+esp], edx                       ;791.7
        lea       edi, DWORD PTR [edx*4]                        ;791.7
        sub       eax, edi                                      ;791.7
        sub       ecx, eax                                      ;791.7
        mov       DWORD PTR [8+esp], ecx                        ;791.7
        cmp       edx, 24                                       ;791.7
        jb        .B1.127       ; Prob 38%                      ;791.7
                                ; LOE rdx rbx rsi edx ebx esi dl bl dh bh sil
.B1.126:                        ; Preds .B1.125                 ; Infreq
        mov       eax, -1431655765                              ;791.7
        mov       ecx, edx                                      ;791.7
        mul       ecx                                           ;791.7
        mov       edi, edx                                      ;791.7
        shr       edi, 4                                        ;791.7
        lea       eax, DWORD PTR [edi+edi*2]                    ;791.7
        shl       eax, 3                                        ;791.7
        sub       ecx, eax                                      ;791.7
        mov       DWORD PTR [12+esp], ecx                       ;791.7
        jmp       .B1.96        ; Prob 100%                     ;791.7
                                ; LOE rbx rsi ebx esi edi bl bh sil
.B1.127:                        ; Preds .B1.125                 ; Infreq
        xor       edx, edx                                      ;791.7
        xor       edi, edi                                      ;791.7
        jmp       .B1.96        ; Prob 100%                     ;791.7
                                ; LOE rbx rsi ebx esi edi bl bh sil
.B1.128:                        ; Preds .B1.84                  ; Infreq
        push      OFFSET FLAT: found.15401.1.1                  ;783.7
        push      DWORD PTR [28+esp+ebx*4]                      ;783.7
        add       DWORD PTR [652+esp], -1                       ;781.7
        adc       DWORD PTR [660+esp], -1                       ;781.7
        call      DWORD PTR [__imp__GetExitCodeThread@8]        ;783.7
                                ; LOE ebx
.B1.129:                        ; Preds .B1.128                 ; Infreq
        cmp       DWORD PTR [found.15401.1.1], 0                ;784.11
        je        .B1.97        ; Prob 80%                      ;784.11
                                ; LOE ebx
.B1.130:                        ; Preds .B1.129                 ; Infreq
        mov       DWORD PTR [20+esp], ebx                       ;
        mov       ebx, DWORD PTR [664+esp]                      ;
        push      0                                             ;785.9
        call      __time64                                      ;785.9
                                ; LOE rbx eax edx ebx bl bh
.B1.263:                        ; Preds .B1.130                 ; Infreq
        add       esp, 4                                        ;785.9
                                ; LOE rbx eax edx ebx bl bh
.B1.131:                        ; Preds .B1.263                 ; Infreq
        sub       eax, DWORD PTR [_start_time]                  ;785.9
        mov       ecx, eax                                      ;785.9
        sbb       edx, DWORD PTR [_start_time+4]                ;785.9
        or        ecx, edx                                      ;785.9
        je        .B1.142       ; Prob 28%                      ;785.9
                                ; LOE rbx eax edx ebx bl bh
.B1.132:                        ; Preds .B1.131                 ; Infreq
        test      ebx, ebx                                      ;785.9
        jbe       .B1.142       ; Prob 10%                      ;785.9
                                ; LOE rbx eax edx ebx bl bh
.B1.133:                        ; Preds .B1.132                 ; Infreq
        xor       ecx, ecx                                      ;785.9
        mov       esi, OFFSET FLAT: _t_blk+392                  ;
        mov       DWORD PTR [320+esp], ecx                      ;785.9
        xor       edi, edi                                      ;785.9
        mov       DWORD PTR [316+esp], ecx                      ;785.9
        mov       DWORD PTR [esp], edx                          ;
        mov       DWORD PTR [4+esp], eax                        ;
        mov       DWORD PTR [664+esp], ebx                      ;
                                ; LOE esi edi
.B1.134:                        ; Preds .B1.135 .B1.133         ; Infreq
        xor       ebx, ebx                                      ;785.9
        mov       eax, -1                                       ;785.9
        xor       ecx, ecx                                      ;785.9
        mov       edx, eax                                      ;785.9
        lock      
        cmpxchg8b QWORD PTR [esi]                               ;785.9
                                ; LOE eax edx esi edi
.B1.135:                        ; Preds .B1.134                 ; Infreq
        add       DWORD PTR [320+esp], eax                      ;785.9
        adc       DWORD PTR [316+esp], edx                      ;785.9
        inc       edi                                           ;785.9
        add       esi, 400                                      ;785.9
        cmp       edi, DWORD PTR [664+esp]                      ;785.9
        jb        .B1.134       ; Prob 82%                      ;785.9
                                ; LOE esi edi
.B1.136:                        ; Preds .B1.135                 ; Infreq
        mov       ecx, DWORD PTR [320+esp]                      ;785.9
        mov       edx, DWORD PTR [esp]                          ;
        mov       eax, DWORD PTR [4+esp]                        ;
        or        ecx, DWORD PTR [316+esp]                      ;785.9
        je        .B1.142       ; Prob 28%                      ;785.9
                                ; LOE rax rdx eax edx al dl ah dh
.B1.137:                        ; Preds .B1.136                 ; Infreq
        push      edx                                           ;785.9
        push      eax                                           ;785.9
        push      DWORD PTR [324+esp]                           ;785.9
        push      DWORD PTR [332+esp]                           ;785.9
        call      __aulldiv                                     ;785.9
                                ; LOE eax edx
.B1.266:                        ; Preds .B1.137                 ; Infreq
        mov       DWORD PTR [esp], eax                          ;785.9
        mov       DWORD PTR [8+esp], edx                        ;785.9
        push      edx                                           ;785.9
        push      eax                                           ;785.9
        mov       ebx, DWORD PTR [332+esp]                      ;785.39
        sub       ebx, DWORD PTR [328+esp]                      ;785.39
        mov       ecx, DWORD PTR [604+esp]                      ;785.39
        sbb       ecx, DWORD PTR [324+esp]                      ;785.39
        push      ecx                                           ;785.9
        push      ebx                                           ;785.9
        call      __aulldiv                                     ;785.9
                                ; LOE eax
.B1.265:                        ; Preds .B1.266                 ; Infreq
        mov       DWORD PTR [12+esp], eax                       ;785.9
        cmp       eax, 60                                       ;785.9
        jb        .B1.140       ; Prob 38%                      ;785.9
                                ; LOE
.B1.138:                        ; Preds .B1.265                 ; Infreq
        mov       eax, -2004318071                              ;785.9
        mov       esi, DWORD PTR [12+esp]                       ;785.9
        mul       esi                                           ;785.9
        shr       edx, 5                                        ;785.9
        mov       ebx, edx                                      ;785.9
        shl       ebx, 6                                        ;785.9
        mov       DWORD PTR [4+esp], edx                        ;785.9
        lea       ecx, DWORD PTR [edx*4]                        ;785.9
        sub       ebx, ecx                                      ;785.9
        sub       esi, ebx                                      ;785.9
        mov       DWORD PTR [12+esp], esi                       ;785.9
        cmp       edx, 60                                       ;785.9
        jae       .B1.143       ; Prob 0%                       ;785.9
                                ; LOE rdx edx dl dh
.B1.139:                        ; Preds .B1.138                 ; Infreq
        xor       ebx, ebx                                      ;785.9
        mov       DWORD PTR [16+esp], ebx                       ;785.9
        jmp       .B1.141       ; Prob 100%                     ;785.9
                                ; LOE ebx
.B1.140:                        ; Preds .B1.265                 ; Infreq
        xor       ebx, ebx                                      ;785.9
        mov       DWORD PTR [16+esp], ebx                       ;785.9
        mov       DWORD PTR [4+esp], ebx                        ;785.9
                                ; LOE ebx
.B1.141:                        ; Preds .B1.144 .B1.145 .B1.139 .B1.140 ; Infreq
        add       esp, -52                                      ;785.9
        mov       DWORD PTR [esp], OFFSET FLAT: ??_C@_0HP@A@?$AN?5?5?$FL?5processed?5?$CFI64u?5keys?5out?5of?5?$CFI64i?5at?5?$CF?42fM?5k?1s?5?3?5?$CFI64u?$CF?$CF?5complete?4?5ETA?3?5?$CFu?5days?5?$CF02u?5hours?5?$CF02u?5minutes?5?$CF02u?5seconds?5?5?5?5?5?$AA@ ;785.9
        mov       edx, DWORD PTR [372+esp]                      ;785.9
        mov       DWORD PTR [4+esp], edx                        ;785.9
        mov       eax, DWORD PTR [368+esp]                      ;785.9
        mov       DWORD PTR [8+esp], eax                        ;785.9
        mov       ecx, DWORD PTR [376+esp]                      ;785.9
        mov       DWORD PTR [12+esp], ecx                       ;785.9
        mov       esi, DWORD PTR [648+esp]                      ;785.9
        mov       DWORD PTR [16+esp], esi                       ;785.9
        mov       edi, DWORD PTR [52+esp]                       ;785.9
        mov       ecx, DWORD PTR [60+esp]                       ;785.9
        mov       DWORD PTR [652+esp], edi                      ;785.9
        mov       DWORD PTR [656+esp], ecx                      ;785.9
        fild      QWORD PTR [652+esp]                           ;785.9
        shr       ecx, 31                                       ;785.9
        movss     xmm1, DWORD PTR [692+esp]                     ;785.9
        fadd      QWORD PTR [_2il0floatpacket.9+ecx*8]          ;785.9
        fstp      DWORD PTR [660+esp]                           ;785.9
        movss     xmm0, DWORD PTR [660+esp]                     ;785.9
        mulss     xmm1, xmm0                                    ;785.9
        cvtss2sd  xmm1, xmm1                                    ;785.9
        movsd     QWORD PTR [20+esp], xmm1                      ;785.9
        push      eax                                           ;785.9
        push      edx                                           ;785.9
        push      0                                             ;785.9
        push      100                                           ;785.9
        call      __allmul                                      ;785.9
                                ; LOE eax edx ebx
.B1.269:                        ; Preds .B1.141                 ; Infreq
        push      DWORD PTR [648+esp]                           ;785.9
        push      DWORD PTR [380+esp]                           ;785.9
        push      edx                                           ;785.9
        push      eax                                           ;785.9
        call      __aulldiv                                     ;785.9
                                ; LOE eax edx ebx
.B1.268:                        ; Preds .B1.269                 ; Infreq
        mov       DWORD PTR [28+esp], eax                       ;785.9
        mov       DWORD PTR [32+esp], edx                       ;785.9
        mov       DWORD PTR [36+esp], ebx                       ;785.9
        mov       ecx, DWORD PTR [68+esp]                       ;785.9
        mov       DWORD PTR [40+esp], ecx                       ;785.9
        mov       ebx, DWORD PTR [56+esp]                       ;785.9
        mov       DWORD PTR [44+esp], ebx                       ;785.9
        mov       esi, DWORD PTR [64+esp]                       ;785.9
        mov       DWORD PTR [48+esp], esi                       ;785.9
        call      _printf                                       ;785.9
                                ; LOE
.B1.267:                        ; Preds .B1.268                 ; Infreq
        add       esp, 52                                       ;785.9
                                ; LOE
.B1.142:                        ; Preds .B1.267 .B1.136 .B1.132 .B1.131 ; Infreq
        imul      eax, DWORD PTR [20+esp], 400                  ;786.9
        lea       edx, DWORD PTR [_t_blk+280+eax]               ;786.9
        push      edx                                           ;786.9
        push      OFFSET FLAT: ??_C@_0BJ@A@?6?5?5?$FL?5password?5?5?5?5?3?5?$CC?$CFs?$CC?6?$AA@ ;786.9
        call      _printf                                       ;786.9
                                ; LOE
.B1.270:                        ; Preds .B1.142                 ; Infreq
        add       esp, 8                                        ;786.9
        jmp       .B1.99        ; Prob 100%                     ;786.9
                                ; LOE
.B1.143:                        ; Preds .B1.138                 ; Infreq
        mov       eax, -2004318071                              ;785.9
        mov       esi, edx                                      ;785.9
        mul       esi                                           ;785.9
        shr       edx, 5                                        ;785.9
        mov       ebx, edx                                      ;785.9
        shl       ebx, 6                                        ;785.9
        mov       DWORD PTR [16+esp], edx                       ;785.9
        lea       ecx, DWORD PTR [edx*4]                        ;785.9
        sub       ebx, ecx                                      ;785.9
        sub       esi, ebx                                      ;785.9
        mov       DWORD PTR [4+esp], esi                        ;785.9
        cmp       edx, 24                                       ;785.9
        jb        .B1.145       ; Prob 38%                      ;785.9
                                ; LOE rdx edx dl dh
.B1.144:                        ; Preds .B1.143                 ; Infreq
        mov       eax, -1431655765                              ;785.9
        mov       esi, edx                                      ;785.9
        mul       esi                                           ;785.9
        mov       ebx, edx                                      ;785.9
        shr       ebx, 4                                        ;785.9
        lea       ecx, DWORD PTR [ebx+ebx*2]                    ;785.9
        shl       ecx, 3                                        ;785.9
        sub       esi, ecx                                      ;785.9
        mov       DWORD PTR [16+esp], esi                       ;785.9
        jmp       .B1.141       ; Prob 100%                     ;785.9
                                ; LOE ebx
.B1.145:                        ; Preds .B1.143                 ; Infreq
        xor       ebx, ebx                                      ;785.9
        jmp       .B1.141       ; Prob 100%                     ;785.9
                                ; LOE ebx
.B1.148:                        ; Preds .B1.24                  ; Infreq
        cmp       DWORD PTR [36+esp], 0                         ;658.13
        je        .B1.150       ; Prob 12%                      ;658.13
                                ; LOE ebx esi
.B1.149:                        ; Preds .B1.148                 ; Infreq
        mov       eax, 256                                      ;659.5
        lea       edx, DWORD PTR [336+esp]                      ;659.5
        mov       ecx, DWORD PTR [36+esp]                       ;659.5
        call      ___intel_ssse3_strncpy                        ;659.5
        jmp       .B1.33        ; Prob 100%                     ;659.5
                                ; LOE ebx esi
.B1.150:                        ; Preds .B1.148                 ; Infreq
        mov       ecx, 256                                      ;662.5
        lea       eax, DWORD PTR [336+esp]                      ;662.5
        mov       edx, DWORD PTR [_alphabets]                   ;662.5
        call      ___intel_sse4_strncat                         ;662.5
                                ; LOE ebx esi
.B1.151:                        ; Preds .B1.150                 ; Infreq
        lea       edx, DWORD PTR [336+esp]                      ;663.50
        mov       ecx, edx                                      ;663.50
        and       edx, -16                                      ;663.50
        pxor      xmm0, xmm0                                    ;663.50
        pcmpeqb   xmm0, XMMWORD PTR [edx]                       ;663.50
        pmovmskb  eax, xmm0                                     ;663.50
        and       ecx, 15                                       ;663.50
        shr       eax, cl                                       ;663.50
        bsf       eax, eax                                      ;663.50
        jne       L19           ; Prob 60%                      ;663.50
        mov       eax, edx                                      ;663.50
        add       edx, ecx                                      ;663.50
        call      ___intel_sse4_strlen                          ;663.50
L19:                                                            ;
                                ; LOE eax ebx esi
.B1.271:                        ; Preds .B1.151                 ; Infreq
        mov       ecx, eax                                      ;663.50
        lea       eax, DWORD PTR [336+esp]                      ;663.5
        neg       ecx                                           ;663.5
        add       ecx, 256                                      ;663.5
        mov       edx, DWORD PTR [_alphabets+4]                 ;663.5
        call      ___intel_sse4_strncat                         ;663.5
        jmp       .B1.33        ; Prob 100%                     ;663.5
                                ; LOE ebx esi
.B1.153:                        ; Preds .B1.11                  ; Infreq
        push      OFFSET FLAT: il0_peep_printf_format_17        ;610.5
        call      _puts                                         ;610.5
                                ; LOE
.B1.154:                        ; Preds .B1.153                 ; Infreq
        xor       eax, eax                                      ;611.12
        add       esp, 760                                      ;611.12
        pop       ebx                                           ;611.12
        pop       edi                                           ;611.12
        pop       esi                                           ;611.12
        mov       esp, ebp                                      ;611.12
        pop       ebp                                           ;611.12
        ret                                                     ;611.12
                                ; LOE
.B1.155:                        ; Preds .B1.8                   ; Infreq
        movsx     eax, BYTE PTR [1+ecx]                         ;573.11
        mov       DWORD PTR [esp], eax                          ;573.11
        lea       eax, DWORD PTR [-63+eax]                      ;574.7
        cmp       eax, 53                                       ;574.7
        ja        .B1.189       ; Prob 50%                      ;574.7
                                ; LOE eax edx ecx ebx esi edi
.B1.156:                        ; Preds .B1.155                 ; Infreq
        movzx     eax, BYTE PTR [.2.44_2.switchtab.72+eax]      ;574.7
        add       eax, OFFSET FLAT: ..1.16_0.TAG.074.1.1        ;574.7
        jmp       eax                                           ;574.7
                                ; LOE edx ecx ebx esi edi
..1.16_0.TAG.074.1.1::
.B1.158:                        ; Preds .B1.156                 ; Infreq
        mov       eax, esi                                      ;593.27
        cmp       BYTE PTR [2+ecx], 0                           ;593.27
        jne       .B1.161       ; Prob 28%                      ;593.27
                                ; LOE eax edx ecx ebx esi edi
.B1.159:                        ; Preds .B1.158                 ; Infreq
        inc       esi                                           ;593.27
        cmp       esi, DWORD PTR [8+ebp]                        ;593.27
        jge       .B1.198       ; Prob 11%                      ;593.27
                                ; LOE eax edx ebx esi edi
.B1.160:                        ; Preds .B1.159                 ; Infreq
        mov       ecx, DWORD PTR [4+edi+eax*4]                  ;593.27
        jmp       .B1.162       ; Prob 100%                     ;593.27
                                ; LOE ecx ebx esi edi
.B1.161:                        ; Preds .B1.158                 ; Infreq
        add       ecx, 2                                        ;593.27
                                ; LOE ecx ebx esi edi
.B1.162:                        ; Preds .B1.161 .B1.160         ; Infreq
        call      ___intel_sse4_atoi                            ;593.22
                                ; LOE eax ebx esi edi
.B1.273:                        ; Preds .B1.162                 ; Infreq
        cdq                                                     ;593.22
        mov       DWORD PTR [24+esp], eax                       ;593.22
        mov       DWORD PTR [652+esp], edx                      ;593.22
        jmp       .B1.10        ; Prob 100%                     ;593.22
                                ; LOE ebx esi edi
..1.16_0.TAG.073.1.1::
.B1.164:                        ; Preds .B1.156                 ; Infreq
        mov       eax, esi                                      ;589.17
        cmp       BYTE PTR [2+ecx], 0                           ;589.17
        jne       .B1.167       ; Prob 28%                      ;589.17
                                ; LOE eax edx ecx ebx esi edi
.B1.165:                        ; Preds .B1.164                 ; Infreq
        inc       esi                                           ;589.17
        cmp       esi, DWORD PTR [8+ebp]                        ;589.17
        jge       .B1.198       ; Prob 11%                      ;589.17
                                ; LOE eax edx ebx esi edi
.B1.166:                        ; Preds .B1.165                 ; Infreq
        mov       ecx, DWORD PTR [4+edi+eax*4]                  ;589.17
        mov       DWORD PTR [32+esp], ecx                       ;589.17
        jmp       .B1.10        ; Prob 100%                     ;589.17
                                ; LOE ebx esi edi
.B1.167:                        ; Preds .B1.164                 ; Infreq
        lea       ecx, DWORD PTR [2+ecx]                        ;589.17
        mov       DWORD PTR [32+esp], ecx                       ;589.17
        jmp       .B1.10        ; Prob 100%                     ;589.17
                                ; LOE ebx esi edi
..1.16_0.TAG.065.1.1::
.B1.171:                        ; Preds .B1.156                 ; Infreq
        mov       eax, esi                                      ;585.17
        cmp       BYTE PTR [2+ecx], 0                           ;585.17
        jne       .B1.174       ; Prob 28%                      ;585.17
                                ; LOE eax edx ecx ebx esi edi
.B1.172:                        ; Preds .B1.171                 ; Infreq
        inc       esi                                           ;585.17
        cmp       esi, DWORD PTR [8+ebp]                        ;585.17
        jge       .B1.198       ; Prob 11%                      ;585.17
                                ; LOE eax edx ebx esi edi
.B1.173:                        ; Preds .B1.172                 ; Infreq
        mov       ecx, DWORD PTR [4+edi+eax*4]                  ;585.17
        mov       DWORD PTR [28+esp], ecx                       ;585.17
        jmp       .B1.10        ; Prob 100%                     ;585.17
                                ; LOE ebx esi edi
.B1.174:                        ; Preds .B1.171                 ; Infreq
        lea       ecx, DWORD PTR [2+ecx]                        ;585.17
        mov       DWORD PTR [28+esp], ecx                       ;585.17
        jmp       .B1.10        ; Prob 100%                     ;585.17
                                ; LOE ebx esi edi
..1.16_0.TAG.063.1.1::
.B1.177:                        ; Preds .B1.156                 ; Infreq
        mov       eax, esi                                      ;581.16
        cmp       BYTE PTR [2+ecx], 0                           ;581.16
        jne       .B1.180       ; Prob 28%                      ;581.16
                                ; LOE eax edx ecx ebx esi edi
.B1.178:                        ; Preds .B1.177                 ; Infreq
        inc       esi                                           ;581.16
        cmp       esi, DWORD PTR [8+ebp]                        ;581.16
        jge       .B1.198       ; Prob 11%                      ;581.16
                                ; LOE eax edx ebx esi edi
.B1.179:                        ; Preds .B1.178                 ; Infreq
        mov       ecx, DWORD PTR [4+edi+eax*4]                  ;581.16
        mov       DWORD PTR [36+esp], ecx                       ;581.16
        jmp       .B1.10        ; Prob 100%                     ;581.16
                                ; LOE ebx esi edi
.B1.180:                        ; Preds .B1.177                 ; Infreq
        lea       ecx, DWORD PTR [2+ecx]                        ;581.16
        mov       DWORD PTR [36+esp], ecx                       ;581.16
        jmp       .B1.10        ; Prob 100%                     ;581.16
                                ; LOE ebx esi edi
..1.16_0.TAG.061.1.1::
.B1.183:                        ; Preds .B1.156                 ; Infreq
        mov       eax, esi                                      ;577.17
        cmp       BYTE PTR [2+ecx], 0                           ;577.17
        jne       .B1.186       ; Prob 28%                      ;577.17
                                ; LOE eax edx ecx ebx esi edi
.B1.184:                        ; Preds .B1.183                 ; Infreq
        inc       esi                                           ;577.17
        cmp       esi, DWORD PTR [8+ebp]                        ;577.17
        jge       .B1.198       ; Prob 11%                      ;577.17
                                ; LOE eax edx ebx esi edi
.B1.185:                        ; Preds .B1.184                 ; Infreq
        mov       ecx, DWORD PTR [4+edi+eax*4]                  ;577.17
        mov       DWORD PTR [40+esp], ecx                       ;577.17
        jmp       .B1.10        ; Prob 100%                     ;577.17
                                ; LOE ebx esi edi
.B1.186:                        ; Preds .B1.183                 ; Infreq
        lea       ecx, DWORD PTR [2+ecx]                        ;577.17
        mov       DWORD PTR [40+esp], ecx                       ;577.17
        jmp       .B1.10        ; Prob 100%                     ;577.17
                                ; LOE ebx esi edi
..1.16_0.TAG.DEFAULT.1.1::
.B1.189:                        ; Preds .B1.156 .B1.155         ; Infreq
        push      DWORD PTR [esp]                               ;600.11
        push      OFFSET FLAT: ??_C@_0BG@A@?5?5?$FL?5unknown?5option?5?$CFc?$AA@ ;600.11
        call      _printf                                       ;600.11
                                ; LOE ebx esi edi
.B1.274:                        ; Preds .B1.189                 ; Infreq
        add       esp, 8                                        ;600.11
        jmp       .B1.10        ; Prob 100%                     ;600.11
                                ; LOE ebx esi edi
..1.16_0.TAG.068.1.1::
..1.16_0.TAG.03f.1.1::
.B1.191:                        ; Preds .B1.156 .B1.156         ; Infreq
        push      OFFSET FLAT: il0_peep_printf_format_18        ;597.11
        call      _puts                                         ;597.11
                                ; LOE
.B1.192:                        ; Preds .B1.191                 ; Infreq
        push      OFFSET FLAT: il0_peep_printf_format_19        ;597.11
        call      _puts                                         ;597.11
                                ; LOE
.B1.193:                        ; Preds .B1.192                 ; Infreq
        push      OFFSET FLAT: il0_peep_printf_format_20        ;597.11
        call      _puts                                         ;597.11
                                ; LOE
.B1.194:                        ; Preds .B1.193                 ; Infreq
        push      OFFSET FLAT: il0_peep_printf_format_21        ;597.11
        call      _puts                                         ;597.11
                                ; LOE
.B1.195:                        ; Preds .B1.194                 ; Infreq
        push      OFFSET FLAT: il0_peep_printf_format_22        ;597.11
        call      _puts                                         ;597.11
                                ; LOE
.B1.196:                        ; Preds .B1.195                 ; Infreq
        push      64                                            ;597.11
        push      OFFSET FLAT: ??_C@_0EB@A@?5?5?5?5?5?5?5?9t?5?$DMthreads?$DO?5?5?5number?5of?5threads?5?$CIshould?5not?5exceed?5?$CFi?$CJ?6?6?$AA@ ;597.11
        call      _printf                                       ;597.11
                                ; LOE
.B1.275:                        ; Preds .B1.196                 ; Infreq
        add       esp, 28                                       ;597.11
        jmp       .B1.114       ; Prob 100%                     ;597.11
                                ; LOE
.B1.198:                        ; Preds .B1.184 .B1.178 .B1.172 .B1.165 .B1.159
                                ;                               ; Infreq
        mov       eax, DWORD PTR [esp]                          ;
        push      eax                                           ;593.27
        push      edx                                           ;593.27
        push      OFFSET FLAT: ??_C@_0BN@A@?5?5?$FL?5?$CFc?$CFc?5requires?5parameter?6?$AA@ ;593.27
        call      _printf                                       ;593.27
                                ; LOE
.B1.276:                        ; Preds .B1.198                 ; Infreq
        add       esp, 12                                       ;593.27
                                ; LOE
.B1.199:                        ; Preds .B1.276                 ; Infreq
        push      0                                             ;593.27
        call      _exit                                         ;593.27
                                ; LOE
.B1.208:                        ; Preds .B1.3                   ; Infreq
        mov       eax, 300                                      ;561.3
        mov       WORD PTR [616+esp], ax                        ;561.3
        push      -11                                           ;561.3
        call      DWORD PTR [__imp__GetStdHandle@4]             ;561.3
                                ; LOE eax
.B1.209:                        ; Preds .B1.208                 ; Infreq
        push      DWORD PTR [616+esp]                           ;561.3
        push      eax                                           ;561.3
        call      DWORD PTR [__imp__SetConsoleScreenBufferSize@8] ;561.3
        jmp       .B1.4         ; Prob 100%                     ;561.3
        ALIGN     16
                                ; LOE
; mark_end;
_main ENDP
;_main	ENDS
_TEXT	ENDS
_BSS	SEGMENT  DWORD PUBLIC FLAT  'BSS'
found.15401.1.1	DD 1 DUP (0H)	; pad
_BSS	ENDS
_RDATA	SEGMENT  DWORD PUBLIC FLAT READ  'DATA'
il0_peep_printf_format_6	DD	538976288
	DD	757080096
	DD	1765548129
	DD	2019910766
	DD	538976318
	DD	1633886240
	DD	1700929646
	DD	1836016416
	DD	1634625890
	DD	1852795252
	DD	543584032
	DD	538970675
	DD	538976288
	DD	538976288
	DD	538976288
	DD	538976288
	DD	538976288
	DD	1970158896
	DD	1769104749
	DD	538970723
	DD	538976288
	DD	538976288
	DD	538976288
	DD	538976288
	DD	538976288
	DD	1886731569
	DD	1668441456
	DD	543519585
	DD	1752198241
	DD	538970721
	DD	538976288
	DD	538976288
	DD	538976288
	DD	538976288
	DD	538976288
	DD	2037595442
	DD	1819239021
	DW	2675
	DB	0
	DD 2 DUP (0H)	; pad
	DB 1 DUP ( 0H)	; pad
il0_peep_printf_format_12	DD	538976288
	DD	757080096
	DD	1765548129
	DD	2019910766
	DD	538976318
	DD	1633886240
	DD	1700929646
	DD	1836016416
	DD	1634625890
	DD	1852795252
	DD	543584032
	DD	538970675
	DD	538976288
	DD	538976288
	DD	538976288
	DD	538976288
	DD	538976288
	DD	1970158896
	DD	1769104749
	DD	538970723
	DD	538976288
	DD	538976288
	DD	538976288
	DD	538976288
	DD	538976288
	DD	1886731569
	DD	1668441456
	DD	543519585
	DD	1752198241
	DD	538970721
	DD	538976288
	DD	538976288
	DD	538976288
	DD	538976288
	DD	538976288
	DD	2037595442
	DD	1819239021
	DW	2675
	DB	0
	DD 2 DUP (0H)	; pad
	DB 1 DUP ( 0H)	; pad
il0_peep_printf_format_19	DD	538976288
	DD	757080096
	DD	1765548129
	DD	2019910766
	DD	538976318
	DD	1633886240
	DD	1700929646
	DD	1836016416
	DD	1634625890
	DD	1852795252
	DD	543584032
	DD	538970675
	DD	538976288
	DD	538976288
	DD	538976288
	DD	538976288
	DD	538976288
	DD	1970158896
	DD	1769104749
	DD	538970723
	DD	538976288
	DD	538976288
	DD	538976288
	DD	538976288
	DD	538976288
	DD	1886731569
	DD	1668441456
	DD	543519585
	DD	1752198241
	DD	538970721
	DD	538976288
	DD	538976288
	DD	538976288
	DD	538976288
	DD	538976288
	DD	2037595442
	DD	1819239021
	DW	2675
	DB	0
	DB 1 DUP ( 0H)	; pad
il0_peep_printf_format_0	DD	1528832010
	DD	1835819808
	DD	1663053088
	DD	1801675122
	DD	1851878432
	DD	544104813
	DD	1752392040
	DW	10
	DB 2 DUP ( 0H)	; pad
il0_peep_printf_format_3	DD	542842912
	DD	1635151465
	DD	543451500
	DD	1918989427
	DD	1634738292
	DD	1870099315
	DW	25714
	DB	0
	DB 1 DUP ( 0H)	; pad
il0_peep_printf_format_1	DD	542842912
	DD	1635151465
	DD	543451500
	DD	1918989427
	DD	1851859060
	DD	1852121188
	DD	1634738276
	DD	1870099315
	DD	7562354
il0_peep_printf_format_2	DD	542842912
	DD	1635151465
	DD	543451500
	DD	543452773
	DD	1936941424
	DD	1685221239
	DB	0
	DB 3 DUP ( 0H)	; pad
il0_peep_printf_format_4	DD	542842912
	DD	1635151465
	DD	543451500
	DD	1752198241
	DD	1952801377
	DD	1684957472
	DW	30821
	DB	0
	DB 1 DUP ( 0H)	; pad
il0_peep_printf_format_5	DD	542842912
	DD	1734439797
	DD	1663056485
	DD	1528851820
	DD	1769238639
	DD	1567845999
	DD	1634221088
	DD	171862131
	DB	0
	DB 3 DUP ( 0H)	; pad
il0_peep_printf_format_7	DD	538976288
	DD	757080096
	DD	1631330403
	DD	1634234476
	DD	1047815522
	DD	1969430560
	DD	1836020851
	DD	1886150944
	DD	1700946280
	DD	1869881460
	DD	1702065440
	DB	0
	DB 3 DUP ( 0H)	; pad
il0_peep_printf_format_8	DD	538976288
	DD	757080096
	DD	1933320307
	DD	1953653108
	DD	538976318
	DD	1953701920
	DD	544502369
	DD	1936941424
	DD	1685221239
	DB	0
	DB 3 DUP ( 0H)	; pad
il0_peep_printf_format_9	DD	538976288
	DD	757080096
	DD	1698439269
	DD	540959854
	DD	538976288
	DD	1852121120
	DD	1634738276
	DD	1870099315
	DW	25714
	DB	0
	DB 1 DUP ( 0H)	; pad
il0_peep_printf_format_10	DD	542842912
	DD	1635151465
	DD	543451500
	DD	1752198241
	DD	1952801377
	DD	1818587936
	DD	1769235301
	DW	28271
	DB	0
	DB 1 DUP ( 0H)	; pad
il0_peep_printf_format_11	DD	542842912
	DD	1734439797
	DD	1663056485
	DD	1528851820
	DD	1769238639
	DD	1567845999
	DD	1634221088
	DD	171862131
	DB	0
	DB 3 DUP ( 0H)	; pad
il0_peep_printf_format_13	DD	538976288
	DD	757080096
	DD	1631330403
	DD	1634234476
	DD	1047815522
	DD	1969430560
	DD	1836020851
	DD	1886150944
	DD	1700946280
	DD	1869881460
	DD	1702065440
	DB	0
	DB 3 DUP ( 0H)	; pad
il0_peep_printf_format_14	DD	538976288
	DD	757080096
	DD	1933320307
	DD	1953653108
	DD	538976318
	DD	1953701920
	DD	544502369
	DD	1936941424
	DD	1685221239
	DB	0
	DB 3 DUP ( 0H)	; pad
il0_peep_printf_format_15	DD	538976288
	DD	757080096
	DD	1698439269
	DD	540959854
	DD	538976288
	DD	1852121120
	DD	1634738276
	DD	1870099315
	DW	25714
	DB	0
	DB 1 DUP ( 0H)	; pad
il0_peep_printf_format_16	DD	542842912
	DD	1701536109
	DD	1869488243
	DD	1852142368
	DD	1948280179
	DD	1684086895
	DD	540942436
	DD	1818304563
	DD	1650550896
	DD	7566437
il0_peep_printf_format_17	DD	542842912
	DD	1746956142
	DD	543716193
	DD	1667592307
	DD	1701406313
	DW	100
	DB 2 DUP ( 0H)	; pad
il0_peep_printf_format_18	DD	542842912
	DD	1734439797
	DD	1663056485
	DD	1528851820
	DD	1769238639
	DD	1567845999
	DD	1634221088
	DD	171862131
	DB	0
	DB 3 DUP ( 0H)	; pad
il0_peep_printf_format_20	DD	538976288
	DD	757080096
	DD	1631330403
	DD	1634234476
	DD	1047815522
	DD	1969430560
	DD	1836020851
	DD	1886150944
	DD	1700946280
	DD	1869881460
	DD	1702065440
	DB	0
	DB 3 DUP ( 0H)	; pad
il0_peep_printf_format_21	DD	538976288
	DD	757080096
	DD	1933320307
	DD	1953653108
	DD	538976318
	DD	1953701920
	DD	544502369
	DD	1936941424
	DD	1685221239
	DB	0
	DB 3 DUP ( 0H)	; pad
il0_peep_printf_format_22	DD	538976288
	DD	757080096
	DD	1698439269
	DD	540959854
	DD	538976288
	DD	1852121120
	DD	1634738276
	DD	1870099315
	DW	25714
	DB	0
_RDATA	ENDS
;	COMDAT .2.44_2.switchtab.72
_RDATA	SEGMENT  DWORD PUBLIC FLAT READ  'DATA'
;	COMDAT .2.44_2.switchtab.72
.2.44_2.switchtab.72	DB	OFFSET FLAT: ..1.16_0.TAG.068.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.061.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.063.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.065.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.068.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.DEFAULT.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.073.1.1 - ..1.16_0.TAG.074.1.1
	DB	OFFSET FLAT: ..1.16_0.TAG.074.1.1 - ..1.16_0.TAG.074.1.1
;.2.44_2.switchtab.72	ENDS
_RDATA	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _main
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _usage
TXTST1:
; -- Begin  _usage
;_usage	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _usage
; mark_begin;
       ALIGN     16
_usage	PROC NEAR PRIVATE
.B2.1:                          ; Preds .B2.0
        sub       esp, 12                                       ;491.1
        push      OFFSET FLAT: il0_peep_printf_format_23        ;492.3
        call      _puts                                         ;492.3
                                ; LOE
.B2.2:                          ; Preds .B2.1
        push      OFFSET FLAT: il0_peep_printf_format_24        ;493.3
        call      _puts                                         ;493.3
                                ; LOE
.B2.3:                          ; Preds .B2.2
        push      OFFSET FLAT: il0_peep_printf_format_25        ;497.3
        call      _puts                                         ;497.3
                                ; LOE
.B2.4:                          ; Preds .B2.3
        push      OFFSET FLAT: il0_peep_printf_format_26        ;498.3
        call      _puts                                         ;498.3
                                ; LOE
.B2.5:                          ; Preds .B2.4
        push      OFFSET FLAT: il0_peep_printf_format_27        ;499.3
        call      _puts                                         ;499.3
                                ; LOE
.B2.6:                          ; Preds .B2.5
        push      64                                            ;500.3
        push      OFFSET FLAT: ??_C@_0EB@A@?5?5?5?5?5?5?5?9t?5?$DMthreads?$DO?5?5?5number?5of?5threads?5?$CIshould?5not?5exceed?5?$CFi?$CJ?6?6?$AA@ ;500.3
        call      _printf                                       ;500.3
                                ; LOE
.B2.10:                         ; Preds .B2.6
        add       esp, 28                                       ;500.3
                                ; LOE
.B2.7:                          ; Preds .B2.10
        push      1                                             ;502.3
        call      _exit                                         ;502.3
        ALIGN     16
                                ; LOE
; mark_end;
_usage ENDP
;_usage	ENDS
_TEXT	ENDS
_RDATA	SEGMENT  DWORD PUBLIC FLAT READ  'DATA'
	DD 4 DUP (0H)	; pad
	DB 1 DUP ( 0H)	; pad
il0_peep_printf_format_24	DD	538976288
	DD	757080096
	DD	1765548129
	DD	2019910766
	DD	538976318
	DD	1633886240
	DD	1700929646
	DD	1836016416
	DD	1634625890
	DD	1852795252
	DD	543584032
	DD	538970675
	DD	538976288
	DD	538976288
	DD	538976288
	DD	538976288
	DD	538976288
	DD	1970158896
	DD	1769104749
	DD	538970723
	DD	538976288
	DD	538976288
	DD	538976288
	DD	538976288
	DD	538976288
	DD	1886731569
	DD	1668441456
	DD	543519585
	DD	1752198241
	DD	538970721
	DD	538976288
	DD	538976288
	DD	538976288
	DD	538976288
	DD	538976288
	DD	2037595442
	DD	1819239021
	DW	2675
	DB	0
	DB 1 DUP ( 0H)	; pad
il0_peep_printf_format_23	DD	542842912
	DD	1734439797
	DD	1663056485
	DD	1528851820
	DD	1769238639
	DD	1567845999
	DD	1634221088
	DD	171862131
	DB	0
	DB 3 DUP ( 0H)	; pad
il0_peep_printf_format_25	DD	538976288
	DD	757080096
	DD	1631330403
	DD	1634234476
	DD	1047815522
	DD	1969430560
	DD	1836020851
	DD	1886150944
	DD	1700946280
	DD	1869881460
	DD	1702065440
	DB	0
	DB 3 DUP ( 0H)	; pad
il0_peep_printf_format_26	DD	538976288
	DD	757080096
	DD	1933320307
	DD	1953653108
	DD	538976318
	DD	1953701920
	DD	544502369
	DD	1936941424
	DD	1685221239
	DB	0
	DB 3 DUP ( 0H)	; pad
il0_peep_printf_format_27	DD	538976288
	DD	757080096
	DD	1698439269
	DD	540959854
	DD	538976288
	DD	1852121120
	DD	1634738276
	DD	1870099315
	DW	25714
	DB	0
_RDATA	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _usage
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _crack_thread
TXTST2:
; -- Begin  _crack_thread
;_crack_thread	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _crack_thread
; mark_begin;
       ALIGN     16
	PUBLIC _crack_thread
_crack_thread	PROC NEAR 
; parameter 1: 8 + ebp
.B3.1:                          ; Preds .B3.0
        push      ebp                                           ;292.1
        mov       ebp, esp                                      ;292.1
        and       esp, -16                                      ;292.1
        push      esi                                           ;292.1
        push      edi                                           ;292.1
        push      ebx                                           ;292.1
        mov       eax, 263316                                   ;292.1
        call      __chkstk                                      ;292.1
        mov       edx, DWORD PTR [8+ebp]                        ;311.15
        mov       ecx, edx                                      ;311.15
        and       edx, -16                                      ;311.15
        pxor      xmm0, xmm0                                    ;311.15
        pcmpeqb   xmm0, XMMWORD PTR [edx]                       ;311.15
        pmovmskb  eax, xmm0                                     ;311.15
        and       ecx, 15                                       ;311.15
        shr       eax, cl                                       ;311.15
        bsf       eax, eax                                      ;311.15
        jne       L22           ; Prob 60%                      ;311.15
        mov       eax, edx                                      ;311.15
        add       edx, ecx                                      ;311.15
        call      ___intel_sse4_strlen                          ;311.15
L22:                                                            ;
                                ; LOE eax
.B3.66:                         ; Preds .B3.1
        mov       DWORD PTR [263308+esp], eax                   ;311.15
        mov       eax, DWORD PTR [8+ebp]                        ;312.15
        mov       edx, DWORD PTR [264+eax]                      ;314.6
        mov       ecx, DWORD PTR [268+eax]                      ;315.6
        mov       ebx, DWORD PTR [272+eax]                      ;317.6
        mov       esi, DWORD PTR [276+eax]                      ;318.6
        movq      xmm0, QWORD PTR [384+eax]                     ;312.15
        mov       DWORD PTR [263296+esp], edx                   ;314.6
        lea       edx, DWORD PTR [16+esp]                       ;323.3
        movdqu    XMMWORD PTR [262160+esp], xmm0                ;312.15
        mov       DWORD PTR [263284+esp], ecx                   ;315.6
        mov       DWORD PTR [263292+esp], ebx                   ;317.6
        mov       DWORD PTR [263288+esp], esi                   ;318.6
        call      _DES_init_keys                                ;323.3
                                ; LOE
.B3.2:                          ; Preds .B3.66
        xor       edx, edx                                      ;326.3
        mov       ecx, 8                                        ;326.3
        xor       eax, eax                                      ;326.3
        xor       ebx, ebx                                      ;326.3
        pxor      xmm0, xmm0                                    ;326.3
                                ; LOE eax edx ecx ebx xmm0
.B3.3:                          ; Preds .B3.4 .B3.2
        mov       esi, edx                                      ;327.5
        shl       esi, 7                                        ;327.5
        movups    XMMWORD PTR [262192+esp+esi], xmm0            ;327.5
        movups    XMMWORD PTR [262208+esp+esi], xmm0            ;327.5
        movups    XMMWORD PTR [262224+esp+esi], xmm0            ;327.5
        movups    XMMWORD PTR [262240+esp+esi], xmm0            ;327.5
        movups    XMMWORD PTR [262256+esp+esi], xmm0            ;327.5
        movups    XMMWORD PTR [262272+esp+esi], xmm0            ;327.5
        movups    XMMWORD PTR [262288+esp+esi], xmm0            ;327.5
        movups    XMMWORD PTR [262176+esp+esi], xmm0            ;327.5
                                ; LOE eax edx ecx ebx xmm0
.B3.4:                          ; Preds .B3.3
        add       edx, 1                                        ;326.3
        mov       esi, edx                                      ;326.3
        adc       eax, 0                                        ;326.3
        sub       esi, ecx                                      ;326.3
        mov       edi, eax                                      ;326.3
        sbb       edi, ebx                                      ;326.3
        jb        .B3.3         ; Prob 87%                      ;326.3
                                ; LOE eax edx ecx ebx xmm0
.B3.5:                          ; Preds .B3.4
        mov       edx, DWORD PTR [8+ebp]                        ;336.5
        xor       ebx, ebx                                      ;336.5
        mov       eax, DWORD PTR [263308+esp]                   ;339.3
        mov       ecx, 1                                        ;339.3
        mov       DWORD PTR [263264+esp], eax                   ;339.3
        pcmpeqd   xmm1, xmm1                                    ;332.5
        mov       esi, DWORD PTR [368+edx]                      ;339.20
        mov       edi, esi                                      ;339.3
        sub       edi, eax                                      ;339.3
        mov       eax, 0                                        ;339.3
        mov       BYTE PTR [280+edx], bl                        ;336.5
        mov       BYTE PTR [281+edx], bl                        ;336.5
        mov       BYTE PTR [282+edx], bl                        ;336.5
        mov       BYTE PTR [283+edx], bl                        ;336.5
        mov       BYTE PTR [284+edx], bl                        ;336.5
        mov       BYTE PTR [285+edx], bl                        ;336.5
        mov       BYTE PTR [286+edx], bl                        ;336.5
        mov       BYTE PTR [287+edx], bl                        ;336.5
        mov       ebx, DWORD PTR [372+edx]                      ;339.20
        mov       edi, ebx                                      ;339.3
        movdqu    XMMWORD PTR [263200+esp], xmm1                ;332.5
        mov       edx, 0                                        ;339.3
        movdqu    XMMWORD PTR [263216+esp], xmm1                ;332.5
        sbb       edi, eax                                      ;339.3
        jb        .B3.9         ; Prob 10%                      ;339.3
                                ; LOE edx ecx ebx esi xmm0
.B3.6:                          ; Preds .B3.5
        mov       eax, DWORD PTR [263264+esp]                   ;
        mov       edi, ecx                                      ;
                                ; LOE eax edx ebx esi edi
.B3.7:                          ; Preds .B3.6 .B3.67
        push      0                                             ;339.3
        push      DWORD PTR [263312+esp]                        ;339.3
        sub       esi, eax                                      ;339.3
        push      edx                                           ;339.3
        push      eax                                           ;339.3
        sbb       ebx, edx                                      ;339.3
        call      __allmul                                      ;339.3
                                ; LOE eax edx ebx esi edi
.B3.67:                         ; Preds .B3.7
        mov       ecx, esi                                      ;339.3
        add       edi, 1                                        ;339.3
        sub       ecx, eax                                      ;339.3
        mov       ecx, ebx                                      ;339.3
        sbb       ecx, edx                                      ;339.3
        jae       .B3.7         ; Prob 82%                      ;339.3
                                ; LOE eax edx ebx esi edi
.B3.8:                          ; Preds .B3.67
        mov       ecx, edi                                      ;
        pxor      xmm0, xmm0                                    ;
        test      ecx, ecx                                      ;339.3
        jle       .B3.12        ; Prob 10%                      ;339.3
                                ; LOE ecx ebx esi xmm0
.B3.9:                          ; Preds .B3.5 .B3.8
        xor       eax, eax                                      ;339.3
        mov       DWORD PTR [263264+esp], ecx                   ;339.3
        xor       edi, edi                                      ;339.3
                                ; LOE ebx esi edi
.B3.10:                         ; Preds .B3.68 .B3.9
        push      0                                             ;339.3
        push      DWORD PTR [263312+esp]                        ;339.3
        push      ebx                                           ;339.3
        push      esi                                           ;339.3
        call      __aullrem                                     ;339.3
                                ; LOE eax ebx esi edi
.B3.69:                         ; Preds .B3.10
        mov       DWORD PTR [263200+esp+edi*4], eax             ;339.11
        push      0                                             ;339.3
        push      DWORD PTR [263312+esp]                        ;339.3
        push      ebx                                           ;339.3
        push      esi                                           ;339.3
        call      __aulldiv                                     ;339.3
                                ; LOE eax edx edi
.B3.68:                         ; Preds .B3.69
        inc       edi                                           ;339.3
        mov       esi, eax                                      ;339.3
        mov       ebx, edx                                      ;339.3
        cmp       edi, DWORD PTR [263264+esp]                   ;339.3
        jl        .B3.10        ; Prob 82%                      ;339.3
                                ; LOE ebx esi edi
.B3.11:                         ; Preds .B3.68
        pxor      xmm0, xmm0                                    ;
                                ; LOE xmm0
.B3.12:                         ; Preds .B3.8 .B3.11
        xor       ecx, ecx                                      ;345.3
        xor       edx, edx                                      ;345.3
        mov       esi, DWORD PTR [8+ebp]                        ;342.3
        xor       ebx, ebx                                      ;
        mov       DWORD PTR [263300+esp], edx                   ;
        movq      QWORD PTR [392+esi], xmm0                     ;342.3
                                ; LOE edx ecx ebx
.B3.13:                         ; Preds .B3.19 .B3.12
        lea       edi, DWORD PTR [6+ebx]                        ;346.5
        mov       eax, DWORD PTR [263200+esp+edi*4]             ;346.9
        mov       DWORD PTR [263304+esp], eax                   ;346.9
        cmp       eax, -1                                       ;346.25
        je        .B3.19        ; Prob 50%                      ;346.25
                                ; LOE edx ecx ebx edi
.B3.14:                         ; Preds .B3.13
        mov       esi, edi                                      ;348.5
        lea       eax, DWORD PTR [16+esp]                       ;348.5
        shl       esi, 15                                       ;348.5
        add       esi, eax                                      ;348.5
        mov       eax, DWORD PTR [263304+esp]                   ;348.5
        shl       eax, 7                                        ;348.5
        shl       edi, 7                                        ;348.5
        add       esi, eax                                      ;348.5
        lea       eax, DWORD PTR [262176+esp]                   ;348.5
        add       edi, eax                                      ;348.5
        mov       eax, ecx                                      ;348.5
        or        eax, edx                                      ;348.5
        jne       .B3.16        ; Prob 50%                      ;348.5
                                ; LOE edx ecx ebx esi edi
.B3.15:                         ; Preds .B3.14
        movdqu    xmm0, XMMWORD PTR [esi]                       ;348.5
        movdqu    xmm1, XMMWORD PTR [16+esi]                    ;348.5
        movdqu    XMMWORD PTR [edi], xmm0                       ;348.5
        movdqu    XMMWORD PTR [16+edi], xmm1                    ;348.5
        movdqu    xmm2, XMMWORD PTR [32+esi]                    ;348.5
        movdqu    xmm3, XMMWORD PTR [48+esi]                    ;348.5
        movdqu    XMMWORD PTR [32+edi], xmm2                    ;348.5
        movdqu    XMMWORD PTR [48+edi], xmm3                    ;348.5
        movdqu    xmm4, XMMWORD PTR [64+esi]                    ;348.5
        movdqu    xmm5, XMMWORD PTR [80+esi]                    ;348.5
        movdqu    XMMWORD PTR [64+edi], xmm4                    ;348.5
        movdqu    XMMWORD PTR [80+edi], xmm5                    ;348.5
        movdqu    xmm6, XMMWORD PTR [96+esi]                    ;348.5
        movdqu    xmm7, XMMWORD PTR [112+esi]                   ;348.5
        movdqu    XMMWORD PTR [96+edi], xmm6                    ;348.5
        movdqu    XMMWORD PTR [112+edi], xmm7                   ;348.5
        jmp       .B3.19        ; Prob 100%                     ;348.5
                                ; LOE edx ecx ebx
.B3.16:                         ; Preds .B3.14
        xor       eax, eax                                      ;348.5
        mov       DWORD PTR [263268+esp], eax                   ;348.5
        mov       DWORD PTR [263264+esp], eax                   ;348.5
        lea       eax, DWORD PTR [7+ebx]                        ;348.5
        shl       eax, 7                                        ;348.5
        mov       DWORD PTR [263312+esp], edi                   ;348.5
        mov       DWORD PTR [263276+esp], ebx                   ;348.5
        mov       DWORD PTR [263272+esp], edx                   ;348.5
        mov       DWORD PTR [263280+esp], ecx                   ;348.5
        lea       eax, DWORD PTR [262176+esp+eax]               ;348.5
        mov       edi, DWORD PTR [263264+esp]                   ;348.5
        mov       ebx, DWORD PTR [263268+esp]                   ;348.5
                                ; LOE eax ebx esi edi
.B3.17:                         ; Preds .B3.17 .B3.16
        mov       ecx, DWORD PTR [263312+esp]                   ;348.5
        mov       edx, DWORD PTR [eax+ebx*8]                    ;348.5
        or        edx, DWORD PTR [esi+ebx*8]                    ;348.5
        mov       DWORD PTR [ecx+ebx*8], edx                    ;348.5
        mov       edx, DWORD PTR [4+eax+ebx*8]                  ;348.5
        or        edx, DWORD PTR [4+esi+ebx*8]                  ;348.5
        mov       DWORD PTR [4+ecx+ebx*8], edx                  ;348.5
        add       ebx, 1                                        ;348.5
        mov       edx, ebx                                      ;348.5
        adc       edi, 0                                        ;348.5
        mov       ecx, 16                                       ;348.5
        sub       edx, ecx                                      ;348.5
        mov       ecx, edi                                      ;348.5
        mov       edx, 0                                        ;348.5
        sbb       ecx, edx                                      ;348.5
        jb        .B3.17        ; Prob 93%                      ;348.5
                                ; LOE eax ebx esi edi
.B3.18:                         ; Preds .B3.17
        mov       edx, DWORD PTR [263272+esp]                   ;
        mov       ebx, DWORD PTR [263276+esp]                   ;
        mov       ecx, DWORD PTR [263280+esp]                   ;
                                ; LOE edx ecx ebx
.B3.19:                         ; Preds .B3.13 .B3.18 .B3.15
        add       ecx, 1                                        ;345.3
        mov       edi, ecx                                      ;345.3
        adc       edx, 0                                        ;345.3
        mov       esi, 7                                        ;345.3
        xor       eax, eax                                      ;345.3
        add       ebx, -1                                       ;345.3
        adc       DWORD PTR [263300+esp], -1                    ;345.3
        sub       edi, esi                                      ;345.3
        mov       esi, edx                                      ;345.3
        sbb       esi, eax                                      ;345.3
        jb        .B3.13        ; Prob 85%                      ;345.3
                                ; LOE edx ecx ebx
.B3.20:                         ; Preds .B3.19
        movq      xmm0, QWORD PTR [_2il0floatpacket.117]        ;392.17
        movdqu    xmm1, XMMWORD PTR [262160+esp]                ;392.17
                                ; LOE xmm0 xmm1
.B3.21:                         ; Preds .B3.54 .B3.20
        mov       esi, DWORD PTR [262176+esp]                   ;373.21
        mov       eax, DWORD PTR [263292+esp]                   ;375.17
        xor       esi, eax                                      ;375.17
        mov       ecx, esi                                      ;375.17
        mov       ebx, esi                                      ;375.17
        shr       ebx, 10                                       ;375.17
        and       ecx, 252                                      ;375.17
        mov       edi, esi                                      ;375.17
        and       ebx, 63                                       ;375.17
        shr       edi, 18                                       ;375.17
        and       edi, 63                                       ;375.17
        shr       esi, 26                                       ;375.17
        mov       ecx, DWORD PTR [_DES_SPtrans+ecx]             ;375.17
        mov       edx, DWORD PTR [262180+esp]                   ;375.17
        xor       ecx, DWORD PTR [_DES_SPtrans+512+ebx*4]       ;375.17
        xor       edx, eax                                      ;375.17
        ror       edx, 4                                        ;375.17
        xor       ecx, DWORD PTR [_DES_SPtrans+1024+edi*4]      ;375.17
        mov       ebx, edx                                      ;375.17
        xor       ecx, DWORD PTR [_DES_SPtrans+1536+esi*4]      ;375.17
        mov       esi, edx                                      ;375.17
        and       esi, 252                                      ;375.17
        shr       ebx, 10                                       ;375.17
        and       ebx, 63                                       ;375.17
        mov       edi, DWORD PTR [262184+esp]                   ;376.17
        xor       ecx, DWORD PTR [_DES_SPtrans+256+esi]         ;375.17
        mov       esi, edx                                      ;375.17
        shr       esi, 18                                       ;375.17
        and       esi, 63                                       ;375.17
        shr       edx, 26                                       ;375.17
        xor       ecx, DWORD PTR [_DES_SPtrans+768+ebx*4]       ;375.17
        xor       ecx, DWORD PTR [_DES_SPtrans+1280+esi*4]      ;375.17
        xor       ecx, DWORD PTR [_DES_SPtrans+1792+edx*4]      ;375.17
        xor       ecx, DWORD PTR [263288+esp]                   ;375.17
        xor       edi, ecx                                      ;376.17
        mov       edx, edi                                      ;376.17
        mov       ebx, edi                                      ;376.17
        shr       ebx, 10                                       ;376.17
        and       edx, 252                                      ;376.17
        and       ebx, 63                                       ;376.17
        mov       esi, DWORD PTR [262188+esp]                   ;376.17
        xor       esi, ecx                                      ;376.17
        mov       edx, DWORD PTR [_DES_SPtrans+edx]             ;376.17
        xor       edx, DWORD PTR [_DES_SPtrans+512+ebx*4]       ;376.17
        mov       ebx, edi                                      ;376.17
        shr       ebx, 18                                       ;376.17
        and       ebx, 63                                       ;376.17
        shr       edi, 26                                       ;376.17
        ror       esi, 4                                        ;376.17
        xor       edx, DWORD PTR [_DES_SPtrans+1024+ebx*4]      ;376.17
        mov       ebx, esi                                      ;376.17
        xor       edx, DWORD PTR [_DES_SPtrans+1536+edi*4]      ;376.17
        mov       edi, esi                                      ;376.17
        and       edi, 252                                      ;376.17
        shr       ebx, 10                                       ;376.17
        and       ebx, 63                                       ;376.17
        xor       edx, DWORD PTR [_DES_SPtrans+256+edi]         ;376.17
        mov       edi, esi                                      ;376.17
        shr       edi, 18                                       ;376.17
        and       edi, 63                                       ;376.17
        shr       esi, 26                                       ;376.17
        xor       edx, DWORD PTR [_DES_SPtrans+768+ebx*4]       ;376.17
        mov       ebx, DWORD PTR [262196+esp]                   ;377.17
        xor       edx, DWORD PTR [_DES_SPtrans+1280+edi*4]      ;376.17
        xor       edx, DWORD PTR [_DES_SPtrans+1792+esi*4]      ;376.17
        xor       edx, eax                                      ;376.17
        mov       eax, DWORD PTR [262192+esp]                   ;377.17
        xor       ebx, edx                                      ;377.17
        xor       eax, edx                                      ;377.17
        mov       esi, eax                                      ;377.17
        mov       edi, eax                                      ;377.17
        shr       edi, 10                                       ;377.17
        and       esi, 252                                      ;377.17
        and       edi, 63                                       ;377.17
        ror       ebx, 4                                        ;377.17
        mov       esi, DWORD PTR [_DES_SPtrans+esi]             ;377.17
        xor       esi, DWORD PTR [_DES_SPtrans+512+edi*4]       ;377.17
        mov       edi, eax                                      ;377.17
        shr       edi, 18                                       ;377.17
        and       edi, 63                                       ;377.17
        shr       eax, 26                                       ;377.17
        xor       esi, DWORD PTR [_DES_SPtrans+1024+edi*4]      ;377.17
        mov       edi, ebx                                      ;377.17
        xor       esi, DWORD PTR [_DES_SPtrans+1536+eax*4]      ;377.17
        mov       eax, ebx                                      ;377.17
        and       eax, 252                                      ;377.17
        shr       edi, 10                                       ;377.17
        and       edi, 63                                       ;377.17
        xor       esi, DWORD PTR [_DES_SPtrans+256+eax]         ;377.17
        mov       eax, ebx                                      ;377.17
        shr       eax, 18                                       ;377.17
        and       eax, 63                                       ;377.17
        shr       ebx, 26                                       ;377.17
        xor       esi, DWORD PTR [_DES_SPtrans+768+edi*4]       ;377.17
        mov       edi, DWORD PTR [262200+esp]                   ;378.17
        xor       esi, DWORD PTR [_DES_SPtrans+1280+eax*4]      ;377.17
        xor       esi, DWORD PTR [_DES_SPtrans+1792+ebx*4]      ;377.17
        xor       ecx, esi                                      ;377.17
        xor       edi, ecx                                      ;378.17
        mov       esi, edi                                      ;378.17
        mov       eax, edi                                      ;378.17
        shr       eax, 10                                       ;378.17
        and       esi, 252                                      ;378.17
        and       eax, 63                                       ;378.17
        mov       ebx, DWORD PTR [262204+esp]                   ;378.17
        xor       ebx, ecx                                      ;378.17
        mov       esi, DWORD PTR [_DES_SPtrans+esi]             ;378.17
        xor       esi, DWORD PTR [_DES_SPtrans+512+eax*4]       ;378.17
        mov       eax, edi                                      ;378.17
        shr       eax, 18                                       ;378.17
        and       eax, 63                                       ;378.17
        shr       edi, 26                                       ;378.17
        ror       ebx, 4                                        ;378.17
        xor       esi, DWORD PTR [_DES_SPtrans+1024+eax*4]      ;378.17
        mov       eax, ebx                                      ;378.17
        xor       esi, DWORD PTR [_DES_SPtrans+1536+edi*4]      ;378.17
        mov       edi, ebx                                      ;378.17
        and       edi, 252                                      ;378.17
        shr       eax, 10                                       ;378.17
        and       eax, 63                                       ;378.17
        xor       esi, DWORD PTR [_DES_SPtrans+256+edi]         ;378.17
        mov       edi, ebx                                      ;378.17
        shr       edi, 18                                       ;378.17
        and       edi, 63                                       ;378.17
        shr       ebx, 26                                       ;378.17
        xor       esi, DWORD PTR [_DES_SPtrans+768+eax*4]       ;378.17
        mov       eax, DWORD PTR [262208+esp]                   ;379.17
        xor       esi, DWORD PTR [_DES_SPtrans+1280+edi*4]      ;378.17
        xor       esi, DWORD PTR [_DES_SPtrans+1792+ebx*4]      ;378.17
        xor       edx, esi                                      ;378.17
        xor       eax, edx                                      ;379.17
        mov       esi, eax                                      ;379.17
        mov       edi, eax                                      ;379.17
        shr       edi, 10                                       ;379.17
        and       esi, 252                                      ;379.17
        and       edi, 63                                       ;379.17
        mov       ebx, DWORD PTR [262212+esp]                   ;379.17
        xor       ebx, edx                                      ;379.17
        mov       esi, DWORD PTR [_DES_SPtrans+esi]             ;379.17
        xor       esi, DWORD PTR [_DES_SPtrans+512+edi*4]       ;379.17
        mov       edi, eax                                      ;379.17
        shr       edi, 18                                       ;379.17
        and       edi, 63                                       ;379.17
        shr       eax, 26                                       ;379.17
        ror       ebx, 4                                        ;379.17
        xor       esi, DWORD PTR [_DES_SPtrans+1024+edi*4]      ;379.17
        mov       edi, ebx                                      ;379.17
        xor       esi, DWORD PTR [_DES_SPtrans+1536+eax*4]      ;379.17
        mov       eax, ebx                                      ;379.17
        and       eax, 252                                      ;379.17
        shr       edi, 10                                       ;379.17
        and       edi, 63                                       ;379.17
        xor       esi, DWORD PTR [_DES_SPtrans+256+eax]         ;379.17
        mov       eax, ebx                                      ;379.17
        shr       eax, 18                                       ;379.17
        and       eax, 63                                       ;379.17
        shr       ebx, 26                                       ;379.17
        xor       esi, DWORD PTR [_DES_SPtrans+768+edi*4]       ;379.17
        mov       edi, DWORD PTR [262216+esp]                   ;380.17
        xor       esi, DWORD PTR [_DES_SPtrans+1280+eax*4]      ;379.17
        xor       esi, DWORD PTR [_DES_SPtrans+1792+ebx*4]      ;379.17
        xor       ecx, esi                                      ;379.17
        xor       edi, ecx                                      ;380.17
        mov       esi, edi                                      ;380.17
        mov       eax, edi                                      ;380.17
        shr       eax, 10                                       ;380.17
        and       esi, 252                                      ;380.17
        and       eax, 63                                       ;380.17
        mov       ebx, DWORD PTR [262220+esp]                   ;380.17
        xor       ebx, ecx                                      ;380.17
        mov       esi, DWORD PTR [_DES_SPtrans+esi]             ;380.17
        xor       esi, DWORD PTR [_DES_SPtrans+512+eax*4]       ;380.17
        mov       eax, edi                                      ;380.17
        shr       eax, 18                                       ;380.17
        and       eax, 63                                       ;380.17
        shr       edi, 26                                       ;380.17
        ror       ebx, 4                                        ;380.17
        xor       esi, DWORD PTR [_DES_SPtrans+1024+eax*4]      ;380.17
        mov       eax, ebx                                      ;380.17
        xor       esi, DWORD PTR [_DES_SPtrans+1536+edi*4]      ;380.17
        mov       edi, ebx                                      ;380.17
        and       edi, 252                                      ;380.17
        shr       eax, 10                                       ;380.17
        and       eax, 63                                       ;380.17
        xor       esi, DWORD PTR [_DES_SPtrans+256+edi]         ;380.17
        mov       edi, ebx                                      ;380.17
        shr       edi, 18                                       ;380.17
        and       edi, 63                                       ;380.17
        shr       ebx, 26                                       ;380.17
        xor       esi, DWORD PTR [_DES_SPtrans+768+eax*4]       ;380.17
        mov       eax, DWORD PTR [262224+esp]                   ;381.17
        xor       esi, DWORD PTR [_DES_SPtrans+1280+edi*4]      ;380.17
        xor       esi, DWORD PTR [_DES_SPtrans+1792+ebx*4]      ;380.17
        xor       edx, esi                                      ;380.17
        xor       eax, edx                                      ;381.17
        mov       esi, eax                                      ;381.17
        mov       edi, eax                                      ;381.17
        shr       edi, 10                                       ;381.17
        and       esi, 252                                      ;381.17
        and       edi, 63                                       ;381.17
        mov       ebx, DWORD PTR [262228+esp]                   ;381.17
        xor       ebx, edx                                      ;381.17
        mov       esi, DWORD PTR [_DES_SPtrans+esi]             ;381.17
        xor       esi, DWORD PTR [_DES_SPtrans+512+edi*4]       ;381.17
        mov       edi, eax                                      ;381.17
        shr       edi, 18                                       ;381.17
        and       edi, 63                                       ;381.17
        shr       eax, 26                                       ;381.17
        ror       ebx, 4                                        ;381.17
        xor       esi, DWORD PTR [_DES_SPtrans+1024+edi*4]      ;381.17
        mov       edi, ebx                                      ;381.17
        xor       esi, DWORD PTR [_DES_SPtrans+1536+eax*4]      ;381.17
        mov       eax, ebx                                      ;381.17
        and       eax, 252                                      ;381.17
        shr       edi, 10                                       ;381.17
        and       edi, 63                                       ;381.17
        xor       esi, DWORD PTR [_DES_SPtrans+256+eax]         ;381.17
        mov       eax, ebx                                      ;381.17
        shr       eax, 18                                       ;381.17
        and       eax, 63                                       ;381.17
        shr       ebx, 26                                       ;381.17
        xor       esi, DWORD PTR [_DES_SPtrans+768+edi*4]       ;381.17
        mov       edi, DWORD PTR [262232+esp]                   ;382.17
        xor       esi, DWORD PTR [_DES_SPtrans+1280+eax*4]      ;381.17
        xor       esi, DWORD PTR [_DES_SPtrans+1792+ebx*4]      ;381.17
        xor       ecx, esi                                      ;381.17
        xor       edi, ecx                                      ;382.17
        mov       esi, edi                                      ;382.17
        mov       eax, edi                                      ;382.17
        shr       eax, 10                                       ;382.17
        and       esi, 252                                      ;382.17
        and       eax, 63                                       ;382.17
        mov       ebx, DWORD PTR [262236+esp]                   ;382.17
        xor       ebx, ecx                                      ;382.17
        mov       esi, DWORD PTR [_DES_SPtrans+esi]             ;382.17
        xor       esi, DWORD PTR [_DES_SPtrans+512+eax*4]       ;382.17
        mov       eax, edi                                      ;382.17
        shr       eax, 18                                       ;382.17
        and       eax, 63                                       ;382.17
        shr       edi, 26                                       ;382.17
        ror       ebx, 4                                        ;382.17
        xor       esi, DWORD PTR [_DES_SPtrans+1024+eax*4]      ;382.17
        mov       eax, ebx                                      ;382.17
        xor       esi, DWORD PTR [_DES_SPtrans+1536+edi*4]      ;382.17
        mov       edi, ebx                                      ;382.17
        and       edi, 252                                      ;382.17
        shr       eax, 10                                       ;382.17
        and       eax, 63                                       ;382.17
        xor       esi, DWORD PTR [_DES_SPtrans+256+edi]         ;382.17
        mov       edi, ebx                                      ;382.17
        shr       edi, 18                                       ;382.17
        and       edi, 63                                       ;382.17
        shr       ebx, 26                                       ;382.17
        xor       esi, DWORD PTR [_DES_SPtrans+768+eax*4]       ;382.17
        mov       eax, DWORD PTR [262240+esp]                   ;383.17
        xor       esi, DWORD PTR [_DES_SPtrans+1280+edi*4]      ;382.17
        xor       esi, DWORD PTR [_DES_SPtrans+1792+ebx*4]      ;382.17
        xor       edx, esi                                      ;382.17
        xor       eax, edx                                      ;383.17
        mov       esi, eax                                      ;383.17
        mov       edi, eax                                      ;383.17
        shr       edi, 10                                       ;383.17
        and       esi, 252                                      ;383.17
        and       edi, 63                                       ;383.17
        mov       ebx, DWORD PTR [262244+esp]                   ;383.17
        xor       ebx, edx                                      ;383.17
        mov       esi, DWORD PTR [_DES_SPtrans+esi]             ;383.17
        xor       esi, DWORD PTR [_DES_SPtrans+512+edi*4]       ;383.17
        mov       edi, eax                                      ;383.17
        shr       edi, 18                                       ;383.17
        and       edi, 63                                       ;383.17
        shr       eax, 26                                       ;383.17
        ror       ebx, 4                                        ;383.17
        xor       esi, DWORD PTR [_DES_SPtrans+1024+edi*4]      ;383.17
        mov       edi, ebx                                      ;383.17
        xor       esi, DWORD PTR [_DES_SPtrans+1536+eax*4]      ;383.17
        mov       eax, ebx                                      ;383.17
        and       eax, 252                                      ;383.17
        shr       edi, 10                                       ;383.17
        and       edi, 63                                       ;383.17
        xor       esi, DWORD PTR [_DES_SPtrans+256+eax]         ;383.17
        mov       eax, ebx                                      ;383.17
        shr       eax, 18                                       ;383.17
        and       eax, 63                                       ;383.17
        shr       ebx, 26                                       ;383.17
        xor       esi, DWORD PTR [_DES_SPtrans+768+edi*4]       ;383.17
        mov       edi, DWORD PTR [262248+esp]                   ;384.17
        xor       esi, DWORD PTR [_DES_SPtrans+1280+eax*4]      ;383.17
        xor       esi, DWORD PTR [_DES_SPtrans+1792+ebx*4]      ;383.17
        xor       ecx, esi                                      ;383.17
        xor       edi, ecx                                      ;384.17
        mov       esi, edi                                      ;384.17
        mov       eax, edi                                      ;384.17
        shr       eax, 10                                       ;384.17
        and       esi, 252                                      ;384.17
        and       eax, 63                                       ;384.17
        mov       ebx, DWORD PTR [262252+esp]                   ;384.17
        xor       ebx, ecx                                      ;384.17
        mov       esi, DWORD PTR [_DES_SPtrans+esi]             ;384.17
        xor       esi, DWORD PTR [_DES_SPtrans+512+eax*4]       ;384.17
        mov       eax, edi                                      ;384.17
        shr       eax, 18                                       ;384.17
        and       eax, 63                                       ;384.17
        shr       edi, 26                                       ;384.17
        ror       ebx, 4                                        ;384.17
        xor       esi, DWORD PTR [_DES_SPtrans+1024+eax*4]      ;384.17
        mov       eax, ebx                                      ;384.17
        xor       esi, DWORD PTR [_DES_SPtrans+1536+edi*4]      ;384.17
        mov       edi, ebx                                      ;384.17
        and       edi, 252                                      ;384.17
        shr       eax, 10                                       ;384.17
        and       eax, 63                                       ;384.17
        xor       esi, DWORD PTR [_DES_SPtrans+256+edi]         ;384.17
        mov       edi, ebx                                      ;384.17
        shr       edi, 18                                       ;384.17
        and       edi, 63                                       ;384.17
        shr       ebx, 26                                       ;384.17
        xor       esi, DWORD PTR [_DES_SPtrans+768+eax*4]       ;384.17
        mov       eax, DWORD PTR [262256+esp]                   ;385.17
        xor       esi, DWORD PTR [_DES_SPtrans+1280+edi*4]      ;384.17
        xor       esi, DWORD PTR [_DES_SPtrans+1792+ebx*4]      ;384.17
        xor       edx, esi                                      ;384.17
        xor       eax, edx                                      ;385.17
        mov       esi, eax                                      ;385.17
        mov       edi, eax                                      ;385.17
        shr       edi, 10                                       ;385.17
        and       esi, 252                                      ;385.17
        and       edi, 63                                       ;385.17
        mov       ebx, DWORD PTR [262260+esp]                   ;385.17
        xor       ebx, edx                                      ;385.17
        mov       esi, DWORD PTR [_DES_SPtrans+esi]             ;385.17
        xor       esi, DWORD PTR [_DES_SPtrans+512+edi*4]       ;385.17
        mov       edi, eax                                      ;385.17
        shr       edi, 18                                       ;385.17
        and       edi, 63                                       ;385.17
        shr       eax, 26                                       ;385.17
        ror       ebx, 4                                        ;385.17
        xor       esi, DWORD PTR [_DES_SPtrans+1024+edi*4]      ;385.17
        mov       edi, ebx                                      ;385.17
        xor       esi, DWORD PTR [_DES_SPtrans+1536+eax*4]      ;385.17
        mov       eax, ebx                                      ;385.17
        and       eax, 252                                      ;385.17
        shr       edi, 10                                       ;385.17
        and       edi, 63                                       ;385.17
        xor       esi, DWORD PTR [_DES_SPtrans+256+eax]         ;385.17
        mov       eax, ebx                                      ;385.17
        shr       eax, 18                                       ;385.17
        and       eax, 63                                       ;385.17
        shr       ebx, 26                                       ;385.17
        xor       esi, DWORD PTR [_DES_SPtrans+768+edi*4]       ;385.17
        mov       edi, DWORD PTR [262264+esp]                   ;386.17
        xor       esi, DWORD PTR [_DES_SPtrans+1280+eax*4]      ;385.17
        xor       esi, DWORD PTR [_DES_SPtrans+1792+ebx*4]      ;385.17
        xor       ecx, esi                                      ;385.17
        xor       edi, ecx                                      ;386.17
        mov       ebx, edi                                      ;386.17
        mov       eax, edi                                      ;386.17
        shr       eax, 10                                       ;386.17
        and       ebx, 252                                      ;386.17
        and       eax, 63                                       ;386.17
        mov       esi, DWORD PTR [262268+esp]                   ;386.17
        xor       esi, ecx                                      ;386.17
        mov       ebx, DWORD PTR [_DES_SPtrans+ebx]             ;386.17
        xor       ebx, DWORD PTR [_DES_SPtrans+512+eax*4]       ;386.17
        mov       eax, edi                                      ;386.17
        shr       eax, 18                                       ;386.17
        and       eax, 63                                       ;386.17
        shr       edi, 26                                       ;386.17
        ror       esi, 4                                        ;386.17
        xor       ebx, DWORD PTR [_DES_SPtrans+1024+eax*4]      ;386.17
        mov       eax, esi                                      ;386.17
        xor       ebx, DWORD PTR [_DES_SPtrans+1536+edi*4]      ;386.17
        mov       edi, esi                                      ;386.17
        and       edi, 252                                      ;386.17
        shr       eax, 10                                       ;386.17
        and       eax, 63                                       ;386.17
        xor       ebx, DWORD PTR [_DES_SPtrans+256+edi]         ;386.17
        mov       edi, esi                                      ;386.17
        shr       edi, 18                                       ;386.17
        and       edi, 63                                       ;386.17
        shr       esi, 26                                       ;386.17
        xor       ebx, DWORD PTR [_DES_SPtrans+768+eax*4]       ;386.17
        mov       eax, DWORD PTR [262276+esp]                   ;387.17
        xor       ebx, DWORD PTR [_DES_SPtrans+1280+edi*4]      ;386.17
        xor       ebx, DWORD PTR [_DES_SPtrans+1792+esi*4]      ;386.17
        xor       edx, ebx                                      ;386.17
        mov       ebx, DWORD PTR [262272+esp]                   ;387.17
        xor       ebx, edx                                      ;387.17
                                ; LOE eax edx ecx ebx xmm0 xmm1
.B3.70:                         ; Preds .B3.21
        mov       edi, ebx                                      ;387.17
        xor       eax, edx                                      ;387.17
        and       edi, 252                                      ;387.17
        ror       eax, 4                                        ;387.17
        mov       esi, DWORD PTR [_DES_SPtrans+edi]             ;387.17
        mov       edi, ebx                                      ;387.17
        shr       edi, 10                                       ;387.17
        and       edi, 63                                       ;387.17
        xor       esi, DWORD PTR [_DES_SPtrans+512+edi*4]       ;387.17
        mov       edi, ebx                                      ;387.17
        shr       edi, 18                                       ;387.17
        and       edi, 63                                       ;387.17
        shr       ebx, 26                                       ;387.17
        xor       esi, DWORD PTR [_DES_SPtrans+1024+edi*4]      ;387.17
        mov       edi, eax                                      ;387.17
        xor       esi, DWORD PTR [_DES_SPtrans+1536+ebx*4]      ;387.17
        mov       ebx, eax                                      ;387.17
        and       ebx, 252                                      ;387.17
        shr       edi, 10                                       ;387.17
        and       edi, 63                                       ;387.17
        xor       esi, DWORD PTR [_DES_SPtrans+256+ebx]         ;387.17
        mov       ebx, eax                                      ;387.17
        shr       ebx, 18                                       ;387.17
        and       ebx, 63                                       ;387.17
        shr       eax, 26                                       ;387.17
        xor       esi, DWORD PTR [_DES_SPtrans+768+edi*4]       ;387.17
        xor       esi, DWORD PTR [_DES_SPtrans+1280+ebx*4]      ;387.17
        xor       esi, DWORD PTR [_DES_SPtrans+1792+eax*4]      ;387.17
        xor       ecx, esi                                      ;387.17
        mov       eax, DWORD PTR [262280+esp]                   ;388.17
        xor       eax, ecx                                      ;388.17
        mov       esi, eax                                      ;388.17
        and       esi, 252                                      ;388.17
        mov       ebx, DWORD PTR [262284+esp]                   ;388.17
        xor       ebx, ecx                                      ;388.17
        ror       ebx, 4                                        ;388.17
        mov       edi, DWORD PTR [_DES_SPtrans+esi]             ;388.17
        mov       esi, eax                                      ;388.17
        shr       esi, 10                                       ;388.17
        and       esi, 63                                       ;388.17
        xor       edi, DWORD PTR [_DES_SPtrans+512+esi*4]       ;388.17
        mov       esi, eax                                      ;388.17
        shr       esi, 18                                       ;388.17
        and       esi, 63                                       ;388.17
        shr       eax, 26                                       ;388.17
        xor       edi, DWORD PTR [_DES_SPtrans+1024+esi*4]      ;388.17
        mov       esi, ebx                                      ;388.17
        xor       edi, DWORD PTR [_DES_SPtrans+1536+eax*4]      ;388.17
        mov       eax, ebx                                      ;388.17
        and       eax, 252                                      ;388.17
        shr       esi, 10                                       ;388.17
        and       esi, 63                                       ;388.17
        xor       edi, DWORD PTR [_DES_SPtrans+256+eax]         ;388.17
        mov       eax, ebx                                      ;388.17
        shr       eax, 18                                       ;388.17
        and       eax, 63                                       ;388.17
        shr       ebx, 26                                       ;388.17
        xor       edi, DWORD PTR [_DES_SPtrans+768+esi*4]       ;388.17
        mov       esi, DWORD PTR [262288+esp]                   ;389.17
        xor       edi, DWORD PTR [_DES_SPtrans+1280+eax*4]      ;388.17
        xor       edi, DWORD PTR [_DES_SPtrans+1792+ebx*4]      ;388.17
        xor       edx, edi                                      ;388.17
        xor       esi, edx                                      ;389.17
        mov       edi, esi                                      ;389.17
        and       edi, 252                                      ;389.17
        mov       ebx, DWORD PTR [262292+esp]                   ;389.17
        xor       ebx, edx                                      ;389.17
        ror       ebx, 4                                        ;389.17
        mov       eax, DWORD PTR [_DES_SPtrans+edi]             ;389.17
        mov       edi, esi                                      ;389.17
        shr       edi, 10                                       ;389.17
        and       edi, 63                                       ;389.17
        xor       eax, DWORD PTR [_DES_SPtrans+512+edi*4]       ;389.17
        mov       edi, esi                                      ;389.17
        shr       edi, 18                                       ;389.17
        and       edi, 63                                       ;389.17
        shr       esi, 26                                       ;389.17
        xor       eax, DWORD PTR [_DES_SPtrans+1024+edi*4]      ;389.17
        mov       edi, ebx                                      ;389.17
        xor       eax, DWORD PTR [_DES_SPtrans+1536+esi*4]      ;389.17
        mov       esi, ebx                                      ;389.17
        and       esi, 252                                      ;389.17
        shr       edi, 10                                       ;389.17
        and       edi, 63                                       ;389.17
        xor       eax, DWORD PTR [_DES_SPtrans+256+esi]         ;389.17
        mov       esi, ebx                                      ;389.17
        shr       esi, 18                                       ;389.17
        and       esi, 63                                       ;389.17
        shr       ebx, 26                                       ;389.17
        xor       eax, DWORD PTR [_DES_SPtrans+768+edi*4]       ;389.17
        xor       eax, DWORD PTR [_DES_SPtrans+1280+esi*4]      ;389.17
        xor       eax, DWORD PTR [_DES_SPtrans+1792+ebx*4]      ;389.17
        mov       ebx, DWORD PTR [8+ebp]                        ;392.17
        xor       ecx, eax                                      ;389.17
        movq      xmm2, QWORD PTR [392+ebx]                     ;392.17
        paddq     xmm2, xmm0                                    ;392.17
        movq      QWORD PTR [392+ebx], xmm2                     ;392.17
        cmp       ecx, DWORD PTR [263296+esp]                   ;395.27
        jne       .B3.23        ; Prob 50%                      ;395.27
                                ; LOE edx ecx xmm0 xmm1
.B3.22:                         ; Preds .B3.70
        mov       ebx, DWORD PTR [262296+esp]                   ;397.19
        xor       ebx, ecx                                      ;397.19
        mov       esi, ebx                                      ;397.19
        mov       edi, ebx                                      ;397.19
        and       esi, 252                                      ;397.19
        shr       edi, 10                                       ;397.19
        and       edi, 63                                       ;397.19
        xor       ecx, DWORD PTR [262300+esp]                   ;397.19
        mov       eax, DWORD PTR [_DES_SPtrans+esi]             ;397.19
        mov       esi, ebx                                      ;397.19
        shr       esi, 18                                       ;397.19
        and       esi, 63                                       ;397.19
        shr       ebx, 26                                       ;397.19
        xor       eax, DWORD PTR [_DES_SPtrans+512+edi*4]       ;397.19
        ror       ecx, 4                                        ;397.19
        xor       eax, DWORD PTR [_DES_SPtrans+1024+esi*4]      ;397.19
        mov       esi, ecx                                      ;397.19
        xor       eax, DWORD PTR [_DES_SPtrans+1536+ebx*4]      ;397.19
        mov       ebx, ecx                                      ;397.19
        shr       esi, 10                                       ;397.19
        and       ebx, 252                                      ;397.19
        mov       edi, ecx                                      ;397.19
        and       esi, 63                                       ;397.19
        shr       edi, 18                                       ;397.19
        and       edi, 63                                       ;397.19
        shr       ecx, 26                                       ;397.19
        xor       eax, DWORD PTR [_DES_SPtrans+256+ebx]         ;397.19
        xor       eax, DWORD PTR [_DES_SPtrans+768+esi*4]       ;397.19
        xor       eax, DWORD PTR [_DES_SPtrans+1280+edi*4]      ;397.19
        xor       eax, DWORD PTR [_DES_SPtrans+1792+ecx*4]      ;397.19
        xor       edx, eax                                      ;397.19
        cmp       edx, DWORD PTR [263284+esp]                   ;399.29
        je        .B3.56        ; Prob 20%                      ;399.29
                                ; LOE xmm0 xmm1
.B3.23:                         ; Preds .B3.70 .B3.22
        movq      xmm2, QWORD PTR [_2il0floatpacket.116]        ;409.23
        paddq     xmm1, xmm2                                    ;409.23
        pand      xmm2, xmm1                                    ;409.36
        ptest     xmm2, xmm2                                    ;409.36
        je        .B3.62        ; Prob 20%                      ;409.36
                                ; LOE xmm0 xmm1
.B3.24:                         ; Preds .B3.23
        mov       ebx, DWORD PTR [263200+esp]                   ;411.26
        inc       ebx                                           ;411.26
        cmp       ebx, DWORD PTR [263308+esp]                   ;411.39
        jb        .B3.52        ; Prob 50%                      ;411.39
                                ; LOE ebx xmm0 xmm1
.B3.25:                         ; Preds .B3.24
        mov       ecx, DWORD PTR [263204+esp]                   ;414.24
        xor       ebx, ebx                                      ;413.15
        inc       ecx                                           ;414.24
        cmp       ecx, DWORD PTR [263308+esp]                   ;414.37
        jb        .B3.48        ; Prob 50%                      ;414.37
                                ; LOE ecx ebx xmm0 xmm1
.B3.26:                         ; Preds .B3.25
        mov       edx, DWORD PTR [263208+esp]                   ;416.22
        xor       ecx, ecx                                      ;415.13
        inc       edx                                           ;416.22
        cmp       edx, DWORD PTR [263308+esp]                   ;416.35
        jb        .B3.44        ; Prob 50%                      ;416.35
                                ; LOE edx ecx ebx xmm0 xmm1
.B3.27:                         ; Preds .B3.26
        mov       esi, DWORD PTR [263212+esp]                   ;418.20
        xor       edx, edx                                      ;417.11
        inc       esi                                           ;418.20
        cmp       esi, DWORD PTR [263308+esp]                   ;418.33
        jb        .B3.40        ; Prob 50%                      ;418.33
                                ; LOE edx ecx ebx esi xmm0 xmm1
.B3.28:                         ; Preds .B3.27
        mov       edi, DWORD PTR [263216+esp]                   ;420.18
        xor       eax, eax                                      ;419.9
        inc       edi                                           ;420.18
        xor       esi, esi                                      ;419.9
        mov       DWORD PTR [262168+esp], edi                   ;420.18
        cmp       edi, DWORD PTR [263308+esp]                   ;420.31
        jb        .B3.36        ; Prob 50%                      ;420.31
                                ; LOE rdi edx ecx ebx esi edi dil xmm0 xmm1
.B3.29:                         ; Preds .B3.28
        mov       edi, DWORD PTR [263220+esp]                   ;422.16
        inc       edi                                           ;422.16
        mov       DWORD PTR [262168+esp], 0                     ;421.7
        mov       DWORD PTR [262160+esp], edi                   ;422.16
        cmp       edi, DWORD PTR [263308+esp]                   ;422.29
        jb        .B3.32        ; Prob 50%                      ;422.29
                                ; LOE rdi edx ecx ebx esi edi dil xmm0 xmm1
.B3.30:                         ; Preds .B3.29
        mov       edi, DWORD PTR [263224+esp]                   ;424.14
        inc       edi                                           ;424.14
        mov       DWORD PTR [262160+esp], 0                     ;423.5
        cmp       edi, DWORD PTR [263308+esp]                   ;424.27
        jae       .B3.62        ; Prob 20%                      ;424.27
                                ; LOE edx ecx ebx esi edi xmm0 xmm1
.B3.31:                         ; Preds .B3.30
        mov       DWORD PTR [263224+esp], edi                   ;424.14
        xor       eax, eax                                      ;423.5
        shl       edi, 7                                        ;354.5
        mov       DWORD PTR [263220+esp], eax                   ;423.5
        mov       DWORD PTR [263216+esp], eax                   ;421.7
        mov       DWORD PTR [263212+esp], eax                   ;419.9
        movdqu    xmm2, XMMWORD PTR [196624+esp+edi]            ;354.5
        movdqu    xmm3, XMMWORD PTR [196640+esp+edi]            ;354.5
        movdqu    XMMWORD PTR [262944+esp], xmm2                ;354.5
        movdqu    XMMWORD PTR [262960+esp], xmm3                ;354.5
        movdqu    xmm4, XMMWORD PTR [196656+esp+edi]            ;354.5
        movdqu    xmm5, XMMWORD PTR [196672+esp+edi]            ;354.5
        movdqu    XMMWORD PTR [262976+esp], xmm4                ;354.5
        movdqu    XMMWORD PTR [262992+esp], xmm5                ;354.5
        movdqu    xmm6, XMMWORD PTR [196688+esp+edi]            ;354.5
        movdqu    xmm7, XMMWORD PTR [196704+esp+edi]            ;354.5
        movdqu    XMMWORD PTR [263008+esp], xmm6                ;354.5
        movdqu    XMMWORD PTR [263024+esp], xmm7                ;354.5
        movdqu    xmm2, XMMWORD PTR [196720+esp+edi]            ;354.5
        movdqu    xmm3, XMMWORD PTR [196736+esp+edi]            ;354.5
        movdqu    XMMWORD PTR [263040+esp], xmm2                ;354.5
        movdqu    XMMWORD PTR [263056+esp], xmm3                ;354.5
        mov       DWORD PTR [263208+esp], eax                   ;417.11
        mov       DWORD PTR [263204+esp], eax                   ;415.13
        mov       DWORD PTR [263200+esp], eax                   ;413.15
        jmp       .B3.33        ; Prob 100%                     ;413.15
                                ; LOE edx ecx ebx esi xmm0 xmm1
.B3.32:                         ; Preds .B3.29
        xor       eax, eax                                      ;421.7
        mov       DWORD PTR [263220+esp], edi                   ;423.5
        mov       DWORD PTR [263216+esp], eax                   ;421.7
        mov       DWORD PTR [263212+esp], eax                   ;419.9
        mov       DWORD PTR [263208+esp], eax                   ;417.11
        mov       DWORD PTR [263204+esp], eax                   ;415.13
        mov       DWORD PTR [263200+esp], eax                   ;413.15
                                ; LOE edx ecx ebx esi xmm0 xmm1
.B3.33:                         ; Preds .B3.31 .B3.32
        mov       eax, DWORD PTR [262160+esp]                   ;356.7
        lea       edi, DWORD PTR [16+esp]                       ;356.7
        shl       eax, 7                                        ;356.7
        add       eax, edi                                      ;356.7
        mov       DWORD PTR [262160+esp], eax                   ;356.7
        xor       eax, eax                                      ;356.7
        mov       DWORD PTR [263264+esp], ecx                   ;356.7
        mov       DWORD PTR [262164+esp], esi                   ;356.7
        mov       DWORD PTR [263268+esp], ebx                   ;356.7
        mov       ebx, 16                                       ;356.7
        mov       DWORD PTR [262172+esp], edx                   ;356.7
        xor       edx, edx                                      ;356.7
        mov       esi, eax                                      ;356.7
        mov       ecx, DWORD PTR [262160+esp]                   ;356.7
                                ; LOE eax edx ecx ebx esi xmm0 xmm1
.B3.34:                         ; Preds .B3.34 .B3.33
        mov       edi, DWORD PTR [262944+esp+eax*8]             ;356.7
        or        edi, DWORD PTR [163840+ecx+eax*8]             ;356.7
        mov       DWORD PTR [262816+esp+eax*8], edi             ;356.7
        mov       edi, DWORD PTR [262948+esp+eax*8]             ;356.7
        or        edi, DWORD PTR [163844+ecx+eax*8]             ;356.7
        mov       DWORD PTR [262820+esp+eax*8], edi             ;356.7
        add       eax, 1                                        ;356.7
        mov       edi, eax                                      ;356.7
        adc       esi, 0                                        ;356.7
        sub       edi, ebx                                      ;356.7
        mov       edi, esi                                      ;356.7
        sbb       edi, edx                                      ;356.7
        jb        .B3.34        ; Prob 93%                      ;356.7
                                ; LOE eax edx ecx ebx esi xmm0 xmm1
.B3.35:                         ; Preds .B3.34
        mov       ebx, DWORD PTR [263268+esp]                   ;
        mov       ecx, DWORD PTR [263264+esp]                   ;
        mov       edx, DWORD PTR [262172+esp]                   ;
        mov       esi, DWORD PTR [262164+esp]                   ;
        jmp       .B3.37        ; Prob 100%                     ;
                                ; LOE edx ecx ebx esi xmm0 xmm1
.B3.36:                         ; Preds .B3.28
        xor       eax, eax                                      ;419.9
        mov       DWORD PTR [263216+esp], edi                   ;421.7
        mov       DWORD PTR [263212+esp], eax                   ;419.9
        mov       DWORD PTR [263208+esp], eax                   ;417.11
        mov       DWORD PTR [263204+esp], eax                   ;415.13
        mov       DWORD PTR [263200+esp], eax                   ;413.15
                                ; LOE edx ecx ebx esi xmm0 xmm1
.B3.37:                         ; Preds .B3.35 .B3.36
        mov       eax, DWORD PTR [262168+esp]                   ;358.9
        lea       edi, DWORD PTR [16+esp]                       ;358.9
        shl       eax, 7                                        ;358.9
        add       eax, edi                                      ;358.9
        mov       DWORD PTR [262168+esp], eax                   ;358.9
        xor       eax, eax                                      ;358.9
        mov       DWORD PTR [263268+esp], ebx                   ;358.9
        mov       DWORD PTR [262164+esp], esi                   ;358.9
        mov       DWORD PTR [263264+esp], ecx                   ;358.9
        mov       ecx, 16                                       ;358.9
        mov       DWORD PTR [262172+esp], edx                   ;358.9
        xor       edx, edx                                      ;358.9
        mov       ebx, eax                                      ;358.9
        mov       esi, DWORD PTR [262168+esp]                   ;358.9
                                ; LOE eax edx ecx ebx esi xmm0 xmm1
.B3.38:                         ; Preds .B3.38 .B3.37
        mov       edi, DWORD PTR [262816+esp+eax*8]             ;358.9
        or        edi, DWORD PTR [131072+esi+eax*8]             ;358.9
        mov       DWORD PTR [262688+esp+eax*8], edi             ;358.9
        mov       edi, DWORD PTR [262820+esp+eax*8]             ;358.9
        or        edi, DWORD PTR [131076+esi+eax*8]             ;358.9
        mov       DWORD PTR [262692+esp+eax*8], edi             ;358.9
        add       eax, 1                                        ;358.9
        mov       edi, eax                                      ;358.9
        adc       ebx, 0                                        ;358.9
        sub       edi, ecx                                      ;358.9
        mov       edi, ebx                                      ;358.9
        sbb       edi, edx                                      ;358.9
        jb        .B3.38        ; Prob 93%                      ;358.9
                                ; LOE eax edx ecx ebx esi xmm0 xmm1
.B3.39:                         ; Preds .B3.38
        mov       ebx, DWORD PTR [263268+esp]                   ;
        mov       ecx, DWORD PTR [263264+esp]                   ;
        mov       edx, DWORD PTR [262172+esp]                   ;
        mov       esi, DWORD PTR [262164+esp]                   ;
        jmp       .B3.41        ; Prob 100%                     ;
                                ; LOE edx ecx ebx esi xmm0 xmm1
.B3.40:                         ; Preds .B3.27
        xor       eax, eax                                      ;417.11
        mov       DWORD PTR [263212+esp], esi                   ;419.9
        mov       DWORD PTR [263208+esp], eax                   ;417.11
        mov       DWORD PTR [263204+esp], eax                   ;415.13
        mov       DWORD PTR [263200+esp], eax                   ;413.15
                                ; LOE edx ecx ebx esi xmm0 xmm1
.B3.41:                         ; Preds .B3.39 .B3.40
        shl       esi, 7                                        ;360.11
        lea       edi, DWORD PTR [16+esp]                       ;360.11
        xor       eax, eax                                      ;360.11
        add       esi, edi                                      ;360.11
        mov       DWORD PTR [263268+esp], ebx                   ;360.11
        xor       edi, edi                                      ;360.11
        mov       DWORD PTR [263264+esp], ecx                   ;360.11
        mov       ecx, 16                                       ;360.11
        mov       DWORD PTR [262172+esp], edx                   ;360.11
        xor       edx, edx                                      ;360.11
                                ; LOE eax edx ecx esi edi xmm0 xmm1
.B3.42:                         ; Preds .B3.42 .B3.41
        mov       ebx, DWORD PTR [262688+esp+eax*8]             ;360.11
        or        ebx, DWORD PTR [98304+esi+eax*8]              ;360.11
        mov       DWORD PTR [262560+esp+eax*8], ebx             ;360.11
        mov       ebx, DWORD PTR [262692+esp+eax*8]             ;360.11
        or        ebx, DWORD PTR [98308+esi+eax*8]              ;360.11
        mov       DWORD PTR [262564+esp+eax*8], ebx             ;360.11
        add       eax, 1                                        ;360.11
        mov       ebx, eax                                      ;360.11
        adc       edi, 0                                        ;360.11
        sub       ebx, ecx                                      ;360.11
        mov       ebx, edi                                      ;360.11
        sbb       ebx, edx                                      ;360.11
        jb        .B3.42        ; Prob 93%                      ;360.11
                                ; LOE eax edx ecx esi edi xmm0 xmm1
.B3.43:                         ; Preds .B3.42
        mov       ebx, DWORD PTR [263268+esp]                   ;
        mov       ecx, DWORD PTR [263264+esp]                   ;
        mov       edx, DWORD PTR [262172+esp]                   ;
        jmp       .B3.45        ; Prob 100%                     ;
                                ; LOE edx ecx ebx xmm0 xmm1
.B3.44:                         ; Preds .B3.26
        xor       eax, eax                                      ;415.13
        mov       DWORD PTR [263208+esp], edx                   ;417.11
        mov       DWORD PTR [263204+esp], eax                   ;415.13
        mov       DWORD PTR [263200+esp], eax                   ;413.15
                                ; LOE edx ecx ebx xmm0 xmm1
.B3.45:                         ; Preds .B3.43 .B3.44
        shl       edx, 7                                        ;362.13
        lea       esi, DWORD PTR [16+esp]                       ;362.13
        xor       eax, eax                                      ;362.13
        add       edx, esi                                      ;362.13
        mov       DWORD PTR [263268+esp], ebx                   ;362.13
        xor       esi, esi                                      ;362.13
        mov       DWORD PTR [263264+esp], ecx                   ;362.13
        mov       ebx, 16                                       ;362.13
        xor       ecx, ecx                                      ;362.13
                                ; LOE eax edx ecx ebx esi xmm0 xmm1
.B3.46:                         ; Preds .B3.46 .B3.45
        mov       edi, DWORD PTR [262560+esp+esi*8]             ;362.13
        or        edi, DWORD PTR [65536+edx+esi*8]              ;362.13
        mov       DWORD PTR [262432+esp+esi*8], edi             ;362.13
        mov       edi, DWORD PTR [262564+esp+esi*8]             ;362.13
        or        edi, DWORD PTR [65540+edx+esi*8]              ;362.13
        mov       DWORD PTR [262436+esp+esi*8], edi             ;362.13
        add       esi, 1                                        ;362.13
        mov       edi, esi                                      ;362.13
        adc       eax, 0                                        ;362.13
        sub       edi, ebx                                      ;362.13
        mov       edi, eax                                      ;362.13
        sbb       edi, ecx                                      ;362.13
        jb        .B3.46        ; Prob 93%                      ;362.13
                                ; LOE eax edx ecx ebx esi xmm0 xmm1
.B3.47:                         ; Preds .B3.46
        mov       ebx, DWORD PTR [263268+esp]                   ;
        mov       ecx, DWORD PTR [263264+esp]                   ;
        jmp       .B3.49        ; Prob 100%                     ;
                                ; LOE ecx ebx xmm0 xmm1
.B3.48:                         ; Preds .B3.25
        mov       DWORD PTR [263204+esp], ecx                   ;415.13
        mov       DWORD PTR [263200+esp], 0                     ;413.15
                                ; LOE ecx ebx xmm0 xmm1
.B3.49:                         ; Preds .B3.47 .B3.48
        xor       eax, eax                                      ;364.15
        lea       esi, DWORD PTR [16+esp]                       ;364.15
        shl       ecx, 7                                        ;364.15
        xor       edi, edi                                      ;364.15
        mov       DWORD PTR [263268+esp], ebx                   ;364.15
        add       ecx, esi                                      ;364.15
        xor       esi, esi                                      ;364.15
        mov       edx, 16                                       ;364.15
                                ; LOE eax edx ecx esi edi xmm0 xmm1
.B3.50:                         ; Preds .B3.50 .B3.49
        mov       ebx, DWORD PTR [262432+esp+edi*8]             ;364.15
        or        ebx, DWORD PTR [32768+ecx+edi*8]              ;364.15
        mov       DWORD PTR [262304+esp+edi*8], ebx             ;364.15
        mov       ebx, DWORD PTR [262436+esp+edi*8]             ;364.15
        or        ebx, DWORD PTR [32772+ecx+edi*8]              ;364.15
        mov       DWORD PTR [262308+esp+edi*8], ebx             ;364.15
        add       edi, 1                                        ;364.15
        mov       ebx, edi                                      ;364.15
        adc       esi, 0                                        ;364.15
        sub       ebx, edx                                      ;364.15
        mov       ebx, esi                                      ;364.15
        sbb       ebx, eax                                      ;364.15
        jb        .B3.50        ; Prob 93%                      ;364.15
                                ; LOE eax edx ecx esi edi xmm0 xmm1
.B3.51:                         ; Preds .B3.50
        mov       ebx, DWORD PTR [263268+esp]                   ;
        jmp       .B3.53        ; Prob 100%                     ;
                                ; LOE ebx xmm0 xmm1
.B3.52:                         ; Preds .B3.24
        mov       DWORD PTR [263200+esp], ebx                   ;413.15
                                ; LOE ebx xmm0 xmm1
.B3.53:                         ; Preds .B3.51 .B3.52
        shl       ebx, 7                                        ;366.17
        lea       esi, DWORD PTR [16+esp]                       ;366.17
        xor       eax, eax                                      ;366.17
        add       ebx, esi                                      ;366.17
        xor       esi, esi                                      ;366.17
        mov       ecx, 16                                       ;366.17
        xor       edx, edx                                      ;366.17
                                ; LOE eax edx ecx ebx esi xmm0 xmm1
.B3.54:                         ; Preds .B3.54 .B3.53
        mov       edi, DWORD PTR [262304+esp+esi*8]             ;366.17
        or        edi, DWORD PTR [ebx+esi*8]                    ;366.17
        mov       DWORD PTR [262176+esp+esi*8], edi             ;366.17
        mov       edi, DWORD PTR [262308+esp+esi*8]             ;366.17
        or        edi, DWORD PTR [4+ebx+esi*8]                  ;366.17
        mov       DWORD PTR [262180+esp+esi*8], edi             ;366.17
        add       esi, 1                                        ;366.17
        mov       edi, esi                                      ;366.17
        adc       edx, 0                                        ;366.17
        sub       edi, ecx                                      ;366.17
        mov       edi, edx                                      ;366.17
        sbb       edi, eax                                      ;366.17
        jb        .B3.54        ; Prob 93%                      ;366.17
        jmp       .B3.21        ; Prob 100%                     ;366.17
                                ; LOE eax edx ecx ebx esi xmm0 xmm1
.B3.56:                         ; Preds .B3.22                  ; Infreq
        xor       eax, eax                                      ;401.26
        mov       esi, 7                                        ;401.26
        xor       edi, edi                                      ;401.26
        xor       edx, edx                                      ;401.26
        mov       ebx, DWORD PTR [8+ebp]                        ;401.26
        xor       ecx, ecx                                      ;401.26
                                ; LOE edx ecx ebx esi edi
.B3.57:                         ; Preds .B3.58 .B3.56           ; Infreq
        mov       eax, DWORD PTR [263200+esp+edi*4]             ;402.27
        cmp       eax, -1                                       ;402.39
        je        .B3.60        ; Prob 20%                      ;402.39
                                ; LOE eax edx ecx ebx esi edi
.B3.58:                         ; Preds .B3.57                  ; Infreq
        movzx     eax, BYTE PTR [eax+ebx]                       ;403.35
        mov       BYTE PTR [280+edi+ebx], al                    ;403.23
        add       edi, 1                                        ;401.42
        mov       eax, edi                                      ;401.33
        adc       ecx, 0                                        ;401.42
        sub       eax, esi                                      ;401.33
        mov       eax, ecx                                      ;401.33
        sbb       eax, edx                                      ;401.33
        jb        .B3.57        ; Prob 85%                      ;401.33
                                ; LOE edx ecx ebx esi edi
.B3.60:                         ; Preds .B3.57 .B3.58           ; Infreq
        mov       eax, 1                                        ;405.28
        add       esp, 263316                                   ;405.28
        pop       ebx                                           ;405.28
        pop       edi                                           ;405.28
        pop       esi                                           ;405.28
        mov       esp, ebp                                      ;405.28
        pop       ebp                                           ;405.28
        ret                                                     ;405.28
                                ; LOE
.B3.62:                         ; Preds .B3.30 .B3.23           ; Infreq
        xor       eax, eax                                      ;409.46
        add       esp, 263316                                   ;409.46
        pop       ebx                                           ;409.46
        pop       edi                                           ;409.46
        pop       esi                                           ;409.46
        mov       esp, ebp                                      ;409.46
        pop       ebp                                           ;409.46
        ret                                                     ;409.46
        ALIGN     16
                                ; LOE
; mark_end;
_crack_thread ENDP
;_crack_thread	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _crack_thread
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _DES_set_key_unchecked
TXTST3:
; -- Begin  _DES_set_key_unchecked
;_DES_set_key_unchecked	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _DES_set_key_unchecked
; mark_begin;
       ALIGN     16
_DES_set_key_unchecked	PROC NEAR PRIVATE
; parameter 1: eax
; parameter 2: edx
.B4.1:                          ; Preds .B4.0
        push      esi                                           ;371.1
        push      edi                                           ;371.1
        push      ebx                                           ;371.1
        push      ebp                                           ;371.1
        movzx     ecx, BYTE PTR [1+eax]                         ;386.5
        shl       ecx, 8                                        ;386.5
        movzx     edi, BYTE PTR [eax]                           ;386.5
        movzx     ebx, BYTE PTR [2+eax]                         ;386.5
        or        edi, ecx                                      ;386.5
        movzx     ebp, BYTE PTR [5+eax]                         ;387.5
        shl       ebx, 16                                       ;386.5
        shl       ebp, 8                                        ;387.5
        or        edi, ebx                                      ;386.5
        movzx     ebx, BYTE PTR [4+eax]                         ;387.5
        movzx     ecx, BYTE PTR [6+eax]                         ;387.5
        or        ebx, ebp                                      ;387.5
        shl       ecx, 16                                       ;387.5
        movzx     esi, BYTE PTR [3+eax]                         ;386.5
        or        ebx, ecx                                      ;387.5
        movzx     eax, BYTE PTR [7+eax]                         ;387.5
        shl       eax, 24                                       ;387.5
        or        ebx, eax                                      ;387.5
        shl       esi, 24                                       ;386.5
        mov       ecx, ebx                                      ;393.5
        shr       ecx, 4                                        ;393.5
        or        edi, esi                                      ;386.5
        xor       ecx, edi                                      ;393.5
        and       ecx, 252645135                                ;393.5
        xor       edi, ecx                                      ;393.5
        shl       ecx, 4                                        ;393.5
        mov       esi, edi                                      ;394.5
        xor       ebx, ecx                                      ;393.5
        mov       ebp, ebx                                      ;395.5
        shl       ebp, 18                                       ;395.5
        xor       ebp, ebx                                      ;395.5
        shl       esi, 18                                       ;394.5
        and       ebp, -859045888                               ;395.5
        xor       esi, edi                                      ;394.5
        xor       ebx, ebp                                      ;395.5
        shr       ebp, 18                                       ;395.5
        and       esi, -859045888                               ;394.5
        xor       ebx, ebp                                      ;395.5
        xor       edi, esi                                      ;394.5
        shr       esi, 18                                       ;394.5
        mov       eax, ebx                                      ;396.5
        shr       eax, 1                                        ;396.5
        xor       edi, esi                                      ;394.5
        xor       eax, edi                                      ;396.5
        and       eax, 1431655765                               ;396.5
        xor       edi, eax                                      ;396.5
        add       eax, eax                                      ;396.5
        mov       ecx, edi                                      ;397.5
        xor       ebx, eax                                      ;396.5
        shr       ecx, 8                                        ;397.5
        xor       ecx, ebx                                      ;397.5
        and       ecx, 16711935                                 ;397.5
        xor       ebx, ecx                                      ;397.5
        shl       ecx, 8                                        ;397.5
        mov       esi, ebx                                      ;398.5
        shr       esi, 1                                        ;398.5
        xor       edi, ecx                                      ;397.5
        xor       esi, edi                                      ;398.5
        and       esi, 1431655765                               ;398.5
        xor       edi, esi                                      ;398.5
        add       esi, esi                                      ;398.5
        xor       ebx, esi                                      ;398.5
        movzx     esi, bl                                       ;399.16
        mov       eax, ebx                                      ;399.44
        shl       esi, 16                                       ;399.32
        and       eax, 65280                                    ;399.44
        and       ebx, 16711680                                 ;400.16
        or        esi, eax                                      ;399.44
        shr       ebx, 16                                       ;400.32
        or        esi, ebx                                      ;400.32
        mov       ebx, edi                                      ;400.45
        and       edi, 268435455                                ;401.5
        and       ebx, -268435456                               ;400.45
        mov       ecx, edi                                      ;408.24
        shr       ecx, 1                                        ;408.24
        shl       edi, 27                                       ;408.36
        shr       ebx, 4                                        ;400.61
        or        ecx, edi                                      ;408.36
        or        esi, ebx                                      ;400.61
        and       ecx, 268435455                                ;411.9
        mov       ebx, esi                                      ;409.24
        mov       edi, ecx                                      ;417.30
        shr       ebx, 1                                        ;409.24
        and       edi, 63                                       ;417.30
        shl       esi, 27                                       ;409.36
        mov       ebp, ecx                                      ;418.31
        or        ebx, esi                                      ;409.36
        mov       esi, ecx                                      ;418.52
        shr       ebp, 6                                        ;418.31
        and       ebx, 268435455                                ;412.9
        shr       esi, 7                                        ;418.52
        and       ebp, 3                                        ;418.37
        and       esi, 60                                       ;418.58
        mov       eax, DWORD PTR [_des_skb+edi*4]               ;417.13
        or        ebp, esi                                      ;418.58
        mov       edi, ecx                                      ;419.31
        mov       esi, ecx                                      ;419.53
        shr       edi, 13                                       ;419.31
        shr       esi, 14                                       ;419.53
        and       edi, 15                                       ;419.38
        and       esi, 48                                       ;419.60
        or        edi, esi                                      ;419.60
        mov       esi, ecx                                      ;420.53
        or        eax, DWORD PTR [_des_skb+256+ebp*4]           ;418.13
        mov       ebp, ecx                                      ;421.31
        shr       esi, 21                                       ;420.53
        shr       ebp, 22                                       ;421.31
        and       esi, 6                                        ;420.60
        or        eax, DWORD PTR [_des_skb+512+edi*4]           ;419.13
        mov       edi, ecx                                      ;420.31
        shr       edi, 20                                       ;420.31
        and       ebp, 56                                       ;421.38
        and       edi, 1                                        ;420.38
        or        edi, esi                                      ;420.60
        mov       esi, ebx                                      ;422.30
        or        edi, ebp                                      ;421.38
        and       esi, 63                                       ;422.30
        or        eax, DWORD PTR [_des_skb+768+edi*4]           ;420.13
        mov       edi, ebx                                      ;423.52
        mov       ebp, DWORD PTR [_des_skb+1024+esi*4]          ;422.13
        mov       esi, ebx                                      ;423.31
        shr       esi, 7                                        ;423.31
        shr       edi, 8                                        ;423.52
        and       esi, 3                                        ;423.37
        and       edi, 60                                       ;423.58
        or        esi, edi                                      ;423.58
        mov       edi, ebx                                      ;424.30
        shr       edi, 15                                       ;424.30
        and       edi, 63                                       ;424.37
        or        ebp, DWORD PTR [_des_skb+1280+esi*4]          ;423.13
        mov       esi, ebx                                      ;425.53
        shr       esi, 22                                       ;425.53
        or        ebp, DWORD PTR [_des_skb+1536+edi*4]          ;424.13
        mov       edi, ebx                                      ;425.31
        shr       edi, 21                                       ;425.31
        and       esi, 48                                       ;425.60
        and       edi, 15                                       ;425.38
        or        edi, esi                                      ;425.60
        movzx     esi, ax                                       ;429.18
        shr       eax, 16                                       ;432.18
        or        ebp, DWORD PTR [_des_skb+1792+edi*4]          ;425.13
        mov       edi, ebp                                      ;429.18
        and       ebp, -65536                                   ;432.18
        or        eax, ebp                                      ;432.18
        mov       ebp, ecx                                      ;408.24
        shr       ebp, 1                                        ;408.24
        shl       ecx, 27                                       ;408.36
        or        ebp, ecx                                      ;408.36
        and       ebp, 268435455                                ;411.9
        ror       eax, 26                                       ;432.18
        mov       ecx, ebp                                      ;418.31
        shl       edi, 16                                       ;429.18
        mov       DWORD PTR [4+edx], eax                        ;432.11
        mov       eax, ebp                                      ;418.52
        shr       ecx, 6                                        ;418.31
        or        edi, esi                                      ;429.18
        shr       eax, 7                                        ;418.52
        mov       esi, ebx                                      ;409.24
        shr       esi, 1                                        ;409.24
        and       ecx, 3                                        ;418.37
        shl       ebx, 27                                       ;409.36
        and       eax, 60                                       ;418.58
        ror       edi, 30                                       ;429.18
        or        esi, ebx                                      ;409.36
        mov       DWORD PTR [edx], edi                          ;429.11
        mov       ebx, ebp                                      ;417.30
        or        ecx, eax                                      ;418.58
        mov       edi, ebp                                      ;419.31
        mov       eax, ebp                                      ;419.53
        and       ebx, 63                                       ;417.30
        shr       edi, 13                                       ;419.31
        and       esi, 268435455                                ;412.9
        shr       eax, 14                                       ;419.53
        and       edi, 15                                       ;419.38
        and       eax, 48                                       ;419.60
        or        edi, eax                                      ;419.60
        mov       eax, ebp                                      ;420.53
        mov       ebx, DWORD PTR [_des_skb+ebx*4]               ;417.13
        or        ebx, DWORD PTR [_des_skb+256+ecx*4]           ;418.13
        mov       ecx, ebp                                      ;421.31
        shr       eax, 21                                       ;420.53
        or        ebx, DWORD PTR [_des_skb+512+edi*4]           ;419.13
        mov       edi, ebp                                      ;420.31
        shr       edi, 20                                       ;420.31
        and       eax, 6                                        ;420.60
        shr       ecx, 22                                       ;421.31
        and       edi, 1                                        ;420.38
        or        edi, eax                                      ;420.60
        and       ecx, 56                                       ;421.38
        mov       eax, esi                                      ;422.30
        or        edi, ecx                                      ;421.38
        and       eax, 63                                       ;422.30
        mov       ecx, esi                                      ;423.52
        shr       ecx, 8                                        ;423.52
        and       ecx, 60                                       ;423.58
        or        ebx, DWORD PTR [_des_skb+768+edi*4]           ;420.13
        mov       edi, DWORD PTR [_des_skb+1024+eax*4]          ;422.13
        mov       eax, esi                                      ;423.31
        shr       eax, 7                                        ;423.31
        and       eax, 3                                        ;423.37
        or        eax, ecx                                      ;423.58
        mov       ecx, esi                                      ;424.30
        shr       ecx, 15                                       ;424.30
        and       ecx, 63                                       ;424.37
        or        edi, DWORD PTR [_des_skb+1280+eax*4]          ;423.13
        mov       eax, esi                                      ;425.53
        shr       eax, 22                                       ;425.53
        or        edi, DWORD PTR [_des_skb+1536+ecx*4]          ;424.13
        mov       ecx, esi                                      ;425.31
        shr       ecx, 21                                       ;425.31
        and       eax, 48                                       ;425.60
        and       ecx, 15                                       ;425.38
        or        ecx, eax                                      ;425.60
        movzx     eax, bx                                       ;429.18
        shr       ebx, 16                                       ;432.18
        or        edi, DWORD PTR [_des_skb+1792+ecx*4]          ;425.13
        mov       ecx, edi                                      ;429.18
        and       edi, -65536                                   ;432.18
        or        ebx, edi                                      ;432.18
        mov       edi, ebp                                      ;405.24
        shr       edi, 2                                        ;405.24
        shl       ebp, 26                                       ;405.36
        or        edi, ebp                                      ;405.36
        mov       ebp, esi                                      ;406.24
        and       edi, 268435455                                ;411.9
        shl       ecx, 16                                       ;429.18
        ror       ebx, 26                                       ;432.18
        or        ecx, eax                                      ;429.18
        mov       DWORD PTR [12+edx], ebx                       ;432.11
        mov       ebx, edi                                      ;417.30
        and       ebx, 63                                       ;417.30
        mov       eax, edi                                      ;418.52
        ror       ecx, 30                                       ;429.18
        mov       DWORD PTR [8+edx], ecx                        ;429.11
        mov       ecx, edi                                      ;418.31
        shr       ecx, 6                                        ;418.31
        shr       eax, 7                                        ;418.52
        and       ecx, 3                                        ;418.37
        shr       ebp, 2                                        ;406.24
        and       eax, 60                                       ;418.58
        shl       esi, 26                                       ;406.36
        or        ecx, eax                                      ;418.58
        or        ebp, esi                                      ;406.36
        mov       eax, edi                                      ;419.31
        mov       esi, DWORD PTR [_des_skb+ebx*4]               ;417.13
        mov       ebx, edi                                      ;419.53
        shr       eax, 13                                       ;419.31
        and       ebp, 268435455                                ;412.9
        shr       ebx, 14                                       ;419.53
        and       eax, 15                                       ;419.38
        and       ebx, 48                                       ;419.60
        or        eax, ebx                                      ;419.60
        mov       ebx, edi                                      ;420.53
        or        esi, DWORD PTR [_des_skb+256+ecx*4]           ;418.13
        mov       ecx, edi                                      ;421.31
        shr       ebx, 21                                       ;420.53
        shr       ecx, 22                                       ;421.31
        and       ebx, 6                                        ;420.60
        or        esi, DWORD PTR [_des_skb+512+eax*4]           ;419.13
        mov       eax, edi                                      ;420.31
        shr       eax, 20                                       ;420.31
        and       ecx, 56                                       ;421.38
        and       eax, 1                                        ;420.38
        or        eax, ebx                                      ;420.60
        mov       ebx, ebp                                      ;422.30
        or        eax, ecx                                      ;421.38
        and       ebx, 63                                       ;422.30
        or        esi, DWORD PTR [_des_skb+768+eax*4]           ;420.13
        mov       eax, ebp                                      ;423.52
        mov       ecx, DWORD PTR [_des_skb+1024+ebx*4]          ;422.13
        mov       ebx, ebp                                      ;423.31
        shr       ebx, 7                                        ;423.31
        shr       eax, 8                                        ;423.52
        and       ebx, 3                                        ;423.37
        and       eax, 60                                       ;423.58
        or        ebx, eax                                      ;423.58
        mov       eax, ebp                                      ;424.30
        shr       eax, 15                                       ;424.30
        and       eax, 63                                       ;424.37
        or        ecx, DWORD PTR [_des_skb+1280+ebx*4]          ;423.13
        mov       ebx, ebp                                      ;425.53
        shr       ebx, 22                                       ;425.53
        or        ecx, DWORD PTR [_des_skb+1536+eax*4]          ;424.13
        mov       eax, ebp                                      ;425.31
        shr       eax, 21                                       ;425.31
        and       ebx, 48                                       ;425.60
        and       eax, 15                                       ;425.38
        or        eax, ebx                                      ;425.60
        movzx     ebx, si                                       ;429.18
        shr       esi, 16                                       ;432.18
        or        ecx, DWORD PTR [_des_skb+1792+eax*4]          ;425.13
        mov       eax, ecx                                      ;429.18
        and       ecx, -65536                                   ;432.18
        or        esi, ecx                                      ;432.18
        mov       ecx, ebp                                      ;406.24
        ror       esi, 26                                       ;432.18
        mov       DWORD PTR [20+edx], esi                       ;432.11
        mov       esi, edi                                      ;405.24
        shr       esi, 2                                        ;405.24
        shl       edi, 26                                       ;405.36
        or        esi, edi                                      ;405.36
        shr       ecx, 2                                        ;406.24
        and       esi, 268435455                                ;411.9
        shl       ebp, 26                                       ;406.36
        mov       edi, esi                                      ;418.31
        shl       eax, 16                                       ;429.18
        or        ecx, ebp                                      ;406.36
        mov       ebp, esi                                      ;417.30
        or        eax, ebx                                      ;429.18
        and       ebp, 63                                       ;417.30
        and       ecx, 268435455                                ;412.9
        ror       eax, 30                                       ;429.18
        mov       DWORD PTR [16+edx], eax                       ;429.11
        mov       eax, esi                                      ;418.52
        shr       edi, 6                                        ;418.31
        shr       eax, 7                                        ;418.52
        and       edi, 3                                        ;418.37
        and       eax, 60                                       ;418.58
        mov       ebx, DWORD PTR [_des_skb+ebp*4]               ;417.13
        or        edi, eax                                      ;418.58
        mov       ebp, esi                                      ;419.31
        mov       eax, esi                                      ;419.53
        shr       ebp, 13                                       ;419.31
        shr       eax, 14                                       ;419.53
        and       ebp, 15                                       ;419.38
        and       eax, 48                                       ;419.60
        or        ebp, eax                                      ;419.60
        mov       eax, esi                                      ;420.53
        or        ebx, DWORD PTR [_des_skb+256+edi*4]           ;418.13
        mov       edi, esi                                      ;421.31
        shr       eax, 21                                       ;420.53
        shr       edi, 22                                       ;421.31
        and       eax, 6                                        ;420.60
        or        ebx, DWORD PTR [_des_skb+512+ebp*4]           ;419.13
        mov       ebp, esi                                      ;420.31
        shr       ebp, 20                                       ;420.31
        and       edi, 56                                       ;421.38
        and       ebp, 1                                        ;420.38
        or        ebp, eax                                      ;420.60
        mov       eax, ecx                                      ;422.30
        or        ebp, edi                                      ;421.38
        mov       edi, ecx                                      ;423.52
        shr       edi, 8                                        ;423.52
        and       eax, 63                                       ;422.30
        and       edi, 60                                       ;423.58
        or        ebx, DWORD PTR [_des_skb+768+ebp*4]           ;420.13
        mov       ebp, ecx                                      ;423.31
        shr       ebp, 7                                        ;423.31
        and       ebp, 3                                        ;423.37
        or        ebp, edi                                      ;423.58
        mov       edi, ecx                                      ;424.30
        shr       edi, 15                                       ;424.30
        and       edi, 63                                       ;424.37
        mov       eax, DWORD PTR [_des_skb+1024+eax*4]          ;422.13
        or        eax, DWORD PTR [_des_skb+1280+ebp*4]          ;423.13
        mov       ebp, ecx                                      ;425.53
        shr       ebp, 22                                       ;425.53
        or        eax, DWORD PTR [_des_skb+1536+edi*4]          ;424.13
        mov       edi, ecx                                      ;425.31
        shr       edi, 21                                       ;425.31
        and       ebp, 48                                       ;425.60
        and       edi, 15                                       ;425.38
        or        edi, ebp                                      ;425.60
        movzx     ebp, bx                                       ;429.18
        shr       ebx, 16                                       ;432.18
        or        eax, DWORD PTR [_des_skb+1792+edi*4]          ;425.13
        mov       edi, eax                                      ;429.18
        and       eax, -65536                                   ;432.18
        or        ebx, eax                                      ;432.18
        mov       eax, ecx                                      ;406.24
        ror       ebx, 26                                       ;432.18
        mov       DWORD PTR [28+edx], ebx                       ;432.11
        mov       ebx, esi                                      ;405.24
        shr       ebx, 2                                        ;405.24
        shl       esi, 26                                       ;405.36
        or        ebx, esi                                      ;405.36
        and       ebx, 268435455                                ;411.9
        shl       edi, 16                                       ;429.18
        mov       esi, ebx                                      ;417.30
        or        edi, ebp                                      ;429.18
        and       esi, 63                                       ;417.30
        ror       edi, 30                                       ;429.18
        mov       ebp, ebx                                      ;418.52
        mov       DWORD PTR [24+edx], edi                       ;429.11
        mov       edi, ebx                                      ;418.31
        shr       edi, 6                                        ;418.31
        shr       ebp, 7                                        ;418.52
        and       edi, 3                                        ;418.37
        shr       eax, 2                                        ;406.24
        and       ebp, 60                                       ;418.58
        shl       ecx, 26                                       ;406.36
        or        edi, ebp                                      ;418.58
        or        eax, ecx                                      ;406.36
        mov       ebp, ebx                                      ;419.31
        mov       ecx, DWORD PTR [_des_skb+esi*4]               ;417.13
        mov       esi, ebx                                      ;419.53
        shr       ebp, 13                                       ;419.31
        and       eax, 268435455                                ;412.9
        shr       esi, 14                                       ;419.53
        and       ebp, 15                                       ;419.38
        and       esi, 48                                       ;419.60
        or        ebp, esi                                      ;419.60
        mov       esi, ebx                                      ;420.53
        or        ecx, DWORD PTR [_des_skb+256+edi*4]           ;418.13
        mov       edi, ebx                                      ;421.31
        shr       esi, 21                                       ;420.53
        shr       edi, 22                                       ;421.31
        and       esi, 6                                        ;420.60
        or        ecx, DWORD PTR [_des_skb+512+ebp*4]           ;419.13
        mov       ebp, ebx                                      ;420.31
        shr       ebp, 20                                       ;420.31
        and       edi, 56                                       ;421.38
        and       ebp, 1                                        ;420.38
        or        ebp, esi                                      ;420.60
        mov       esi, eax                                      ;422.30
        or        ebp, edi                                      ;421.38
        mov       edi, eax                                      ;423.52
        shr       edi, 8                                        ;423.52
        and       esi, 63                                       ;422.30
        and       edi, 60                                       ;423.58
        or        ecx, DWORD PTR [_des_skb+768+ebp*4]           ;420.13
        mov       ebp, eax                                      ;423.31
        shr       ebp, 7                                        ;423.31
        and       ebp, 3                                        ;423.37
        or        ebp, edi                                      ;423.58
        mov       edi, eax                                      ;424.30
        shr       edi, 15                                       ;424.30
        and       edi, 63                                       ;424.37
        mov       esi, DWORD PTR [_des_skb+1024+esi*4]          ;422.13
        or        esi, DWORD PTR [_des_skb+1280+ebp*4]          ;423.13
        mov       ebp, eax                                      ;425.53
        shr       ebp, 22                                       ;425.53
        or        esi, DWORD PTR [_des_skb+1536+edi*4]          ;424.13
        mov       edi, eax                                      ;425.31
        shr       edi, 21                                       ;425.31
        and       ebp, 48                                       ;425.60
        and       edi, 15                                       ;425.38
        or        edi, ebp                                      ;425.60
        movzx     ebp, cx                                       ;429.18
        shr       ecx, 16                                       ;432.18
        or        esi, DWORD PTR [_des_skb+1792+edi*4]          ;425.13
        mov       edi, esi                                      ;429.18
        and       esi, -65536                                   ;432.18
        or        ecx, esi                                      ;432.18
        ror       ecx, 26                                       ;432.18
        mov       DWORD PTR [36+edx], ecx                       ;432.11
        mov       ecx, ebx                                      ;405.24
        shl       edi, 16                                       ;429.18
        shr       ecx, 2                                        ;405.24
        or        edi, ebp                                      ;429.18
        shl       ebx, 26                                       ;405.36
        or        ecx, ebx                                      ;405.36
        mov       ebx, eax                                      ;406.24
        ror       edi, 30                                       ;429.18
        and       ecx, 268435455                                ;411.9
        mov       DWORD PTR [32+edx], edi                       ;429.11
        shr       ebx, 2                                        ;406.24
        shl       eax, 26                                       ;406.36
                                ; LOE eax edx ecx ebx
.B4.5:                          ; Preds .B4.1
        or        ebx, eax                                      ;406.36
        mov       eax, ecx                                      ;417.30
        and       eax, 63                                       ;417.30
        mov       edi, ecx                                      ;418.31
        mov       ebp, ecx                                      ;418.52
        and       ebx, 268435455                                ;412.9
        shr       edi, 6                                        ;418.31
        shr       ebp, 7                                        ;418.52
        and       edi, 3                                        ;418.37
        and       ebp, 60                                       ;418.58
        mov       esi, DWORD PTR [_des_skb+eax*4]               ;417.13
        or        edi, ebp                                      ;418.58
        mov       ebp, ecx                                      ;419.31
        mov       eax, ecx                                      ;419.53
        shr       ebp, 13                                       ;419.31
        shr       eax, 14                                       ;419.53
        and       ebp, 15                                       ;419.38
        and       eax, 48                                       ;419.60
        or        ebp, eax                                      ;419.60
        mov       eax, ecx                                      ;420.53
        or        esi, DWORD PTR [_des_skb+256+edi*4]           ;418.13
        mov       edi, ecx                                      ;421.31
        shr       eax, 21                                       ;420.53
        shr       edi, 22                                       ;421.31
        and       eax, 6                                        ;420.60
        or        esi, DWORD PTR [_des_skb+512+ebp*4]           ;419.13
        mov       ebp, ecx                                      ;420.31
        shr       ebp, 20                                       ;420.31
        and       edi, 56                                       ;421.38
        and       ebp, 1                                        ;420.38
        or        ebp, eax                                      ;420.60
        mov       eax, ebx                                      ;422.30
        or        ebp, edi                                      ;421.38
        mov       edi, ebx                                      ;423.52
        shr       edi, 8                                        ;423.52
        and       eax, 63                                       ;422.30
        and       edi, 60                                       ;423.58
        or        esi, DWORD PTR [_des_skb+768+ebp*4]           ;420.13
        mov       ebp, ebx                                      ;423.31
        shr       ebp, 7                                        ;423.31
        and       ebp, 3                                        ;423.37
        or        ebp, edi                                      ;423.58
        mov       edi, ebx                                      ;424.30
        shr       edi, 15                                       ;424.30
        and       edi, 63                                       ;424.37
        mov       eax, DWORD PTR [_des_skb+1024+eax*4]          ;422.13
        or        eax, DWORD PTR [_des_skb+1280+ebp*4]          ;423.13
        mov       ebp, ebx                                      ;425.53
        shr       ebp, 22                                       ;425.53
        or        eax, DWORD PTR [_des_skb+1536+edi*4]          ;424.13
        mov       edi, ebx                                      ;425.31
        shr       edi, 21                                       ;425.31
        and       ebp, 48                                       ;425.60
        and       edi, 15                                       ;425.38
        or        edi, ebp                                      ;425.60
        movzx     ebp, si                                       ;429.18
        shr       esi, 16                                       ;432.18
        or        eax, DWORD PTR [_des_skb+1792+edi*4]          ;425.13
        mov       edi, eax                                      ;429.18
        and       eax, -65536                                   ;432.18
        or        esi, eax                                      ;432.18
        mov       eax, ecx                                      ;405.24
        shr       eax, 2                                        ;405.24
        shl       ecx, 26                                       ;405.36
        or        eax, ecx                                      ;405.36
        mov       ecx, ebx                                      ;406.24
        shr       ecx, 2                                        ;406.24
        and       eax, 268435455                                ;411.9
        shl       ebx, 26                                       ;406.36
        shl       edi, 16                                       ;429.18
        or        ecx, ebx                                      ;406.36
        mov       ebx, eax                                      ;417.30
        or        edi, ebp                                      ;429.18
        and       ebx, 63                                       ;417.30
        and       ecx, 268435455                                ;412.9
        ror       edi, 30                                       ;429.18
        ror       esi, 26                                       ;432.18
        mov       DWORD PTR [40+edx], edi                       ;429.11
        mov       edi, eax                                      ;418.31
        mov       DWORD PTR [44+edx], esi                       ;432.11
        mov       esi, eax                                      ;418.52
        shr       edi, 6                                        ;418.31
        shr       esi, 7                                        ;418.52
        and       edi, 3                                        ;418.37
        and       esi, 60                                       ;418.58
        mov       ebp, DWORD PTR [_des_skb+ebx*4]               ;417.13
        or        edi, esi                                      ;418.58
        mov       esi, eax                                      ;419.31
        mov       ebx, eax                                      ;419.53
        shr       esi, 13                                       ;419.31
        shr       ebx, 14                                       ;419.53
        and       esi, 15                                       ;419.38
        and       ebx, 48                                       ;419.60
        or        esi, ebx                                      ;419.60
        mov       ebx, eax                                      ;420.53
        or        ebp, DWORD PTR [_des_skb+256+edi*4]           ;418.13
        mov       edi, eax                                      ;421.31
        shr       ebx, 21                                       ;420.53
        shr       edi, 22                                       ;421.31
        and       ebx, 6                                        ;420.60
        or        ebp, DWORD PTR [_des_skb+512+esi*4]           ;419.13
        mov       esi, eax                                      ;420.31
        shr       esi, 20                                       ;420.31
        and       edi, 56                                       ;421.38
        and       esi, 1                                        ;420.38
        or        esi, ebx                                      ;420.60
        mov       ebx, ecx                                      ;422.30
        or        esi, edi                                      ;421.38
        mov       edi, ecx                                      ;423.52
        shr       edi, 8                                        ;423.52
        and       ebx, 63                                       ;422.30
        and       edi, 60                                       ;423.58
        or        ebp, DWORD PTR [_des_skb+768+esi*4]           ;420.13
        mov       esi, ecx                                      ;423.31
        shr       esi, 7                                        ;423.31
        and       esi, 3                                        ;423.37
        or        esi, edi                                      ;423.58
        mov       edi, ecx                                      ;424.30
        shr       edi, 15                                       ;424.30
        and       edi, 63                                       ;424.37
        mov       ebx, DWORD PTR [_des_skb+1024+ebx*4]          ;422.13
        or        ebx, DWORD PTR [_des_skb+1280+esi*4]          ;423.13
        mov       esi, ecx                                      ;425.53
        shr       esi, 22                                       ;425.53
        or        ebx, DWORD PTR [_des_skb+1536+edi*4]          ;424.13
        mov       edi, ecx                                      ;425.31
        shr       edi, 21                                       ;425.31
        and       esi, 48                                       ;425.60
        and       edi, 15                                       ;425.38
        or        edi, esi                                      ;425.60
        movzx     esi, bp                                       ;429.18
        shr       ebp, 16                                       ;432.18
        or        ebx, DWORD PTR [_des_skb+1792+edi*4]          ;425.13
        mov       edi, ebx                                      ;429.18
        and       ebx, -65536                                   ;432.18
        or        ebp, ebx                                      ;432.18
        mov       ebx, eax                                      ;405.24
        shr       ebx, 2                                        ;405.24
        shl       eax, 26                                       ;405.36
        ror       ebp, 26                                       ;432.18
        or        ebx, eax                                      ;405.36
        mov       DWORD PTR [52+edx], ebp                       ;432.11
        mov       ebp, ecx                                      ;406.24
        shr       ebp, 2                                        ;406.24
        and       ebx, 268435455                                ;411.9
        shl       ecx, 26                                       ;406.36
        mov       eax, ebx                                      ;418.52
        or        ebp, ecx                                      ;406.36
        mov       ecx, ebx                                      ;417.30
        shl       edi, 16                                       ;429.18
        and       ecx, 63                                       ;417.30
        or        edi, esi                                      ;429.18
        mov       esi, ebx                                      ;418.31
        shr       esi, 6                                        ;418.31
        and       ebp, 268435455                                ;412.9
        shr       eax, 7                                        ;418.52
        and       esi, 3                                        ;418.37
        and       eax, 60                                       ;418.58
        ror       edi, 30                                       ;429.18
        or        esi, eax                                      ;418.58
        mov       DWORD PTR [48+edx], edi                       ;429.11
        mov       eax, ebx                                      ;419.53
        mov       edi, DWORD PTR [_des_skb+ecx*4]               ;417.13
        mov       ecx, ebx                                      ;419.31
        shr       ecx, 13                                       ;419.31
        shr       eax, 14                                       ;419.53
        and       ecx, 15                                       ;419.38
        and       eax, 48                                       ;419.60
        or        ecx, eax                                      ;419.60
        mov       eax, ebx                                      ;420.53
        or        edi, DWORD PTR [_des_skb+256+esi*4]           ;418.13
        mov       esi, ebx                                      ;421.31
        shr       eax, 21                                       ;420.53
        shr       esi, 22                                       ;421.31
        and       eax, 6                                        ;420.60
        or        edi, DWORD PTR [_des_skb+512+ecx*4]           ;419.13
        mov       ecx, ebx                                      ;420.31
        shr       ecx, 20                                       ;420.31
        and       esi, 56                                       ;421.38
        and       ecx, 1                                        ;420.38
        or        ecx, eax                                      ;420.60
        mov       eax, ebp                                      ;422.30
        or        ecx, esi                                      ;421.38
        and       eax, 63                                       ;422.30
        or        edi, DWORD PTR [_des_skb+768+ecx*4]           ;420.13
        mov       ecx, ebp                                      ;423.52
        mov       esi, DWORD PTR [_des_skb+1024+eax*4]          ;422.13
        mov       eax, ebp                                      ;423.31
        shr       eax, 7                                        ;423.31
        shr       ecx, 8                                        ;423.52
        and       eax, 3                                        ;423.37
        and       ecx, 60                                       ;423.58
        or        eax, ecx                                      ;423.58
        mov       ecx, ebp                                      ;424.30
        shr       ecx, 15                                       ;424.30
        and       ecx, 63                                       ;424.37
        or        esi, DWORD PTR [_des_skb+1280+eax*4]          ;423.13
        mov       eax, ebp                                      ;425.53
        shr       eax, 22                                       ;425.53
        or        esi, DWORD PTR [_des_skb+1536+ecx*4]          ;424.13
        mov       ecx, ebp                                      ;425.31
        shr       ecx, 21                                       ;425.31
        and       eax, 48                                       ;425.60
        and       ecx, 15                                       ;425.38
        or        ecx, eax                                      ;425.60
        movzx     eax, di                                       ;429.18
        shr       edi, 16                                       ;432.18
        or        esi, DWORD PTR [_des_skb+1792+ecx*4]          ;425.13
        mov       ecx, esi                                      ;429.18
        and       esi, -65536                                   ;432.18
        or        edi, esi                                      ;432.18
        mov       esi, ebx                                      ;408.24
        shr       esi, 1                                        ;408.24
        shl       ebx, 27                                       ;408.36
        or        esi, ebx                                      ;408.36
        and       esi, 268435455                                ;411.9
        mov       ebx, esi                                      ;417.30
        and       ebx, 63                                       ;417.30
        ror       edi, 26                                       ;432.18
        mov       DWORD PTR [60+edx], edi                       ;432.11
        mov       edi, ebp                                      ;409.24
        shl       ecx, 16                                       ;429.18
        shr       edi, 1                                        ;409.24
        or        ecx, eax                                      ;429.18
        shl       ebp, 27                                       ;409.36
        mov       eax, DWORD PTR [_des_skb+ebx*4]               ;417.13
        or        edi, ebp                                      ;409.36
        mov       ebx, esi                                      ;418.31
        mov       ebp, esi                                      ;418.52
        shr       ebx, 6                                        ;418.31
        and       edi, 268435455                                ;412.9
        shr       ebp, 7                                        ;418.52
        and       ebx, 3                                        ;418.37
        and       ebp, 60                                       ;418.58
        or        ebx, ebp                                      ;418.58
        mov       ebp, esi                                      ;420.53
        ror       ecx, 30                                       ;429.18
        mov       DWORD PTR [56+edx], ecx                       ;429.11
        mov       ecx, esi                                      ;419.53
        shr       ecx, 14                                       ;419.53
        or        eax, DWORD PTR [_des_skb+256+ebx*4]           ;418.13
        mov       ebx, esi                                      ;419.31
        shr       ebx, 13                                       ;419.31
        and       ecx, 48                                       ;419.60
        and       ebx, 15                                       ;419.38
        or        ebx, ecx                                      ;419.60
        mov       ecx, esi                                      ;420.31
        shr       ecx, 20                                       ;420.31
        shr       ebp, 21                                       ;420.53
        and       ecx, 1                                        ;420.38
        and       ebp, 6                                        ;420.60
        or        eax, DWORD PTR [_des_skb+512+ebx*4]           ;419.13
        mov       ebx, esi                                      ;421.31
        shr       ebx, 22                                       ;421.31
        or        ecx, ebp                                      ;420.60
        and       ebx, 56                                       ;421.38
        mov       ebp, edi                                      ;423.52
        or        ecx, ebx                                      ;421.38
        mov       ebx, edi                                      ;422.30
        shr       ebp, 8                                        ;423.52
        and       ebx, 63                                       ;422.30
        and       ebp, 60                                       ;423.58
        or        eax, DWORD PTR [_des_skb+768+ecx*4]           ;420.13
        mov       ecx, edi                                      ;423.31
        shr       ecx, 7                                        ;423.31
        and       ecx, 3                                        ;423.37
        or        ecx, ebp                                      ;423.58
        mov       ebp, edi                                      ;424.30
        shr       ebp, 15                                       ;424.30
        and       ebp, 63                                       ;424.37
        mov       ebx, DWORD PTR [_des_skb+1024+ebx*4]          ;422.13
        or        ebx, DWORD PTR [_des_skb+1280+ecx*4]          ;423.13
        mov       ecx, edi                                      ;425.53
        shr       ecx, 22                                       ;425.53
        or        ebx, DWORD PTR [_des_skb+1536+ebp*4]          ;424.13
        mov       ebp, edi                                      ;425.31
        shr       ebp, 21                                       ;425.31
        and       ecx, 48                                       ;425.60
        and       ebp, 15                                       ;425.38
        or        ebp, ecx                                      ;425.60
        movzx     ecx, ax                                       ;429.18
        shr       eax, 16                                       ;432.18
        or        ebx, DWORD PTR [_des_skb+1792+ebp*4]          ;425.13
        mov       ebp, ebx                                      ;429.18
        and       ebx, -65536                                   ;432.18
        or        eax, ebx                                      ;432.18
        mov       ebx, esi                                      ;405.24
        shr       ebx, 2                                        ;405.24
        shl       esi, 26                                       ;405.36
        or        ebx, esi                                      ;405.36
        mov       esi, edi                                      ;406.24
        shr       esi, 2                                        ;406.24
        and       ebx, 268435455                                ;411.9
        shl       edi, 26                                       ;406.36
        or        esi, edi                                      ;406.36
        mov       edi, ebx                                      ;417.30
        shl       ebp, 16                                       ;429.18
        and       edi, 63                                       ;417.30
        ror       eax, 26                                       ;432.18
        or        ebp, ecx                                      ;429.18
        mov       DWORD PTR [68+edx], eax                       ;432.11
        mov       ecx, ebx                                      ;418.31
        mov       eax, ebx                                      ;418.52
        and       esi, 268435455                                ;412.9
        shr       ecx, 6                                        ;418.31
        shr       eax, 7                                        ;418.52
        and       ecx, 3                                        ;418.37
        and       eax, 60                                       ;418.58
        ror       ebp, 30                                       ;429.18
        or        ecx, eax                                      ;418.58
        mov       DWORD PTR [64+edx], ebp                       ;429.11
        mov       eax, ebx                                      ;419.53
        mov       ebp, DWORD PTR [_des_skb+edi*4]               ;417.13
        mov       edi, ebx                                      ;419.31
        shr       edi, 13                                       ;419.31
        shr       eax, 14                                       ;419.53
        and       edi, 15                                       ;419.38
        and       eax, 48                                       ;419.60
        or        edi, eax                                      ;419.60
        mov       eax, ebx                                      ;420.53
        or        ebp, DWORD PTR [_des_skb+256+ecx*4]           ;418.13
        mov       ecx, ebx                                      ;421.31
        shr       eax, 21                                       ;420.53
        shr       ecx, 22                                       ;421.31
        and       eax, 6                                        ;420.60
        or        ebp, DWORD PTR [_des_skb+512+edi*4]           ;419.13
        mov       edi, ebx                                      ;420.31
        shr       edi, 20                                       ;420.31
        and       ecx, 56                                       ;421.38
        and       edi, 1                                        ;420.38
        or        edi, eax                                      ;420.60
        mov       eax, esi                                      ;422.30
        or        edi, ecx                                      ;421.38
        and       eax, 63                                       ;422.30
        or        ebp, DWORD PTR [_des_skb+768+edi*4]           ;420.13
        mov       edi, esi                                      ;423.52
        mov       ecx, DWORD PTR [_des_skb+1024+eax*4]          ;422.13
        mov       eax, esi                                      ;423.31
        shr       eax, 7                                        ;423.31
        shr       edi, 8                                        ;423.52
        and       eax, 3                                        ;423.37
        and       edi, 60                                       ;423.58
        or        eax, edi                                      ;423.58
        mov       edi, esi                                      ;424.30
        shr       edi, 15                                       ;424.30
        and       edi, 63                                       ;424.37
        or        ecx, DWORD PTR [_des_skb+1280+eax*4]          ;423.13
        mov       eax, esi                                      ;425.53
        shr       eax, 22                                       ;425.53
        or        ecx, DWORD PTR [_des_skb+1536+edi*4]          ;424.13
        mov       edi, esi                                      ;425.31
        shr       edi, 21                                       ;425.31
        and       eax, 48                                       ;425.60
        and       edi, 15                                       ;425.38
        or        edi, eax                                      ;425.60
        movzx     eax, bp                                       ;429.18
        shr       ebp, 16                                       ;432.18
        or        ecx, DWORD PTR [_des_skb+1792+edi*4]          ;425.13
        mov       edi, ecx                                      ;429.18
        and       ecx, -65536                                   ;432.18
        or        ebp, ecx                                      ;432.18
        mov       ecx, esi                                      ;406.24
        ror       ebp, 26                                       ;432.18
        mov       DWORD PTR [76+edx], ebp                       ;432.11
        mov       ebp, ebx                                      ;405.24
        shr       ebp, 2                                        ;405.24
        shl       ebx, 26                                       ;405.36
        or        ebp, ebx                                      ;405.36
        shl       edi, 16                                       ;429.18
        and       ebp, 268435455                                ;411.9
        shr       ecx, 2                                        ;406.24
        or        edi, eax                                      ;429.18
        shl       esi, 26                                       ;406.36
        mov       eax, ebp                                      ;418.31
        or        ecx, esi                                      ;406.36
        mov       esi, ebp                                      ;418.52
        shr       eax, 6                                        ;418.31
        mov       ebx, ebp                                      ;417.30
        shr       esi, 7                                        ;418.52
        and       ebx, 63                                       ;417.30
        and       eax, 3                                        ;418.37
        and       esi, 60                                       ;418.58
        or        eax, esi                                      ;418.58
        mov       esi, ebp                                      ;420.53
        ror       edi, 30                                       ;429.18
        and       ecx, 268435455                                ;412.9
        mov       ebx, DWORD PTR [_des_skb+ebx*4]               ;417.13
        mov       DWORD PTR [72+edx], edi                       ;429.11
        mov       edi, ebp                                      ;419.53
        or        ebx, DWORD PTR [_des_skb+256+eax*4]           ;418.13
        mov       eax, ebp                                      ;419.31
        shr       eax, 13                                       ;419.31
        shr       edi, 14                                       ;419.53
        and       eax, 15                                       ;419.38
        and       edi, 48                                       ;419.60
        or        eax, edi                                      ;419.60
        mov       edi, ebp                                      ;420.31
        shr       edi, 20                                       ;420.31
        shr       esi, 21                                       ;420.53
        and       edi, 1                                        ;420.38
        and       esi, 6                                        ;420.60
        or        ebx, DWORD PTR [_des_skb+512+eax*4]           ;419.13
        mov       eax, ebp                                      ;421.31
        shr       eax, 22                                       ;421.31
        or        edi, esi                                      ;420.60
        and       eax, 56                                       ;421.38
        mov       esi, ecx                                      ;423.52
        or        edi, eax                                      ;421.38
        mov       eax, ecx                                      ;422.30
        shr       esi, 8                                        ;423.52
        and       eax, 63                                       ;422.30
        and       esi, 60                                       ;423.58
        or        ebx, DWORD PTR [_des_skb+768+edi*4]           ;420.13
        mov       edi, ecx                                      ;423.31
        shr       edi, 7                                        ;423.31
        and       edi, 3                                        ;423.37
        or        edi, esi                                      ;423.58
        mov       esi, ecx                                      ;424.30
        shr       esi, 15                                       ;424.30
        and       esi, 63                                       ;424.37
        mov       eax, DWORD PTR [_des_skb+1024+eax*4]          ;422.13
        or        eax, DWORD PTR [_des_skb+1280+edi*4]          ;423.13
        mov       edi, ecx                                      ;425.53
        shr       edi, 22                                       ;425.53
        or        eax, DWORD PTR [_des_skb+1536+esi*4]          ;424.13
        mov       esi, ecx                                      ;425.31
        shr       esi, 21                                       ;425.31
        and       edi, 48                                       ;425.60
        and       esi, 15                                       ;425.38
        or        esi, edi                                      ;425.60
        or        eax, DWORD PTR [_des_skb+1792+esi*4]          ;425.13
        movzx     esi, bx                                       ;429.18
        mov       edi, eax                                      ;429.18
        shr       ebx, 16                                       ;432.18
        and       eax, -65536                                   ;432.18
        or        ebx, eax                                      ;432.18
        mov       eax, ebp                                      ;405.24
        shr       eax, 2                                        ;405.24
        shl       ebp, 26                                       ;405.36
        or        eax, ebp                                      ;405.36
        shl       edi, 16                                       ;429.18
        and       eax, 268435455                                ;411.9
        or        edi, esi                                      ;429.18
        mov       ebp, eax                                      ;417.30
        ror       edi, 30                                       ;429.18
        and       ebp, 63                                       ;417.30
        mov       DWORD PTR [80+edx], edi                       ;429.11
        mov       edi, eax                                      ;418.31
        mov       esi, eax                                      ;418.52
        shr       edi, 6                                        ;418.31
        shr       esi, 7                                        ;418.52
        and       edi, 3                                        ;418.37
        ror       ebx, 26                                       ;432.18
        and       esi, 60                                       ;418.58
        mov       DWORD PTR [84+edx], ebx                       ;432.11
        mov       ebx, ecx                                      ;406.24
        shr       ebx, 2                                        ;406.24
        or        edi, esi                                      ;418.58
        shl       ecx, 26                                       ;406.36
        mov       esi, eax                                      ;419.31
        or        ebx, ecx                                      ;406.36
        mov       ecx, DWORD PTR [_des_skb+ebp*4]               ;417.13
        mov       ebp, eax                                      ;419.53
        shr       esi, 13                                       ;419.31
        and       ebx, 268435455                                ;412.9
        shr       ebp, 14                                       ;419.53
        and       esi, 15                                       ;419.38
        and       ebp, 48                                       ;419.60
        or        ecx, DWORD PTR [_des_skb+256+edi*4]           ;418.13
        or        esi, ebp                                      ;419.60
                                ; LOE eax edx ecx ebx esi
.B4.4:                          ; Preds .B4.5
        mov       ebp, eax                                      ;420.31
        mov       edi, eax                                      ;421.31
        shr       ebp, 20                                       ;420.31
        shr       edi, 22                                       ;421.31
        and       ebp, 1                                        ;420.38
        or        ecx, DWORD PTR [_des_skb+512+esi*4]           ;419.13
        mov       esi, eax                                      ;420.53
        shr       esi, 21                                       ;420.53
        and       edi, 56                                       ;421.38
        and       esi, 6                                        ;420.60
        or        ebp, esi                                      ;420.60
        mov       esi, ebx                                      ;422.30
        or        ebp, edi                                      ;421.38
        and       esi, 63                                       ;422.30
        mov       edi, ebx                                      ;423.52
        shr       edi, 8                                        ;423.52
        and       edi, 60                                       ;423.58
        or        ecx, DWORD PTR [_des_skb+768+ebp*4]           ;420.13
        mov       ebp, DWORD PTR [_des_skb+1024+esi*4]          ;422.13
        mov       esi, ebx                                      ;423.31
        shr       esi, 7                                        ;423.31
        and       esi, 3                                        ;423.37
        or        esi, edi                                      ;423.58
        mov       edi, ebx                                      ;424.30
        shr       edi, 15                                       ;424.30
        and       edi, 63                                       ;424.37
        or        ebp, DWORD PTR [_des_skb+1280+esi*4]          ;423.13
        mov       esi, ebx                                      ;425.53
        shr       esi, 22                                       ;425.53
        or        ebp, DWORD PTR [_des_skb+1536+edi*4]          ;424.13
        mov       edi, ebx                                      ;425.31
        shr       edi, 21                                       ;425.31
        and       esi, 48                                       ;425.60
        and       edi, 15                                       ;425.38
        or        edi, esi                                      ;425.60
        movzx     esi, cx                                       ;429.18
        shr       ecx, 16                                       ;432.18
        or        ebp, DWORD PTR [_des_skb+1792+edi*4]          ;425.13
        mov       edi, ebp                                      ;429.18
        and       ebp, -65536                                   ;432.18
        or        ecx, ebp                                      ;432.18
        ror       ecx, 26                                       ;432.18
        mov       DWORD PTR [92+edx], ecx                       ;432.11
        mov       ecx, eax                                      ;405.24
        shr       ecx, 2                                        ;405.24
        shl       eax, 26                                       ;405.36
        or        ecx, eax                                      ;405.36
        mov       eax, ebx                                      ;406.24
        shl       edi, 16                                       ;429.18
        and       ecx, 268435455                                ;411.9
        shr       eax, 2                                        ;406.24
        or        edi, esi                                      ;429.18
        shl       ebx, 26                                       ;406.36
        mov       esi, ecx                                      ;418.31
        mov       ebp, ecx                                      ;418.52
        or        eax, ebx                                      ;406.36
        shr       esi, 6                                        ;418.31
        mov       ebx, ecx                                      ;417.30
        shr       ebp, 7                                        ;418.52
        and       ebx, 63                                       ;417.30
        and       esi, 3                                        ;418.37
        and       ebp, 60                                       ;418.58
        or        esi, ebp                                      ;418.58
        mov       ebp, ecx                                      ;420.53
        ror       edi, 30                                       ;429.18
        and       eax, 268435455                                ;412.9
        mov       ebx, DWORD PTR [_des_skb+ebx*4]               ;417.13
        mov       DWORD PTR [88+edx], edi                       ;429.11
        mov       edi, ecx                                      ;419.53
        or        ebx, DWORD PTR [_des_skb+256+esi*4]           ;418.13
        mov       esi, ecx                                      ;419.31
        shr       esi, 13                                       ;419.31
        shr       edi, 14                                       ;419.53
        and       esi, 15                                       ;419.38
        and       edi, 48                                       ;419.60
        or        esi, edi                                      ;419.60
        mov       edi, ecx                                      ;420.31
        shr       edi, 20                                       ;420.31
        shr       ebp, 21                                       ;420.53
        and       edi, 1                                        ;420.38
        and       ebp, 6                                        ;420.60
        or        ebx, DWORD PTR [_des_skb+512+esi*4]           ;419.13
        mov       esi, ecx                                      ;421.31
        shr       esi, 22                                       ;421.31
        or        edi, ebp                                      ;420.60
        and       esi, 56                                       ;421.38
        mov       ebp, eax                                      ;423.52
        or        edi, esi                                      ;421.38
        mov       esi, eax                                      ;422.30
        and       esi, 63                                       ;422.30
        shr       ebp, 8                                        ;423.52
        and       ebp, 60                                       ;423.58
        or        ebx, DWORD PTR [_des_skb+768+edi*4]           ;420.13
        mov       edi, DWORD PTR [_des_skb+1024+esi*4]          ;422.13
        mov       esi, eax                                      ;423.31
        shr       esi, 7                                        ;423.31
        and       esi, 3                                        ;423.37
        or        esi, ebp                                      ;423.58
        mov       ebp, eax                                      ;424.30
        shr       ebp, 15                                       ;424.30
        and       ebp, 63                                       ;424.37
        or        edi, DWORD PTR [_des_skb+1280+esi*4]          ;423.13
        mov       esi, eax                                      ;425.53
        shr       esi, 22                                       ;425.53
        or        edi, DWORD PTR [_des_skb+1536+ebp*4]          ;424.13
        mov       ebp, eax                                      ;425.31
        shr       ebp, 21                                       ;425.31
        and       esi, 48                                       ;425.60
        and       ebp, 15                                       ;425.38
        or        ebp, esi                                      ;425.60
        movzx     esi, bx                                       ;429.18
        shr       ebx, 16                                       ;432.18
        or        edi, DWORD PTR [_des_skb+1792+ebp*4]          ;425.13
        mov       ebp, edi                                      ;429.18
        and       edi, -65536                                   ;432.18
        or        ebx, edi                                      ;432.18
        ror       ebx, 26                                       ;432.18
        mov       DWORD PTR [100+edx], ebx                      ;432.11
        mov       ebx, ecx                                      ;405.24
        shl       ebp, 16                                       ;429.18
        shr       ebx, 2                                        ;405.24
        or        ebp, esi                                      ;429.18
        shl       ecx, 26                                       ;405.36
        or        ebx, ecx                                      ;405.36
        ror       ebp, 30                                       ;429.18
        and       ebx, 268435455                                ;411.9
        mov       DWORD PTR [96+edx], ebp                       ;429.11
        mov       ebp, eax                                      ;406.24
        shr       ebp, 2                                        ;406.24
        mov       esi, ebx                                      ;418.31
        shl       eax, 26                                       ;406.36
        mov       ecx, ebx                                      ;418.52
        shr       esi, 6                                        ;418.31
        or        ebp, eax                                      ;406.36
        shr       ecx, 7                                        ;418.52
        mov       eax, ebx                                      ;417.30
        and       eax, 63                                       ;417.30
        and       esi, 3                                        ;418.37
        and       ecx, 60                                       ;418.58
        mov       edi, ebx                                      ;419.53
        or        esi, ecx                                      ;418.58
        mov       ecx, ebx                                      ;420.53
        shr       edi, 14                                       ;419.53
        and       ebp, 268435455                                ;412.9
        mov       eax, DWORD PTR [_des_skb+eax*4]               ;417.13
        and       edi, 48                                       ;419.60
        shr       ecx, 21                                       ;420.53
        or        eax, DWORD PTR [_des_skb+256+esi*4]           ;418.13
        mov       esi, ebx                                      ;419.31
        shr       esi, 13                                       ;419.31
        and       ecx, 6                                        ;420.60
        and       esi, 15                                       ;419.38
        or        esi, edi                                      ;419.60
        mov       edi, ebx                                      ;420.31
        shr       edi, 20                                       ;420.31
        and       edi, 1                                        ;420.38
        or        edi, ecx                                      ;420.60
        mov       ecx, ebp                                      ;423.52
        or        eax, DWORD PTR [_des_skb+512+esi*4]           ;419.13
        mov       esi, ebx                                      ;421.31
        shr       esi, 22                                       ;421.31
        and       esi, 56                                       ;421.38
        or        edi, esi                                      ;421.38
        mov       esi, ebp                                      ;422.30
        shr       ecx, 8                                        ;423.52
        and       esi, 63                                       ;422.30
        and       ecx, 60                                       ;423.58
        or        eax, DWORD PTR [_des_skb+768+edi*4]           ;420.13
        mov       edi, ebp                                      ;423.31
        shr       edi, 7                                        ;423.31
        and       edi, 3                                        ;423.37
        or        edi, ecx                                      ;423.58
        mov       ecx, ebp                                      ;424.30
        shr       ecx, 15                                       ;424.30
        and       ecx, 63                                       ;424.37
        mov       esi, DWORD PTR [_des_skb+1024+esi*4]          ;422.13
        or        esi, DWORD PTR [_des_skb+1280+edi*4]          ;423.13
        mov       edi, ebp                                      ;425.53
        shr       edi, 22                                       ;425.53
        or        esi, DWORD PTR [_des_skb+1536+ecx*4]          ;424.13
        mov       ecx, ebp                                      ;425.31
        shr       ecx, 21                                       ;425.31
        and       edi, 48                                       ;425.60
        and       ecx, 15                                       ;425.38
        or        ecx, edi                                      ;425.60
        movzx     edi, ax                                       ;429.18
        shr       eax, 16                                       ;432.18
        or        esi, DWORD PTR [_des_skb+1792+ecx*4]          ;425.13
        mov       ecx, esi                                      ;429.18
        and       esi, -65536                                   ;432.18
        or        eax, esi                                      ;432.18
        mov       esi, ebx                                      ;405.24
        shl       ecx, 16                                       ;429.18
        shr       esi, 2                                        ;405.24
        or        ecx, edi                                      ;429.18
        shl       ebx, 26                                       ;405.36
        mov       edi, ebp                                      ;406.24
        or        esi, ebx                                      ;405.36
        shr       edi, 2                                        ;406.24
        and       esi, 268435455                                ;411.9
        shl       ebp, 26                                       ;406.36
        mov       ebx, esi                                      ;417.30
        ror       eax, 26                                       ;432.18
        or        edi, ebp                                      ;406.36
        mov       DWORD PTR [108+edx], eax                      ;432.11
        mov       ebp, esi                                      ;418.31
        mov       eax, esi                                      ;418.52
        and       ebx, 63                                       ;417.30
        shr       ebp, 6                                        ;418.31
        and       edi, 268435455                                ;412.9
        shr       eax, 7                                        ;418.52
        and       ebp, 3                                        ;418.37
        and       eax, 60                                       ;418.58
        ror       ecx, 30                                       ;429.18
        or        ebp, eax                                      ;418.58
        mov       DWORD PTR [104+edx], ecx                      ;429.11
        mov       ecx, esi                                      ;419.31
        mov       eax, esi                                      ;419.53
        shr       ecx, 13                                       ;419.31
        shr       eax, 14                                       ;419.53
        and       ecx, 15                                       ;419.38
        and       eax, 48                                       ;419.60
        or        ecx, eax                                      ;419.60
        mov       eax, esi                                      ;420.53
        mov       ebx, DWORD PTR [_des_skb+ebx*4]               ;417.13
        or        ebx, DWORD PTR [_des_skb+256+ebp*4]           ;418.13
        mov       ebp, esi                                      ;421.31
        shr       eax, 21                                       ;420.53
        or        ebx, DWORD PTR [_des_skb+512+ecx*4]           ;419.13
        mov       ecx, esi                                      ;420.31
        shr       ecx, 20                                       ;420.31
        and       eax, 6                                        ;420.60
        shr       ebp, 22                                       ;421.31
        and       ecx, 1                                        ;420.38
        or        ecx, eax                                      ;420.60
        and       ebp, 56                                       ;421.38
        mov       eax, edi                                      ;422.30
        or        ecx, ebp                                      ;421.38
        and       eax, 63                                       ;422.30
        mov       ebp, edi                                      ;423.52
        shr       ebp, 8                                        ;423.52
        and       ebp, 60                                       ;423.58
        or        ebx, DWORD PTR [_des_skb+768+ecx*4]           ;420.13
        mov       ecx, DWORD PTR [_des_skb+1024+eax*4]          ;422.13
        mov       eax, edi                                      ;423.31
        shr       eax, 7                                        ;423.31
        and       eax, 3                                        ;423.37
        or        eax, ebp                                      ;423.58
        mov       ebp, edi                                      ;424.30
        shr       ebp, 15                                       ;424.30
        and       ebp, 63                                       ;424.37
        or        ecx, DWORD PTR [_des_skb+1280+eax*4]          ;423.13
        mov       eax, edi                                      ;425.53
        shr       eax, 22                                       ;425.53
        or        ecx, DWORD PTR [_des_skb+1536+ebp*4]          ;424.13
        mov       ebp, edi                                      ;425.31
        shr       ebp, 21                                       ;425.31
        and       eax, 48                                       ;425.60
        and       ebp, 15                                       ;425.38
        or        ebp, eax                                      ;425.60
        movzx     eax, bx                                       ;429.18
        shr       ebx, 16                                       ;432.18
        or        ecx, DWORD PTR [_des_skb+1792+ebp*4]          ;425.13
        mov       ebp, ecx                                      ;429.18
        and       ecx, -65536                                   ;432.18
        shl       ebp, 16                                       ;429.18
        or        ebx, ecx                                      ;432.18
        or        ebp, eax                                      ;429.18
        mov       eax, edi                                      ;409.24
        ror       ebp, 30                                       ;429.18
        mov       DWORD PTR [112+edx], ebp                      ;429.11
        mov       ebp, esi                                      ;408.24
        shr       ebp, 1                                        ;408.24
        shl       esi, 27                                       ;408.36
        or        ebp, esi                                      ;408.36
        shr       eax, 1                                        ;409.24
        mov       esi, ebp                                      ;417.30
        shl       edi, 27                                       ;409.36
        and       esi, 63                                       ;417.30
        or        eax, edi                                      ;409.36
        mov       edi, ebp                                      ;418.31
        mov       ecx, ebp                                      ;418.52
        shr       edi, 6                                        ;418.31
        shr       ecx, 7                                        ;418.52
        and       edi, 3                                        ;418.37
        and       ecx, 60                                       ;418.58
        ror       ebx, 26                                       ;432.18
        or        edi, ecx                                      ;418.58
        mov       DWORD PTR [116+edx], ebx                      ;432.11
        mov       ecx, ebp                                      ;419.31
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;417.13
        mov       esi, ebp                                      ;419.53
        shr       ecx, 13                                       ;419.31
        shr       esi, 14                                       ;419.53
        and       ecx, 15                                       ;419.38
        and       esi, 48                                       ;419.60
        or        ebx, DWORD PTR [_des_skb+256+edi*4]           ;418.13
        or        ecx, esi                                      ;419.60
        mov       edi, ebp                                      ;420.31
        mov       esi, ebp                                      ;420.53
        shr       edi, 20                                       ;420.31
        shr       esi, 21                                       ;420.53
        and       edi, 1                                        ;420.38
        shr       ebp, 22                                       ;421.31
        and       esi, 6                                        ;420.60
        or        edi, esi                                      ;420.60
        and       ebp, 56                                       ;421.38
        or        edi, ebp                                      ;421.38
        mov       ebp, eax                                      ;422.30
        or        ebx, DWORD PTR [_des_skb+512+ecx*4]           ;419.13
        and       ebp, 63                                       ;422.30
        mov       ecx, eax                                      ;423.52
        shr       ecx, 8                                        ;423.52
        or        ebx, DWORD PTR [_des_skb+768+edi*4]           ;420.13
        mov       edi, eax                                      ;423.31
        shr       edi, 7                                        ;423.31
        and       ecx, 60                                       ;423.58
        and       edi, 3                                        ;423.37
        mov       esi, DWORD PTR [_des_skb+1024+ebp*4]          ;422.13
        or        edi, ecx                                      ;423.58
        mov       ecx, eax                                      ;424.30
        mov       ebp, eax                                      ;425.31
        shr       ecx, 15                                       ;424.30
        shr       ebp, 21                                       ;425.31
        and       ecx, 63                                       ;424.37
        shr       eax, 22                                       ;425.53
        and       ebp, 15                                       ;425.38
        and       eax, 48                                       ;425.60
        or        ebp, eax                                      ;425.60
        or        esi, DWORD PTR [_des_skb+1280+edi*4]          ;423.13
        or        esi, DWORD PTR [_des_skb+1536+ecx*4]          ;424.13
        movzx     eax, bx                                       ;429.18
        or        esi, DWORD PTR [_des_skb+1792+ebp*4]          ;425.13
        mov       ecx, esi                                      ;429.18
        and       esi, -65536                                   ;432.18
        shl       ecx, 16                                       ;429.18
        shr       ebx, 16                                       ;432.18
        or        ecx, eax                                      ;429.18
        or        ebx, esi                                      ;432.18
        ror       ecx, 30                                       ;429.18
        ror       ebx, 26                                       ;432.18
        mov       DWORD PTR [120+edx], ecx                      ;429.11
        mov       DWORD PTR [124+edx], ebx                      ;432.11
        pop       ebp                                           ;434.1
        pop       ebx                                           ;434.1
        pop       edi                                           ;434.1
        pop       esi                                           ;434.1
        ret                                                     ;434.1
        ALIGN     16
                                ; LOE
; mark_end;
_DES_set_key_unchecked ENDP
;_DES_set_key_unchecked	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _DES_set_key_unchecked
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _DES_init_keys
TXTST4:
; -- Begin  _DES_init_keys
;_DES_init_keys	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _DES_init_keys
; mark_begin;
       ALIGN     16
_DES_init_keys	PROC NEAR PRIVATE
; parameter 1: eax
; parameter 2: edx
.B5.1:                          ; Preds .B5.0
        push      esi                                           ;208.1
        push      edi                                           ;208.1
        push      ebx                                           ;208.1
        push      ebp                                           ;208.1
        sub       esp, 60                                       ;208.1
        mov       ebp, eax                                      ;208.1
        mov       ebx, edx                                      ;208.1
        mov       edx, ebp                                      ;211.30
        mov       ecx, edx                                      ;211.30
        and       edx, -16                                      ;211.30
        pxor      xmm0, xmm0                                    ;211.30
        pcmpeqb   xmm0, XMMWORD PTR [edx]                       ;211.30
        pmovmskb  eax, xmm0                                     ;211.30
        and       ecx, 15                                       ;211.30
        shr       eax, cl                                       ;211.30
        bsf       eax, eax                                      ;211.30
        jne       L25           ; Prob 60%                      ;211.30
        mov       eax, edx                                      ;211.30
        add       edx, ecx                                      ;211.30
        call      ___intel_sse4_strlen                          ;211.30
L25:                                                            ;
                                ; LOE eax ebx ebp esi edi
.B5.12:                         ; Preds .B5.1
        pxor      xmm0, xmm0                                    ;213.3
        movq      QWORD PTR [32+esp], xmm0                      ;213.3
                                ; LOE eax ebx ebp esi edi
.B5.2:                          ; Preds .B5.12
        xor       edx, edx                                      ;216.3
        mov       ecx, edx                                      ;216.3
        mov       edx, ebx                                      ;216.3
        mov       DWORD PTR [44+esp], ebp                       ;216.3
        mov       ebx, ecx                                      ;216.3
                                ; LOE eax edx ebx
.B5.3:                          ; Preds .B5.8 .B5.2
        test      eax, eax                                      ;219.17
        jbe       .B5.8         ; Prob 10%                      ;219.17
                                ; LOE eax edx ebx
.B5.4:                          ; Preds .B5.3
        mov       ecx, ebx                                      ;216.3
        xor       ebp, ebp                                      ;219.5
        shl       ecx, 15                                       ;216.3
        add       ecx, edx                                      ;222.27
        mov       DWORD PTR [40+esp], ecx                       ;222.27
        mov       DWORD PTR [28+esp], eax                       ;222.27
        mov       DWORD PTR [24+esp], edx                       ;222.27
                                ; LOE ebx ebp
.B5.5:                          ; Preds .B5.6 .B5.4
        mov       esi, DWORD PTR [44+esp]                       ;220.16
        movzx     ecx, BYTE PTR [ebp+esi]                       ;220.16
        mov       BYTE PTR [32+esp+ebx], cl                     ;220.7
        movsx     edx, BYTE PTR [32+esp]                        ;221.23
        mov       eax, edx                                      ;221.7
        shr       eax, 1                                        ;221.7
        and       edx, 1                                        ;221.7
        mov       BYTE PTR [16+esp], al                         ;221.7
        movsx     eax, BYTE PTR [33+esp]                        ;221.23
        mov       edi, eax                                      ;221.7
        shl       edx, 6                                        ;221.7
        and       eax, 3                                        ;221.7
        shr       edi, 2                                        ;221.7
        or        edx, edi                                      ;221.7
        mov       BYTE PTR [17+esp], dl                         ;221.7
        movsx     edx, BYTE PTR [34+esp]                        ;221.23
        mov       ecx, edx                                      ;221.7
        shl       eax, 5                                        ;221.7
        and       edx, 7                                        ;221.7
        shr       ecx, 3                                        ;221.7
        or        eax, ecx                                      ;221.7
        movsx     ecx, BYTE PTR [35+esp]                        ;221.23
        mov       BYTE PTR [18+esp], al                         ;221.7
        mov       eax, ecx                                      ;221.7
        shl       edx, 4                                        ;221.7
        and       ecx, 15                                       ;221.7
        shr       eax, 4                                        ;221.7
        or        edx, eax                                      ;221.7
        movsx     eax, BYTE PTR [36+esp]                        ;221.23
        mov       esi, eax                                      ;221.7
        shl       ecx, 3                                        ;221.7
        and       eax, 31                                       ;221.7
        shr       esi, 5                                        ;221.7
        or        ecx, esi                                      ;221.7
        mov       BYTE PTR [20+esp], cl                         ;221.7
        movsx     ecx, BYTE PTR [37+esp]                        ;221.23
        mov       esi, ecx                                      ;221.7
        shl       eax, 2                                        ;221.7
        and       ecx, 63                                       ;221.7
        shr       esi, 6                                        ;221.7
        add       ecx, ecx                                      ;221.7
        or        eax, esi                                      ;221.7
        mov       BYTE PTR [21+esp], al                         ;221.7
        movsx     eax, BYTE PTR [38+esp]                        ;221.23
        mov       esi, eax                                      ;221.7
        shr       esi, 7                                        ;221.7
        and       eax, 127                                      ;221.7
        or        ecx, esi                                      ;221.7
        mov       BYTE PTR [19+esp], dl                         ;221.7
        mov       edx, ebp                                      ;222.7
        mov       BYTE PTR [22+esp], cl                         ;221.7
        mov       BYTE PTR [23+esp], al                         ;221.7
        movq      xmm0, QWORD PTR [16+esp]                      ;221.7
        psllw     xmm0, 1                                       ;221.7
        pand      xmm0, XMMWORD PTR [_2il0floatpacket.125]      ;221.7
        movq      QWORD PTR [16+esp], xmm0                      ;221.7
        movzx     edi, BYTE PTR [16+esp]                        ;221.7
        shl       edx, 7                                        ;222.7
        add       edx, DWORD PTR [40+esp]                       ;222.7
        movzx     eax, BYTE PTR [_odd_parity+edi]               ;221.7
        movd      xmm1, eax                                     ;221.7
        movzx     eax, BYTE PTR [17+esp]                        ;221.7
        pinsrb    xmm1, BYTE PTR [_odd_parity+eax], 1           ;221.7
        movzx     eax, BYTE PTR [18+esp]                        ;221.7
        pinsrb    xmm1, BYTE PTR [_odd_parity+eax], 2           ;221.7
        movzx     eax, BYTE PTR [19+esp]                        ;221.7
        pinsrb    xmm1, BYTE PTR [_odd_parity+eax], 3           ;221.7
        movzx     eax, BYTE PTR [20+esp]                        ;221.7
        pinsrb    xmm1, BYTE PTR [_odd_parity+eax], 4           ;221.7
        movzx     eax, BYTE PTR [21+esp]                        ;221.7
        pinsrb    xmm1, BYTE PTR [_odd_parity+eax], 5           ;221.7
        movzx     eax, BYTE PTR [22+esp]                        ;221.7
        pinsrb    xmm1, BYTE PTR [_odd_parity+eax], 6           ;221.7
        movzx     eax, BYTE PTR [23+esp]                        ;221.7
        pinsrb    xmm1, BYTE PTR [_odd_parity+eax], 7           ;221.7
        lea       eax, DWORD PTR [16+esp]                       ;222.7
        movq      QWORD PTR [eax], xmm1                         ;221.7
        call      _DES_set_key_unchecked                        ;222.7
                                ; LOE ebx ebp
.B5.6:                          ; Preds .B5.5
        inc       ebp                                           ;219.5
        cmp       ebp, DWORD PTR [28+esp]                       ;219.5
        jb        .B5.5         ; Prob 78%                      ;219.5
                                ; LOE ebx ebp
.B5.7:                          ; Preds .B5.6
        mov       eax, DWORD PTR [28+esp]                       ;
        mov       edx, DWORD PTR [24+esp]                       ;
                                ; LOE eax edx ebx
.B5.8:                          ; Preds .B5.3 .B5.7
        mov       BYTE PTR [32+esp+ebx], 0                      ;225.5
        inc       ebx                                           ;216.3
        cmp       ebx, 8                                        ;216.3
        jb        .B5.3         ; Prob 87%                      ;216.3
                                ; LOE eax edx ebx
.B5.9:                          ; Preds .B5.8
        add       esp, 60                                       ;227.1
        pop       ebp                                           ;227.1
        pop       ebx                                           ;227.1
        pop       edi                                           ;227.1
        pop       esi                                           ;227.1
        ret                                                     ;227.1
        ALIGN     16
                                ; LOE
; mark_end;
_DES_init_keys ENDP
;_DES_init_keys	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _DES_init_keys
_BSS	SEGMENT  DWORD PUBLIC FLAT  'BSS'
	DD 7 DUP (0H)	; pad
_t_blk	DB ?	; pad
	ORG $+25598	; pad
	DB ?	; pad
_start_time	DD 2 DUP (0H)	; pad
_BSS	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_alphabets	DD	OFFSET FLAT: ??_C@_0L@A@0123456789?$AA@
	DD	OFFSET FLAT: ??_C@_0BL@A@ABCDEFGHIJKLMNOPQRSTUVWXYZ?$AA@
	DD	OFFSET FLAT: ??_C@_0CC@A@?5?$CB?$CC?$CD$?$CF?$CG?8?$CI?$CJ?$CK?$CL?0?9?4?1?3?$DL?$DM?$DN?$DO?$DP?$EA?$FL?2?$FN?$FO_?$GA?$HL?$HM?$HN?$HO?$AA@
_DATA	ENDS
_RDATA	SEGMENT  DWORD PUBLIC FLAT READ  'DATA'
	DD 2 DUP (0H)	; pad
	DB 1 DUP ( 0H)	; pad
??_C@_0HP@A@?$AN?5?5?$FL?5processed?5?$CFI64u?5keys?5out?5of?5?$CFI64i?5at?5?$CF?42fM?5k?1s?5?3?5?$CFI64u?$CF?$CF?5complete?4?5ETA?3?5?$CFu?5days?5?$CF02u?5hours?5?$CF02u?5minutes?5?$CF02u?5seconds?5?5?5?5?5?$AA@	DD	1528832013
	DD	1869770784
	DD	1936942435
	DD	622879845
	DD	1966356041
	DD	2036689696
	DD	1970217075
	DD	1718558836
	DD	910763296
	DD	1629514036
	DD	774185076
	DD	541943346
	DD	544419691
	DD	1227169850
	DD	628438070
	DD	1868767269
	DD	1701605485
	DD	539911540
	DD	977359941
	DD	544548128
	DD	1937334628
	DD	842016032
	DD	1869095029
	DD	544436853
	DD	1966223397
	DD	1852402976
	DD	1936028789
	DD	842016032
	DD	1702043765
	DD	1684959075
	DD	538976371
	DW	8224
	DB	0
	DB 1 DUP ( 0H)	; pad
??_C@_0EB@A@?5?5?5?5?5?5?5?9t?5?$DMthreads?$DO?5?5?5number?5of?5threads?5?$CIshould?5not?5exceed?5?$CFi?$CJ?6?6?$AA@	DD	538976288
	DD	757080096
	DD	1950097524
	DD	1634038376
	DD	540963684
	DD	1970151456
	DD	1919246957
	DD	543584032
	DD	1701996660
	DD	544433249
	DD	1869116200
	DD	543452277
	DD	544501614
	DD	1701017701
	DD	622879845
	DD	168438121
	DB	0
	DD 7 DUP (0H)	; pad
	DB 3 DUP ( 0H)	; pad
_DES_SPtrans	DD	34080768
	DD	524288
	DD	33554434
	DD	34080770
	DD	33554432
	DD	526338
	DD	524290
	DD	33554434
	DD	526338
	DD	34080768
	DD	34078720
	DD	2050
	DD	33556482
	DD	33554432
	DD	0
	DD	524290
	DD	524288
	DD	2
	DD	33556480
	DD	526336
	DD	34080770
	DD	34078720
	DD	2050
	DD	33556480
	DD	2
	DD	2048
	DD	526336
	DD	34078722
	DD	2048
	DD	33556482
	DD	34078722
	DD	0
	DD	0
	DD	34080770
	DD	33556480
	DD	524290
	DD	34080768
	DD	524288
	DD	2050
	DD	33556480
	DD	34078722
	DD	2048
	DD	526336
	DD	33554434
	DD	526338
	DD	2
	DD	33554434
	DD	34078720
	DD	34080770
	DD	526336
	DD	34078720
	DD	33556482
	DD	33554432
	DD	2050
	DD	524290
	DD	0
	DD	524288
	DD	33554432
	DD	33556482
	DD	34080768
	DD	2
	DD	34078722
	DD	2048
	DD	526338
	DD	1074823184
	DD	0
	DD	1081344
	DD	1074790400
	DD	1073741840
	DD	32784
	DD	1073774592
	DD	1081344
	DD	32768
	DD	1074790416
	DD	16
	DD	1073774592
	DD	1048592
	DD	1074823168
	DD	1074790400
	DD	16
	DD	1048576
	DD	1073774608
	DD	1074790416
	DD	32768
	DD	1081360
	DD	1073741824
	DD	0
	DD	1048592
	DD	1073774608
	DD	1081360
	DD	1074823168
	DD	1073741840
	DD	1073741824
	DD	1048576
	DD	32784
	DD	1074823184
	DD	1048592
	DD	1074823168
	DD	1073774592
	DD	1081360
	DD	1074823184
	DD	1048592
	DD	1073741840
	DD	0
	DD	1073741824
	DD	32784
	DD	1048576
	DD	1074790416
	DD	32768
	DD	1073741824
	DD	1081360
	DD	1073774608
	DD	1074823168
	DD	32768
	DD	0
	DD	1073741840
	DD	16
	DD	1074823184
	DD	1081344
	DD	1074790400
	DD	1074790416
	DD	1048576
	DD	32784
	DD	1073774592
	DD	1073774608
	DD	16
	DD	1074790400
	DD	1081344
	DD	67108865
	DD	67371264
	DD	256
	DD	67109121
	DD	262145
	DD	67108864
	DD	67109121
	DD	262400
	DD	67109120
	DD	262144
	DD	67371008
	DD	1
	DD	67371265
	DD	257
	DD	1
	DD	67371009
	DD	0
	DD	262145
	DD	67371264
	DD	256
	DD	257
	DD	67371265
	DD	262144
	DD	67108865
	DD	67371009
	DD	67109120
	DD	262401
	DD	67371008
	DD	262400
	DD	0
	DD	67108864
	DD	262401
	DD	67371264
	DD	256
	DD	1
	DD	262144
	DD	257
	DD	262145
	DD	67371008
	DD	67109121
	DD	0
	DD	67371264
	DD	262400
	DD	67371009
	DD	262145
	DD	67108864
	DD	67371265
	DD	1
	DD	262401
	DD	67108865
	DD	67108864
	DD	67371265
	DD	262144
	DD	67109120
	DD	67109121
	DD	262400
	DD	67109120
	DD	0
	DD	67371009
	DD	257
	DD	67108865
	DD	262401
	DD	256
	DD	67371008
	DD	4198408
	DD	268439552
	DD	8
	DD	272633864
	DD	0
	DD	272629760
	DD	268439560
	DD	4194312
	DD	272633856
	DD	268435464
	DD	268435456
	DD	4104
	DD	268435464
	DD	4198408
	DD	4194304
	DD	268435456
	DD	272629768
	DD	4198400
	DD	4096
	DD	8
	DD	4198400
	DD	268439560
	DD	272629760
	DD	4096
	DD	4104
	DD	0
	DD	4194312
	DD	272633856
	DD	268439552
	DD	272629768
	DD	272633864
	DD	4194304
	DD	272629768
	DD	4104
	DD	4194304
	DD	268435464
	DD	4198400
	DD	268439552
	DD	8
	DD	272629760
	DD	268439560
	DD	0
	DD	4096
	DD	4194312
	DD	0
	DD	272629768
	DD	272633856
	DD	4096
	DD	268435456
	DD	272633864
	DD	4198408
	DD	4194304
	DD	272633864
	DD	8
	DD	268439552
	DD	4198408
	DD	4194312
	DD	4198400
	DD	272629760
	DD	268439560
	DD	4104
	DD	268435456
	DD	268435464
	DD	272633856
	DD	134217728
	DD	65536
	DD	1024
	DD	134284320
	DD	134283296
	DD	134218752
	DD	66592
	DD	134283264
	DD	65536
	DD	32
	DD	134217760
	DD	66560
	DD	134218784
	DD	134283296
	DD	134284288
	DD	0
	DD	66560
	DD	134217728
	DD	65568
	DD	1056
	DD	134218752
	DD	66592
	DD	0
	DD	134217760
	DD	32
	DD	134218784
	DD	134284320
	DD	65568
	DD	134283264
	DD	1024
	DD	1056
	DD	134284288
	DD	134284288
	DD	134218784
	DD	65568
	DD	134283264
	DD	65536
	DD	32
	DD	134217760
	DD	134218752
	DD	134217728
	DD	66560
	DD	134284320
	DD	0
	DD	66592
	DD	134217728
	DD	1024
	DD	65568
	DD	134218784
	DD	1024
	DD	0
	DD	134284320
	DD	134283296
	DD	134284288
	DD	1056
	DD	65536
	DD	66560
	DD	134283296
	DD	134218752
	DD	1056
	DD	32
	DD	66592
	DD	134283264
	DD	134217760
	DD	2147483712
	DD	2097216
	DD	0
	DD	2149588992
	DD	2097216
	DD	8192
	DD	2147491904
	DD	2097152
	DD	8256
	DD	2149589056
	DD	2105344
	DD	2147483648
	DD	2147491840
	DD	2147483712
	DD	2149580800
	DD	2105408
	DD	2097152
	DD	2147491904
	DD	2149580864
	DD	0
	DD	8192
	DD	64
	DD	2149588992
	DD	2149580864
	DD	2149589056
	DD	2149580800
	DD	2147483648
	DD	8256
	DD	64
	DD	2105344
	DD	2105408
	DD	2147491840
	DD	8256
	DD	2147483648
	DD	2147491840
	DD	2105408
	DD	2149588992
	DD	2097216
	DD	0
	DD	2147491840
	DD	2147483648
	DD	8192
	DD	2149580864
	DD	2097152
	DD	2097216
	DD	2149589056
	DD	2105344
	DD	64
	DD	2149589056
	DD	2105344
	DD	2097152
	DD	2147491904
	DD	2147483712
	DD	2149580800
	DD	2105408
	DD	0
	DD	8192
	DD	2147483712
	DD	2147491904
	DD	2149588992
	DD	2149580800
	DD	8256
	DD	64
	DD	2149580864
	DD	16384
	DD	512
	DD	16777728
	DD	16777220
	DD	16794116
	DD	16388
	DD	16896
	DD	0
	DD	16777216
	DD	16777732
	DD	516
	DD	16793600
	DD	4
	DD	16794112
	DD	16793600
	DD	516
	DD	16777732
	DD	16384
	DD	16388
	DD	16794116
	DD	0
	DD	16777728
	DD	16777220
	DD	16896
	DD	16793604
	DD	16900
	DD	16794112
	DD	4
	DD	16900
	DD	16793604
	DD	512
	DD	16777216
	DD	16900
	DD	16793600
	DD	16793604
	DD	516
	DD	16384
	DD	512
	DD	16777216
	DD	16793604
	DD	16777732
	DD	16900
	DD	16896
	DD	0
	DD	512
	DD	16777220
	DD	4
	DD	16777728
	DD	0
	DD	16777732
	DD	16777728
	DD	16896
	DD	516
	DD	16384
	DD	16794116
	DD	16777216
	DD	16794112
	DD	4
	DD	16388
	DD	16794116
	DD	16777220
	DD	16794112
	DD	16793600
	DD	16388
	DD	545259648
	DD	545390592
	DD	131200
	DD	0
	DD	537001984
	DD	8388736
	DD	545259520
	DD	545390720
	DD	128
	DD	536870912
	DD	8519680
	DD	131200
	DD	8519808
	DD	537002112
	DD	536871040
	DD	545259520
	DD	131072
	DD	8519808
	DD	8388736
	DD	537001984
	DD	545390720
	DD	536871040
	DD	0
	DD	8519680
	DD	536870912
	DD	8388608
	DD	537002112
	DD	545259648
	DD	8388608
	DD	131072
	DD	545390592
	DD	128
	DD	8388608
	DD	131072
	DD	536871040
	DD	545390720
	DD	131200
	DD	536870912
	DD	0
	DD	8519680
	DD	545259648
	DD	537002112
	DD	537001984
	DD	8388736
	DD	545390592
	DD	128
	DD	8388736
	DD	537001984
	DD	545390720
	DD	8388608
	DD	545259520
	DD	536871040
	DD	8519680
	DD	131200
	DD	537002112
	DD	545259520
	DD	128
	DD	545390592
	DD	8519808
	DD	0
	DD	536870912
	DD	545259648
	DD	131072
	DD	8519808
_des_skb	DD	0
	DD	16
	DD	536870912
	DD	536870928
	DD	65536
	DD	65552
	DD	536936448
	DD	536936464
	DD	2048
	DD	2064
	DD	536872960
	DD	536872976
	DD	67584
	DD	67600
	DD	536938496
	DD	536938512
	DD	32
	DD	48
	DD	536870944
	DD	536870960
	DD	65568
	DD	65584
	DD	536936480
	DD	536936496
	DD	2080
	DD	2096
	DD	536872992
	DD	536873008
	DD	67616
	DD	67632
	DD	536938528
	DD	536938544
	DD	524288
	DD	524304
	DD	537395200
	DD	537395216
	DD	589824
	DD	589840
	DD	537460736
	DD	537460752
	DD	526336
	DD	526352
	DD	537397248
	DD	537397264
	DD	591872
	DD	591888
	DD	537462784
	DD	537462800
	DD	524320
	DD	524336
	DD	537395232
	DD	537395248
	DD	589856
	DD	589872
	DD	537460768
	DD	537460784
	DD	526368
	DD	526384
	DD	537397280
	DD	537397296
	DD	591904
	DD	591920
	DD	537462816
	DD	537462832
	DD	0
	DD	33554432
	DD	8192
	DD	33562624
	DD	2097152
	DD	35651584
	DD	2105344
	DD	35659776
	DD	4
	DD	33554436
	DD	8196
	DD	33562628
	DD	2097156
	DD	35651588
	DD	2105348
	DD	35659780
	DD	1024
	DD	33555456
	DD	9216
	DD	33563648
	DD	2098176
	DD	35652608
	DD	2106368
	DD	35660800
	DD	1028
	DD	33555460
	DD	9220
	DD	33563652
	DD	2098180
	DD	35652612
	DD	2106372
	DD	35660804
	DD	268435456
	DD	301989888
	DD	268443648
	DD	301998080
	DD	270532608
	DD	304087040
	DD	270540800
	DD	304095232
	DD	268435460
	DD	301989892
	DD	268443652
	DD	301998084
	DD	270532612
	DD	304087044
	DD	270540804
	DD	304095236
	DD	268436480
	DD	301990912
	DD	268444672
	DD	301999104
	DD	270533632
	DD	304088064
	DD	270541824
	DD	304096256
	DD	268436484
	DD	301990916
	DD	268444676
	DD	301999108
	DD	270533636
	DD	304088068
	DD	270541828
	DD	304096260
	DD	0
	DD	1
	DD	262144
	DD	262145
	DD	16777216
	DD	16777217
	DD	17039360
	DD	17039361
	DD	2
	DD	3
	DD	262146
	DD	262147
	DD	16777218
	DD	16777219
	DD	17039362
	DD	17039363
	DD	512
	DD	513
	DD	262656
	DD	262657
	DD	16777728
	DD	16777729
	DD	17039872
	DD	17039873
	DD	514
	DD	515
	DD	262658
	DD	262659
	DD	16777730
	DD	16777731
	DD	17039874
	DD	17039875
	DD	134217728
	DD	134217729
	DD	134479872
	DD	134479873
	DD	150994944
	DD	150994945
	DD	151257088
	DD	151257089
	DD	134217730
	DD	134217731
	DD	134479874
	DD	134479875
	DD	150994946
	DD	150994947
	DD	151257090
	DD	151257091
	DD	134218240
	DD	134218241
	DD	134480384
	DD	134480385
	DD	150995456
	DD	150995457
	DD	151257600
	DD	151257601
	DD	134218242
	DD	134218243
	DD	134480386
	DD	134480387
	DD	150995458
	DD	150995459
	DD	151257602
	DD	151257603
	DD	0
	DD	1048576
	DD	256
	DD	1048832
	DD	8
	DD	1048584
	DD	264
	DD	1048840
	DD	4096
	DD	1052672
	DD	4352
	DD	1052928
	DD	4104
	DD	1052680
	DD	4360
	DD	1052936
	DD	67108864
	DD	68157440
	DD	67109120
	DD	68157696
	DD	67108872
	DD	68157448
	DD	67109128
	DD	68157704
	DD	67112960
	DD	68161536
	DD	67113216
	DD	68161792
	DD	67112968
	DD	68161544
	DD	67113224
	DD	68161800
	DD	131072
	DD	1179648
	DD	131328
	DD	1179904
	DD	131080
	DD	1179656
	DD	131336
	DD	1179912
	DD	135168
	DD	1183744
	DD	135424
	DD	1184000
	DD	135176
	DD	1183752
	DD	135432
	DD	1184008
	DD	67239936
	DD	68288512
	DD	67240192
	DD	68288768
	DD	67239944
	DD	68288520
	DD	67240200
	DD	68288776
	DD	67244032
	DD	68292608
	DD	67244288
	DD	68292864
	DD	67244040
	DD	68292616
	DD	67244296
	DD	68292872
	DD	0
	DD	268435456
	DD	65536
	DD	268500992
	DD	4
	DD	268435460
	DD	65540
	DD	268500996
	DD	536870912
	DD	805306368
	DD	536936448
	DD	805371904
	DD	536870916
	DD	805306372
	DD	536936452
	DD	805371908
	DD	1048576
	DD	269484032
	DD	1114112
	DD	269549568
	DD	1048580
	DD	269484036
	DD	1114116
	DD	269549572
	DD	537919488
	DD	806354944
	DD	537985024
	DD	806420480
	DD	537919492
	DD	806354948
	DD	537985028
	DD	806420484
	DD	4096
	DD	268439552
	DD	69632
	DD	268505088
	DD	4100
	DD	268439556
	DD	69636
	DD	268505092
	DD	536875008
	DD	805310464
	DD	536940544
	DD	805376000
	DD	536875012
	DD	805310468
	DD	536940548
	DD	805376004
	DD	1052672
	DD	269488128
	DD	1118208
	DD	269553664
	DD	1052676
	DD	269488132
	DD	1118212
	DD	269553668
	DD	537923584
	DD	806359040
	DD	537989120
	DD	806424576
	DD	537923588
	DD	806359044
	DD	537989124
	DD	806424580
	DD	0
	DD	134217728
	DD	8
	DD	134217736
	DD	1024
	DD	134218752
	DD	1032
	DD	134218760
	DD	131072
	DD	134348800
	DD	131080
	DD	134348808
	DD	132096
	DD	134349824
	DD	132104
	DD	134349832
	DD	1
	DD	134217729
	DD	9
	DD	134217737
	DD	1025
	DD	134218753
	DD	1033
	DD	134218761
	DD	131073
	DD	134348801
	DD	131081
	DD	134348809
	DD	132097
	DD	134349825
	DD	132105
	DD	134349833
	DD	33554432
	DD	167772160
	DD	33554440
	DD	167772168
	DD	33555456
	DD	167773184
	DD	33555464
	DD	167773192
	DD	33685504
	DD	167903232
	DD	33685512
	DD	167903240
	DD	33686528
	DD	167904256
	DD	33686536
	DD	167904264
	DD	33554433
	DD	167772161
	DD	33554441
	DD	167772169
	DD	33555457
	DD	167773185
	DD	33555465
	DD	167773193
	DD	33685505
	DD	167903233
	DD	33685513
	DD	167903241
	DD	33686529
	DD	167904257
	DD	33686537
	DD	167904265
	DD	0
	DD	256
	DD	524288
	DD	524544
	DD	16777216
	DD	16777472
	DD	17301504
	DD	17301760
	DD	16
	DD	272
	DD	524304
	DD	524560
	DD	16777232
	DD	16777488
	DD	17301520
	DD	17301776
	DD	2097152
	DD	2097408
	DD	2621440
	DD	2621696
	DD	18874368
	DD	18874624
	DD	19398656
	DD	19398912
	DD	2097168
	DD	2097424
	DD	2621456
	DD	2621712
	DD	18874384
	DD	18874640
	DD	19398672
	DD	19398928
	DD	512
	DD	768
	DD	524800
	DD	525056
	DD	16777728
	DD	16777984
	DD	17302016
	DD	17302272
	DD	528
	DD	784
	DD	524816
	DD	525072
	DD	16777744
	DD	16778000
	DD	17302032
	DD	17302288
	DD	2097664
	DD	2097920
	DD	2621952
	DD	2622208
	DD	18874880
	DD	18875136
	DD	19399168
	DD	19399424
	DD	2097680
	DD	2097936
	DD	2621968
	DD	2622224
	DD	18874896
	DD	18875152
	DD	19399184
	DD	19399440
	DD	0
	DD	67108864
	DD	262144
	DD	67371008
	DD	2
	DD	67108866
	DD	262146
	DD	67371010
	DD	8192
	DD	67117056
	DD	270336
	DD	67379200
	DD	8194
	DD	67117058
	DD	270338
	DD	67379202
	DD	32
	DD	67108896
	DD	262176
	DD	67371040
	DD	34
	DD	67108898
	DD	262178
	DD	67371042
	DD	8224
	DD	67117088
	DD	270368
	DD	67379232
	DD	8226
	DD	67117090
	DD	270370
	DD	67379234
	DD	2048
	DD	67110912
	DD	264192
	DD	67373056
	DD	2050
	DD	67110914
	DD	264194
	DD	67373058
	DD	10240
	DD	67119104
	DD	272384
	DD	67381248
	DD	10242
	DD	67119106
	DD	272386
	DD	67381250
	DD	2080
	DD	67110944
	DD	264224
	DD	67373088
	DD	2082
	DD	67110946
	DD	264226
	DD	67373090
	DD	10272
	DD	67119136
	DD	272416
	DD	67381280
	DD	10274
	DD	67119138
	DD	272418
	DD	67381282
_odd_parity	DB	1
	DB	1
	DB	2
	DB	2
	DB	4
	DB	4
	DB	7
	DB	7
	DB	8
	DB	8
	DB	11
	DB	11
	DB	13
	DB	13
	DB	14
	DB	14
	DB	16
	DB	16
	DB	19
	DB	19
	DB	21
	DB	21
	DB	22
	DB	22
	DB	25
	DB	25
	DB	26
	DB	26
	DB	28
	DB	28
	DB	31
	DB	31
	DB	32
	DB	32
	DB	35
	DB	35
	DB	37
	DB	37
	DB	38
	DB	38
	DB	41
	DB	41
	DB	42
	DB	42
	DB	44
	DB	44
	DB	47
	DB	47
	DB	49
	DB	49
	DB	50
	DB	50
	DB	52
	DB	52
	DB	55
	DB	55
	DB	56
	DB	56
	DB	59
	DB	59
	DB	61
	DB	61
	DB	62
	DB	62
	DB	64
	DB	64
	DB	67
	DB	67
	DB	69
	DB	69
	DB	70
	DB	70
	DB	73
	DB	73
	DB	74
	DB	74
	DB	76
	DB	76
	DB	79
	DB	79
	DB	81
	DB	81
	DB	82
	DB	82
	DB	84
	DB	84
	DB	87
	DB	87
	DB	88
	DB	88
	DB	91
	DB	91
	DB	93
	DB	93
	DB	94
	DB	94
	DB	97
	DB	97
	DB	98
	DB	98
	DB	100
	DB	100
	DB	103
	DB	103
	DB	104
	DB	104
	DB	107
	DB	107
	DB	109
	DB	109
	DB	110
	DB	110
	DB	112
	DB	112
	DB	115
	DB	115
	DB	117
	DB	117
	DB	118
	DB	118
	DB	121
	DB	121
	DB	122
	DB	122
	DB	124
	DB	124
	DB	127
	DB	127
	DB	128
	DB	128
	DB	131
	DB	131
	DB	133
	DB	133
	DB	134
	DB	134
	DB	137
	DB	137
	DB	138
	DB	138
	DB	140
	DB	140
	DB	143
	DB	143
	DB	145
	DB	145
	DB	146
	DB	146
	DB	148
	DB	148
	DB	151
	DB	151
	DB	152
	DB	152
	DB	155
	DB	155
	DB	157
	DB	157
	DB	158
	DB	158
	DB	161
	DB	161
	DB	162
	DB	162
	DB	164
	DB	164
	DB	167
	DB	167
	DB	168
	DB	168
	DB	171
	DB	171
	DB	173
	DB	173
	DB	174
	DB	174
	DB	176
	DB	176
	DB	179
	DB	179
	DB	181
	DB	181
	DB	182
	DB	182
	DB	185
	DB	185
	DB	186
	DB	186
	DB	188
	DB	188
	DB	191
	DB	191
	DB	193
	DB	193
	DB	194
	DB	194
	DB	196
	DB	196
	DB	199
	DB	199
	DB	200
	DB	200
	DB	203
	DB	203
	DB	205
	DB	205
	DB	206
	DB	206
	DB	208
	DB	208
	DB	211
	DB	211
	DB	213
	DB	213
	DB	214
	DB	214
	DB	217
	DB	217
	DB	218
	DB	218
	DB	220
	DB	220
	DB	223
	DB	223
	DB	224
	DB	224
	DB	227
	DB	227
	DB	229
	DB	229
	DB	230
	DB	230
	DB	233
	DB	233
	DB	234
	DB	234
	DB	236
	DB	236
	DB	239
	DB	239
	DB	241
	DB	241
	DB	242
	DB	242
	DB	244
	DB	244
	DB	247
	DB	247
	DB	248
	DB	248
	DB	251
	DB	251
	DB	253
	DB	253
	DB	254
	DB	254
_2il0floatpacket.9	DD	000000000H,000000000H,000000000H,043f00000H
_2il0floatpacket.125	DD	0fefefefeH,0fefefefeH,0fefefefeH,0fefefefeH
_2il0floatpacket.116	DD	0ffffffffH,0ffffffffH
_2il0floatpacket.117	DD	000000001H,000000000H
_2il0floatpacket.8	DD	0358637beH
??_C@_0BF@A@?6?5?5Invalid?5hash?5?$DN?5?$CFs?$AA@	DD	1226842122
	DD	1818326638
	DD	1746953321
	DD	543716193
	DD	1931812925
	DB	0
	DB 3 DUP ( 0H)	; pad
??_C@_03A@?$CF2x?$AA@	DD	7877157
??_C@_0L@A@0123456789?$AA@	DD	858927408
	DD	926299444
	DW	14648
	DB	0
	DB 1 DUP ( 0H)	; pad
??_C@_0BL@A@ABCDEFGHIJKLMNOPQRSTUVWXYZ?$AA@	DD	1145258561
	DD	1212630597
	DD	1280002633
	DD	1347374669
	DD	1414746705
	DD	1482118741
	DW	23129
	DB	0
	DB 1 DUP ( 0H)	; pad
??_C@_0CC@A@?5?$CB?$CC?$CD$?$CF?$CG?8?$CI?$CJ?$CK?$CL?0?9?4?1?3?$DL?$DM?$DN?$DO?$DP?$EA?$FL?2?$FN?$FO_?$GA?$HL?$HM?$HN?$HO?$AA@	DD	589439264
	DD	656811300
	DD	724183336
	DD	791555372
	DD	1027357498
	DD	1530937150
	DD	1600019804
	DD	2105310048
	DW	126
	DB 2 DUP ( 0H)	; pad
??_C@_0BF@A@?5?5?$FL?5starting?5on?5?3?5?$CFs?$AA@	DD	542842912
	DD	1918989427
	DD	1735289204
	DD	544108320
	DD	1931812922
	DB	0
	DB 3 DUP ( 0H)	; pad
??_C@_0BI@A@?5?5?$FL?5start?5pwd?5?5?5?3?5?$CC?$CFs?$CC?6?$AA@	DD	542842912
	DD	1918989427
	DD	2003837044
	DD	538976356
	DD	622993466
	DD	664179
??_C@_0BI@A@?5?5?$FL?5end?5pwd?5?5?5?5?5?3?5?$CC?$CFs?$CC?6?$AA@	DD	542842912
	DD	543452773
	DD	543455088
	DD	538976288
	DD	622993466
	DD	664179
??_C@_0BI@A@?5?5?$FL?5alphabet?5?5?5?5?3?5?$CC?$CFs?$CC?6?$AA@	DD	542842912
	DD	1752198241
	DD	1952801377
	DD	538976288
	DD	622993466
	DD	664179
??_C@_0BJ@A@?5?5?$FL?5total?5pwd?5?5?5?3?5?$CFI64u?6?$AA@	DD	542842912
	DD	1635020660
	DD	2003837036
	DD	538976356
	DD	1227169850
	DD	175453238
	DB	0
	DB 3 DUP ( 0H)	; pad
??_C@_0BJ@A@?5?5?$FL?5thread?5cbn?5?5?3?5?$CFI64u?6?$AA@	DD	542842912
	DD	1701996660
	DD	1663067233
	DD	538996322
	DD	1227169850
	DD	175453238
	DB	0
	DB 3 DUP ( 0H)	; pad
??_C@_0BK@A@?5?5?$FL?5thread?5cnt?5?5?3?5?$CFI64u?6?6?$AA@	DD	542842912
	DD	1701996660
	DD	1663067233
	DD	538997870
	DD	1227169850
	DD	175453238
	DW	10
	DB 2 DUP ( 0H)	; pad
??_C@_0BG@A@?6?5?5?$FL?5ending?5on?5?5?5?3?5?$CFs?$AA@	DD	1528832010
	DD	1684956448
	DD	543649385
	DD	538996335
	DD	622869024
	DW	115
	DB 2 DUP ( 0H)	; pad
??_C@_0BJ@A@?6?5?5?$FL?5password?5?5?5?5?3?5?$CC?$CFs?$CC?6?$AA@	DD	1528832010
	DD	1935765536
	DD	1919907699
	DD	538976356
	DD	572537376
	DD	170029861
	DB	0
	DB 3 DUP ( 0H)	; pad
??_C@_0BG@A@?5?5?$FL?5unknown?5option?5?$CFc?$AA@	DD	542842912
	DD	1852534389
	DD	544110447
	DD	1769238639
	DD	622882415
	DW	99
	DB 2 DUP ( 0H)	; pad
??_C@_0BN@A@?5?5?$FL?5?$CFc?$CFc?5requires?5parameter?6?$AA@	DD	542842912
	DD	1663394597
	DD	1902473760
	DD	1701996917
	DD	1634738291
	DD	1701667186
	DD	175269236
	DB	0
_RDATA	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
EXTRN	__imp__GetStdHandle@4:BYTE
EXTRN	__imp__GetConsoleScreenBufferInfo@8:BYTE
EXTRN	__imp__GetSystemInfo@4:BYTE
EXTRN	__imp__CreateThread@24:BYTE
EXTRN	__imp__WaitForMultipleObjects@16:BYTE
EXTRN	__imp__GetExitCodeThread@8:BYTE
EXTRN	__imp__SetConsoleScreenBufferSize@8:BYTE
_DATA	ENDS
EXTRN	_puts:PROC
EXTRN	__localtime64:PROC
EXTRN	__time64:PROC
EXTRN	_isxdigit:PROC
EXTRN	_sscanf:PROC
EXTRN	_printf:PROC
EXTRN	_exit:PROC
EXTRN	_isdigit:PROC
EXTRN	_asctime:PROC
EXTRN	___intel_new_feature_proc_init:PROC
EXTRN	___intel_sse4_atoi:PROC
EXTRN	___intel_sse4_strchr:PROC
EXTRN	___intel_sse4_strlen:PROC
EXTRN	___intel_sse4_strncat:PROC
EXTRN	___intel_ssse3_strncpy:PROC
EXTRN	__allmul:PROC
EXTRN	__aulldiv:PROC
EXTRN	__aullrem:PROC
EXTRN	__chkstk:PROC
EXTRN	__fltused:BYTE
	INCLUDELIB <libdecimal>
	END
