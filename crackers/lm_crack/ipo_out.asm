; mark_description "Intel(R) C++ Compiler XE for applications running on IA-32, Version 15.0.0.108 Build 20140726";
; mark_description "-O3 -fast -Fa";
	.686P
 	.387
	OPTION DOTNAME
	ASSUME	CS:FLAT,DS:FLAT,SS:FLAT
;ident "-defaultlib:libcpmt"
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
        push      ebp                                           ;314.34
        mov       ebp, esp                                      ;314.34
        and       esp, -128                                     ;314.34
        push      esi                                           ;314.34
        push      edi                                           ;314.34
        push      ebx                                           ;314.34
        sub       esp, 244                                      ;314.34
        push      0                                             ;314.34
        push      6142                                          ;314.34
        push      3                                             ;314.34
        mov       edi, DWORD PTR [12+ebp]                       ;314.5
        call      ___intel_new_feature_proc_init                ;314.34
                                ; LOE edi
.B1.45:                         ; Preds .B1.1
        add       esp, 12                                       ;314.34
        stmxcsr   DWORD PTR [128+esp]                           ;314.34
        or        DWORD PTR [128+esp], 32832                    ;314.34
        ldmxcsr   DWORD PTR [128+esp]                           ;314.34
        cmp       DWORD PTR [8+ebp], 5                          ;318.15
        jne       .B1.36        ; Prob 21%                      ;318.15
                                ; LOE edi
.B1.2:                          ; Preds .B1.45
        mov       esi, DWORD PTR [4+edi]                        ;323.16
        mov       edx, esi                                      ;323.8
        mov       ecx, edx                                      ;323.8
        and       edx, -16                                      ;323.8
        pxor      xmm0, xmm0                                    ;323.8
        pcmpeqb   xmm0, XMMWORD PTR [edx]                       ;323.8
        pmovmskb  eax, xmm0                                     ;323.8
        and       ecx, 15                                       ;323.8
        shr       eax, cl                                       ;323.8
        bsf       eax, eax                                      ;323.8
        jne       L2            ; Prob 60%                      ;323.8
        mov       eax, edx                                      ;323.8
        add       edx, ecx                                      ;323.8
        call      ___intel_sse4_strlen                          ;323.8
L2:                                                             ;
                                ; LOE eax esi edi
.B1.46:                         ; Preds .B1.2
        mov       ebx, eax                                      ;323.8
        test      bl, 1                                         ;323.8
        jne       .B1.34        ; Prob 28%                      ;323.8
                                ; LOE ebx esi edi
.B1.3:                          ; Preds .B1.46
        test      ebx, ebx                                      ;323.8
        jbe       .B1.8         ; Prob 15%                      ;323.8
                                ; LOE ebx esi edi
.B1.4:                          ; Preds .B1.3
        xor       eax, eax                                      ;323.8
        mov       edi, eax                                      ;323.8
                                ; LOE ebx esi edi
.B1.5:                          ; Preds .B1.6 .B1.4
        movsx     ecx, BYTE PTR [edi+esi]                       ;323.8
        push      ecx                                           ;323.8
        call      _isxdigit                                     ;323.8
                                ; LOE eax ebx esi edi
.B1.47:                         ; Preds .B1.5
        add       esp, 4                                        ;323.8
        test      eax, eax                                      ;323.8
        je        .B1.34        ; Prob 20%                      ;323.8
                                ; LOE ebx esi edi
.B1.6:                          ; Preds .B1.47
        inc       edi                                           ;323.8
        cmp       edi, ebx                                      ;323.8
        jb        .B1.5         ; Prob 82%                      ;323.8
                                ; LOE ebx esi edi
.B1.7:                          ; Preds .B1.6
        mov       edi, DWORD PTR [12+ebp]                       ;
                                ; LOE ebx esi edi
.B1.8:                          ; Preds .B1.3 .B1.7
        shr       ebx, 1                                        ;323.8
        test      ebx, ebx                                      ;323.8
        jbe       .B1.40        ; Prob 10%                      ;323.8
                                ; LOE ebx esi edi
.B1.9:                          ; Preds .B1.8
        xor       eax, eax                                      ;323.8
        mov       edi, eax                                      ;323.8
                                ; LOE ebx esi edi
.B1.10:                         ; Preds .B1.11 .B1.9
        lea       ecx, DWORD PTR [152+esp]                      ;323.8
        push      ecx                                           ;323.8
        push      OFFSET FLAT: ??_C@_03A@?$CF2x?$AA@            ;323.8
        lea       ecx, DWORD PTR [esi+edi*2]                    ;323.8
        push      ecx                                           ;323.8
        call      _sscanf                                       ;323.8
                                ; LOE ebx esi edi
.B1.48:                         ; Preds .B1.10
        add       esp, 12                                       ;323.8
                                ; LOE ebx esi edi
.B1.11:                         ; Preds .B1.48
        mov       ecx, DWORD PTR [152+esp]                      ;323.8
        mov       BYTE PTR [_hash+edi], cl                      ;323.8
        inc       edi                                           ;323.8
        cmp       edi, ebx                                      ;323.8
        jb        .B1.10        ; Prob 82%                      ;323.8
                                ; LOE ebx esi edi
.B1.12:                         ; Preds .B1.11
        mov       edi, DWORD PTR [12+ebp]                       ;
                                ; LOE edi
.B1.13:                         ; Preds .B1.40 .B1.12
        mov       edx, OFFSET FLAT: _start_pw                   ;328.3
        mov       eax, 256                                      ;328.3
        mov       ecx, DWORD PTR [8+edi]                        ;328.3
        call      ___intel_ssse3_strncpy                        ;328.3
                                ; LOE edi
.B1.14:                         ; Preds .B1.13
        mov       edx, OFFSET FLAT: _end_pw                     ;329.3
        mov       eax, 256                                      ;329.3
        mov       ecx, DWORD PTR [12+edi]                       ;329.3
        call      ___intel_ssse3_strncpy                        ;329.3
                                ; LOE edi
.B1.15:                         ; Preds .B1.14
        mov       edx, OFFSET FLAT: _alphabet                   ;330.3
        mov       eax, 256                                      ;330.3
        mov       ecx, DWORD PTR [16+edi]                       ;330.3
        call      ___intel_ssse3_strncpy                        ;330.3
                                ; LOE
.B1.16:                         ; Preds .B1.15
        mov       edx, OFFSET FLAT: _alphabet                   ;332.15
        mov       ecx, edx                                      ;332.15
        and       edx, -16                                      ;332.15
        pxor      xmm0, xmm0                                    ;332.15
        pcmpeqb   xmm0, XMMWORD PTR [edx]                       ;332.15
        pmovmskb  eax, xmm0                                     ;332.15
        and       ecx, 15                                       ;332.15
        shr       eax, cl                                       ;332.15
        bsf       eax, eax                                      ;332.15
        jne       L3            ; Prob 60%                      ;332.15
        mov       eax, edx                                      ;332.15
        add       edx, ecx                                      ;332.15
        call      ___intel_sse4_strlen                          ;332.15
L3:                                                             ;
                                ; LOE eax
.B1.50:                         ; Preds .B1.16
        mov       edx, OFFSET FLAT: _start_pw                   ;333.15
        mov       DWORD PTR [128+esp], eax                      ;332.15
        mov       DWORD PTR [_alpha_len], eax                   ;332.3
        mov       ecx, edx                                      ;333.15
        and       edx, -16                                      ;333.15
        pxor      xmm0, xmm0                                    ;333.15
        pcmpeqb   xmm0, XMMWORD PTR [edx]                       ;333.15
        pmovmskb  eax, xmm0                                     ;333.15
        and       ecx, 15                                       ;333.15
        shr       eax, cl                                       ;333.15
        bsf       eax, eax                                      ;333.15
        jne       L4            ; Prob 60%                      ;333.15
        mov       eax, edx                                      ;333.15
        add       edx, ecx                                      ;333.15
        call      ___intel_sse4_strlen                          ;333.15
L4:                                                             ;
                                ; LOE eax
.B1.49:                         ; Preds .B1.50
        mov       edx, eax                                      ;333.15
        xor       esi, esi                                      ;333.15
        xor       ebx, ebx                                      ;333.15
        test      edx, edx                                      ;333.15
        jbe       .B1.22        ; Prob 4%                       ;333.15
                                ; LOE edx ebx esi
.B1.17:                         ; Preds .B1.49
        xor       edi, edi                                      ;333.15
        mov       eax, 1                                        ;333.15
        mov       DWORD PTR [132+esp], ebx                      ;333.15
        mov       ebx, edi                                      ;333.15
        mov       DWORD PTR [136+esp], esi                      ;333.15
        mov       esi, eax                                      ;333.15
        mov       DWORD PTR [140+esp], edx                      ;333.15
                                ; LOE ebx esi edi
.B1.18:                         ; Preds .B1.52 .B1.17
        mov       eax, OFFSET FLAT: _alphabet                   ;333.15
        movsx     edx, BYTE PTR [_start_pw+ebx]                 ;333.15
        mov       ecx, eax                                      ;333.15
        and       ecx, 15                                       ;333.15
        and       eax, -16                                      ;333.15
        push      eax                                           ;333.15
        pxor      xmm2, xmm2                                    ;333.15
        movd      xmm1, edx                                     ;333.15
        pshufb    xmm1, xmm2                                    ;333.15
        movdqa    xmm0, XMMWORD PTR [eax]                       ;333.15
        pcmpeqb   xmm2, xmm0                                    ;333.15
        pcmpeqb   xmm0, xmm1                                    ;333.15
        pmovmskb  edx, xmm0                                     ;333.15
        pmovmskb  eax, xmm2                                     ;333.15
        shr       edx, cl                                       ;333.15
        shr       eax, cl                                       ;333.15
        test      edx, edx                                      ;333.15
        jne       L5            ; Prob 25%                      ;333.15
        test      eax, eax                                      ;333.15
        je        L8            ; Prob 25%                      ;333.15
        jmp       L7            ; Prob 100%                     ;333.15
L5:                                                             ;
        bsf       edx, edx                                      ;333.15
        bsf       eax, eax                                      ;333.15
        jz        L6            ; Prob 50%                      ;333.15
        cmp       edx, eax                                      ;333.15
        jg        L7            ; Prob 25%                      ;333.15
L6:                                                             ;
        pop       eax                                           ;333.15
        add       eax, ecx                                      ;333.15
        add       eax, edx                                      ;333.15
        jmp       L9            ; Prob 25%                      ;333.15
L7:                                                             ;
        pop       edx                                           ;333.15
        xor       eax, eax                                      ;333.15
        jmp       L9            ; Prob 100%                     ;333.15
L8:                                                             ;
        pop       eax                                           ;333.15
        call      ___intel_sse4_strchr                          ;333.15
L9:                                                             ;
                                ; LOE eax ebx esi edi
.B1.51:                         ; Preds .B1.18
        inc       eax                                           ;333.15
        mov       edx, OFFSET FLAT: _alphabet                   ;333.15
        sub       eax, edx                                      ;333.15
        je        .B1.39        ; Prob 20%                      ;333.15
                                ; LOE eax ebx esi edi
.B1.19:                         ; Preds .B1.51
        push      0                                             ;333.15
        push      eax                                           ;333.15
        push      edi                                           ;333.15
        push      esi                                           ;333.15
        call      __allmul                                      ;333.15
                                ; LOE eax edx ebx esi edi
.B1.53:                         ; Preds .B1.19
        push      edi                                           ;333.15
        push      esi                                           ;333.15
        push      0                                             ;333.15
        push      DWORD PTR [140+esp]                           ;333.15
        add       DWORD PTR [152+esp], eax                      ;333.15
        adc       DWORD PTR [148+esp], edx                      ;333.15
        call      __allmul                                      ;333.15
                                ; LOE eax edx ebx
.B1.52:                         ; Preds .B1.53
        inc       ebx                                           ;333.15
        mov       esi, eax                                      ;333.15
        mov       edi, edx                                      ;333.15
        cmp       ebx, DWORD PTR [140+esp]                      ;333.15
        jb        .B1.18        ; Prob 82%                      ;333.15
                                ; LOE ebx esi edi
.B1.20:                         ; Preds .B1.52
        mov       ebx, DWORD PTR [132+esp]                      ;
        mov       esi, DWORD PTR [136+esp]                      ;
                                ; LOE ebx esi
.B1.22:                         ; Preds .B1.20 .B1.49 .B1.39
        mov       edx, OFFSET FLAT: _end_pw                     ;334.13
        mov       DWORD PTR [_start_cbn], esi                   ;333.3
        mov       DWORD PTR [_start_cbn+4], ebx                 ;333.3
        mov       ecx, edx                                      ;334.13
        and       edx, -16                                      ;334.13
        pxor      xmm0, xmm0                                    ;334.13
        pcmpeqb   xmm0, XMMWORD PTR [edx]                       ;334.13
        pmovmskb  eax, xmm0                                     ;334.13
        and       ecx, 15                                       ;334.13
        shr       eax, cl                                       ;334.13
        bsf       eax, eax                                      ;334.13
        jne       L10           ; Prob 60%                      ;334.13
        mov       eax, edx                                      ;334.13
        add       edx, ecx                                      ;334.13
        call      ___intel_sse4_strlen                          ;334.13
L10:                                                            ;
                                ; LOE eax ebx esi
.B1.54:                         ; Preds .B1.22
        mov       edx, eax                                      ;334.13
        xor       eax, eax                                      ;334.13
        xor       edi, edi                                      ;334.13
        test      edx, edx                                      ;334.13
        jbe       .B1.28        ; Prob 4%                       ;334.13
                                ; LOE eax edx ebx esi edi
.B1.23:                         ; Preds .B1.54
        xor       ecx, ecx                                      ;334.13
        mov       DWORD PTR [140+esp], 1                        ;334.13
        mov       DWORD PTR [148+esp], ecx                      ;334.13
        mov       DWORD PTR [144+esp], edx                      ;334.13
        mov       DWORD PTR [132+esp], ebx                      ;334.13
        mov       ebx, eax                                      ;334.13
        mov       DWORD PTR [136+esp], esi                      ;334.13
        mov       esi, ecx                                      ;334.13
                                ; LOE ebx esi edi
.B1.24:                         ; Preds .B1.56 .B1.23
        mov       edx, DWORD PTR [148+esp]                      ;334.13
        mov       eax, OFFSET FLAT: _alphabet                   ;334.13
        movsx     edx, BYTE PTR [_end_pw+edx]                   ;334.13
        mov       ecx, eax                                      ;334.13
        and       ecx, 15                                       ;334.13
        and       eax, -16                                      ;334.13
        push      eax                                           ;334.13
        pxor      xmm2, xmm2                                    ;334.13
        movd      xmm1, edx                                     ;334.13
        pshufb    xmm1, xmm2                                    ;334.13
        movdqa    xmm0, XMMWORD PTR [eax]                       ;334.13
        pcmpeqb   xmm2, xmm0                                    ;334.13
        pcmpeqb   xmm0, xmm1                                    ;334.13
        pmovmskb  edx, xmm0                                     ;334.13
        pmovmskb  eax, xmm2                                     ;334.13
        shr       edx, cl                                       ;334.13
        shr       eax, cl                                       ;334.13
        test      edx, edx                                      ;334.13
        jne       L11           ; Prob 25%                      ;334.13
        test      eax, eax                                      ;334.13
        je        L14           ; Prob 25%                      ;334.13
        jmp       L13           ; Prob 100%                     ;334.13
L11:                                                            ;
        bsf       edx, edx                                      ;334.13
        bsf       eax, eax                                      ;334.13
        jz        L12           ; Prob 50%                      ;334.13
        cmp       edx, eax                                      ;334.13
        jg        L13           ; Prob 25%                      ;334.13
L12:                                                            ;
        pop       eax                                           ;334.13
        add       eax, ecx                                      ;334.13
        add       eax, edx                                      ;334.13
        jmp       L15           ; Prob 25%                      ;334.13
L13:                                                            ;
        pop       edx                                           ;334.13
        xor       eax, eax                                      ;334.13
        jmp       L15           ; Prob 100%                     ;334.13
L14:                                                            ;
        pop       eax                                           ;334.13
        call      ___intel_sse4_strchr                          ;334.13
L15:                                                            ;
                                ; LOE eax ebx esi edi
.B1.55:                         ; Preds .B1.24
        inc       eax                                           ;334.13
        mov       edx, OFFSET FLAT: _alphabet                   ;334.13
        sub       eax, edx                                      ;334.13
        je        .B1.38        ; Prob 20%                      ;334.13
                                ; LOE eax ebx esi edi
.B1.25:                         ; Preds .B1.55
        push      0                                             ;334.13
        push      eax                                           ;334.13
        push      esi                                           ;334.13
        push      DWORD PTR [152+esp]                           ;334.13
        call      __allmul                                      ;334.13
                                ; LOE eax edx ebx esi edi
.B1.57:                         ; Preds .B1.25
        push      0                                             ;334.13
        push      DWORD PTR [132+esp]                           ;334.13
        add       ebx, eax                                      ;334.13
        push      esi                                           ;334.13
        push      DWORD PTR [152+esp]                           ;334.13
        adc       edi, edx                                      ;334.13
        call      __allmul                                      ;334.13
                                ; LOE eax edx ebx edi
.B1.56:                         ; Preds .B1.57
        mov       esi, edx                                      ;334.13
        mov       edx, DWORD PTR [148+esp]                      ;334.13
        inc       edx                                           ;334.13
        mov       DWORD PTR [140+esp], eax                      ;334.13
        mov       DWORD PTR [148+esp], edx                      ;334.13
        cmp       edx, DWORD PTR [144+esp]                      ;334.13
        jb        .B1.24        ; Prob 82%                      ;334.13
                                ; LOE ebx esi edi
.B1.26:                         ; Preds .B1.56
        mov       esi, DWORD PTR [136+esp]                      ;
        mov       eax, ebx                                      ;
        mov       ebx, DWORD PTR [132+esp]                      ;
                                ; LOE eax ebx esi edi
.B1.28:                         ; Preds .B1.26 .B1.54 .B1.38
        add       esi, -1                                       ;336.3
        mov       DWORD PTR [_end_cbn], eax                     ;334.3
        mov       eax, OFFSET FLAT: _alphabet                   ;339.3
        adc       ebx, -1                                       ;336.3
        mov       DWORD PTR [_end_cbn+4], edi                   ;334.3
        mov       DWORD PTR [_start_cbn], esi                   ;336.3
        mov       DWORD PTR [_start_cbn+4], ebx                 ;336.3
        call      _DES_init_keys                                ;339.3
                                ; LOE
.B1.29:                         ; Preds .B1.28
        call      _clock                                        ;341.16
                                ; LOE eax
.B1.58:                         ; Preds .B1.29
        mov       ebx, eax                                      ;341.16
                                ; LOE ebx
.B1.30:                         ; Preds .B1.58
        mov       eax, OFFSET FLAT: _ptext                      ;342.3
        mov       edx, OFFSET FLAT: _hash                       ;342.3
        call      _lm_fast                                      ;342.3
                                ; LOE ebx
.B1.31:                         ; Preds .B1.30
        call      _clock                                        ;343.13
                                ; LOE eax ebx
.B1.59:                         ; Preds .B1.31
        mov       edx, eax                                      ;343.13
                                ; LOE edx ebx
.B1.32:                         ; Preds .B1.59
        fild      QWORD PTR [_completed]                        ;346.3
        sub       edx, ebx                                      ;346.3
        xorps     xmm0, xmm0                                    ;346.3
        cvtsi2ss  xmm0, edx                                     ;346.3
        mulss     xmm0, DWORD PTR [_2il0floatpacket.1]          ;346.3
        movss     xmm2, DWORD PTR [_2il0floatpacket.0]          ;346.3
        divss     xmm2, xmm0                                    ;346.3
        mov       eax, DWORD PTR [_completed]                   ;346.42
        mov       ecx, DWORD PTR [_completed+4]                 ;346.42
        mov       DWORD PTR [esp], OFFSET FLAT: ??_C@_0BM@A@?6?5Completed?3?5?$CFlld?5?$CF?42fM?5k?1s?$AA@ ;346.3
        mov       DWORD PTR [4+esp], eax                        ;346.3
        mov       DWORD PTR [8+esp], ecx                        ;346.3
        shr       ecx, 31                                       ;346.3
        fadd      QWORD PTR [_2il0floatpacket.3+ecx*8]          ;346.3
        fstp      DWORD PTR [128+esp]                           ;346.3
        movss     xmm1, DWORD PTR [128+esp]                     ;346.3
        mulss     xmm2, xmm1                                    ;346.3
        cvtss2sd  xmm2, xmm2                                    ;346.3
        movsd     QWORD PTR [12+esp], xmm2                      ;346.3
        call      _printf                                       ;346.3
                                ; LOE
.B1.33:                         ; Preds .B1.32
        xor       eax, eax                                      ;347.10
        add       esp, 244                                      ;347.10
        pop       ebx                                           ;347.10
        pop       edi                                           ;347.10
        pop       esi                                           ;347.10
        mov       esp, ebp                                      ;347.10
        pop       ebp                                           ;347.10
        ret                                                     ;347.10
                                ; LOE
.B1.34:                         ; Preds .B1.47 .B1.46 .B1.41
        push      esi                                           ;324.5
        push      OFFSET FLAT: ??_C@_0BF@A@?6?5?5Invalid?5hash?5?$DN?5?$CFs?$AA@ ;324.5
        call      _printf                                       ;324.5
                                ; LOE
.B1.60:                         ; Preds .B1.34
        add       esp, 8                                        ;324.5
                                ; LOE
.B1.35:                         ; Preds .B1.60
        push      2                                             ;325.5
        call      _exit                                         ;325.5
                                ; LOE
.B1.36:                         ; Preds .B1.45
        push      DWORD PTR [edi]                               ;319.5
        push      OFFSET FLAT: ??_C@_0CO@A@?6?5?5Usage?3?5?$CFs?5?$DMhash?$DO?5?$DMstart?$DO?5?$DMend?$DO?5?$DMalphabet?$DO?6?$AA@ ;319.5
        call      _printf                                       ;319.5
                                ; LOE
.B1.61:                         ; Preds .B1.36
        add       esp, 8                                        ;319.5
                                ; LOE
.B1.37:                         ; Preds .B1.61
        push      1                                             ;320.5
        call      _exit                                         ;320.5
                                ; LOE
.B1.38:                         ; Preds .B1.55                  ; Infreq
        xor       eax, eax                                      ;334.13
        mov       ebx, DWORD PTR [132+esp]                      ;
        xor       edi, edi                                      ;334.13
        mov       esi, DWORD PTR [136+esp]                      ;
        jmp       .B1.28        ; Prob 100%                     ;
                                ; LOE eax ebx esi edi
.B1.39:                         ; Preds .B1.51                  ; Infreq
        xor       esi, esi                                      ;333.15
        xor       ebx, ebx                                      ;333.15
        jmp       .B1.22        ; Prob 100%                     ;333.15
                                ; LOE ebx esi
.B1.40:                         ; Preds .B1.8                   ; Infreq
        jne       .B1.13        ; Prob 50%                      ;323.8
                                ; LOE edi
.B1.41:                         ; Preds .B1.40                  ; Infreq
        mov       esi, DWORD PTR [4+edi]                        ;324.37
        jmp       .B1.34        ; Prob 100%                     ;324.37
        ALIGN     16
                                ; LOE esi
; mark_end;
_main ENDP
;_main	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _main
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _lm_fast
TXTST1:
; -- Begin  _lm_fast
;_lm_fast	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _lm_fast
; mark_begin;
       ALIGN     16
_lm_fast	PROC NEAR PRIVATE
; parameter 1: eax
; parameter 2: edx
.B2.1:                          ; Preds .B2.0
        push      esi                                           ;222.50
        push      edi                                           ;222.50
        push      ebx                                           ;222.50
        push      ebp                                           ;222.50
        sub       esp, 140                                      ;222.50
        mov       ebx, DWORD PTR [4+eax]                        ;234.8
        mov       ecx, ebx                                      ;235.3
        shr       ecx, 4                                        ;235.3
        pcmpeqd   xmm4, xmm4                                    ;247.5
        mov       ebp, DWORD PTR [eax]                          ;233.8
        xor       ecx, ebp                                      ;235.3
        and       ecx, 252645135                                ;235.3
        movdqa    xmm2, xmm4                                    ;247.5
        xor       ebp, ecx                                      ;235.3
        movdqa    xmm1, xmm4                                    ;247.5
        shl       ecx, 4                                        ;235.3
        mov       eax, ebp                                      ;235.3
        shr       eax, 16                                       ;235.3
        xor       ebx, ecx                                      ;235.3
        xor       eax, ebx                                      ;235.3
        movdqa    xmm3, xmm4                                    ;247.5
        movzx     esi, ax                                       ;235.3
        pxor      xmm0, xmm0                                    ;245.3
        xor       ebx, esi                                      ;235.3
        shl       esi, 16                                       ;235.3
        mov       edi, ebx                                      ;235.3
        shr       edi, 2                                        ;235.3
        xor       ebp, esi                                      ;235.3
        xor       edi, ebp                                      ;235.3
        and       edi, 858993459                                ;235.3
        xor       ebp, edi                                      ;235.3
        shl       edi, 2                                        ;235.3
        mov       ecx, ebp                                      ;235.3
        shr       ecx, 8                                        ;235.3
        xor       ebx, edi                                      ;235.3
        xor       ecx, ebx                                      ;235.3
        and       ecx, 16711935                                 ;235.3
        xor       ebx, ecx                                      ;235.3
        shl       ecx, 8                                        ;235.3
        mov       eax, ebx                                      ;235.3
        xor       ebp, ecx                                      ;235.3
        mov       ecx, DWORD PTR [edx]                          ;239.8
        mov       edx, DWORD PTR [4+edx]                        ;240.8
        mov       esi, edx                                      ;241.3
        shr       eax, 1                                        ;235.3
        shr       esi, 4                                        ;241.3
        xor       eax, ebp                                      ;235.3
        xor       esi, ecx                                      ;241.3
        and       eax, 1431655765                               ;235.3
        and       esi, 252645135                                ;241.3
        xor       ebp, eax                                      ;236.8
        add       eax, eax                                      ;237.8
        xor       ecx, esi                                      ;241.3
        shl       esi, 4                                        ;241.3
        xor       ebx, eax                                      ;237.8
        mov       eax, ecx                                      ;241.3
        xor       edx, esi                                      ;241.3
        shr       eax, 16                                       ;241.3
        xor       eax, edx                                      ;241.3
        movzx     edi, ax                                       ;241.3
        xor       edx, edi                                      ;241.3
        shl       edi, 16                                       ;241.3
        mov       eax, edx                                      ;241.3
        shr       eax, 2                                        ;241.3
        xor       ecx, edi                                      ;241.3
        xor       eax, ecx                                      ;241.3
        and       eax, 858993459                                ;241.3
        xor       ecx, eax                                      ;241.3
        shl       eax, 2                                        ;241.3
        mov       esi, ecx                                      ;241.3
        shr       esi, 8                                        ;241.3
        xor       edx, eax                                      ;241.3
        xor       esi, edx                                      ;241.3
        and       esi, 16711935                                 ;241.3
        xor       edx, esi                                      ;241.3
        shl       esi, 8                                        ;241.3
        mov       eax, edx                                      ;241.3
        shr       eax, 1                                        ;241.3
        xor       ecx, esi                                      ;241.3
        xor       eax, ecx                                      ;241.3
        and       eax, 1431655765                               ;241.3
        xor       ecx, eax                                      ;242.8
        add       eax, eax                                      ;243.8
        psrldq    xmm2, 8                                       ;247.5
        xor       edx, eax                                      ;243.8
        psrldq    xmm1, 4                                       ;247.5
        xor       eax, eax                                      ;249.3
        mov       edi, DWORD PTR [_alpha_len]                   ;299.39
        mov       DWORD PTR [92+esp], edi                       ;299.39
        movd      esi, xmm1                                     ;301.24
        movd      edi, xmm2                                     ;303.22
        psrldq    xmm3, 12                                      ;247.5
        movdqu    XMMWORD PTR [esp], xmm4                       ;247.5
        ror       ebp, 29                                       ;236.8
        ror       ebx, 29                                       ;237.8
        ror       ecx, 29                                       ;242.8
        ror       edx, 29                                       ;243.8
        movdqu    XMMWORD PTR [16+esp], xmm4                    ;247.5
        movdqu    XMMWORD PTR [32+esp], xmm4                    ;247.5
        movdqu    XMMWORD PTR [48+esp], xmm4                    ;247.5
        mov       DWORD PTR [84+esp], esi                       ;301.24
        mov       DWORD PTR [80+esp], edi                       ;303.22
        movd      DWORD PTR [76+esp], xmm3                      ;305.20
        movd      DWORD PTR [72+esp], xmm4                      ;307.18
        mov       DWORD PTR [68+esp], esi                       ;309.16
        mov       DWORD PTR [64+esp], edi                       ;311.14
        mov       DWORD PTR [96+esp], eax                       ;249.3
        movdqu    xmm1, XMMWORD PTR [_ks+128]                   ;266.17
        mov       DWORD PTR [112+esp], eax                      ;266.17
        mov       DWORD PTR [88+esp], edx                       ;266.17
        mov       DWORD PTR [104+esp], ecx                      ;266.17
        mov       DWORD PTR [100+esp], ebx                      ;266.17
        mov       DWORD PTR [108+esp], ebp                      ;266.17
                                ; LOE xmm0 xmm1
.B2.2:                          ; Preds .B2.4 .B2.21 .B2.1
        mov       ecx, DWORD PTR [112+esp]                      ;266.17
        movdqa    xmm2, xmm1                                    ;266.17
        shl       ecx, 7                                        ;266.17
        mov       eax, DWORD PTR [108+esp]                      ;273.17
        mov       ebx, eax                                      ;273.17
        mov       ebp, eax                                      ;273.17
        por       xmm2, XMMWORD PTR [_ks_tbl+ecx]               ;266.17
        movd      ecx, xmm2                                     ;271.33
        movdqa    xmm3, xmm2                                    ;266.17
        psrldq    xmm3, 4                                       ;266.17
        movdqa    xmm4, xmm2                                    ;266.17
        psrldq    xmm4, 8                                       ;266.17
        movdqa    xmm5, xmm2                                    ;266.17
        xor       ebx, ecx                                      ;273.17
        mov       esi, ebx                                      ;273.17
        and       esi, 252                                      ;273.17
        movd      edx, xmm3                                     ;273.17
        psrldq    xmm5, 12                                      ;266.17
        movdqu    XMMWORD PTR [_ks], xmm2                       ;266.17
        mov       edi, DWORD PTR [_des_SPtrans+esi]             ;273.17
        mov       esi, ebx                                      ;273.17
        shr       esi, 10                                       ;273.17
        xor       ebp, edx                                      ;273.17
        and       esi, 63                                       ;273.17
        ror       ebp, 4                                        ;273.17
        movdqu    XMMWORD PTR [_ks+16], xmm2                    ;266.17
        movdqu    XMMWORD PTR [_ks+32], xmm2                    ;266.17
        xor       edi, DWORD PTR [_des_SPtrans+512+esi*4]       ;273.17
        mov       esi, ebx                                      ;273.17
        shr       esi, 18                                       ;273.17
        and       esi, 63                                       ;273.17
        shr       ebx, 26                                       ;273.17
        movdqu    XMMWORD PTR [_ks+48], xmm2                    ;266.17
        movdqu    XMMWORD PTR [_ks+64], xmm2                    ;266.17
        xor       edi, DWORD PTR [_des_SPtrans+1024+esi*4]      ;273.17
        mov       esi, ebp                                      ;273.17
        xor       edi, DWORD PTR [_des_SPtrans+1536+ebx*4]      ;273.17
        mov       ebx, ebp                                      ;273.17
        and       ebx, 252                                      ;273.17
        shr       esi, 10                                       ;273.17
        and       esi, 63                                       ;273.17
        movdqu    XMMWORD PTR [_ks+80], xmm2                    ;266.17
        xor       edi, DWORD PTR [_des_SPtrans+256+ebx]         ;273.17
        mov       ebx, ebp                                      ;273.17
        shr       ebx, 18                                       ;273.17
        and       ebx, 63                                       ;273.17
        shr       ebp, 26                                       ;273.17
        xor       edi, DWORD PTR [_des_SPtrans+768+esi*4]       ;273.17
        movd      esi, xmm5                                     ;274.17
        movdqu    XMMWORD PTR [_ks+96], xmm2                    ;266.17
        movdqu    XMMWORD PTR [_ks+112], xmm2                   ;266.17
        xor       edi, DWORD PTR [_des_SPtrans+1280+ebx*4]      ;273.17
        xor       edi, DWORD PTR [_des_SPtrans+1792+ebp*4]      ;273.17
        movd      ebx, xmm4                                     ;271.33
        xor       edi, DWORD PTR [100+esp]                      ;273.17
        mov       ebp, edi                                      ;274.17
        xor       ebp, ebx                                      ;274.17
        mov       DWORD PTR [124+esp], edi                      ;273.17
        xor       edi, esi                                      ;274.17
        mov       DWORD PTR [116+esp], ebx                      ;271.33
        mov       ebx, ebp                                      ;274.17
        mov       DWORD PTR [120+esp], esi                      ;274.17
        mov       esi, ebp                                      ;274.17
        shr       esi, 10                                       ;274.17
        and       ebx, 252                                      ;274.17
        and       esi, 63                                       ;274.17
        ror       edi, 4                                        ;274.17
        mov       ebx, DWORD PTR [_des_SPtrans+ebx]             ;274.17
        xor       ebx, DWORD PTR [_des_SPtrans+512+esi*4]       ;274.17
        mov       esi, ebp                                      ;274.17
        shr       esi, 18                                       ;274.17
        and       esi, 63                                       ;274.17
        shr       ebp, 26                                       ;274.17
        xor       ebx, DWORD PTR [_des_SPtrans+1024+esi*4]      ;274.17
        mov       esi, edi                                      ;274.17
        xor       ebx, DWORD PTR [_des_SPtrans+1536+ebp*4]      ;274.17
        mov       ebp, edi                                      ;274.17
        and       ebp, 252                                      ;274.17
        shr       esi, 10                                       ;274.17
        and       esi, 63                                       ;274.17
        xor       ebx, DWORD PTR [_des_SPtrans+256+ebp]         ;274.17
        mov       ebp, edi                                      ;274.17
        shr       ebp, 18                                       ;274.17
        and       ebp, 63                                       ;274.17
        shr       edi, 26                                       ;274.17
        xor       ebx, DWORD PTR [_des_SPtrans+768+esi*4]       ;274.17
        xor       ebx, DWORD PTR [_des_SPtrans+1280+ebp*4]      ;274.17
        xor       ebx, DWORD PTR [_des_SPtrans+1792+edi*4]      ;274.17
        xor       ebx, eax                                      ;274.17
        mov       eax, ebx                                      ;275.17
        mov       ebp, ebx                                      ;275.17
        xor       eax, ecx                                      ;275.17
        xor       ebp, edx                                      ;275.17
        mov       edi, eax                                      ;275.17
        and       edi, 252                                      ;275.17
        ror       ebp, 4                                        ;275.17
        mov       esi, DWORD PTR [_des_SPtrans+edi]             ;275.17
        mov       edi, eax                                      ;275.17
        shr       edi, 10                                       ;275.17
        and       edi, 63                                       ;275.17
        xor       esi, DWORD PTR [_des_SPtrans+512+edi*4]       ;275.17
        mov       edi, eax                                      ;275.17
        shr       edi, 18                                       ;275.17
        and       edi, 63                                       ;275.17
        shr       eax, 26                                       ;275.17
        xor       esi, DWORD PTR [_des_SPtrans+1024+edi*4]      ;275.17
        mov       edi, ebp                                      ;275.17
        xor       esi, DWORD PTR [_des_SPtrans+1536+eax*4]      ;275.17
        mov       eax, ebp                                      ;275.17
        and       eax, 252                                      ;275.17
        shr       edi, 10                                       ;275.17
        and       edi, 63                                       ;275.17
        xor       esi, DWORD PTR [_des_SPtrans+256+eax]         ;275.17
        mov       eax, ebp                                      ;275.17
        shr       eax, 18                                       ;275.17
        and       eax, 63                                       ;275.17
        shr       ebp, 26                                       ;275.17
        xor       esi, DWORD PTR [_des_SPtrans+768+edi*4]       ;275.17
        xor       esi, DWORD PTR [_des_SPtrans+1280+eax*4]      ;275.17
        xor       esi, DWORD PTR [_des_SPtrans+1792+ebp*4]      ;275.17
        mov       eax, DWORD PTR [124+esp]                      ;275.17
        xor       eax, esi                                      ;275.17
        mov       ebp, eax                                      ;276.17
        xor       ebp, DWORD PTR [116+esp]                      ;276.17
        mov       esi, ebp                                      ;276.17
        and       esi, 252                                      ;276.17
        mov       DWORD PTR [124+esp], eax                      ;275.17
        xor       eax, DWORD PTR [120+esp]                      ;276.17
        ror       eax, 4                                        ;276.17
        mov       edi, DWORD PTR [_des_SPtrans+esi]             ;276.17
        mov       esi, ebp                                      ;276.17
        shr       esi, 10                                       ;276.17
        and       esi, 63                                       ;276.17
        xor       edi, DWORD PTR [_des_SPtrans+512+esi*4]       ;276.17
        mov       esi, ebp                                      ;276.17
        shr       esi, 18                                       ;276.17
        and       esi, 63                                       ;276.17
        shr       ebp, 26                                       ;276.17
        xor       edi, DWORD PTR [_des_SPtrans+1024+esi*4]      ;276.17
        mov       esi, eax                                      ;276.17
        xor       edi, DWORD PTR [_des_SPtrans+1536+ebp*4]      ;276.17
        mov       ebp, eax                                      ;276.17
        and       ebp, 252                                      ;276.17
        shr       esi, 10                                       ;276.17
        and       esi, 63                                       ;276.17
        xor       edi, DWORD PTR [_des_SPtrans+256+ebp]         ;276.17
        mov       ebp, eax                                      ;276.17
        shr       ebp, 18                                       ;276.17
        and       ebp, 63                                       ;276.17
        shr       eax, 26                                       ;276.17
        xor       edi, DWORD PTR [_des_SPtrans+768+esi*4]       ;276.17
        xor       edi, DWORD PTR [_des_SPtrans+1280+ebp*4]      ;276.17
        xor       edi, DWORD PTR [_des_SPtrans+1792+eax*4]      ;276.17
        xor       ebx, edi                                      ;276.17
        mov       eax, ebx                                      ;277.17
        mov       ebp, ebx                                      ;277.17
        xor       eax, ecx                                      ;277.17
        xor       ebp, edx                                      ;277.17
        mov       edi, eax                                      ;277.17
        and       edi, 252                                      ;277.17
        ror       ebp, 4                                        ;277.17
        mov       esi, DWORD PTR [_des_SPtrans+edi]             ;277.17
        mov       edi, eax                                      ;277.17
        shr       edi, 10                                       ;277.17
        and       edi, 63                                       ;277.17
        xor       esi, DWORD PTR [_des_SPtrans+512+edi*4]       ;277.17
        mov       edi, eax                                      ;277.17
        shr       edi, 18                                       ;277.17
        and       edi, 63                                       ;277.17
        shr       eax, 26                                       ;277.17
        xor       esi, DWORD PTR [_des_SPtrans+1024+edi*4]      ;277.17
        mov       edi, ebp                                      ;277.17
        xor       esi, DWORD PTR [_des_SPtrans+1536+eax*4]      ;277.17
        mov       eax, ebp                                      ;277.17
        and       eax, 252                                      ;277.17
        shr       edi, 10                                       ;277.17
        and       edi, 63                                       ;277.17
        xor       esi, DWORD PTR [_des_SPtrans+256+eax]         ;277.17
        mov       eax, ebp                                      ;277.17
        shr       eax, 18                                       ;277.17
        and       eax, 63                                       ;277.17
        shr       ebp, 26                                       ;277.17
        xor       esi, DWORD PTR [_des_SPtrans+768+edi*4]       ;277.17
        xor       esi, DWORD PTR [_des_SPtrans+1280+eax*4]      ;277.17
        xor       esi, DWORD PTR [_des_SPtrans+1792+ebp*4]      ;277.17
        mov       eax, DWORD PTR [124+esp]                      ;277.17
        xor       eax, esi                                      ;277.17
        mov       ebp, eax                                      ;278.17
        xor       ebp, DWORD PTR [116+esp]                      ;278.17
        mov       esi, ebp                                      ;278.17
        and       esi, 252                                      ;278.17
        mov       DWORD PTR [124+esp], eax                      ;277.17
        xor       eax, DWORD PTR [120+esp]                      ;278.17
        ror       eax, 4                                        ;278.17
        mov       edi, DWORD PTR [_des_SPtrans+esi]             ;278.17
        mov       esi, ebp                                      ;278.17
        shr       esi, 10                                       ;278.17
        and       esi, 63                                       ;278.17
        xor       edi, DWORD PTR [_des_SPtrans+512+esi*4]       ;278.17
        mov       esi, ebp                                      ;278.17
        shr       esi, 18                                       ;278.17
        and       esi, 63                                       ;278.17
        shr       ebp, 26                                       ;278.17
        xor       edi, DWORD PTR [_des_SPtrans+1024+esi*4]      ;278.17
        mov       esi, eax                                      ;278.17
        xor       edi, DWORD PTR [_des_SPtrans+1536+ebp*4]      ;278.17
        mov       ebp, eax                                      ;278.17
        and       ebp, 252                                      ;278.17
        shr       esi, 10                                       ;278.17
        and       esi, 63                                       ;278.17
        xor       edi, DWORD PTR [_des_SPtrans+256+ebp]         ;278.17
        mov       ebp, eax                                      ;278.17
        shr       ebp, 18                                       ;278.17
        and       ebp, 63                                       ;278.17
        shr       eax, 26                                       ;278.17
        xor       edi, DWORD PTR [_des_SPtrans+768+esi*4]       ;278.17
        xor       edi, DWORD PTR [_des_SPtrans+1280+ebp*4]      ;278.17
        xor       edi, DWORD PTR [_des_SPtrans+1792+eax*4]      ;278.17
        xor       ebx, edi                                      ;278.17
        mov       eax, ebx                                      ;279.17
        mov       ebp, ebx                                      ;279.17
        xor       eax, ecx                                      ;279.17
        xor       ebp, edx                                      ;279.17
        mov       edi, eax                                      ;279.17
        and       edi, 252                                      ;279.17
        ror       ebp, 4                                        ;279.17
        mov       esi, DWORD PTR [_des_SPtrans+edi]             ;279.17
        mov       edi, eax                                      ;279.17
        shr       edi, 10                                       ;279.17
        and       edi, 63                                       ;279.17
        xor       esi, DWORD PTR [_des_SPtrans+512+edi*4]       ;279.17
        mov       edi, eax                                      ;279.17
        shr       edi, 18                                       ;279.17
        and       edi, 63                                       ;279.17
        shr       eax, 26                                       ;279.17
        xor       esi, DWORD PTR [_des_SPtrans+1024+edi*4]      ;279.17
        mov       edi, ebp                                      ;279.17
        xor       esi, DWORD PTR [_des_SPtrans+1536+eax*4]      ;279.17
        mov       eax, ebp                                      ;279.17
        and       eax, 252                                      ;279.17
        shr       edi, 10                                       ;279.17
        and       edi, 63                                       ;279.17
        xor       esi, DWORD PTR [_des_SPtrans+256+eax]         ;279.17
        mov       eax, ebp                                      ;279.17
        shr       eax, 18                                       ;279.17
        and       eax, 63                                       ;279.17
        shr       ebp, 26                                       ;279.17
        xor       esi, DWORD PTR [_des_SPtrans+768+edi*4]       ;279.17
        xor       esi, DWORD PTR [_des_SPtrans+1280+eax*4]      ;279.17
        xor       esi, DWORD PTR [_des_SPtrans+1792+ebp*4]      ;279.17
        mov       eax, DWORD PTR [124+esp]                      ;279.17
        xor       eax, esi                                      ;279.17
        mov       ebp, eax                                      ;280.17
        xor       ebp, DWORD PTR [116+esp]                      ;280.17
        mov       esi, ebp                                      ;280.17
        and       esi, 252                                      ;280.17
        mov       DWORD PTR [124+esp], eax                      ;279.17
        xor       eax, DWORD PTR [120+esp]                      ;280.17
        ror       eax, 4                                        ;280.17
        mov       edi, DWORD PTR [_des_SPtrans+esi]             ;280.17
        mov       esi, ebp                                      ;280.17
        shr       esi, 10                                       ;280.17
        and       esi, 63                                       ;280.17
        xor       edi, DWORD PTR [_des_SPtrans+512+esi*4]       ;280.17
        mov       esi, ebp                                      ;280.17
        shr       esi, 18                                       ;280.17
        and       esi, 63                                       ;280.17
        shr       ebp, 26                                       ;280.17
        xor       edi, DWORD PTR [_des_SPtrans+1024+esi*4]      ;280.17
        mov       esi, eax                                      ;280.17
        xor       edi, DWORD PTR [_des_SPtrans+1536+ebp*4]      ;280.17
        mov       ebp, eax                                      ;280.17
        and       ebp, 252                                      ;280.17
        shr       esi, 10                                       ;280.17
        and       esi, 63                                       ;280.17
        xor       edi, DWORD PTR [_des_SPtrans+256+ebp]         ;280.17
        mov       ebp, eax                                      ;280.17
        shr       ebp, 18                                       ;280.17
        and       ebp, 63                                       ;280.17
        shr       eax, 26                                       ;280.17
        xor       edi, DWORD PTR [_des_SPtrans+768+esi*4]       ;280.17
        xor       edi, DWORD PTR [_des_SPtrans+1280+ebp*4]      ;280.17
        xor       edi, DWORD PTR [_des_SPtrans+1792+eax*4]      ;280.17
        xor       ebx, edi                                      ;280.17
        mov       eax, ebx                                      ;281.17
        mov       ebp, ebx                                      ;281.17
        xor       eax, ecx                                      ;281.17
        xor       ebp, edx                                      ;281.17
        mov       edi, eax                                      ;281.17
        and       edi, 252                                      ;281.17
        ror       ebp, 4                                        ;281.17
        mov       esi, DWORD PTR [_des_SPtrans+edi]             ;281.17
        mov       edi, eax                                      ;281.17
        shr       edi, 10                                       ;281.17
        and       edi, 63                                       ;281.17
        xor       esi, DWORD PTR [_des_SPtrans+512+edi*4]       ;281.17
        mov       edi, eax                                      ;281.17
        shr       edi, 18                                       ;281.17
        and       edi, 63                                       ;281.17
        shr       eax, 26                                       ;281.17
        xor       esi, DWORD PTR [_des_SPtrans+1024+edi*4]      ;281.17
        mov       edi, ebp                                      ;281.17
        xor       esi, DWORD PTR [_des_SPtrans+1536+eax*4]      ;281.17
        mov       eax, ebp                                      ;281.17
        and       eax, 252                                      ;281.17
        shr       edi, 10                                       ;281.17
        and       edi, 63                                       ;281.17
        xor       esi, DWORD PTR [_des_SPtrans+256+eax]         ;281.17
        mov       eax, ebp                                      ;281.17
        shr       eax, 18                                       ;281.17
        and       eax, 63                                       ;281.17
        shr       ebp, 26                                       ;281.17
        xor       esi, DWORD PTR [_des_SPtrans+768+edi*4]       ;281.17
        xor       esi, DWORD PTR [_des_SPtrans+1280+eax*4]      ;281.17
        xor       esi, DWORD PTR [_des_SPtrans+1792+ebp*4]      ;281.17
        mov       eax, DWORD PTR [124+esp]                      ;281.17
        xor       eax, esi                                      ;281.17
        mov       ebp, eax                                      ;282.17
        xor       ebp, DWORD PTR [116+esp]                      ;282.17
        mov       esi, ebp                                      ;282.17
        and       esi, 252                                      ;282.17
        mov       DWORD PTR [124+esp], eax                      ;281.17
        xor       eax, DWORD PTR [120+esp]                      ;282.17
        ror       eax, 4                                        ;282.17
        mov       edi, DWORD PTR [_des_SPtrans+esi]             ;282.17
        mov       esi, ebp                                      ;282.17
        shr       esi, 10                                       ;282.17
        and       esi, 63                                       ;282.17
        xor       edi, DWORD PTR [_des_SPtrans+512+esi*4]       ;282.17
        mov       esi, ebp                                      ;282.17
        shr       esi, 18                                       ;282.17
        and       esi, 63                                       ;282.17
        shr       ebp, 26                                       ;282.17
        xor       edi, DWORD PTR [_des_SPtrans+1024+esi*4]      ;282.17
        mov       esi, eax                                      ;282.17
        xor       edi, DWORD PTR [_des_SPtrans+1536+ebp*4]      ;282.17
        mov       ebp, eax                                      ;282.17
        and       ebp, 252                                      ;282.17
        shr       esi, 10                                       ;282.17
        and       esi, 63                                       ;282.17
        xor       edi, DWORD PTR [_des_SPtrans+256+ebp]         ;282.17
        mov       ebp, eax                                      ;282.17
        shr       ebp, 18                                       ;282.17
        and       ebp, 63                                       ;282.17
        shr       eax, 26                                       ;282.17
        xor       edi, DWORD PTR [_des_SPtrans+768+esi*4]       ;282.17
        xor       edi, DWORD PTR [_des_SPtrans+1280+ebp*4]      ;282.17
        xor       edi, DWORD PTR [_des_SPtrans+1792+eax*4]      ;282.17
        xor       ebx, edi                                      ;282.17
        mov       esi, ebx                                      ;283.17
        xor       edx, ebx                                      ;283.17
        xor       esi, ecx                                      ;283.17
        mov       eax, esi                                      ;283.17
        mov       edi, esi                                      ;283.17
        and       eax, 252                                      ;283.17
        shr       edi, 10                                       ;283.17
        and       edi, 63                                       ;283.17
        ror       edx, 4                                        ;283.17
        mov       ebp, DWORD PTR [_des_SPtrans+eax]             ;283.17
        mov       eax, esi                                      ;283.17
        shr       eax, 18                                       ;283.17
        and       eax, 63                                       ;283.17
        shr       esi, 26                                       ;283.17
        xor       ebp, DWORD PTR [_des_SPtrans+512+edi*4]       ;283.17
        mov       edi, edx                                      ;283.17
        shr       edi, 18                                       ;283.17
        xor       ebp, DWORD PTR [_des_SPtrans+1024+eax*4]      ;283.17
        mov       eax, edx                                      ;283.17
        xor       ebp, DWORD PTR [_des_SPtrans+1536+esi*4]      ;283.17
        mov       esi, edx                                      ;283.17
        shr       eax, 10                                       ;283.17
        and       esi, 252                                      ;283.17
        and       eax, 63                                       ;283.17
        and       edi, 63                                       ;283.17
        shr       edx, 26                                       ;283.17
        xor       ebp, DWORD PTR [_des_SPtrans+256+esi]         ;283.17
        xor       ebp, DWORD PTR [_des_SPtrans+768+eax*4]       ;283.17
        xor       ebp, DWORD PTR [_des_SPtrans+1280+edi*4]      ;283.17
        xor       ebp, DWORD PTR [_des_SPtrans+1792+edx*4]      ;283.17
        mov       eax, DWORD PTR [124+esp]                      ;283.17
        xor       eax, ebp                                      ;283.17
        mov       edx, DWORD PTR [120+esp]                      ;284.17
        xor       edx, eax                                      ;284.17
        ror       edx, 4                                        ;284.17
        xor       DWORD PTR [116+esp], eax                      ;284.17
        mov       DWORD PTR [120+esp], edx                      ;284.17
                                ; LOE eax ecx ebx xmm0 xmm1
.B2.34:                         ; Preds .B2.2
        mov       edi, DWORD PTR [116+esp]                      ;284.17
        mov       ebp, edi                                      ;284.17
        and       ebp, 252                                      ;284.17
        mov       esi, edi                                      ;284.17
        shr       esi, 10                                       ;284.17
        and       esi, 63                                       ;284.17
        mov       edx, DWORD PTR [_des_SPtrans+ebp]             ;284.17
        mov       ebp, edi                                      ;284.17
        shr       ebp, 18                                       ;284.17
        and       ebp, 63                                       ;284.17
        shr       edi, 26                                       ;284.17
        xor       edx, DWORD PTR [_des_SPtrans+512+esi*4]       ;284.17
        xor       edx, DWORD PTR [_des_SPtrans+1024+ebp*4]      ;284.17
        mov       ebp, DWORD PTR [120+esp]                      ;284.17
        mov       esi, ebp                                      ;284.17
        xor       edx, DWORD PTR [_des_SPtrans+1536+edi*4]      ;284.17
        mov       edi, ebp                                      ;284.17
        and       edi, 252                                      ;284.17
        shr       esi, 10                                       ;284.17
        and       esi, 63                                       ;284.17
        xor       edx, DWORD PTR [_des_SPtrans+256+edi]         ;284.17
        mov       edi, ebp                                      ;284.17
        shr       edi, 18                                       ;284.17
        and       edi, 63                                       ;284.17
        shr       ebp, 26                                       ;284.17
        xor       edx, DWORD PTR [_des_SPtrans+768+esi*4]       ;284.17
        mov       esi, DWORD PTR [_ks+100]                      ;285.17
        xor       edx, DWORD PTR [_des_SPtrans+1280+edi*4]      ;284.17
        xor       edx, DWORD PTR [_des_SPtrans+1792+ebp*4]      ;284.17
        xor       ebx, edx                                      ;284.17
        xor       ecx, ebx                                      ;285.17
        xor       esi, ebx                                      ;285.17
        mov       edx, ecx                                      ;285.17
        mov       ebp, ecx                                      ;285.17
        shr       ebp, 10                                       ;285.17
        and       edx, 252                                      ;285.17
        mov       edi, ecx                                      ;285.17
        and       ebp, 63                                       ;285.17
        shr       edi, 18                                       ;285.17
        and       edi, 63                                       ;285.17
        shr       ecx, 26                                       ;285.17
        mov       edx, DWORD PTR [_des_SPtrans+edx]             ;285.17
        xor       edx, DWORD PTR [_des_SPtrans+512+ebp*4]       ;285.17
        ror       esi, 4                                        ;285.17
        xor       edx, DWORD PTR [_des_SPtrans+1024+edi*4]      ;285.17
        mov       ebp, esi                                      ;285.17
        xor       edx, DWORD PTR [_des_SPtrans+1536+ecx*4]      ;285.17
        mov       ecx, esi                                      ;285.17
        shr       ebp, 10                                       ;285.17
        and       ecx, 252                                      ;285.17
        mov       edi, esi                                      ;285.17
        and       ebp, 63                                       ;285.17
        shr       edi, 18                                       ;285.17
        and       edi, 63                                       ;285.17
        shr       esi, 26                                       ;285.17
        xor       edx, DWORD PTR [_des_SPtrans+256+ecx]         ;285.17
        xor       edx, DWORD PTR [_des_SPtrans+768+ebp*4]       ;285.17
        xor       edx, DWORD PTR [_des_SPtrans+1280+edi*4]      ;285.17
        xor       edx, DWORD PTR [_des_SPtrans+1792+esi*4]      ;285.17
        xor       eax, edx                                      ;285.17
        mov       edi, DWORD PTR [_ks+104]                      ;271.33
        xor       edi, eax                                      ;286.17
        mov       edx, edi                                      ;286.17
        mov       ecx, edi                                      ;286.17
        and       edx, 252                                      ;286.17
        shr       ecx, 10                                       ;286.17
        and       ecx, 63                                       ;286.17
        mov       ebp, DWORD PTR [_ks+108]                      ;286.17
        mov       esi, DWORD PTR [_des_SPtrans+edx]             ;286.17
        mov       edx, edi                                      ;286.17
        shr       edx, 18                                       ;286.17
        xor       ebp, eax                                      ;286.17
        and       edx, 63                                       ;286.17
        shr       edi, 26                                       ;286.17
        xor       esi, DWORD PTR [_des_SPtrans+512+ecx*4]       ;286.17
        ror       ebp, 4                                        ;286.17
        xor       esi, DWORD PTR [_des_SPtrans+1024+edx*4]      ;286.17
        mov       ecx, ebp                                      ;286.17
        xor       esi, DWORD PTR [_des_SPtrans+1536+edi*4]      ;286.17
        mov       edi, ebp                                      ;286.17
        shr       ecx, 10                                       ;286.17
        and       edi, 252                                      ;286.17
        mov       edx, ebp                                      ;286.17
        and       ecx, 63                                       ;286.17
        shr       edx, 18                                       ;286.17
        and       edx, 63                                       ;286.17
        shr       ebp, 26                                       ;286.17
        xor       esi, DWORD PTR [_des_SPtrans+256+edi]         ;286.17
        xor       esi, DWORD PTR [_des_SPtrans+768+ecx*4]       ;286.17
        xor       esi, DWORD PTR [_des_SPtrans+1280+edx*4]      ;286.17
        xor       esi, DWORD PTR [_des_SPtrans+1792+ebp*4]      ;286.17
        xor       ebx, esi                                      ;286.17
        mov       edx, DWORD PTR [_ks+112]                      ;271.33
        xor       edx, ebx                                      ;287.17
        mov       esi, edx                                      ;287.17
        mov       edi, edx                                      ;287.17
        and       esi, 252                                      ;287.17
        shr       edi, 10                                       ;287.17
        and       edi, 63                                       ;287.17
        mov       ebp, DWORD PTR [_ks+116]                      ;287.17
        mov       ecx, DWORD PTR [_des_SPtrans+esi]             ;287.17
        mov       esi, edx                                      ;287.17
        shr       esi, 18                                       ;287.17
        xor       ebp, ebx                                      ;287.17
        and       esi, 63                                       ;287.17
        shr       edx, 26                                       ;287.17
        xor       ecx, DWORD PTR [_des_SPtrans+512+edi*4]       ;287.17
        ror       ebp, 4                                        ;287.17
        xor       ecx, DWORD PTR [_des_SPtrans+1024+esi*4]      ;287.17
        mov       esi, ebp                                      ;287.17
        xor       ecx, DWORD PTR [_des_SPtrans+1536+edx*4]      ;287.17
        mov       edx, ebp                                      ;287.17
        shr       esi, 10                                       ;287.17
        and       edx, 252                                      ;287.17
        mov       edi, ebp                                      ;287.17
        and       esi, 63                                       ;287.17
        shr       edi, 18                                       ;287.17
        and       edi, 63                                       ;287.17
        shr       ebp, 26                                       ;287.17
        xor       ecx, DWORD PTR [_des_SPtrans+256+edx]         ;287.17
        xor       ecx, DWORD PTR [_des_SPtrans+768+esi*4]       ;287.17
        xor       ecx, DWORD PTR [_des_SPtrans+1280+edi*4]      ;287.17
        xor       ecx, DWORD PTR [_des_SPtrans+1792+ebp*4]      ;287.17
        xor       eax, ecx                                      ;287.17
        cmp       eax, DWORD PTR [104+esp]                      ;289.27
        jne       .B2.4         ; Prob 50%                      ;289.27
                                ; LOE eax ebx xmm0 xmm1
.B2.3:                          ; Preds .B2.34
        mov       edi, DWORD PTR [_ks+120]                      ;271.33
        xor       edi, eax                                      ;290.19
        mov       ecx, edi                                      ;290.19
        mov       ebp, edi                                      ;290.19
        shr       ebp, 10                                       ;290.19
        and       ecx, 252                                      ;290.19
        mov       esi, edi                                      ;290.19
        and       ebp, 63                                       ;290.19
        shr       esi, 18                                       ;290.19
        and       esi, 63                                       ;290.19
        xor       eax, DWORD PTR [_ks+124]                      ;290.19
        ror       eax, 4                                        ;290.19
        mov       edx, DWORD PTR [_des_SPtrans+ecx]             ;290.19
        mov       ecx, eax                                      ;290.19
        xor       edx, DWORD PTR [_des_SPtrans+512+ebp*4]       ;290.19
        mov       ebp, eax                                      ;290.19
        shr       edi, 26                                       ;290.19
        and       ecx, 252                                      ;290.19
        xor       edx, DWORD PTR [_des_SPtrans+1024+esi*4]      ;290.19
        mov       esi, eax                                      ;290.19
        shr       ebp, 10                                       ;290.19
        shr       esi, 18                                       ;290.19
        and       ebp, 63                                       ;290.19
        and       esi, 63                                       ;290.19
        xor       edx, DWORD PTR [_des_SPtrans+1536+edi*4]      ;290.19
        shr       eax, 26                                       ;290.19
        xor       edx, DWORD PTR [_des_SPtrans+256+ecx]         ;290.19
        xor       edx, DWORD PTR [_des_SPtrans+768+ebp*4]       ;290.19
        xor       edx, DWORD PTR [_des_SPtrans+1280+esi*4]      ;290.19
        xor       edx, DWORD PTR [_des_SPtrans+1792+eax*4]      ;290.19
        xor       ebx, edx                                      ;290.19
        cmp       ebx, DWORD PTR [88+esp]                       ;291.29
        je        .B2.22        ; Prob 20%                      ;291.29
                                ; LOE xmm0 xmm1
.B2.4:                          ; Preds .B2.34 .B2.3
        mov       eax, DWORD PTR [96+esp]                       ;299.26
        movq      xmm2, QWORD PTR [_2il0floatpacket.240]        ;298.17
        paddq     xmm0, xmm2                                    ;298.17
        lea       edx, DWORD PTR [1+eax]                        ;299.26
        mov       DWORD PTR [112+esp], edx                      ;299.26
        mov       DWORD PTR [96+esp], edx                       ;299.26
        cmp       edx, DWORD PTR [92+esp]                       ;299.39
        jb        .B2.2         ; Prob 82%                      ;299.39
                                ; LOE xmm0 xmm1
.B2.5:                          ; Preds .B2.4                   ; Infreq
        mov       esi, DWORD PTR [84+esp]                       ;301.24
        inc       esi                                           ;301.24
        mov       DWORD PTR [112+esp], 0                        ;300.15
        mov       DWORD PTR [84+esp], esi                       ;301.24
        cmp       esi, DWORD PTR [92+esp]                       ;301.37
        jb        .B2.20        ; Prob 50%                      ;301.37
                                ; LOE rsi esi sil xmm0
.B2.6:                          ; Preds .B2.5                   ; Infreq
        mov       ebp, DWORD PTR [80+esp]                       ;303.22
        xor       esi, esi                                      ;302.13
        inc       ebp                                           ;303.22
        mov       DWORD PTR [80+esp], ebp                       ;303.22
        cmp       ebp, DWORD PTR [92+esp]                       ;303.35
        jb        .B2.18        ; Prob 50%                      ;303.35
                                ; LOE rbp ebp esi bpl xmm0
.B2.7:                          ; Preds .B2.6                   ; Infreq
        mov       ebx, DWORD PTR [76+esp]                       ;305.20
        xor       ebp, ebp                                      ;304.11
        inc       ebx                                           ;305.20
        mov       DWORD PTR [76+esp], ebx                       ;305.20
        cmp       ebx, DWORD PTR [92+esp]                       ;305.33
        jb        .B2.16        ; Prob 50%                      ;305.33
                                ; LOE rbx ebx ebp esi bl bh xmm0
.B2.8:                          ; Preds .B2.7                   ; Infreq
        mov       ecx, DWORD PTR [72+esp]                       ;307.18
        xor       ebx, ebx                                      ;306.9
        inc       ecx                                           ;307.18
        mov       DWORD PTR [72+esp], ecx                       ;307.18
        cmp       ecx, DWORD PTR [92+esp]                       ;307.31
        jb        .B2.14        ; Prob 50%                      ;307.31
                                ; LOE rcx ecx ebx ebp esi cl ch xmm0
.B2.9:                          ; Preds .B2.8                   ; Infreq
        mov       edx, DWORD PTR [68+esp]                       ;309.16
        xor       ecx, ecx                                      ;308.7
        inc       edx                                           ;309.16
        mov       DWORD PTR [68+esp], edx                       ;309.16
        cmp       edx, DWORD PTR [92+esp]                       ;309.29
        jb        .B2.12        ; Prob 50%                      ;309.29
                                ; LOE rdx edx ecx ebx ebp esi dl dh xmm0
.B2.10:                         ; Preds .B2.9                   ; Infreq
        mov       eax, DWORD PTR [64+esp]                       ;311.14
        xor       edx, edx                                      ;310.5
        inc       eax                                           ;311.14
        mov       DWORD PTR [64+esp], eax                       ;311.14
        cmp       eax, DWORD PTR [92+esp]                       ;311.27
        jae       .B2.31        ; Prob 20%                      ;311.27
                                ; LOE rax eax edx ecx ebx ebp esi al ah xmm0
.B2.11:                         ; Preds .B2.10                  ; Infreq
        mov       edi, eax                                      ;311.14
        xor       eax, eax                                      ;310.5
        mov       DWORD PTR [24+esp], edi                       ;311.14
        shl       edi, 7                                        ;253.5
        mov       DWORD PTR [20+esp], eax                       ;310.5
        mov       DWORD PTR [16+esp], eax                       ;308.7
        mov       DWORD PTR [12+esp], eax                       ;306.9
        movdqu    xmm1, XMMWORD PTR [_ks_tbl+196608+edi]        ;253.5
        movdqu    XMMWORD PTR [_ks+768], xmm1                   ;253.5
        movdqu    xmm2, XMMWORD PTR [_ks_tbl+196624+edi]        ;253.5
        movdqu    xmm3, XMMWORD PTR [_ks_tbl+196640+edi]        ;253.5
        movdqu    xmm4, XMMWORD PTR [_ks_tbl+196656+edi]        ;253.5
        movdqu    xmm5, XMMWORD PTR [_ks_tbl+196672+edi]        ;253.5
        movdqu    xmm6, XMMWORD PTR [_ks_tbl+196688+edi]        ;253.5
        movdqu    xmm7, XMMWORD PTR [_ks_tbl+196704+edi]        ;253.5
        movdqu    xmm1, XMMWORD PTR [_ks_tbl+196720+edi]        ;253.5
        mov       DWORD PTR [8+esp], eax                        ;304.11
        mov       DWORD PTR [4+esp], eax                        ;302.13
        movdqu    XMMWORD PTR [_ks+784], xmm2                   ;253.5
        movdqu    XMMWORD PTR [_ks+800], xmm3                   ;253.5
        movdqu    XMMWORD PTR [_ks+816], xmm4                   ;253.5
        movdqu    XMMWORD PTR [_ks+832], xmm5                   ;253.5
        movdqu    XMMWORD PTR [_ks+848], xmm6                   ;253.5
        movdqu    XMMWORD PTR [_ks+864], xmm7                   ;253.5
        movdqu    XMMWORD PTR [_ks+880], xmm1                   ;253.5
        mov       DWORD PTR [68+esp], eax                       ;310.5
        jmp       .B2.13        ; Prob 100%                     ;310.5
                                ; LOE edx ecx ebx ebp esi xmm0
.B2.12:                         ; Preds .B2.9                   ; Infreq
        mov       eax, edx                                      ;310.5
        xor       edi, edi                                      ;308.7
        mov       DWORD PTR [20+esp], eax                       ;310.5
        mov       DWORD PTR [16+esp], edi                       ;308.7
        mov       DWORD PTR [12+esp], edi                       ;306.9
        mov       DWORD PTR [8+esp], edi                        ;304.11
        mov       DWORD PTR [4+esp], edi                        ;302.13
                                ; LOE edx ecx ebx ebp esi xmm0
.B2.13:                         ; Preds .B2.11 .B2.12           ; Infreq
        shl       edx, 7                                        ;255.7
        mov       DWORD PTR [72+esp], 0                         ;308.7
        movdqu    xmm1, XMMWORD PTR [_ks_tbl+163840+edx]        ;255.7
        por       xmm1, XMMWORD PTR [_ks+768]                   ;255.7
        movdqu    XMMWORD PTR [_ks+640], xmm1                   ;255.7
        movdqu    XMMWORD PTR [_ks+656], xmm1                   ;255.7
        movdqu    XMMWORD PTR [_ks+672], xmm1                   ;255.7
        movdqu    XMMWORD PTR [_ks+688], xmm1                   ;255.7
        movdqu    XMMWORD PTR [_ks+704], xmm1                   ;255.7
        movdqu    XMMWORD PTR [_ks+720], xmm1                   ;255.7
        movdqu    XMMWORD PTR [_ks+736], xmm1                   ;255.7
        movdqu    XMMWORD PTR [_ks+752], xmm1                   ;255.7
        jmp       .B2.15        ; Prob 100%                     ;255.7
                                ; LOE ecx ebx ebp esi xmm0
.B2.14:                         ; Preds .B2.8                   ; Infreq
        mov       eax, ecx                                      ;308.7
        xor       edx, edx                                      ;306.9
        mov       DWORD PTR [16+esp], eax                       ;308.7
        mov       DWORD PTR [12+esp], edx                       ;306.9
        mov       DWORD PTR [8+esp], edx                        ;304.11
        mov       DWORD PTR [4+esp], edx                        ;302.13
                                ; LOE ecx ebx ebp esi xmm0
.B2.15:                         ; Preds .B2.13 .B2.14           ; Infreq
        shl       ecx, 7                                        ;257.9
        mov       DWORD PTR [76+esp], 0                         ;306.9
        movdqu    xmm1, XMMWORD PTR [_ks_tbl+131072+ecx]        ;257.9
        por       xmm1, XMMWORD PTR [_ks+640]                   ;257.9
        movdqu    XMMWORD PTR [_ks+512], xmm1                   ;257.9
        movdqu    XMMWORD PTR [_ks+528], xmm1                   ;257.9
        movdqu    XMMWORD PTR [_ks+544], xmm1                   ;257.9
        movdqu    XMMWORD PTR [_ks+560], xmm1                   ;257.9
        movdqu    XMMWORD PTR [_ks+576], xmm1                   ;257.9
        movdqu    XMMWORD PTR [_ks+592], xmm1                   ;257.9
        movdqu    XMMWORD PTR [_ks+608], xmm1                   ;257.9
        movdqu    XMMWORD PTR [_ks+624], xmm1                   ;257.9
        jmp       .B2.17        ; Prob 100%                     ;257.9
                                ; LOE ebx ebp esi xmm0
.B2.16:                         ; Preds .B2.7                   ; Infreq
        mov       eax, ebx                                      ;306.9
        xor       edx, edx                                      ;304.11
        mov       DWORD PTR [12+esp], eax                       ;306.9
        mov       DWORD PTR [8+esp], edx                        ;304.11
        mov       DWORD PTR [4+esp], edx                        ;302.13
                                ; LOE ebx ebp esi xmm0
.B2.17:                         ; Preds .B2.15 .B2.16           ; Infreq
        shl       ebx, 7                                        ;259.11
        mov       DWORD PTR [80+esp], 0                         ;304.11
        movdqu    xmm1, XMMWORD PTR [_ks_tbl+98304+ebx]         ;259.11
        por       xmm1, XMMWORD PTR [_ks+512]                   ;259.11
        movdqu    XMMWORD PTR [_ks+384], xmm1                   ;259.11
        movdqu    XMMWORD PTR [_ks+400], xmm1                   ;259.11
        movdqu    XMMWORD PTR [_ks+416], xmm1                   ;259.11
        movdqu    XMMWORD PTR [_ks+432], xmm1                   ;259.11
        movdqu    XMMWORD PTR [_ks+448], xmm1                   ;259.11
        movdqu    XMMWORD PTR [_ks+464], xmm1                   ;259.11
        movdqu    XMMWORD PTR [_ks+480], xmm1                   ;259.11
        movdqu    XMMWORD PTR [_ks+496], xmm1                   ;259.11
        jmp       .B2.19        ; Prob 100%                     ;259.11
                                ; LOE ebp esi xmm0
.B2.18:                         ; Preds .B2.6                   ; Infreq
        mov       eax, ebp                                      ;304.11
        mov       DWORD PTR [8+esp], eax                        ;304.11
        mov       DWORD PTR [4+esp], 0                          ;302.13
                                ; LOE ebp esi xmm0
.B2.19:                         ; Preds .B2.17 .B2.18           ; Infreq
        shl       ebp, 7                                        ;261.13
        mov       DWORD PTR [84+esp], 0                         ;302.13
        movdqu    xmm1, XMMWORD PTR [_ks_tbl+65536+ebp]         ;261.13
        por       xmm1, XMMWORD PTR [_ks+384]                   ;261.13
        movdqu    XMMWORD PTR [_ks+256], xmm1                   ;261.13
        movdqu    XMMWORD PTR [_ks+272], xmm1                   ;261.13
        movdqu    XMMWORD PTR [_ks+288], xmm1                   ;261.13
        movdqu    XMMWORD PTR [_ks+304], xmm1                   ;261.13
        movdqu    XMMWORD PTR [_ks+320], xmm1                   ;261.13
        movdqu    XMMWORD PTR [_ks+336], xmm1                   ;261.13
        movdqu    XMMWORD PTR [_ks+352], xmm1                   ;261.13
        movdqu    XMMWORD PTR [_ks+368], xmm1                   ;261.13
        jmp       .B2.21        ; Prob 100%                     ;261.13
                                ; LOE esi xmm0
.B2.20:                         ; Preds .B2.5                   ; Infreq
        mov       eax, esi                                      ;302.13
        mov       DWORD PTR [4+esp], eax                        ;302.13
                                ; LOE esi xmm0
.B2.21:                         ; Preds .B2.19 .B2.20           ; Infreq
        shl       esi, 7                                        ;263.15
        mov       DWORD PTR [96+esp], 0                         ;300.15
        movdqu    xmm1, XMMWORD PTR [_ks_tbl+32768+esi]         ;263.15
        por       xmm1, XMMWORD PTR [_ks+256]                   ;263.15
        movdqu    XMMWORD PTR [_ks+128], xmm1                   ;263.15
        movdqu    XMMWORD PTR [_ks+144], xmm1                   ;263.15
        movdqu    XMMWORD PTR [_ks+160], xmm1                   ;263.15
        movdqu    XMMWORD PTR [_ks+176], xmm1                   ;263.15
        movdqu    XMMWORD PTR [_ks+192], xmm1                   ;263.15
        movdqu    XMMWORD PTR [_ks+208], xmm1                   ;263.15
        movdqu    XMMWORD PTR [_ks+224], xmm1                   ;263.15
        movdqu    XMMWORD PTR [_ks+240], xmm1                   ;263.15
        jmp       .B2.2         ; Prob 100%                     ;263.15
                                ; LOE xmm0 xmm1
.B2.22:                         ; Preds .B2.3                   ; Infreq
        mov       eax, DWORD PTR [112+esp]                      ;
        mov       DWORD PTR [esp], eax                          ;300.15
        push      OFFSET FLAT: ??_C@_0BA@A@?6Found?5password?$AA@ ;292.21
        movq      QWORD PTR [_completed], xmm0                  ;245.3
        call      _printf                                       ;292.21
                                ; LOE
.B2.23:                         ; Preds .B2.22                  ; Infreq
        push      10                                            ;293.21
        call      _putchar                                      ;293.21
                                ; LOE
.B2.35:                         ; Preds .B2.23                  ; Infreq
        add       esp, 8                                        ;293.21
                                ; LOE
.B2.24:                         ; Preds .B2.35                  ; Infreq
        xor       ebx, ebx                                      ;293.21
                                ; LOE ebx
.B2.25:                         ; Preds .B2.27 .B2.24           ; Infreq
        cmp       DWORD PTR [esp+ebx*4], -1                     ;293.21
        je        .B2.29        ; Prob 20%                      ;293.21
                                ; LOE ebx
.B2.26:                         ; Preds .B2.25                  ; Infreq
        mov       eax, DWORD PTR [esp+ebx*4]                    ;293.21
        movsx     edx, BYTE PTR [_alphabet+eax]                 ;293.21
        push      edx                                           ;293.21
        call      _putchar                                      ;293.21
                                ; LOE ebx
.B2.36:                         ; Preds .B2.26                  ; Infreq
        add       esp, 4                                        ;293.21
                                ; LOE ebx
.B2.27:                         ; Preds .B2.36                  ; Infreq
        inc       ebx                                           ;293.21
        cmp       ebx, 8                                        ;293.21
        jl        .B2.25        ; Prob 87%                      ;293.21
                                ; LOE ebx
.B2.29:                         ; Preds .B2.25 .B2.27           ; Infreq
        add       esp, 140                                      ;294.21
        pop       ebp                                           ;294.21
        pop       ebx                                           ;294.21
        pop       edi                                           ;294.21
        pop       esi                                           ;294.21
        ret                                                     ;294.21
                                ; LOE
.B2.31:                         ; Preds .B2.10                  ; Infreq
        movq      QWORD PTR [_completed], xmm0                  ;245.3
        add       esp, 140                                      ;312.1
        pop       ebp                                           ;312.1
        pop       ebx                                           ;312.1
        pop       edi                                           ;312.1
        pop       esi                                           ;312.1
        ret                                                     ;312.1
        ALIGN     16
                                ; LOE
; mark_end;
_lm_fast ENDP
;_lm_fast	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _lm_fast
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _DES_init_keys
TXTST2:
; -- Begin  _DES_init_keys
;_DES_init_keys	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _DES_init_keys
; mark_begin;
       ALIGN     16
_DES_init_keys	PROC NEAR PRIVATE
; parameter 1: eax
.B3.1:                          ; Preds .B3.0
        push      esi                                           ;124.36
        push      edi                                           ;124.36
        push      ebx                                           ;124.36
        push      ebp                                           ;124.36
        sub       esp, 92                                       ;124.36
        mov       edx, eax                                      ;128.9
        mov       DWORD PTR [8+esp], eax                        ;124.36
        mov       ecx, edx                                      ;128.9
        and       edx, -16                                      ;128.9
        pxor      xmm0, xmm0                                    ;128.9
        pcmpeqb   xmm0, XMMWORD PTR [edx]                       ;128.9
        pmovmskb  eax, xmm0                                     ;128.9
        and       ecx, 15                                       ;128.9
        shr       eax, cl                                       ;128.9
        bsf       eax, eax                                      ;128.9
        jne       L18           ; Prob 60%                      ;128.9
        mov       eax, edx                                      ;128.9
        add       edx, ecx                                      ;128.9
        call      ___intel_sse4_strlen                          ;128.9
L18:                                                            ;
                                ; LOE eax ebx ebp esi edi
.B3.11:                         ; Preds .B3.1
        mov       edx, eax                                      ;128.9
        xor       eax, eax                                      ;130.3
        pxor      xmm0, xmm0                                    ;130.3
                                ; LOE eax edx xmm0
.B3.2:                          ; Preds .B3.7 .B3.11
        movq      QWORD PTR [16+esp], xmm0                      ;131.5
                                ; LOE eax edx xmm0
.B3.3:                          ; Preds .B3.2
        test      edx, edx                                      ;132.21
        jbe       .B3.7         ; Prob 10%                      ;132.21
                                ; LOE eax edx xmm0
.B3.4:                          ; Preds .B3.3
        mov       ecx, eax                                      ;130.3
        xor       ebx, ebx                                      ;132.5
        shl       ecx, 15                                       ;130.3
        mov       DWORD PTR [32+esp], ecx                       ;130.3
        mov       DWORD PTR [28+esp], ebx                       ;130.3
        mov       DWORD PTR [24+esp], eax                       ;130.3
        mov       DWORD PTR [12+esp], edx                       ;130.3
                                ; LOE xmm0
.B3.5:                          ; Preds .B3.12 .B3.4
        mov       ecx, DWORD PTR [8+esp]                        ;133.15
        mov       edx, DWORD PTR [28+esp]                       ;133.15
        mov       ebx, DWORD PTR [24+esp]                       ;133.7
        movzx     edx, BYTE PTR [edx+ecx]                       ;133.15
        mov       BYTE PTR [16+esp+ebx], dl                     ;133.7
        movzx     esi, BYTE PTR [17+esp]                        ;134.22
        mov       eax, esi                                      ;134.7
        movzx     ebp, BYTE PTR [16+esp]                        ;134.22
        mov       edx, ebp                                      ;134.7
        shl       ebp, 6                                        ;134.7
        and       edx, 254                                      ;134.7
        shr       eax, 2                                        ;134.7
        movzx     ecx, BYTE PTR [19+esp]                        ;134.22
        or        ebp, eax                                      ;134.7
        movzx     edi, BYTE PTR [18+esp]                        ;134.22
        mov       eax, ecx                                      ;134.7
        mov       ebx, edi                                      ;134.7
        add       ebp, ebp                                      ;134.7
        shl       edi, 4                                        ;134.7
        shr       eax, 4                                        ;134.7
        shl       esi, 5                                        ;134.7
        or        edi, eax                                      ;134.7
        shr       ebx, 3                                        ;134.7
        add       edi, edi                                      ;134.7
        movzx     eax, BYTE PTR [20+esp]                        ;134.7
        or        esi, ebx                                      ;134.7
        mov       ebx, eax                                      ;134.7
        add       esi, esi                                      ;134.7
        shl       ecx, 3                                        ;134.7
        shr       ebx, 5                                        ;134.7
        or        ecx, ebx                                      ;134.7
        add       ecx, ecx                                      ;134.7
        mov       DWORD PTR [36+esp], ecx                       ;134.7
        movzx     ecx, BYTE PTR [21+esp]                        ;134.7
        mov       ebx, ecx                                      ;134.7
        shl       eax, 2                                        ;134.7
        add       ecx, ecx                                      ;134.7
        shr       ebx, 6                                        ;134.7
        or        eax, ebx                                      ;134.7
        and       ebp, 255                                      ;134.7
        add       eax, eax                                      ;134.7
        movzx     ebx, BYTE PTR [22+esp]                        ;134.7
        mov       DWORD PTR [40+esp], eax                       ;134.7
        mov       eax, ebx                                      ;134.7
        and       esi, 255                                      ;134.7
        add       ebx, ebx                                      ;134.7
        shr       eax, 7                                        ;134.7
        and       edi, 255                                      ;134.7
        or        ecx, eax                                      ;134.7
        movzx     eax, BYTE PTR [_odd_parity+edx]               ;134.7
        add       ecx, ecx                                      ;134.7
        movzx     edx, BYTE PTR [_odd_parity+ebp]               ;134.7
        mov       BYTE PTR [1+esp], dl                          ;134.7
        movzx     edx, BYTE PTR [_odd_parity+esi]               ;134.7
        movzx     ebp, BYTE PTR [40+esp]                        ;134.7
        movzx     ecx, cl                                       ;134.7
        movzx     ebx, bl                                       ;134.7
        mov       BYTE PTR [2+esp], dl                          ;134.7
        movzx     edx, BYTE PTR [_odd_parity+edi]               ;134.7
        movzx     edi, BYTE PTR [36+esp]                        ;134.7
        mov       BYTE PTR [3+esp], dl                          ;134.7
        movzx     edx, BYTE PTR [_odd_parity+ebp]               ;134.7
        mov       BYTE PTR [5+esp], dl                          ;134.7
        mov       BYTE PTR [esp], al                            ;134.7
        movzx     edx, BYTE PTR [_odd_parity+ecx]               ;134.7
        movzx     eax, BYTE PTR [_odd_parity+edi]               ;134.7
        movzx     ecx, BYTE PTR [_odd_parity+ebx]               ;134.7
        mov       BYTE PTR [4+esp], al                          ;134.7
        mov       BYTE PTR [6+esp], dl                          ;134.7
        mov       BYTE PTR [7+esp], cl                          ;134.7
        mov       ecx, DWORD PTR [4+esp]                        ;135.7
        mov       esi, ecx                                      ;135.7
        shr       esi, 4                                        ;135.7
        mov       ebx, DWORD PTR [esp]                          ;135.7
        xor       esi, ebx                                      ;135.7
        and       esi, 252645135                                ;135.7
        xor       ebx, esi                                      ;135.7
        shl       esi, 4                                        ;135.7
        mov       edi, ebx                                      ;135.7
        xor       ecx, esi                                      ;135.7
        mov       ebp, ecx                                      ;135.7
        shl       ebp, 18                                       ;135.7
        xor       ebp, ecx                                      ;135.7
        shl       edi, 18                                       ;135.7
        and       ebp, -859045888                               ;135.7
        xor       edi, ebx                                      ;135.7
        xor       ecx, ebp                                      ;135.7
        shr       ebp, 18                                       ;135.7
        and       edi, -859045888                               ;135.7
        xor       ecx, ebp                                      ;135.7
        xor       ebx, edi                                      ;135.7
        shr       edi, 18                                       ;135.7
        mov       eax, ecx                                      ;135.7
        shr       eax, 1                                        ;135.7
        xor       ebx, edi                                      ;135.7
        xor       eax, ebx                                      ;135.7
        and       eax, 1431655765                               ;135.7
        xor       ebx, eax                                      ;135.7
        add       eax, eax                                      ;135.7
        mov       edi, ebx                                      ;135.7
        xor       ecx, eax                                      ;135.7
        shr       edi, 8                                        ;135.7
        xor       edi, ecx                                      ;135.7
        and       edi, 16711935                                 ;135.7
        xor       ecx, edi                                      ;135.7
        shl       edi, 8                                        ;135.7
        mov       ebp, ecx                                      ;135.7
        shr       ebp, 1                                        ;135.7
        xor       ebx, edi                                      ;135.7
        xor       ebp, ebx                                      ;135.7
        and       ebp, 1431655765                               ;135.7
        xor       ebx, ebp                                      ;135.7
        add       ebp, ebp                                      ;135.7
        xor       ecx, ebp                                      ;135.7
        movzx     ebp, cl                                       ;135.7
        mov       esi, ecx                                      ;135.7
        shl       ebp, 16                                       ;135.7
        and       esi, 65280                                    ;135.7
        and       ecx, 16711680                                 ;135.7
        or        ebp, esi                                      ;135.7
        shr       ecx, 16                                       ;135.7
        or        ebp, ecx                                      ;135.7
        mov       ecx, ebx                                      ;135.7
        and       ecx, -268435456                               ;135.7
        and       ebx, 268435455                                ;135.7
        shr       ecx, 4                                        ;135.7
        mov       edi, ebx                                      ;135.7
        shr       edi, 1                                        ;135.7
        or        ebp, ecx                                      ;135.7
        shl       ebx, 27                                       ;135.7
        mov       esi, ebp                                      ;135.7
        or        edi, ebx                                      ;135.7
        shr       esi, 1                                        ;135.7
        and       edi, 268435455                                ;135.7
        shl       ebp, 27                                       ;135.7
        mov       eax, edi                                      ;135.7
        or        esi, ebp                                      ;135.7
        mov       ebp, edi                                      ;135.7
        shr       eax, 6                                        ;135.7
        mov       ebx, edi                                      ;135.7
        shr       ebp, 7                                        ;135.7
        and       eax, 3                                        ;135.7
        and       ebp, 60                                       ;135.7
        mov       ecx, edi                                      ;135.7
        or        eax, ebp                                      ;135.7
        mov       ebp, edi                                      ;135.7
        shr       ebp, 13                                       ;135.7
        and       ebx, 63                                       ;135.7
        shr       ecx, 14                                       ;135.7
        and       ebp, 15                                       ;135.7
        and       ecx, 48                                       ;135.7
        and       esi, 268435455                                ;135.7
        or        ebp, ecx                                      ;135.7
        mov       ecx, edi                                      ;135.7
        mov       ebx, DWORD PTR [_des_skb+ebx*4]               ;135.7
        or        ebx, DWORD PTR [_des_skb+256+eax*4]           ;135.7
        mov       eax, edi                                      ;135.7
        shr       ecx, 21                                       ;135.7
        or        ebx, DWORD PTR [_des_skb+512+ebp*4]           ;135.7
        mov       ebp, edi                                      ;135.7
        shr       ebp, 20                                       ;135.7
        and       ecx, 6                                        ;135.7
        shr       eax, 22                                       ;135.7
        and       ebp, 1                                        ;135.7
        or        ebp, ecx                                      ;135.7
        and       eax, 56                                       ;135.7
        or        ebp, eax                                      ;135.7
        mov       eax, esi                                      ;135.7
        shr       eax, 8                                        ;135.7
        mov       ecx, esi                                      ;135.7
        and       eax, 60                                       ;135.7
        and       ecx, 63                                       ;135.7
        mov       edx, DWORD PTR [28+esp]                       ;132.5
        or        ebx, DWORD PTR [_des_skb+768+ebp*4]           ;135.7
        mov       ebp, esi                                      ;135.7
        shr       ebp, 7                                        ;135.7
        and       ebp, 3                                        ;135.7
        or        ebp, eax                                      ;135.7
        mov       eax, esi                                      ;135.7
        shr       eax, 15                                       ;135.7
        and       eax, 63                                       ;135.7
        mov       ecx, DWORD PTR [_des_skb+1024+ecx*4]          ;135.7
        or        ecx, DWORD PTR [_des_skb+1280+ebp*4]          ;135.7
        mov       ebp, esi                                      ;135.7
        shr       ebp, 22                                       ;135.7
        or        ecx, DWORD PTR [_des_skb+1536+eax*4]          ;135.7
        mov       eax, esi                                      ;135.7
        shr       eax, 21                                       ;135.7
        and       ebp, 48                                       ;135.7
        and       eax, 15                                       ;135.7
        or        eax, ebp                                      ;135.7
        movzx     ebp, bx                                       ;135.7
        shl       edx, 7                                        ;132.5
        shr       ebx, 16                                       ;135.7
        or        ecx, DWORD PTR [_des_skb+1792+eax*4]          ;135.7
        mov       eax, ecx                                      ;135.7
        and       ecx, -65536                                   ;135.7
        shl       eax, 16                                       ;135.7
        or        ebx, ecx                                      ;135.7
        or        eax, ebp                                      ;135.7
        mov       ecx, edi                                      ;135.7
        mov       ebp, DWORD PTR [32+esp]                       ;135.7
        shr       ecx, 1                                        ;135.7
        shl       edi, 27                                       ;135.7
        ror       eax, 30                                       ;135.7
        or        ecx, edi                                      ;135.7
        mov       DWORD PTR [_ks_tbl+ebp+edx], eax              ;135.7
        mov       eax, esi                                      ;135.7
        shr       eax, 1                                        ;135.7
        and       ecx, 268435455                                ;135.7
        shl       esi, 27                                       ;135.7
        mov       edi, ecx                                      ;135.7
        ror       ebx, 26                                       ;135.7
        or        eax, esi                                      ;135.7
        mov       DWORD PTR [_ks_tbl+4+ebp+edx], ebx            ;135.7
        mov       ebx, ecx                                      ;135.7
        mov       esi, ecx                                      ;135.7
        and       edi, 63                                       ;135.7
        shr       ebx, 6                                        ;135.7
        and       eax, 268435455                                ;135.7
        shr       esi, 7                                        ;135.7
        and       ebx, 3                                        ;135.7
        and       esi, 60                                       ;135.7
        or        ebx, esi                                      ;135.7
        mov       esi, ecx                                      ;135.7
        mov       edi, DWORD PTR [_des_skb+edi*4]               ;135.7
        shr       esi, 14                                       ;135.7
        and       esi, 48                                       ;135.7
        or        edi, DWORD PTR [_des_skb+256+ebx*4]           ;135.7
        mov       ebx, ecx                                      ;135.7
        shr       ebx, 13                                       ;135.7
        and       ebx, 15                                       ;135.7
        or        ebx, esi                                      ;135.7
        mov       esi, ecx                                      ;135.7
        shr       esi, 21                                       ;135.7
        mov       DWORD PTR [44+esp], ecx                       ;135.7
        and       esi, 6                                        ;135.7
        or        edi, DWORD PTR [_des_skb+512+ebx*4]           ;135.7
        mov       ebx, ecx                                      ;135.7
        shr       ebx, 20                                       ;135.7
        shr       ecx, 22                                       ;135.7
        and       ebx, 1                                        ;135.7
        or        ebx, esi                                      ;135.7
        and       ecx, 56                                       ;135.7
        or        ebx, ecx                                      ;135.7
        mov       esi, eax                                      ;135.7
        shr       esi, 8                                        ;135.7
        and       esi, 60                                       ;135.7
        or        edi, DWORD PTR [_des_skb+768+ebx*4]           ;135.7
        mov       ebx, eax                                      ;135.7
        and       ebx, 63                                       ;135.7
        mov       ecx, DWORD PTR [_des_skb+1024+ebx*4]          ;135.7
        mov       ebx, eax                                      ;135.7
        shr       ebx, 7                                        ;135.7
        and       ebx, 3                                        ;135.7
        or        ebx, esi                                      ;135.7
        mov       esi, eax                                      ;135.7
        shr       esi, 15                                       ;135.7
        and       esi, 63                                       ;135.7
        or        ecx, DWORD PTR [_des_skb+1280+ebx*4]          ;135.7
        mov       ebx, eax                                      ;135.7
        shr       ebx, 22                                       ;135.7
        or        ecx, DWORD PTR [_des_skb+1536+esi*4]          ;135.7
        mov       esi, eax                                      ;135.7
        shr       esi, 21                                       ;135.7
        and       ebx, 48                                       ;135.7
        and       esi, 15                                       ;135.7
        or        esi, ebx                                      ;135.7
        movzx     ebx, di                                       ;135.7
        shr       edi, 16                                       ;135.7
        or        ecx, DWORD PTR [_des_skb+1792+esi*4]          ;135.7
        mov       esi, ecx                                      ;135.7
        and       ecx, -65536                                   ;135.7
        shl       esi, 16                                       ;135.7
        or        edi, ecx                                      ;135.7
        or        esi, ebx                                      ;135.7
        mov       ecx, eax                                      ;135.7
        ror       edi, 26                                       ;135.7
        mov       DWORD PTR [_ks_tbl+12+ebp+edx], edi           ;135.7
        ror       esi, 30                                       ;135.7
        mov       edi, DWORD PTR [44+esp]                       ;135.7
        mov       DWORD PTR [_ks_tbl+8+ebp+edx], esi            ;135.7
        mov       esi, edi                                      ;135.7
        shr       esi, 2                                        ;135.7
        shl       edi, 26                                       ;135.7
        or        esi, edi                                      ;135.7
        shr       ecx, 2                                        ;135.7
        and       esi, 268435455                                ;135.7
        shl       eax, 26                                       ;135.7
        mov       edi, esi                                      ;135.7
        or        ecx, eax                                      ;135.7
        mov       eax, esi                                      ;135.7
        and       eax, 63                                       ;135.7
        and       ecx, 268435455                                ;135.7
        shr       edi, 7                                        ;135.7
        and       edi, 60                                       ;135.7
        mov       DWORD PTR [48+esp], esi                       ;135.7
        mov       ebx, DWORD PTR [_des_skb+eax*4]               ;135.7
        mov       eax, esi                                      ;135.7
        shr       eax, 6                                        ;135.7
        and       eax, 3                                        ;135.7
        or        eax, edi                                      ;135.7
        mov       edi, esi                                      ;135.7
        shr       edi, 14                                       ;135.7
        and       edi, 48                                       ;135.7
        or        ebx, DWORD PTR [_des_skb+256+eax*4]           ;135.7
        mov       eax, esi                                      ;135.7
        shr       eax, 13                                       ;135.7
        and       eax, 15                                       ;135.7
        or        eax, edi                                      ;135.7
        mov       edi, esi                                      ;135.7
        shr       edi, 21                                       ;135.7
        and       edi, 6                                        ;135.7
        or        ebx, DWORD PTR [_des_skb+512+eax*4]           ;135.7
        mov       eax, esi                                      ;135.7
        shr       eax, 20                                       ;135.7
        shr       esi, 22                                       ;135.7
        and       eax, 1                                        ;135.7
        or        eax, edi                                      ;135.7
        and       esi, 56                                       ;135.7
        or        eax, esi                                      ;135.7
        mov       esi, ecx                                      ;135.7
        shr       esi, 7                                        ;135.7
        mov       edi, ecx                                      ;135.7
        and       esi, 3                                        ;135.7
        and       edi, 63                                       ;135.7
        or        ebx, DWORD PTR [_des_skb+768+eax*4]           ;135.7
        mov       eax, ecx                                      ;135.7
        shr       eax, 8                                        ;135.7
        and       eax, 60                                       ;135.7
        or        esi, eax                                      ;135.7
        mov       eax, ecx                                      ;135.7
        shr       eax, 15                                       ;135.7
        and       eax, 63                                       ;135.7
        mov       edi, DWORD PTR [_des_skb+1024+edi*4]          ;135.7
        or        edi, DWORD PTR [_des_skb+1280+esi*4]          ;135.7
        mov       esi, ecx                                      ;135.7
        shr       esi, 22                                       ;135.7
        or        edi, DWORD PTR [_des_skb+1536+eax*4]          ;135.7
        mov       eax, ecx                                      ;135.7
        shr       eax, 21                                       ;135.7
        and       esi, 48                                       ;135.7
        and       eax, 15                                       ;135.7
        or        eax, esi                                      ;135.7
        movzx     esi, bx                                       ;135.7
        shr       ebx, 16                                       ;135.7
        or        edi, DWORD PTR [_des_skb+1792+eax*4]          ;135.7
        mov       eax, edi                                      ;135.7
        and       edi, -65536                                   ;135.7
        or        ebx, edi                                      ;135.7
        ror       ebx, 26                                       ;135.7
        mov       edi, DWORD PTR [48+esp]                       ;135.7
        mov       DWORD PTR [_ks_tbl+20+ebp+edx], ebx           ;135.7
        mov       ebx, edi                                      ;135.7
        shr       ebx, 2                                        ;135.7
        shl       edi, 26                                       ;135.7
        shl       eax, 16                                       ;135.7
        or        ebx, edi                                      ;135.7
        or        eax, esi                                      ;135.7
        and       ebx, 268435455                                ;135.7
        mov       edi, ecx                                      ;135.7
        mov       esi, ebx                                      ;135.7
        ror       eax, 30                                       ;135.7
        mov       DWORD PTR [_ks_tbl+16+ebp+edx], eax           ;135.7
        mov       eax, ebx                                      ;135.7
        shr       edi, 2                                        ;135.7
        shl       ecx, 26                                       ;135.7
        shr       eax, 6                                        ;135.7
        or        edi, ecx                                      ;135.7
        shr       esi, 7                                        ;135.7
        mov       ecx, ebx                                      ;135.7
        and       ecx, 63                                       ;135.7
        and       eax, 3                                        ;135.7
        and       esi, 60                                       ;135.7
        and       edi, 268435455                                ;135.7
        or        eax, esi                                      ;135.7
        mov       esi, ebx                                      ;135.7
        shr       esi, 14                                       ;135.7
        mov       ecx, DWORD PTR [_des_skb+ecx*4]               ;135.7
        and       esi, 48                                       ;135.7
        mov       DWORD PTR [52+esp], ebx                       ;135.7
        or        ecx, DWORD PTR [_des_skb+256+eax*4]           ;135.7
        mov       eax, ebx                                      ;135.7
        shr       eax, 13                                       ;135.7
        and       eax, 15                                       ;135.7
        or        eax, esi                                      ;135.7
        mov       esi, ebx                                      ;135.7
        shr       esi, 20                                       ;135.7
        and       esi, 1                                        ;135.7
        or        ecx, DWORD PTR [_des_skb+512+eax*4]           ;135.7
        mov       eax, ebx                                      ;135.7
        shr       eax, 21                                       ;135.7
        shr       ebx, 22                                       ;135.7
        and       eax, 6                                        ;135.7
        or        esi, eax                                      ;135.7
        and       ebx, 56                                       ;135.7
        mov       eax, edi                                      ;135.7
        or        esi, ebx                                      ;135.7
        and       eax, 63                                       ;135.7
        or        ecx, DWORD PTR [_des_skb+768+esi*4]           ;135.7
        mov       esi, edi                                      ;135.7
        mov       ebx, DWORD PTR [_des_skb+1024+eax*4]          ;135.7
        mov       eax, edi                                      ;135.7
        shr       eax, 7                                        ;135.7
        shr       esi, 8                                        ;135.7
        and       eax, 3                                        ;135.7
        and       esi, 60                                       ;135.7
        or        eax, esi                                      ;135.7
        mov       esi, edi                                      ;135.7
        shr       esi, 15                                       ;135.7
        and       esi, 63                                       ;135.7
        or        ebx, DWORD PTR [_des_skb+1280+eax*4]          ;135.7
        mov       eax, edi                                      ;135.7
        shr       eax, 22                                       ;135.7
        or        ebx, DWORD PTR [_des_skb+1536+esi*4]          ;135.7
        mov       esi, edi                                      ;135.7
        shr       esi, 21                                       ;135.7
        and       eax, 48                                       ;135.7
        and       esi, 15                                       ;135.7
        or        esi, eax                                      ;135.7
        movzx     eax, cx                                       ;135.7
        shr       ecx, 16                                       ;135.7
        or        ebx, DWORD PTR [_des_skb+1792+esi*4]          ;135.7
        mov       esi, ebx                                      ;135.7
        and       ebx, -65536                                   ;135.7
        shl       esi, 16                                       ;135.7
        or        ecx, ebx                                      ;135.7
        or        esi, eax                                      ;135.7
        mov       ebx, edi                                      ;135.7
        ror       esi, 30                                       ;135.7
        ror       ecx, 26                                       ;135.7
        mov       DWORD PTR [_ks_tbl+24+ebp+edx], esi           ;135.7
        mov       DWORD PTR [_ks_tbl+28+ebp+edx], ecx           ;135.7
        mov       ebp, DWORD PTR [52+esp]                       ;135.7
        mov       ecx, ebp                                      ;135.7
        shr       ecx, 2                                        ;135.7
        shl       ebp, 26                                       ;135.7
        or        ecx, ebp                                      ;135.7
        and       ecx, 268435455                                ;135.7
        mov       esi, ecx                                      ;135.7
        mov       eax, ecx                                      ;135.7
        shr       esi, 6                                        ;135.7
        mov       ebp, ecx                                      ;135.7
        shr       eax, 7                                        ;135.7
        and       esi, 3                                        ;135.7
        shr       ebx, 2                                        ;135.7
        and       eax, 60                                       ;135.7
        shl       edi, 26                                       ;135.7
        or        esi, eax                                      ;135.7
        or        ebx, edi                                      ;135.7
        mov       edi, ecx                                      ;135.7
        mov       eax, ecx                                      ;135.7
        and       edi, 63                                       ;135.7
        shr       ebp, 13                                       ;135.7
        and       ebx, 268435455                                ;135.7
        shr       eax, 14                                       ;135.7
        and       ebp, 15                                       ;135.7
        and       eax, 48                                       ;135.7
        or        ebp, eax                                      ;135.7
        mov       eax, ecx                                      ;135.7
        mov       edi, DWORD PTR [_des_skb+edi*4]               ;135.7
        or        edi, DWORD PTR [_des_skb+256+esi*4]           ;135.7
        mov       esi, ecx                                      ;135.7
        shr       eax, 21                                       ;135.7
        or        edi, DWORD PTR [_des_skb+512+ebp*4]           ;135.7
        mov       ebp, ecx                                      ;135.7
        shr       ebp, 20                                       ;135.7
        and       eax, 6                                        ;135.7
        shr       esi, 22                                       ;135.7
        and       ebp, 1                                        ;135.7
        or        ebp, eax                                      ;135.7
        and       esi, 56                                       ;135.7
        or        ebp, esi                                      ;135.7
        mov       eax, DWORD PTR [_des_skb+768+ebp*4]           ;135.7
                                ; LOE eax edx ecx ebx edi xmm0
.B3.13:                         ; Preds .B3.5
        or        edi, eax                                      ;135.7
        mov       eax, ebx                                      ;135.7
        and       eax, 63                                       ;135.7
        mov       ebp, ebx                                      ;135.7
        shr       ebp, 8                                        ;135.7
        and       ebp, 60                                       ;135.7
        mov       esi, DWORD PTR [_des_skb+1024+eax*4]          ;135.7
        mov       eax, ebx                                      ;135.7
        shr       eax, 7                                        ;135.7
        and       eax, 3                                        ;135.7
        or        eax, ebp                                      ;135.7
        mov       ebp, ebx                                      ;135.7
        shr       ebp, 15                                       ;135.7
        and       ebp, 63                                       ;135.7
        or        esi, DWORD PTR [_des_skb+1280+eax*4]          ;135.7
        mov       eax, ebx                                      ;135.7
        shr       eax, 22                                       ;135.7
        or        esi, DWORD PTR [_des_skb+1536+ebp*4]          ;135.7
        mov       ebp, ebx                                      ;135.7
        shr       ebp, 21                                       ;135.7
        and       eax, 48                                       ;135.7
        and       ebp, 15                                       ;135.7
        or        ebp, eax                                      ;135.7
        movzx     eax, di                                       ;135.7
        shr       edi, 16                                       ;135.7
        or        esi, DWORD PTR [_des_skb+1792+ebp*4]          ;135.7
        mov       ebp, esi                                      ;135.7
        and       esi, -65536                                   ;135.7
        shl       ebp, 16                                       ;135.7
        or        edi, esi                                      ;135.7
        or        ebp, eax                                      ;135.7
        mov       eax, DWORD PTR [32+esp]                       ;135.7
        ror       ebp, 30                                       ;135.7
        ror       edi, 26                                       ;135.7
        mov       DWORD PTR [_ks_tbl+32+eax+edx], ebp           ;135.7
        mov       ebp, ecx                                      ;135.7
        shr       ebp, 2                                        ;135.7
        shl       ecx, 26                                       ;135.7
        or        ebp, ecx                                      ;135.7
        mov       ecx, ebx                                      ;135.7
        shr       ecx, 2                                        ;135.7
        and       ebp, 268435455                                ;135.7
        shl       ebx, 26                                       ;135.7
        mov       esi, ebp                                      ;135.7
        or        ecx, ebx                                      ;135.7
        mov       ebx, ebp                                      ;135.7
        and       ebx, 63                                       ;135.7
        and       ecx, 268435455                                ;135.7
        mov       DWORD PTR [_ks_tbl+36+eax+edx], edi           ;135.7
        shr       esi, 7                                        ;135.7
        and       esi, 60                                       ;135.7
        mov       edi, DWORD PTR [_des_skb+ebx*4]               ;135.7
        mov       ebx, ebp                                      ;135.7
        shr       ebx, 6                                        ;135.7
        and       ebx, 3                                        ;135.7
        or        ebx, esi                                      ;135.7
        mov       esi, ebp                                      ;135.7
        shr       esi, 14                                       ;135.7
        and       esi, 48                                       ;135.7
        mov       DWORD PTR [56+esp], ebp                       ;135.7
        or        edi, DWORD PTR [_des_skb+256+ebx*4]           ;135.7
        mov       ebx, ebp                                      ;135.7
        shr       ebx, 13                                       ;135.7
        and       ebx, 15                                       ;135.7
        or        ebx, esi                                      ;135.7
        mov       esi, ebp                                      ;135.7
        shr       esi, 20                                       ;135.7
        and       esi, 1                                        ;135.7
        or        edi, DWORD PTR [_des_skb+512+ebx*4]           ;135.7
        mov       ebx, ebp                                      ;135.7
        shr       ebx, 21                                       ;135.7
        shr       ebp, 22                                       ;135.7
        and       ebx, 6                                        ;135.7
        or        esi, ebx                                      ;135.7
        and       ebp, 56                                       ;135.7
        or        esi, ebp                                      ;135.7
        mov       ebp, ecx                                      ;135.7
        shr       ebp, 7                                        ;135.7
        mov       ebx, ecx                                      ;135.7
        and       ebp, 3                                        ;135.7
        and       ebx, 63                                       ;135.7
        or        edi, DWORD PTR [_des_skb+768+esi*4]           ;135.7
        mov       esi, ecx                                      ;135.7
        shr       esi, 8                                        ;135.7
        and       esi, 60                                       ;135.7
        or        ebp, esi                                      ;135.7
        mov       esi, ecx                                      ;135.7
        shr       esi, 15                                       ;135.7
        and       esi, 63                                       ;135.7
        mov       ebx, DWORD PTR [_des_skb+1024+ebx*4]          ;135.7
        or        ebx, DWORD PTR [_des_skb+1280+ebp*4]          ;135.7
        mov       ebp, ecx                                      ;135.7
        shr       ebp, 22                                       ;135.7
        or        ebx, DWORD PTR [_des_skb+1536+esi*4]          ;135.7
        mov       esi, ecx                                      ;135.7
        shr       esi, 21                                       ;135.7
        and       ebp, 48                                       ;135.7
        and       esi, 15                                       ;135.7
        or        esi, ebp                                      ;135.7
        movzx     ebp, di                                       ;135.7
        shr       edi, 16                                       ;135.7
        or        ebx, DWORD PTR [_des_skb+1792+esi*4]          ;135.7
        mov       esi, ebx                                      ;135.7
        and       ebx, -65536                                   ;135.7
        or        edi, ebx                                      ;135.7
        ror       edi, 26                                       ;135.7
        mov       ebx, DWORD PTR [56+esp]                       ;135.7
        mov       DWORD PTR [_ks_tbl+44+eax+edx], edi           ;135.7
        mov       edi, ebx                                      ;135.7
        shr       edi, 2                                        ;135.7
        shl       ebx, 26                                       ;135.7
        or        edi, ebx                                      ;135.7
        mov       ebx, ecx                                      ;135.7
        shr       ebx, 2                                        ;135.7
        and       edi, 268435455                                ;135.7
        shl       ecx, 26                                       ;135.7
        or        ebx, ecx                                      ;135.7
        mov       ecx, edi                                      ;135.7
        and       ecx, 63                                       ;135.7
        and       ebx, 268435455                                ;135.7
        shl       esi, 16                                       ;135.7
        or        esi, ebp                                      ;135.7
        ror       esi, 30                                       ;135.7
        mov       DWORD PTR [_ks_tbl+40+eax+edx], esi           ;135.7
        mov       esi, edi                                      ;135.7
        mov       ebp, DWORD PTR [_des_skb+ecx*4]               ;135.7
        mov       ecx, edi                                      ;135.7
        shr       ecx, 6                                        ;135.7
        shr       esi, 7                                        ;135.7
        and       ecx, 3                                        ;135.7
        and       esi, 60                                       ;135.7
        or        ecx, esi                                      ;135.7
        mov       esi, edi                                      ;135.7
        shr       esi, 14                                       ;135.7
        and       esi, 48                                       ;135.7
        mov       DWORD PTR [60+esp], edi                       ;135.7
        or        ebp, DWORD PTR [_des_skb+256+ecx*4]           ;135.7
        mov       ecx, edi                                      ;135.7
        shr       ecx, 13                                       ;135.7
        and       ecx, 15                                       ;135.7
        or        ecx, esi                                      ;135.7
        mov       esi, edi                                      ;135.7
        shr       esi, 21                                       ;135.7
        and       esi, 6                                        ;135.7
        or        ebp, DWORD PTR [_des_skb+512+ecx*4]           ;135.7
        mov       ecx, edi                                      ;135.7
        shr       ecx, 20                                       ;135.7
        shr       edi, 22                                       ;135.7
        and       ecx, 1                                        ;135.7
        or        ecx, esi                                      ;135.7
        and       edi, 56                                       ;135.7
        or        ecx, edi                                      ;135.7
        mov       edi, ebx                                      ;135.7
        shr       edi, 8                                        ;135.7
        and       edi, 60                                       ;135.7
        or        ebp, DWORD PTR [_des_skb+768+ecx*4]           ;135.7
        mov       ecx, ebx                                      ;135.7
        and       ecx, 63                                       ;135.7
        mov       esi, DWORD PTR [_des_skb+1024+ecx*4]          ;135.7
        mov       ecx, ebx                                      ;135.7
        shr       ecx, 7                                        ;135.7
        and       ecx, 3                                        ;135.7
        or        ecx, edi                                      ;135.7
        mov       edi, ebx                                      ;135.7
        shr       edi, 15                                       ;135.7
        and       edi, 63                                       ;135.7
        or        esi, DWORD PTR [_des_skb+1280+ecx*4]          ;135.7
        mov       ecx, ebx                                      ;135.7
        shr       ecx, 22                                       ;135.7
        or        esi, DWORD PTR [_des_skb+1536+edi*4]          ;135.7
        mov       edi, ebx                                      ;135.7
        shr       edi, 21                                       ;135.7
        and       ecx, 48                                       ;135.7
        and       edi, 15                                       ;135.7
        or        edi, ecx                                      ;135.7
        movzx     ecx, bp                                       ;135.7
        shr       ebp, 16                                       ;135.7
        or        esi, DWORD PTR [_des_skb+1792+edi*4]          ;135.7
        mov       edi, esi                                      ;135.7
        and       esi, -65536                                   ;135.7
        or        ebp, esi                                      ;135.7
        ror       ebp, 26                                       ;135.7
        mov       esi, DWORD PTR [60+esp]                       ;135.7
        mov       DWORD PTR [_ks_tbl+52+eax+edx], ebp           ;135.7
        mov       ebp, esi                                      ;135.7
        shr       ebp, 2                                        ;135.7
        shl       esi, 26                                       ;135.7
        shl       edi, 16                                       ;135.7
        or        ebp, esi                                      ;135.7
        or        edi, ecx                                      ;135.7
        and       ebp, 268435455                                ;135.7
        mov       esi, ebx                                      ;135.7
        mov       ecx, ebp                                      ;135.7
        ror       edi, 30                                       ;135.7
        mov       DWORD PTR [_ks_tbl+48+eax+edx], edi           ;135.7
        mov       edi, ebp                                      ;135.7
        shr       esi, 2                                        ;135.7
        shl       ebx, 26                                       ;135.7
        shr       edi, 6                                        ;135.7
        or        esi, ebx                                      ;135.7
        shr       ecx, 7                                        ;135.7
        mov       ebx, ebp                                      ;135.7
        and       ebx, 63                                       ;135.7
        and       edi, 3                                        ;135.7
        and       ecx, 60                                       ;135.7
        and       esi, 268435455                                ;135.7
        or        edi, ecx                                      ;135.7
        mov       ecx, ebp                                      ;135.7
        shr       ecx, 14                                       ;135.7
        mov       ebx, DWORD PTR [_des_skb+ebx*4]               ;135.7
        and       ecx, 48                                       ;135.7
        mov       DWORD PTR [64+esp], ebp                       ;135.7
        or        ebx, DWORD PTR [_des_skb+256+edi*4]           ;135.7
        mov       edi, ebp                                      ;135.7
        shr       edi, 13                                       ;135.7
        and       edi, 15                                       ;135.7
        or        edi, ecx                                      ;135.7
        mov       ecx, ebp                                      ;135.7
        shr       ecx, 20                                       ;135.7
        and       ecx, 1                                        ;135.7
        or        ebx, DWORD PTR [_des_skb+512+edi*4]           ;135.7
        mov       edi, ebp                                      ;135.7
        shr       edi, 21                                       ;135.7
        shr       ebp, 22                                       ;135.7
        and       edi, 6                                        ;135.7
        or        ecx, edi                                      ;135.7
        and       ebp, 56                                       ;135.7
        or        ecx, ebp                                      ;135.7
        mov       ebp, esi                                      ;135.7
        shr       ebp, 8                                        ;135.7
        and       ebp, 60                                       ;135.7
        or        ebx, DWORD PTR [_des_skb+768+ecx*4]           ;135.7
        mov       ecx, esi                                      ;135.7
        and       ecx, 63                                       ;135.7
        mov       edi, DWORD PTR [_des_skb+1024+ecx*4]          ;135.7
        mov       ecx, esi                                      ;135.7
        shr       ecx, 7                                        ;135.7
        and       ecx, 3                                        ;135.7
        or        ecx, ebp                                      ;135.7
        mov       ebp, esi                                      ;135.7
        shr       ebp, 15                                       ;135.7
        and       ebp, 63                                       ;135.7
        or        edi, DWORD PTR [_des_skb+1280+ecx*4]          ;135.7
        mov       ecx, esi                                      ;135.7
        shr       ecx, 22                                       ;135.7
        or        edi, DWORD PTR [_des_skb+1536+ebp*4]          ;135.7
        mov       ebp, esi                                      ;135.7
        shr       ebp, 21                                       ;135.7
        and       ecx, 48                                       ;135.7
        and       ebp, 15                                       ;135.7
        or        ebp, ecx                                      ;135.7
        movzx     ecx, bx                                       ;135.7
        shr       ebx, 16                                       ;135.7
        or        edi, DWORD PTR [_des_skb+1792+ebp*4]          ;135.7
        mov       ebp, edi                                      ;135.7
        and       edi, -65536                                   ;135.7
        shl       ebp, 16                                       ;135.7
        or        ebx, edi                                      ;135.7
        or        ebp, ecx                                      ;135.7
        mov       edi, esi                                      ;135.7
        ror       ebx, 26                                       ;135.7
        mov       DWORD PTR [_ks_tbl+60+eax+edx], ebx           ;135.7
        ror       ebp, 30                                       ;135.7
        mov       ebx, DWORD PTR [64+esp]                       ;135.7
        mov       DWORD PTR [_ks_tbl+56+eax+edx], ebp           ;135.7
        mov       ebp, ebx                                      ;135.7
        shr       ebp, 1                                        ;135.7
        shl       ebx, 27                                       ;135.7
        or        ebp, ebx                                      ;135.7
        shr       edi, 1                                        ;135.7
        and       ebp, 268435455                                ;135.7
        shl       esi, 27                                       ;135.7
        mov       ebx, ebp                                      ;135.7
        or        edi, esi                                      ;135.7
        mov       esi, ebp                                      ;135.7
        and       esi, 63                                       ;135.7
        and       edi, 268435455                                ;135.7
        shr       ebx, 7                                        ;135.7
        and       ebx, 60                                       ;135.7
        mov       DWORD PTR [68+esp], ebp                       ;135.7
        mov       ecx, DWORD PTR [_des_skb+esi*4]               ;135.7
        mov       esi, ebp                                      ;135.7
        shr       esi, 6                                        ;135.7
        and       esi, 3                                        ;135.7
        or        esi, ebx                                      ;135.7
        mov       ebx, ebp                                      ;135.7
        shr       ebx, 14                                       ;135.7
        and       ebx, 48                                       ;135.7
        or        ecx, DWORD PTR [_des_skb+256+esi*4]           ;135.7
        mov       esi, ebp                                      ;135.7
        shr       esi, 13                                       ;135.7
        and       esi, 15                                       ;135.7
        or        esi, ebx                                      ;135.7
        mov       ebx, ebp                                      ;135.7
        shr       ebx, 21                                       ;135.7
        and       ebx, 6                                        ;135.7
        or        ecx, DWORD PTR [_des_skb+512+esi*4]           ;135.7
        mov       esi, ebp                                      ;135.7
        shr       esi, 20                                       ;135.7
        shr       ebp, 22                                       ;135.7
        and       esi, 1                                        ;135.7
        or        esi, ebx                                      ;135.7
        and       ebp, 56                                       ;135.7
        or        esi, ebp                                      ;135.7
        mov       ebp, edi                                      ;135.7
        shr       ebp, 7                                        ;135.7
        mov       ebx, edi                                      ;135.7
        and       ebp, 3                                        ;135.7
        and       ebx, 63                                       ;135.7
        or        ecx, DWORD PTR [_des_skb+768+esi*4]           ;135.7
        mov       esi, edi                                      ;135.7
        shr       esi, 8                                        ;135.7
        and       esi, 60                                       ;135.7
        or        ebp, esi                                      ;135.7
        mov       esi, edi                                      ;135.7
        shr       esi, 15                                       ;135.7
        and       esi, 63                                       ;135.7
        mov       ebx, DWORD PTR [_des_skb+1024+ebx*4]          ;135.7
        or        ebx, DWORD PTR [_des_skb+1280+ebp*4]          ;135.7
        mov       ebp, edi                                      ;135.7
        shr       ebp, 22                                       ;135.7
        or        ebx, DWORD PTR [_des_skb+1536+esi*4]          ;135.7
        mov       esi, edi                                      ;135.7
        shr       esi, 21                                       ;135.7
        and       ebp, 48                                       ;135.7
        and       esi, 15                                       ;135.7
        or        esi, ebp                                      ;135.7
        movzx     ebp, cx                                       ;135.7
        shr       ecx, 16                                       ;135.7
        or        ebx, DWORD PTR [_des_skb+1792+esi*4]          ;135.7
        mov       esi, ebx                                      ;135.7
        and       ebx, -65536                                   ;135.7
        or        ecx, ebx                                      ;135.7
        shl       esi, 16                                       ;135.7
        ror       ecx, 26                                       ;135.7
        or        esi, ebp                                      ;135.7
        mov       ebx, DWORD PTR [68+esp]                       ;135.7
        mov       DWORD PTR [_ks_tbl+68+eax+edx], ecx           ;135.7
        mov       ecx, ebx                                      ;135.7
        shr       ecx, 2                                        ;135.7
        shl       ebx, 26                                       ;135.7
        ror       esi, 30                                       ;135.7
        or        ecx, ebx                                      ;135.7
        mov       DWORD PTR [_ks_tbl+64+eax+edx], esi           ;135.7
        mov       esi, edi                                      ;135.7
        shr       esi, 2                                        ;135.7
        and       ecx, 268435455                                ;135.7
        shl       edi, 26                                       ;135.7
        mov       ebx, ecx                                      ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, ecx                                      ;135.7
        and       edi, 63                                       ;135.7
        and       esi, 268435455                                ;135.7
        shr       ebx, 7                                        ;135.7
        and       ebx, 60                                       ;135.7
        mov       DWORD PTR [72+esp], ecx                       ;135.7
        mov       ebp, DWORD PTR [_des_skb+edi*4]               ;135.7
        mov       edi, ecx                                      ;135.7
        shr       edi, 6                                        ;135.7
        and       edi, 3                                        ;135.7
        or        edi, ebx                                      ;135.7
        mov       ebx, ecx                                      ;135.7
        shr       ebx, 14                                       ;135.7
        and       ebx, 48                                       ;135.7
        or        ebp, DWORD PTR [_des_skb+256+edi*4]           ;135.7
        mov       edi, ecx                                      ;135.7
        shr       edi, 13                                       ;135.7
        and       edi, 15                                       ;135.7
        or        edi, ebx                                      ;135.7
        mov       ebx, ecx                                      ;135.7
        shr       ebx, 20                                       ;135.7
        and       ebx, 1                                        ;135.7
        or        ebp, DWORD PTR [_des_skb+512+edi*4]           ;135.7
        mov       edi, ecx                                      ;135.7
        shr       edi, 21                                       ;135.7
        shr       ecx, 22                                       ;135.7
        and       edi, 6                                        ;135.7
        or        ebx, edi                                      ;135.7
        and       ecx, 56                                       ;135.7
        or        ebx, ecx                                      ;135.7
        mov       edi, esi                                      ;135.7
        shr       edi, 8                                        ;135.7
        and       edi, 60                                       ;135.7
        or        ebp, DWORD PTR [_des_skb+768+ebx*4]           ;135.7
        mov       ebx, esi                                      ;135.7
        and       ebx, 63                                       ;135.7
        mov       ecx, DWORD PTR [_des_skb+1024+ebx*4]          ;135.7
        mov       ebx, esi                                      ;135.7
        shr       ebx, 7                                        ;135.7
        and       ebx, 3                                        ;135.7
        or        ebx, edi                                      ;135.7
        mov       edi, esi                                      ;135.7
        shr       edi, 15                                       ;135.7
        and       edi, 63                                       ;135.7
        or        ecx, DWORD PTR [_des_skb+1280+ebx*4]          ;135.7
        mov       ebx, esi                                      ;135.7
        shr       ebx, 22                                       ;135.7
        or        ecx, DWORD PTR [_des_skb+1536+edi*4]          ;135.7
        mov       edi, esi                                      ;135.7
        shr       edi, 21                                       ;135.7
        and       ebx, 48                                       ;135.7
        and       edi, 15                                       ;135.7
        or        edi, ebx                                      ;135.7
        movzx     ebx, bp                                       ;135.7
        shr       ebp, 16                                       ;135.7
        or        ecx, DWORD PTR [_des_skb+1792+edi*4]          ;135.7
        mov       edi, ecx                                      ;135.7
        and       ecx, -65536                                   ;135.7
        shl       edi, 16                                       ;135.7
        or        ebp, ecx                                      ;135.7
        or        edi, ebx                                      ;135.7
        mov       ebx, esi                                      ;135.7
        ror       edi, 30                                       ;135.7
        ror       ebp, 26                                       ;135.7
        mov       DWORD PTR [_ks_tbl+72+eax+edx], edi           ;135.7
        mov       DWORD PTR [_ks_tbl+76+eax+edx], ebp           ;135.7
        mov       eax, DWORD PTR [72+esp]                       ;135.7
        mov       ecx, eax                                      ;135.7
        shr       ecx, 2                                        ;135.7
        shl       eax, 26                                       ;135.7
        or        ecx, eax                                      ;135.7
        and       ecx, 268435455                                ;135.7
        mov       ebp, ecx                                      ;135.7
        mov       edi, ecx                                      ;135.7
        shr       ebp, 6                                        ;135.7
        mov       eax, ecx                                      ;135.7
        shr       edi, 7                                        ;135.7
        and       ebp, 3                                        ;135.7
        shr       ebx, 2                                        ;135.7
        and       edi, 60                                       ;135.7
        shl       esi, 26                                       ;135.7
        or        ebp, edi                                      ;135.7
        or        ebx, esi                                      ;135.7
        mov       esi, ecx                                      ;135.7
        mov       edi, ecx                                      ;135.7
        and       esi, 63                                       ;135.7
        shr       eax, 13                                       ;135.7
        and       ebx, 268435455                                ;135.7
        shr       edi, 14                                       ;135.7
        and       eax, 15                                       ;135.7
        and       edi, 48                                       ;135.7
        or        eax, edi                                      ;135.7
        mov       edi, ecx                                      ;135.7
        mov       esi, DWORD PTR [_des_skb+esi*4]               ;135.7
        or        esi, DWORD PTR [_des_skb+256+ebp*4]           ;135.7
        mov       ebp, ecx                                      ;135.7
        shr       edi, 21                                       ;135.7
        or        esi, DWORD PTR [_des_skb+512+eax*4]           ;135.7
        mov       eax, ecx                                      ;135.7
        shr       eax, 20                                       ;135.7
        and       edi, 6                                        ;135.7
        shr       ebp, 22                                       ;135.7
        and       eax, 1                                        ;135.7
        or        eax, edi                                      ;135.7
        and       ebp, 56                                       ;135.7
        or        eax, ebp                                      ;135.7
        mov       ebp, ebx                                      ;135.7
        shr       ebp, 8                                        ;135.7
        mov       edi, ebx                                      ;135.7
        and       ebp, 60                                       ;135.7
        and       edi, 63                                       ;135.7
        or        esi, DWORD PTR [_des_skb+768+eax*4]           ;135.7
        mov       eax, ebx                                      ;135.7
        shr       eax, 7                                        ;135.7
        and       eax, 3                                        ;135.7
        or        eax, ebp                                      ;135.7
        mov       ebp, ebx                                      ;135.7
        shr       ebp, 15                                       ;135.7
        and       ebp, 63                                       ;135.7
        mov       edi, DWORD PTR [_des_skb+1024+edi*4]          ;135.7
        or        edi, DWORD PTR [_des_skb+1280+eax*4]          ;135.7
        or        edi, DWORD PTR [_des_skb+1536+ebp*4]          ;135.7
        mov       ebp, ebx                                      ;135.7
        shr       ebp, 21                                       ;135.7
        and       ebp, 15                                       ;135.7
                                ; LOE edx ecx ebx ebp esi edi xmm0
.B3.12:                         ; Preds .B3.13
        mov       eax, ebx                                      ;135.7
        shr       eax, 22                                       ;135.7
        and       eax, 48                                       ;135.7
        or        ebp, eax                                      ;135.7
        movzx     eax, si                                       ;135.7
        shr       esi, 16                                       ;135.7
        or        edi, DWORD PTR [_des_skb+1792+ebp*4]          ;135.7
        mov       ebp, edi                                      ;135.7
        and       edi, -65536                                   ;135.7
        shl       ebp, 16                                       ;135.7
        or        esi, edi                                      ;135.7
        or        ebp, eax                                      ;135.7
        mov       eax, DWORD PTR [32+esp]                       ;135.7
        ror       ebp, 30                                       ;135.7
        ror       esi, 26                                       ;135.7
        mov       DWORD PTR [_ks_tbl+80+eax+edx], ebp           ;135.7
        mov       ebp, ecx                                      ;135.7
        shr       ebp, 2                                        ;135.7
        shl       ecx, 26                                       ;135.7
        or        ebp, ecx                                      ;135.7
        mov       ecx, ebx                                      ;135.7
        shr       ecx, 2                                        ;135.7
        and       ebp, 268435455                                ;135.7
        shl       ebx, 26                                       ;135.7
        or        ecx, ebx                                      ;135.7
        mov       ebx, ebp                                      ;135.7
        and       ebx, 63                                       ;135.7
        and       ecx, 268435455                                ;135.7
        mov       DWORD PTR [_ks_tbl+84+eax+edx], esi           ;135.7
        mov       esi, ebp                                      ;135.7
        shr       esi, 7                                        ;135.7
        and       esi, 60                                       ;135.7
        mov       edi, DWORD PTR [_des_skb+ebx*4]               ;135.7
        mov       ebx, ebp                                      ;135.7
        shr       ebx, 6                                        ;135.7
        and       ebx, 3                                        ;135.7
        or        ebx, esi                                      ;135.7
        mov       esi, ebp                                      ;135.7
        shr       esi, 14                                       ;135.7
        and       esi, 48                                       ;135.7
        mov       DWORD PTR [76+esp], ebp                       ;135.7
        or        edi, DWORD PTR [_des_skb+256+ebx*4]           ;135.7
        mov       ebx, ebp                                      ;135.7
        shr       ebx, 13                                       ;135.7
        and       ebx, 15                                       ;135.7
        or        ebx, esi                                      ;135.7
        mov       esi, ebp                                      ;135.7
        shr       esi, 20                                       ;135.7
        and       esi, 1                                        ;135.7
        or        edi, DWORD PTR [_des_skb+512+ebx*4]           ;135.7
        mov       ebx, ebp                                      ;135.7
        shr       ebx, 21                                       ;135.7
        shr       ebp, 22                                       ;135.7
        and       ebx, 6                                        ;135.7
        or        esi, ebx                                      ;135.7
        and       ebp, 56                                       ;135.7
        or        esi, ebp                                      ;135.7
        mov       ebp, ecx                                      ;135.7
        shr       ebp, 7                                        ;135.7
        mov       ebx, ecx                                      ;135.7
        and       ebp, 3                                        ;135.7
        and       ebx, 63                                       ;135.7
        or        edi, DWORD PTR [_des_skb+768+esi*4]           ;135.7
        mov       esi, ecx                                      ;135.7
        shr       esi, 8                                        ;135.7
        and       esi, 60                                       ;135.7
        or        ebp, esi                                      ;135.7
        mov       esi, ecx                                      ;135.7
        shr       esi, 15                                       ;135.7
        and       esi, 63                                       ;135.7
        mov       ebx, DWORD PTR [_des_skb+1024+ebx*4]          ;135.7
        or        ebx, DWORD PTR [_des_skb+1280+ebp*4]          ;135.7
        mov       ebp, ecx                                      ;135.7
        shr       ebp, 22                                       ;135.7
        or        ebx, DWORD PTR [_des_skb+1536+esi*4]          ;135.7
        mov       esi, ecx                                      ;135.7
        shr       esi, 21                                       ;135.7
        and       ebp, 48                                       ;135.7
        and       esi, 15                                       ;135.7
        or        esi, ebp                                      ;135.7
        movzx     ebp, di                                       ;135.7
        shr       edi, 16                                       ;135.7
        or        ebx, DWORD PTR [_des_skb+1792+esi*4]          ;135.7
        mov       esi, ebx                                      ;135.7
        and       ebx, -65536                                   ;135.7
        or        edi, ebx                                      ;135.7
        ror       edi, 26                                       ;135.7
        mov       ebx, DWORD PTR [76+esp]                       ;135.7
        mov       DWORD PTR [_ks_tbl+92+eax+edx], edi           ;135.7
        mov       edi, ebx                                      ;135.7
        shr       edi, 2                                        ;135.7
        shl       ebx, 26                                       ;135.7
        shl       esi, 16                                       ;135.7
        or        edi, ebx                                      ;135.7
        or        esi, ebp                                      ;135.7
        and       edi, 268435455                                ;135.7
        mov       ebx, ecx                                      ;135.7
        mov       ebp, edi                                      ;135.7
        ror       esi, 30                                       ;135.7
        mov       DWORD PTR [_ks_tbl+88+eax+edx], esi           ;135.7
        mov       esi, edi                                      ;135.7
        shr       ebx, 2                                        ;135.7
        shl       ecx, 26                                       ;135.7
        shr       esi, 6                                        ;135.7
        or        ebx, ecx                                      ;135.7
        shr       ebp, 7                                        ;135.7
        mov       ecx, edi                                      ;135.7
        and       ecx, 63                                       ;135.7
        and       esi, 3                                        ;135.7
        and       ebp, 60                                       ;135.7
        and       ebx, 268435455                                ;135.7
        or        esi, ebp                                      ;135.7
        mov       ebp, edi                                      ;135.7
        shr       ebp, 14                                       ;135.7
        mov       ecx, DWORD PTR [_des_skb+ecx*4]               ;135.7
        and       ebp, 48                                       ;135.7
        mov       DWORD PTR [80+esp], edi                       ;135.7
        or        ecx, DWORD PTR [_des_skb+256+esi*4]           ;135.7
        mov       esi, edi                                      ;135.7
        shr       esi, 13                                       ;135.7
        and       esi, 15                                       ;135.7
        or        esi, ebp                                      ;135.7
        mov       ebp, edi                                      ;135.7
        shr       ebp, 20                                       ;135.7
        and       ebp, 1                                        ;135.7
        or        ecx, DWORD PTR [_des_skb+512+esi*4]           ;135.7
        mov       esi, edi                                      ;135.7
        shr       esi, 21                                       ;135.7
        shr       edi, 22                                       ;135.7
        and       esi, 6                                        ;135.7
        or        ebp, esi                                      ;135.7
        and       edi, 56                                       ;135.7
        or        ebp, edi                                      ;135.7
        mov       edi, ebx                                      ;135.7
        shr       edi, 7                                        ;135.7
        mov       esi, ebx                                      ;135.7
        and       edi, 3                                        ;135.7
        and       esi, 63                                       ;135.7
        or        ecx, DWORD PTR [_des_skb+768+ebp*4]           ;135.7
        mov       ebp, ebx                                      ;135.7
        shr       ebp, 8                                        ;135.7
        and       ebp, 60                                       ;135.7
        or        edi, ebp                                      ;135.7
        mov       ebp, ebx                                      ;135.7
        shr       ebp, 15                                       ;135.7
        and       ebp, 63                                       ;135.7
        mov       esi, DWORD PTR [_des_skb+1024+esi*4]          ;135.7
        or        esi, DWORD PTR [_des_skb+1280+edi*4]          ;135.7
        mov       edi, ebx                                      ;135.7
        shr       edi, 22                                       ;135.7
        or        esi, DWORD PTR [_des_skb+1536+ebp*4]          ;135.7
        mov       ebp, ebx                                      ;135.7
        shr       ebp, 21                                       ;135.7
        and       edi, 48                                       ;135.7
        and       ebp, 15                                       ;135.7
        or        ebp, edi                                      ;135.7
        movzx     edi, cx                                       ;135.7
        shr       ecx, 16                                       ;135.7
        or        esi, DWORD PTR [_des_skb+1792+ebp*4]          ;135.7
        mov       ebp, esi                                      ;135.7
        and       esi, -65536                                   ;135.7
        or        ecx, esi                                      ;135.7
        ror       ecx, 26                                       ;135.7
        mov       esi, DWORD PTR [80+esp]                       ;135.7
        mov       DWORD PTR [_ks_tbl+100+eax+edx], ecx          ;135.7
        mov       ecx, esi                                      ;135.7
        shr       ecx, 2                                        ;135.7
        shl       esi, 26                                       ;135.7
        or        ecx, esi                                      ;135.7
        mov       esi, ebx                                      ;135.7
        shr       esi, 2                                        ;135.7
        and       ecx, 268435455                                ;135.7
        shl       ebx, 26                                       ;135.7
        or        esi, ebx                                      ;135.7
        mov       ebx, ecx                                      ;135.7
        and       ebx, 63                                       ;135.7
        and       esi, 268435455                                ;135.7
        shl       ebp, 16                                       ;135.7
        or        ebp, edi                                      ;135.7
        mov       edi, ecx                                      ;135.7
        ror       ebp, 30                                       ;135.7
        mov       DWORD PTR [_ks_tbl+96+eax+edx], ebp           ;135.7
        mov       ebp, DWORD PTR [_des_skb+ebx*4]               ;135.7
        mov       ebx, ecx                                      ;135.7
        shr       ebx, 6                                        ;135.7
        shr       edi, 7                                        ;135.7
        and       ebx, 3                                        ;135.7
        and       edi, 60                                       ;135.7
        or        ebx, edi                                      ;135.7
        mov       edi, ecx                                      ;135.7
        shr       edi, 14                                       ;135.7
        and       edi, 48                                       ;135.7
        mov       DWORD PTR [84+esp], ecx                       ;135.7
        or        ebp, DWORD PTR [_des_skb+256+ebx*4]           ;135.7
        mov       ebx, ecx                                      ;135.7
        shr       ebx, 13                                       ;135.7
        and       ebx, 15                                       ;135.7
        or        ebx, edi                                      ;135.7
        mov       edi, ecx                                      ;135.7
        shr       edi, 21                                       ;135.7
        and       edi, 6                                        ;135.7
        or        ebp, DWORD PTR [_des_skb+512+ebx*4]           ;135.7
        mov       ebx, ecx                                      ;135.7
        shr       ebx, 20                                       ;135.7
        shr       ecx, 22                                       ;135.7
        and       ebx, 1                                        ;135.7
        or        ebx, edi                                      ;135.7
        and       ecx, 56                                       ;135.7
        or        ebx, ecx                                      ;135.7
        mov       ecx, esi                                      ;135.7
        shr       ecx, 8                                        ;135.7
        and       ecx, 60                                       ;135.7
        or        ebp, DWORD PTR [_des_skb+768+ebx*4]           ;135.7
        mov       ebx, esi                                      ;135.7
        and       ebx, 63                                       ;135.7
        mov       edi, DWORD PTR [_des_skb+1024+ebx*4]          ;135.7
        mov       ebx, esi                                      ;135.7
        shr       ebx, 7                                        ;135.7
        and       ebx, 3                                        ;135.7
        or        ebx, ecx                                      ;135.7
        mov       ecx, esi                                      ;135.7
        shr       ecx, 15                                       ;135.7
        and       ecx, 63                                       ;135.7
        or        edi, DWORD PTR [_des_skb+1280+ebx*4]          ;135.7
        mov       ebx, esi                                      ;135.7
        shr       ebx, 22                                       ;135.7
        or        edi, DWORD PTR [_des_skb+1536+ecx*4]          ;135.7
        mov       ecx, esi                                      ;135.7
        shr       ecx, 21                                       ;135.7
        and       ebx, 48                                       ;135.7
        and       ecx, 15                                       ;135.7
        or        ecx, ebx                                      ;135.7
        movzx     ebx, bp                                       ;135.7
        shr       ebp, 16                                       ;135.7
        or        edi, DWORD PTR [_des_skb+1792+ecx*4]          ;135.7
        mov       ecx, edi                                      ;135.7
        and       edi, -65536                                   ;135.7
        or        ebp, edi                                      ;135.7
        mov       edi, esi                                      ;135.7
        shl       ecx, 16                                       ;135.7
        ror       ebp, 26                                       ;135.7
        or        ecx, ebx                                      ;135.7
        mov       DWORD PTR [_ks_tbl+108+eax+edx], ebp          ;135.7
        mov       ebp, DWORD PTR [84+esp]                       ;135.7
        mov       ebx, ebp                                      ;135.7
        shr       ebx, 2                                        ;135.7
        shl       ebp, 26                                       ;135.7
        or        ebx, ebp                                      ;135.7
        shr       edi, 2                                        ;135.7
        and       ebx, 268435455                                ;135.7
        shl       esi, 26                                       ;135.7
        mov       ebp, ebx                                      ;135.7
        or        edi, esi                                      ;135.7
        mov       esi, ebx                                      ;135.7
        and       esi, 63                                       ;135.7
        and       edi, 268435455                                ;135.7
        ror       ecx, 30                                       ;135.7
        mov       DWORD PTR [_ks_tbl+104+eax+edx], ecx          ;135.7
        shr       ebp, 7                                        ;135.7
        mov       ecx, DWORD PTR [_des_skb+esi*4]               ;135.7
        mov       esi, ebx                                      ;135.7
        shr       esi, 6                                        ;135.7
        and       ebp, 60                                       ;135.7
        and       esi, 3                                        ;135.7
        or        esi, ebp                                      ;135.7
        mov       ebp, ebx                                      ;135.7
        shr       ebp, 14                                       ;135.7
        and       ebp, 48                                       ;135.7
        mov       DWORD PTR [88+esp], ebx                       ;135.7
        or        ecx, DWORD PTR [_des_skb+256+esi*4]           ;135.7
        mov       esi, ebx                                      ;135.7
        shr       esi, 13                                       ;135.7
        and       esi, 15                                       ;135.7
        or        esi, ebp                                      ;135.7
        mov       ebp, ebx                                      ;135.7
        shr       ebp, 21                                       ;135.7
        and       ebp, 6                                        ;135.7
        or        ecx, DWORD PTR [_des_skb+512+esi*4]           ;135.7
        mov       esi, ebx                                      ;135.7
        shr       esi, 20                                       ;135.7
        shr       ebx, 22                                       ;135.7
        and       esi, 1                                        ;135.7
        or        esi, ebp                                      ;135.7
        and       ebx, 56                                       ;135.7
        or        esi, ebx                                      ;135.7
        mov       ebp, edi                                      ;135.7
        shr       ebp, 8                                        ;135.7
        and       ebp, 60                                       ;135.7
        or        ecx, DWORD PTR [_des_skb+768+esi*4]           ;135.7
        mov       esi, edi                                      ;135.7
        and       esi, 63                                       ;135.7
        mov       ebx, DWORD PTR [_des_skb+1024+esi*4]          ;135.7
        mov       esi, edi                                      ;135.7
        shr       esi, 7                                        ;135.7
        and       esi, 3                                        ;135.7
        or        esi, ebp                                      ;135.7
        mov       ebp, edi                                      ;135.7
        shr       ebp, 15                                       ;135.7
        and       ebp, 63                                       ;135.7
        or        ebx, DWORD PTR [_des_skb+1280+esi*4]          ;135.7
        mov       esi, edi                                      ;135.7
        shr       esi, 22                                       ;135.7
        or        ebx, DWORD PTR [_des_skb+1536+ebp*4]          ;135.7
        mov       ebp, edi                                      ;135.7
        shr       ebp, 21                                       ;135.7
        and       esi, 48                                       ;135.7
        and       ebp, 15                                       ;135.7
        or        ebp, esi                                      ;135.7
        movzx     esi, cx                                       ;135.7
        shr       ecx, 16                                       ;135.7
        or        ebx, DWORD PTR [_des_skb+1792+ebp*4]          ;135.7
        mov       ebp, ebx                                      ;135.7
        and       ebx, -65536                                   ;135.7
        shl       ebp, 16                                       ;135.7
        or        ecx, ebx                                      ;135.7
        ror       ecx, 26                                       ;135.7
        or        ebp, esi                                      ;135.7
        mov       ebx, DWORD PTR [88+esp]                       ;135.7
        mov       DWORD PTR [_ks_tbl+116+eax+edx], ecx          ;135.7
        mov       ecx, ebx                                      ;135.7
        ror       ebp, 30                                       ;135.7
        mov       DWORD PTR [_ks_tbl+112+eax+edx], ebp          ;135.7
        mov       ebp, edi                                      ;135.7
        shr       ecx, 1                                        ;135.7
        shl       ebx, 27                                       ;135.7
        shr       ebp, 1                                        ;135.7
        or        ecx, ebx                                      ;135.7
        shl       edi, 27                                       ;135.7
        mov       esi, ecx                                      ;135.7
        or        ebp, edi                                      ;135.7
        mov       edi, ecx                                      ;135.7
        and       edi, 63                                       ;135.7
        shr       esi, 7                                        ;135.7
        and       esi, 60                                       ;135.7
        mov       ebx, DWORD PTR [_des_skb+edi*4]               ;135.7
        mov       edi, ecx                                      ;135.7
        shr       edi, 6                                        ;135.7
        and       edi, 3                                        ;135.7
        or        edi, esi                                      ;135.7
        mov       esi, ecx                                      ;135.7
        shr       esi, 14                                       ;135.7
        and       esi, 48                                       ;135.7
        or        ebx, DWORD PTR [_des_skb+256+edi*4]           ;135.7
        mov       edi, ecx                                      ;135.7
        shr       edi, 13                                       ;135.7
        and       edi, 15                                       ;135.7
        or        edi, esi                                      ;135.7
        mov       esi, ecx                                      ;135.7
        shr       esi, 21                                       ;135.7
        and       esi, 6                                        ;135.7
        or        ebx, DWORD PTR [_des_skb+512+edi*4]           ;135.7
        mov       edi, ecx                                      ;135.7
        shr       edi, 20                                       ;135.7
        shr       ecx, 22                                       ;135.7
        and       edi, 1                                        ;135.7
        or        edi, esi                                      ;135.7
        and       ecx, 56                                       ;135.7
        or        edi, ecx                                      ;135.7
        mov       ecx, ebp                                      ;135.7
        and       ecx, 63                                       ;135.7
        or        ebx, DWORD PTR [_des_skb+768+edi*4]           ;135.7
        mov       edi, ebp                                      ;135.7
        mov       esi, DWORD PTR [_des_skb+1024+ecx*4]          ;135.7
        mov       ecx, ebp                                      ;135.7
        shr       ecx, 7                                        ;135.7
        shr       edi, 8                                        ;135.7
        and       ecx, 3                                        ;135.7
        and       edi, 60                                       ;135.7
        or        ecx, edi                                      ;135.7
        mov       edi, ebp                                      ;135.7
        shr       edi, 15                                       ;135.7
        and       edi, 63                                       ;135.7
        or        esi, DWORD PTR [_des_skb+1280+ecx*4]          ;135.7
        mov       ecx, ebp                                      ;135.7
        shr       ecx, 21                                       ;135.7
        shr       ebp, 22                                       ;135.7
        and       ecx, 15                                       ;135.7
        and       ebp, 48                                       ;135.7
        or        ecx, ebp                                      ;135.7
        or        esi, DWORD PTR [_des_skb+1536+edi*4]          ;135.7
        movzx     ebp, bx                                       ;135.7
        shr       ebx, 16                                       ;135.7
        or        esi, DWORD PTR [_des_skb+1792+ecx*4]          ;135.7
        mov       ecx, esi                                      ;135.7
        and       esi, -65536                                   ;135.7
        shl       ecx, 16                                       ;135.7
        or        ebx, esi                                      ;135.7
        or        ecx, ebp                                      ;135.7
        ror       ecx, 30                                       ;135.7
        ror       ebx, 26                                       ;135.7
        mov       DWORD PTR [_ks_tbl+120+eax+edx], ecx          ;135.7
        mov       DWORD PTR [_ks_tbl+124+eax+edx], ebx          ;135.7
        mov       edx, DWORD PTR [28+esp]                       ;132.5
        inc       edx                                           ;132.5
        mov       DWORD PTR [28+esp], edx                       ;132.5
        cmp       edx, DWORD PTR [12+esp]                       ;132.5
        jb        .B3.5         ; Prob 99%                      ;132.5
                                ; LOE xmm0
.B3.6:                          ; Preds .B3.12
        mov       eax, DWORD PTR [24+esp]                       ;
        mov       edx, DWORD PTR [12+esp]                       ;
                                ; LOE eax edx xmm0
.B3.7:                          ; Preds .B3.3 .B3.6
        inc       eax                                           ;130.3
        cmp       eax, 8                                        ;130.3
        jb        .B3.2         ; Prob 87%                      ;130.3
                                ; LOE eax edx xmm0
.B3.8:                          ; Preds .B3.7
        add       esp, 92                                       ;138.1
        pop       ebp                                           ;138.1
        pop       ebx                                           ;138.1
        pop       edi                                           ;138.1
        pop       esi                                           ;138.1
        ret                                                     ;138.1
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
_start_pw	DB ?	; pad
	ORG $+254	; pad
	DB ?	; pad
_end_pw	DB ?	; pad
	ORG $+254	; pad
	DB ?	; pad
_alphabet	DB ?	; pad
	ORG $+254	; pad
	DB ?	; pad
_ks	DB ?	; pad
	ORG $+1022	; pad
	DB ?	; pad
_ks_tbl	DB ?	; pad
	ORG $+262142	; pad
	DB ?	; pad
	DB ?	; pad
	ORG $+510	; pad
	DB ?	; pad
_start_cbn	DD 2 DUP (0H)	; pad
_end_cbn	DD 2 DUP (0H)	; pad
_completed	DD 2 DUP (0H)	; pad
_hash	DD 8 DUP (0H)	; pad
_alpha_len	DD 1 DUP (0H)	; pad
_BSS	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_des_SPtrans	DD	34080768
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
_DATA	ENDS
_RDATA	SEGMENT  DWORD PUBLIC FLAT READ  'DATA'
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
_2il0floatpacket.3	DD	000000000H,000000000H,000000000H,043f00000H
_2il0floatpacket.240	DD	000000001H,000000000H
_2il0floatpacket.0	DD	0358637bdH
_2il0floatpacket.1	DD	03a83126fH
_2il0floatpacket.2	DD	03f800000H
??_C@_03A@?$CF2x?$AA@	DD	7877157
??_C@_0BM@A@?6?5Completed?3?5?$CFlld?5?$CF?42fM?5k?1s?$AA@	DD	1866670090
	DD	1701605485
	DD	979658100
	DD	1819026720
	DD	774185060
	DD	541943346
	DD	7548779
??_C@_0BF@A@?6?5?5Invalid?5hash?5?$DN?5?$CFs?$AA@	DD	1226842122
	DD	1818326638
	DD	1746953321
	DD	543716193
	DD	1931812925
	DB	0
	DB 3 DUP ( 0H)	; pad
??_C@_0CO@A@?6?5?5Usage?3?5?$CFs?5?$DMhash?$DO?5?$DMstart?$DO?5?$DMend?$DO?5?$DMalphabet?$DO?6?$AA@	DD	1428168714
	DD	1701273971
	DD	1931812922
	DD	1634221088
	DD	540960883
	DD	1635021628
	DD	540963954
	DD	1684956476
	DD	1631330366
	DD	1634234476
	DD	1047815522
	DW	10
	DB 2 DUP ( 0H)	; pad
??_C@_0BA@A@?6Found?5password?$AA@	DD	1970226698
	DD	1881171054
	DD	2004054881
	DD	6582895
_ptext	DD	559105867
	DD	623125312
	DB	0
_RDATA	ENDS
;	COMDAT ??_C@_01A@?6?$AA@
_RDATA	SEGMENT  DWORD PUBLIC FLAT READ  'DATA'
;	COMDAT ??_C@_01A@?6?$AA@
??_C@_01A@?6?$AA@	DW	10
;??_C@_01A@?6?$AA@	ENDS
_RDATA	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
EXTRN	_putchar:PROC
EXTRN	_isxdigit:PROC
EXTRN	_sscanf:PROC
EXTRN	_printf:PROC
EXTRN	_exit:PROC
EXTRN	_clock:PROC
EXTRN	___intel_new_feature_proc_init:PROC
EXTRN	___intel_sse4_strchr:PROC
EXTRN	___intel_sse4_strlen:PROC
EXTRN	___intel_ssse3_strncpy:PROC
EXTRN	__allmul:PROC
EXTRN	__fltused:BYTE
	INCLUDELIB <libdecimal>
	END
