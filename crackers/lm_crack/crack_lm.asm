; mark_description "Intel(R) C++ Compiler XE for applications running on IA-32, Version 15.0.0.108 Build 20140726";
; mark_description "-O3 -Fa -c";
	.686P
 	.387
	OPTION DOTNAME
	ASSUME	CS:FLAT,DS:FLAT,SS:FLAT
;ident "-defaultlib:libcpmt"
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
        push      ebp                                           ;315.34
        mov       ebp, esp                                      ;315.34
        and       esp, -128                                     ;315.34
        push      esi                                           ;315.34
        push      edi                                           ;315.34
        push      ebx                                           ;315.34
        sub       esp, 372                                      ;315.34
        xor       eax, eax                                      ;315.34
        push      eax                                           ;315.34
        push      eax                                           ;315.34
        push      3                                             ;315.34
        mov       ebx, DWORD PTR [12+ebp]                       ;315.5
        call      ___intel_new_feature_proc_init                ;315.34
                                ; LOE ebx
.B1.99:                         ; Preds .B1.1
        add       esp, 12                                       ;315.34
        stmxcsr   DWORD PTR [128+esp]                           ;315.34
        or        DWORD PTR [128+esp], 32768                    ;315.34
        ldmxcsr   DWORD PTR [128+esp]                           ;315.34
        cmp       DWORD PTR [8+ebp], 5                          ;319.15
        jne       .B1.90        ; Prob 21%                      ;319.15
                                ; LOE ebx
.B1.2:                          ; Preds .B1.99
        mov       edi, DWORD PTR [4+ebx]                        ;324.16
        mov       edx, edi                                      ;324.8
        mov       ecx, edx                                      ;324.8
        and       edx, -16                                      ;324.8
        pxor      xmm0, xmm0                                    ;324.8
        pcmpeqb   xmm0, XMMWORD PTR [edx]                       ;324.8
        pmovmskb  eax, xmm0                                     ;324.8
        and       ecx, 15                                       ;324.8
        shr       eax, cl                                       ;324.8
        bsf       eax, eax                                      ;324.8
        jne       L2            ; Prob 60%                      ;324.8
        mov       eax, edx                                      ;324.8
        add       edx, ecx                                      ;324.8
        call      ___intel_sse2_strlen                          ;324.8
L2:                                                             ;
                                ; LOE eax ebx edi
.B1.100:                        ; Preds .B1.2
        mov       esi, eax                                      ;324.8
        test      esi, 1                                        ;324.8
        jne       .B1.88        ; Prob 28%                      ;324.8
                                ; LOE ebx esi edi
.B1.3:                          ; Preds .B1.100
        test      esi, esi                                      ;324.8
        jbe       .B1.8         ; Prob 15%                      ;324.8
                                ; LOE ebx esi edi
.B1.4:                          ; Preds .B1.3
        xor       eax, eax                                      ;324.8
        mov       ebx, eax                                      ;324.8
                                ; LOE ebx esi edi
.B1.5:                          ; Preds .B1.6 .B1.4
        movsx     ecx, BYTE PTR [ebx+edi]                       ;324.8
        push      ecx                                           ;324.8
        call      _isxdigit                                     ;324.8
                                ; LOE eax ebx esi edi
.B1.101:                        ; Preds .B1.5
        add       esp, 4                                        ;324.8
        test      eax, eax                                      ;324.8
        je        .B1.88        ; Prob 20%                      ;324.8
                                ; LOE ebx esi edi
.B1.6:                          ; Preds .B1.101
        inc       ebx                                           ;324.8
        cmp       ebx, esi                                      ;324.8
        jb        .B1.5         ; Prob 82%                      ;324.8
                                ; LOE ebx esi edi
.B1.7:                          ; Preds .B1.6
        mov       ebx, DWORD PTR [12+ebp]                       ;
                                ; LOE ebx esi edi
.B1.8:                          ; Preds .B1.7 .B1.3
        shr       esi, 1                                        ;324.8
        test      esi, esi                                      ;324.8
        jbe       .B1.94        ; Prob 10%                      ;324.8
                                ; LOE ebx esi edi
.B1.9:                          ; Preds .B1.8
        xor       eax, eax                                      ;324.8
        mov       ebx, eax                                      ;324.8
                                ; LOE ebx esi edi
.B1.10:                         ; Preds .B1.11 .B1.9
        lea       ecx, DWORD PTR [148+esp]                      ;324.8
        push      ecx                                           ;324.8
        push      OFFSET FLAT: ??_C@_03A@?$CF2x?$AA@            ;324.8
        lea       ecx, DWORD PTR [edi+ebx*2]                    ;324.8
        push      ecx                                           ;324.8
        call      _sscanf                                       ;324.8
                                ; LOE ebx esi edi
.B1.102:                        ; Preds .B1.10
        add       esp, 12                                       ;324.8
                                ; LOE ebx esi edi
.B1.11:                         ; Preds .B1.102
        mov       ecx, DWORD PTR [148+esp]                      ;324.8
        mov       BYTE PTR [_hash+ebx], cl                      ;324.8
        inc       ebx                                           ;324.8
        cmp       ebx, esi                                      ;324.8
        jb        .B1.10        ; Prob 82%                      ;324.8
                                ; LOE ebx esi edi
.B1.12:                         ; Preds .B1.11
        mov       ebx, DWORD PTR [12+ebp]                       ;
                                ; LOE ebx
.B1.13:                         ; Preds .B1.12 .B1.94
        mov       eax, OFFSET FLAT: _start_pw                   ;329.3
        mov       edi, 256                                      ;329.3
        mov       edx, DWORD PTR [8+ebx]                        ;329.3
        test      edi, edi                                      ;329.3
        je        L6            ; Prob 75%                      ;329.3
        test      dl, 3                                         ;329.3
        je        L4            ; Prob 75%                      ;329.3
L3:                                                             ;
        mov       cl, BYTE PTR [edx]                            ;329.3
        inc       edx                                           ;329.3
        test      cl, cl                                        ;329.3
        je        L5            ; Prob 75%                      ;329.3
        mov       BYTE PTR [eax], cl                            ;329.3
        inc       eax                                           ;329.3
        dec       edi                                           ;329.3
        je        L6            ; Prob 75%                      ;329.3
        test      dl, 3                                         ;329.3
        jne       L3            ; Prob 75%                      ;329.3
L4:                                                             ;
        call      ___intel_sse2_strncpy                         ;329.3
L5:                                                             ;
        test      edi, edi                                      ;329.3
        je        L6            ; Prob 75%                      ;329.3
        xor       cl, cl                                        ;329.3
L7:                                                             ;
        mov       BYTE PTR [eax], cl                            ;329.3
        inc       eax                                           ;329.3
        dec       edi                                           ;329.3
        jne       L7            ; Prob 75%                      ;329.3
L6:                                                             ;
                                ; LOE ebx
.B1.14:                         ; Preds .B1.13
        mov       eax, OFFSET FLAT: _end_pw                     ;330.3
        mov       edi, 256                                      ;330.3
        mov       edx, DWORD PTR [12+ebx]                       ;330.3
        test      edi, edi                                      ;330.3
        je        L11           ; Prob 75%                      ;330.3
        test      dl, 3                                         ;330.3
        je        L9            ; Prob 75%                      ;330.3
L8:                                                             ;
        mov       cl, BYTE PTR [edx]                            ;330.3
        inc       edx                                           ;330.3
        test      cl, cl                                        ;330.3
        je        L10           ; Prob 75%                      ;330.3
        mov       BYTE PTR [eax], cl                            ;330.3
        inc       eax                                           ;330.3
        dec       edi                                           ;330.3
        je        L11           ; Prob 75%                      ;330.3
        test      dl, 3                                         ;330.3
        jne       L8            ; Prob 75%                      ;330.3
L9:                                                             ;
        call      ___intel_sse2_strncpy                         ;330.3
L10:                                                            ;
        test      edi, edi                                      ;330.3
        je        L11           ; Prob 75%                      ;330.3
        xor       cl, cl                                        ;330.3
L12:                                                            ;
        mov       BYTE PTR [eax], cl                            ;330.3
        inc       eax                                           ;330.3
        dec       edi                                           ;330.3
        jne       L12           ; Prob 75%                      ;330.3
L11:                                                            ;
                                ; LOE ebx
.B1.15:                         ; Preds .B1.14
        mov       eax, OFFSET FLAT: _alphabet                   ;331.3
        mov       edi, 256                                      ;331.3
        mov       edx, DWORD PTR [16+ebx]                       ;331.3
        test      edi, edi                                      ;331.3
        je        L16           ; Prob 75%                      ;331.3
        test      dl, 3                                         ;331.3
        je        L14           ; Prob 75%                      ;331.3
L13:                                                            ;
        mov       cl, BYTE PTR [edx]                            ;331.3
        inc       edx                                           ;331.3
        test      cl, cl                                        ;331.3
        je        L15           ; Prob 75%                      ;331.3
        mov       BYTE PTR [eax], cl                            ;331.3
        inc       eax                                           ;331.3
        dec       edi                                           ;331.3
        je        L16           ; Prob 75%                      ;331.3
        test      dl, 3                                         ;331.3
        jne       L13           ; Prob 75%                      ;331.3
L14:                                                            ;
        call      ___intel_sse2_strncpy                         ;331.3
L15:                                                            ;
        test      edi, edi                                      ;331.3
        je        L16           ; Prob 75%                      ;331.3
        xor       cl, cl                                        ;331.3
L17:                                                            ;
        mov       BYTE PTR [eax], cl                            ;331.3
        inc       eax                                           ;331.3
        dec       edi                                           ;331.3
        jne       L17           ; Prob 75%                      ;331.3
L16:                                                            ;
                                ; LOE
.B1.16:                         ; Preds .B1.15
        mov       edx, OFFSET FLAT: _alphabet                   ;333.15
        mov       ecx, edx                                      ;333.15
        and       edx, -16                                      ;333.15
        pxor      xmm0, xmm0                                    ;333.15
        pcmpeqb   xmm0, XMMWORD PTR [edx]                       ;333.15
        pmovmskb  eax, xmm0                                     ;333.15
        and       ecx, 15                                       ;333.15
        shr       eax, cl                                       ;333.15
        bsf       eax, eax                                      ;333.15
        jne       L18           ; Prob 60%                      ;333.15
        mov       eax, edx                                      ;333.15
        add       edx, ecx                                      ;333.15
        call      ___intel_sse2_strlen                          ;333.15
L18:                                                            ;
                                ; LOE eax
.B1.104:                        ; Preds .B1.16
        mov       edx, OFFSET FLAT: _start_pw                   ;334.15
        mov       DWORD PTR [152+esp], eax                      ;333.15
        mov       DWORD PTR [_alpha_len], eax                   ;333.3
        mov       ecx, edx                                      ;334.15
        and       edx, -16                                      ;334.15
        pxor      xmm0, xmm0                                    ;334.15
        pcmpeqb   xmm0, XMMWORD PTR [edx]                       ;334.15
        pmovmskb  eax, xmm0                                     ;334.15
        and       ecx, 15                                       ;334.15
        shr       eax, cl                                       ;334.15
        bsf       eax, eax                                      ;334.15
        jne       L19           ; Prob 60%                      ;334.15
        mov       eax, edx                                      ;334.15
        add       edx, ecx                                      ;334.15
        call      ___intel_sse2_strlen                          ;334.15
L19:                                                            ;
                                ; LOE eax
.B1.103:                        ; Preds .B1.104
        mov       edx, eax                                      ;334.15
        xor       esi, esi                                      ;334.15
        xor       ebx, ebx                                      ;334.15
        test      edx, edx                                      ;334.15
        jbe       .B1.22        ; Prob 4%                       ;334.15
                                ; LOE edx ebx esi
.B1.17:                         ; Preds .B1.103
        xor       edi, edi                                      ;334.15
        mov       eax, 1                                        ;334.15
        mov       DWORD PTR [128+esp], ebx                      ;334.15
        mov       ebx, edi                                      ;334.15
        mov       DWORD PTR [132+esp], esi                      ;334.15
        mov       esi, eax                                      ;334.15
        mov       DWORD PTR [136+esp], edx                      ;334.15
                                ; LOE ebx esi edi
.B1.18:                         ; Preds .B1.106 .B1.17
        mov       eax, OFFSET FLAT: _alphabet                   ;334.15
        movsx     edx, BYTE PTR [_start_pw+ebx]                 ;334.15
        mov       ecx, eax                                      ;334.15
        and       ecx, 15                                       ;334.15
        and       eax, -16                                      ;334.15
        push      eax                                           ;334.15
        pxor      xmm2, xmm2                                    ;334.15
        movd      xmm1, edx                                     ;334.15
        punpcklbw xmm1, xmm1                                    ;334.15
        punpcklbw xmm1, xmm1                                    ;334.15
        pshufd    xmm1, xmm1, 0                                 ;334.15
        movdqa    xmm0, XMMWORD PTR [eax]                       ;334.15
        pcmpeqb   xmm2, xmm0                                    ;334.15
        pcmpeqb   xmm0, xmm1                                    ;334.15
        pmovmskb  edx, xmm0                                     ;334.15
        pmovmskb  eax, xmm2                                     ;334.15
        shr       edx, cl                                       ;334.15
        shr       eax, cl                                       ;334.15
        test      edx, edx                                      ;334.15
        jne       L20           ; Prob 25%                      ;334.15
        test      eax, eax                                      ;334.15
        je        L23           ; Prob 25%                      ;334.15
        jmp       L22           ; Prob 100%                     ;334.15
L20:                                                            ;
        bsf       edx, edx                                      ;334.15
        bsf       eax, eax                                      ;334.15
        jz        L21           ; Prob 50%                      ;334.15
        cmp       edx, eax                                      ;334.15
        jg        L22           ; Prob 25%                      ;334.15
L21:                                                            ;
        pop       eax                                           ;334.15
        add       eax, ecx                                      ;334.15
        add       eax, edx                                      ;334.15
        jmp       L24           ; Prob 25%                      ;334.15
L22:                                                            ;
        pop       edx                                           ;334.15
        xor       eax, eax                                      ;334.15
        jmp       L24           ; Prob 100%                     ;334.15
L23:                                                            ;
        pop       eax                                           ;334.15
        call      ___intel_sse2_strchr                          ;334.15
L24:                                                            ;
                                ; LOE eax ebx esi edi
.B1.105:                        ; Preds .B1.18
        inc       eax                                           ;334.15
        mov       edx, OFFSET FLAT: _alphabet                   ;334.15
        sub       eax, edx                                      ;334.15
        je        .B1.93        ; Prob 20%                      ;334.15
                                ; LOE eax ebx esi edi
.B1.19:                         ; Preds .B1.105
        push      0                                             ;334.15
        push      eax                                           ;334.15
        push      edi                                           ;334.15
        push      esi                                           ;334.15
        call      __allmul                                      ;334.15
                                ; LOE eax edx ebx esi edi
.B1.107:                        ; Preds .B1.19
        push      0                                             ;334.15
        push      DWORD PTR [156+esp]                           ;334.15
        push      edi                                           ;334.15
        push      esi                                           ;334.15
        add       DWORD PTR [148+esp], eax                      ;334.15
        adc       DWORD PTR [144+esp], edx                      ;334.15
        call      __allmul                                      ;334.15
                                ; LOE eax edx ebx
.B1.106:                        ; Preds .B1.107
        inc       ebx                                           ;334.15
        mov       esi, eax                                      ;334.15
        mov       edi, edx                                      ;334.15
        cmp       ebx, DWORD PTR [136+esp]                      ;334.15
        jb        .B1.18        ; Prob 82%                      ;334.15
                                ; LOE ebx esi edi
.B1.20:                         ; Preds .B1.106
        mov       ebx, DWORD PTR [128+esp]                      ;
        mov       esi, DWORD PTR [132+esp]                      ;
                                ; LOE ebx esi
.B1.22:                         ; Preds .B1.20 .B1.103 .B1.93
        mov       edx, OFFSET FLAT: _end_pw                     ;335.13
        mov       DWORD PTR [_start_cbn], esi                   ;334.3
        mov       DWORD PTR [_start_cbn+4], ebx                 ;334.3
        mov       ecx, edx                                      ;335.13
        and       edx, -16                                      ;335.13
        pxor      xmm0, xmm0                                    ;335.13
        pcmpeqb   xmm0, XMMWORD PTR [edx]                       ;335.13
        pmovmskb  eax, xmm0                                     ;335.13
        and       ecx, 15                                       ;335.13
        shr       eax, cl                                       ;335.13
        bsf       eax, eax                                      ;335.13
        jne       L25           ; Prob 60%                      ;335.13
        mov       eax, edx                                      ;335.13
        add       edx, ecx                                      ;335.13
        call      ___intel_sse2_strlen                          ;335.13
L25:                                                            ;
                                ; LOE eax ebx esi
.B1.108:                        ; Preds .B1.22
        mov       edx, eax                                      ;335.13
        xor       eax, eax                                      ;335.13
        xor       edi, edi                                      ;335.13
        test      edx, edx                                      ;335.13
        jbe       .B1.28        ; Prob 4%                       ;335.13
                                ; LOE eax edx ebx esi edi
.B1.23:                         ; Preds .B1.108
        xor       ecx, ecx                                      ;335.13
        mov       DWORD PTR [136+esp], 1                        ;335.13
        mov       DWORD PTR [144+esp], ecx                      ;335.13
        mov       DWORD PTR [140+esp], edx                      ;335.13
        mov       DWORD PTR [128+esp], ebx                      ;335.13
        mov       ebx, eax                                      ;335.13
        mov       DWORD PTR [132+esp], esi                      ;335.13
        mov       esi, ecx                                      ;335.13
                                ; LOE ebx esi edi
.B1.24:                         ; Preds .B1.110 .B1.23
        mov       edx, DWORD PTR [144+esp]                      ;335.13
        mov       eax, OFFSET FLAT: _alphabet                   ;335.13
        movsx     edx, BYTE PTR [_end_pw+edx]                   ;335.13
        mov       ecx, eax                                      ;335.13
        and       ecx, 15                                       ;335.13
        and       eax, -16                                      ;335.13
        push      eax                                           ;335.13
        pxor      xmm2, xmm2                                    ;335.13
        movd      xmm1, edx                                     ;335.13
        punpcklbw xmm1, xmm1                                    ;335.13
        punpcklbw xmm1, xmm1                                    ;335.13
        pshufd    xmm1, xmm1, 0                                 ;335.13
        movdqa    xmm0, XMMWORD PTR [eax]                       ;335.13
        pcmpeqb   xmm2, xmm0                                    ;335.13
        pcmpeqb   xmm0, xmm1                                    ;335.13
        pmovmskb  edx, xmm0                                     ;335.13
        pmovmskb  eax, xmm2                                     ;335.13
        shr       edx, cl                                       ;335.13
        shr       eax, cl                                       ;335.13
        test      edx, edx                                      ;335.13
        jne       L26           ; Prob 25%                      ;335.13
        test      eax, eax                                      ;335.13
        je        L29           ; Prob 25%                      ;335.13
        jmp       L28           ; Prob 100%                     ;335.13
L26:                                                            ;
        bsf       edx, edx                                      ;335.13
        bsf       eax, eax                                      ;335.13
        jz        L27           ; Prob 50%                      ;335.13
        cmp       edx, eax                                      ;335.13
        jg        L28           ; Prob 25%                      ;335.13
L27:                                                            ;
        pop       eax                                           ;335.13
        add       eax, ecx                                      ;335.13
        add       eax, edx                                      ;335.13
        jmp       L30           ; Prob 25%                      ;335.13
L28:                                                            ;
        pop       edx                                           ;335.13
        xor       eax, eax                                      ;335.13
        jmp       L30           ; Prob 100%                     ;335.13
L29:                                                            ;
        pop       eax                                           ;335.13
        call      ___intel_sse2_strchr                          ;335.13
L30:                                                            ;
                                ; LOE eax ebx esi edi
.B1.109:                        ; Preds .B1.24
        inc       eax                                           ;335.13
        mov       edx, OFFSET FLAT: _alphabet                   ;335.13
        sub       eax, edx                                      ;335.13
        je        .B1.92        ; Prob 20%                      ;335.13
                                ; LOE eax ebx esi edi
.B1.25:                         ; Preds .B1.109
        push      0                                             ;335.13
        push      eax                                           ;335.13
        push      esi                                           ;335.13
        push      DWORD PTR [148+esp]                           ;335.13
        call      __allmul                                      ;335.13
                                ; LOE eax edx ebx esi edi
.B1.111:                        ; Preds .B1.25
        push      esi                                           ;335.13
        push      DWORD PTR [140+esp]                           ;335.13
        add       ebx, eax                                      ;335.13
        push      0                                             ;335.13
        push      DWORD PTR [164+esp]                           ;335.13
        adc       edi, edx                                      ;335.13
        call      __allmul                                      ;335.13
                                ; LOE eax edx ebx edi
.B1.110:                        ; Preds .B1.111
        mov       esi, edx                                      ;335.13
        mov       edx, DWORD PTR [144+esp]                      ;335.13
        inc       edx                                           ;335.13
        mov       DWORD PTR [136+esp], eax                      ;335.13
        mov       DWORD PTR [144+esp], edx                      ;335.13
        cmp       edx, DWORD PTR [140+esp]                      ;335.13
        jb        .B1.24        ; Prob 82%                      ;335.13
                                ; LOE ebx esi edi
.B1.26:                         ; Preds .B1.110
        mov       esi, DWORD PTR [132+esp]                      ;
        mov       eax, ebx                                      ;
        mov       ebx, DWORD PTR [128+esp]                      ;
                                ; LOE eax ebx esi edi
.B1.28:                         ; Preds .B1.26 .B1.108 .B1.92
        add       esi, -1                                       ;337.3
        mov       DWORD PTR [_end_cbn], eax                     ;335.3
        pxor      xmm0, xmm0                                    ;340.3
        adc       ebx, -1                                       ;337.3
        sub       eax, esi                                      ;338.15
        mov       DWORD PTR [_end_cbn+4], edi                   ;335.3
        sbb       edi, ebx                                      ;338.15
        mov       DWORD PTR [_start_cbn], esi                   ;337.3
        mov       DWORD PTR [_start_cbn+4], ebx                 ;337.3
        xor       ebx, ebx                                      ;340.3
        mov       DWORD PTR [_total_cbn], eax                   ;338.3
        mov       DWORD PTR [_total_cbn+4], edi                 ;338.3
                                ; LOE ebx xmm0
.B1.29:                         ; Preds .B1.82 .B1.28
        movq      QWORD PTR [160+esp], xmm0                     ;340.3
                                ; LOE ebx xmm0
.B1.30:                         ; Preds .B1.29
        cmp       DWORD PTR [152+esp], 0                        ;340.3
        jbe       .B1.82        ; Prob 10%                      ;340.3
                                ; LOE ebx xmm0
.B1.31:                         ; Preds .B1.30
        mov       edi, DWORD PTR [shifts2.1460.0.3+12]          ;340.3
        mov       esi, ebx                                      ;340.3
        mov       DWORD PTR [180+esp], edi                      ;340.3
        mov       edi, DWORD PTR [shifts2.1460.0.3+28]          ;340.3
        mov       DWORD PTR [196+esp], edi                      ;340.3
        mov       eax, DWORD PTR [shifts2.1460.0.3]             ;340.3
        mov       edi, DWORD PTR [shifts2.1460.0.3+48]          ;340.3
        mov       DWORD PTR [168+esp], eax                      ;340.3
        mov       DWORD PTR [204+esp], edi                      ;340.3
        mov       edx, DWORD PTR [shifts2.1460.0.3+4]           ;340.3
        mov       ecx, DWORD PTR [shifts2.1460.0.3+8]           ;340.3
        mov       eax, DWORD PTR [shifts2.1460.0.3+16]          ;340.3
        mov       edi, DWORD PTR [shifts2.1460.0.3+52]          ;340.3
        mov       DWORD PTR [172+esp], edx                      ;340.3
        mov       DWORD PTR [176+esp], ecx                      ;340.3
        mov       DWORD PTR [184+esp], eax                      ;340.3
        mov       DWORD PTR [156+esp], edi                      ;340.3
        mov       edx, DWORD PTR [shifts2.1460.0.3+20]          ;340.3
        mov       ecx, DWORD PTR [shifts2.1460.0.3+24]          ;340.3
        mov       eax, DWORD PTR [shifts2.1460.0.3+32]          ;340.3
        mov       edi, DWORD PTR [shifts2.1460.0.3+56]          ;340.3
        mov       DWORD PTR [188+esp], edx                      ;340.3
        mov       DWORD PTR [192+esp], ecx                      ;340.3
        mov       DWORD PTR [200+esp], eax                      ;340.3
        mov       DWORD PTR [140+esp], edi                      ;340.3
        shl       esi, 15                                       ;340.3
        mov       eax, DWORD PTR [shifts2.1460.0.3+36]          ;340.3
        mov       edx, DWORD PTR [shifts2.1460.0.3+40]          ;340.3
        mov       ecx, DWORD PTR [shifts2.1460.0.3+44]          ;340.3
        mov       edi, DWORD PTR [shifts2.1460.0.3+60]          ;340.3
        mov       DWORD PTR [144+esp], 0                        ;340.3
        mov       DWORD PTR [136+esp], edi                      ;340.3
        mov       DWORD PTR [216+esp], ecx                      ;340.3
        mov       DWORD PTR [220+esp], edx                      ;340.3
        mov       DWORD PTR [208+esp], eax                      ;340.3
        mov       DWORD PTR [224+esp], esi                      ;340.3
        mov       DWORD PTR [212+esp], ebx                      ;340.3
                                ; LOE xmm0
.B1.32:                         ; Preds .B1.80 .B1.31
        mov       eax, DWORD PTR [144+esp]                      ;340.17
        mov       edi, DWORD PTR [212+esp]                      ;340.3
        movzx     eax, BYTE PTR [_alphabet+eax]                 ;340.17
        mov       BYTE PTR [160+esp+edi], al                    ;340.3
        movzx     ecx, BYTE PTR [162+esp]                       ;340.3
        mov       edx, ecx                                      ;340.3
        movzx     edi, BYTE PTR [161+esp]                       ;340.3
        mov       ebx, edi                                      ;340.3
        movzx     eax, BYTE PTR [160+esp]                       ;340.3
        mov       esi, eax                                      ;340.3
        shl       edi, 5                                        ;340.3
        and       esi, 254                                      ;340.3
        shr       edx, 3                                        ;340.3
        shl       eax, 6                                        ;340.3
        or        edi, edx                                      ;340.3
        shr       ebx, 2                                        ;340.3
        add       edi, edi                                      ;340.3
        movzx     edx, BYTE PTR [163+esp]                       ;340.3
        or        eax, ebx                                      ;340.3
        mov       ebx, edx                                      ;340.3
        add       eax, eax                                      ;340.3
        shl       ecx, 4                                        ;340.3
        shr       ebx, 4                                        ;340.3
        or        ecx, ebx                                      ;340.3
        add       ecx, ecx                                      ;340.3
        mov       DWORD PTR [232+esp], ecx                      ;340.3
        movzx     ecx, BYTE PTR [164+esp]                       ;340.3
        mov       ebx, ecx                                      ;340.3
        shl       edx, 3                                        ;340.3
        shr       ebx, 5                                        ;340.3
        or        edx, ebx                                      ;340.3
        add       edx, edx                                      ;340.3
        mov       DWORD PTR [236+esp], edx                      ;340.3
        movzx     edx, BYTE PTR [165+esp]                       ;340.3
        mov       ebx, edx                                      ;340.3
        shl       ecx, 2                                        ;340.3
        add       edx, edx                                      ;340.3
        shr       ebx, 6                                        ;340.3
        or        ecx, ebx                                      ;340.3
        movzx     ebx, BYTE PTR [166+esp]                       ;340.3
        add       ecx, ecx                                      ;340.3
        mov       DWORD PTR [240+esp], ecx                      ;340.3
        mov       ecx, ebx                                      ;340.3
        movzx     eax, al                                       ;340.3
        add       ebx, ebx                                      ;340.3
        and       edi, 255                                      ;340.3
        shr       ecx, 7                                        ;340.3
        or        edx, ecx                                      ;340.3
        movzx     ecx, BYTE PTR [_odd_parity+esi]               ;340.3
        add       edx, edx                                      ;340.3
        movzx     esi, BYTE PTR [232+esp]                       ;340.3
        mov       BYTE PTR [128+esp], cl                        ;340.3
        movzx     ecx, BYTE PTR [_odd_parity+eax]               ;340.3
        movzx     eax, BYTE PTR [_odd_parity+edi]               ;340.3
        mov       BYTE PTR [129+esp], cl                        ;340.3
        mov       BYTE PTR [130+esp], al                        ;340.3
        movzx     ecx, BYTE PTR [_odd_parity+esi]               ;340.3
        movzx     eax, BYTE PTR [236+esp]                       ;340.3
        movzx     esi, BYTE PTR [240+esp]                       ;340.3
        movzx     edx, dl                                       ;340.3
        movzx     ebx, bl                                       ;340.3
        mov       BYTE PTR [131+esp], cl                        ;340.3
        movzx     ecx, BYTE PTR [_odd_parity+eax]               ;340.3
        movzx     eax, BYTE PTR [_odd_parity+esi]               ;340.3
        mov       BYTE PTR [133+esp], al                        ;340.3
        movzx     eax, BYTE PTR [_odd_parity+edx]               ;340.3
        mov       BYTE PTR [134+esp], al                        ;340.3
        movzx     eax, BYTE PTR [_odd_parity+ebx]               ;340.3
        mov       BYTE PTR [132+esp], cl                        ;340.3
        mov       BYTE PTR [135+esp], al                        ;340.3
        mov       ebx, DWORD PTR [132+esp]                      ;340.3
        mov       ecx, ebx                                      ;340.3
        shr       ecx, 4                                        ;340.3
        mov       eax, DWORD PTR [128+esp]                      ;340.3
        xor       ecx, eax                                      ;340.3
        and       ecx, 252645135                                ;340.3
        xor       eax, ecx                                      ;340.3
        shl       ecx, 4                                        ;340.3
        mov       edx, eax                                      ;340.3
        xor       ebx, ecx                                      ;340.3
        mov       esi, ebx                                      ;340.3
        shl       esi, 18                                       ;340.3
        xor       esi, ebx                                      ;340.3
        shl       edx, 18                                       ;340.3
        and       esi, -859045888                               ;340.3
        xor       edx, eax                                      ;340.3
        xor       ebx, esi                                      ;340.3
        shr       esi, 18                                       ;340.3
        and       edx, -859045888                               ;340.3
        xor       ebx, esi                                      ;340.3
        xor       eax, edx                                      ;340.3
        shr       edx, 18                                       ;340.3
        mov       ecx, ebx                                      ;340.3
        shr       ecx, 1                                        ;340.3
        xor       eax, edx                                      ;340.3
        xor       ecx, eax                                      ;340.3
        and       ecx, 1431655765                               ;340.3
        xor       eax, ecx                                      ;340.3
        add       ecx, ecx                                      ;340.3
        mov       edx, eax                                      ;340.3
        xor       ebx, ecx                                      ;340.3
        shr       edx, 8                                        ;340.3
        xor       edx, ebx                                      ;340.3
        and       edx, 16711935                                 ;340.3
        xor       ebx, edx                                      ;340.3
        mov       edi, DWORD PTR [144+esp]                      ;340.3
        shl       edi, 7                                        ;340.3
        mov       DWORD PTR [228+esp], edi                      ;340.3
        mov       edi, ebx                                      ;340.3
        shl       edx, 8                                        ;340.3
        shr       edi, 1                                        ;340.3
        xor       eax, edx                                      ;340.3
        xor       edi, eax                                      ;340.3
        and       edi, 1431655765                               ;340.3
        xor       eax, edi                                      ;340.3
        add       edi, edi                                      ;340.3
        xor       ebx, edi                                      ;340.3
        movzx     ecx, bl                                       ;340.3
        mov       edx, ebx                                      ;340.3
        shl       ecx, 16                                       ;340.3
        and       edx, 65280                                    ;340.3
        and       ebx, 16711680                                 ;340.3
        or        ecx, edx                                      ;340.3
        shr       ebx, 16                                       ;340.3
        or        ecx, ebx                                      ;340.3
        mov       ebx, eax                                      ;340.3
        and       ebx, -268435456                               ;340.3
        and       eax, 268435455                                ;340.3
        shr       ebx, 4                                        ;340.3
        or        ecx, ebx                                      ;340.3
        cmp       DWORD PTR [168+esp], 0                        ;340.3
        je        .B1.34        ; Prob 50%                      ;340.3
                                ; LOE eax ecx xmm0
.B1.33:                         ; Preds .B1.32
        mov       edx, eax                                      ;340.3
        shr       edx, 2                                        ;340.3
        shl       eax, 26                                       ;340.3
        or        edx, eax                                      ;340.3
        mov       eax, ecx                                      ;340.3
        shr       eax, 2                                        ;340.3
        shl       ecx, 26                                       ;340.3
        or        eax, ecx                                      ;340.3
        jmp       .B1.35        ; Prob 100%                     ;340.3
                                ; LOE eax edx xmm0
.B1.34:                         ; Preds .B1.32
        mov       edx, eax                                      ;340.3
        shr       edx, 1                                        ;340.3
        shl       eax, 27                                       ;340.3
        or        edx, eax                                      ;340.3
        mov       eax, ecx                                      ;340.3
        shr       eax, 1                                        ;340.3
        shl       ecx, 27                                       ;340.3
        or        eax, ecx                                      ;340.3
                                ; LOE eax edx xmm0
.B1.35:                         ; Preds .B1.33 .B1.34
        and       edx, 268435455                                ;340.3
        and       eax, 268435455                                ;340.3
        mov       ecx, edx                                      ;340.3
        mov       edi, edx                                      ;340.3
        shr       ecx, 6                                        ;340.3
        mov       esi, edx                                      ;340.3
        shr       edi, 7                                        ;340.3
        and       esi, 63                                       ;340.3
        and       ecx, 3                                        ;340.3
        and       edi, 60                                       ;340.3
        or        ecx, edi                                      ;340.3
        mov       edi, edx                                      ;340.3
        shr       edi, 21                                       ;340.3
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;340.3
        mov       esi, edx                                      ;340.3
        shr       esi, 14                                       ;340.3
        and       edi, 6                                        ;340.3
        or        ebx, DWORD PTR [_des_skb+256+ecx*4]           ;340.3
        mov       ecx, edx                                      ;340.3
        shr       ecx, 13                                       ;340.3
        and       esi, 48                                       ;340.3
        and       ecx, 15                                       ;340.3
        or        ecx, esi                                      ;340.3
        mov       esi, edx                                      ;340.3
        shr       esi, 20                                       ;340.3
        and       esi, 1                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, eax                                      ;340.3
        or        ebx, DWORD PTR [_des_skb+512+ecx*4]           ;340.3
        mov       ecx, edx                                      ;340.3
        shr       ecx, 22                                       ;340.3
        and       ecx, 56                                       ;340.3
        or        esi, ecx                                      ;340.3
        mov       ecx, eax                                      ;340.3
        shr       edi, 8                                        ;340.3
        and       ecx, 63                                       ;340.3
        and       edi, 60                                       ;340.3
        mov       DWORD PTR [244+esp], eax                      ;340.3
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;340.3
        mov       esi, eax                                      ;340.3
        shr       esi, 7                                        ;340.3
        and       esi, 3                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, eax                                      ;340.3
        mov       ecx, DWORD PTR [_des_skb+1024+ecx*4]          ;340.3
        shr       edi, 15                                       ;340.3
        and       edi, 63                                       ;340.3
        or        ecx, DWORD PTR [_des_skb+1280+esi*4]          ;340.3
        mov       esi, eax                                      ;340.3
        shr       esi, 21                                       ;340.3
        shr       eax, 22                                       ;340.3
        and       esi, 15                                       ;340.3
        and       eax, 48                                       ;340.3
        or        esi, eax                                      ;340.3
        or        ecx, DWORD PTR [_des_skb+1536+edi*4]          ;340.3
        movzx     edi, bx                                       ;340.3
        shr       ebx, 16                                       ;340.3
        or        ecx, DWORD PTR [_des_skb+1792+esi*4]          ;340.3
        mov       eax, ecx                                      ;340.3
        and       ecx, -65536                                   ;340.3
        shl       eax, 16                                       ;340.3
        or        ebx, ecx                                      ;340.3
        mov       esi, DWORD PTR [224+esp]                      ;340.3
        or        eax, edi                                      ;340.3
        mov       edi, DWORD PTR [228+esp]                      ;340.3
        ror       eax, 30                                       ;340.3
        ror       ebx, 26                                       ;340.3
        mov       DWORD PTR [_ks_tbl+esi+edi], eax              ;340.3
        mov       DWORD PTR [_ks_tbl+4+esi+edi], ebx            ;340.3
        mov       eax, DWORD PTR [244+esp]                      ;340.3
        cmp       DWORD PTR [172+esp], 0                        ;340.3
        je        .B1.37        ; Prob 50%                      ;340.3
                                ; LOE rax eax edx al ah xmm0
.B1.36:                         ; Preds .B1.35
        mov       ecx, edx                                      ;340.3
        shr       ecx, 2                                        ;340.3
        shl       edx, 26                                       ;340.3
        or        ecx, edx                                      ;340.3
        mov       edx, eax                                      ;340.3
        shr       edx, 2                                        ;340.3
        shl       eax, 26                                       ;340.3
        or        edx, eax                                      ;340.3
        jmp       .B1.38        ; Prob 100%                     ;340.3
                                ; LOE edx ecx xmm0
.B1.37:                         ; Preds .B1.35
        mov       ecx, edx                                      ;340.3
        shr       ecx, 1                                        ;340.3
        shl       edx, 27                                       ;340.3
        or        ecx, edx                                      ;340.3
        mov       edx, eax                                      ;340.3
        shr       edx, 1                                        ;340.3
        shl       eax, 27                                       ;340.3
        or        edx, eax                                      ;340.3
                                ; LOE edx ecx xmm0
.B1.38:                         ; Preds .B1.36 .B1.37
        and       ecx, 268435455                                ;340.3
        and       edx, 268435455                                ;340.3
        mov       eax, ecx                                      ;340.3
        mov       edi, ecx                                      ;340.3
        shr       eax, 6                                        ;340.3
        mov       esi, ecx                                      ;340.3
        shr       edi, 7                                        ;340.3
        and       esi, 63                                       ;340.3
        and       eax, 3                                        ;340.3
        and       edi, 60                                       ;340.3
        or        eax, edi                                      ;340.3
        mov       edi, ecx                                      ;340.3
        shr       edi, 21                                       ;340.3
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;340.3
        mov       esi, ecx                                      ;340.3
        shr       esi, 14                                       ;340.3
        and       edi, 6                                        ;340.3
        or        ebx, DWORD PTR [_des_skb+256+eax*4]           ;340.3
        mov       eax, ecx                                      ;340.3
        shr       eax, 13                                       ;340.3
        and       esi, 48                                       ;340.3
        and       eax, 15                                       ;340.3
        or        eax, esi                                      ;340.3
        mov       esi, ecx                                      ;340.3
        shr       esi, 20                                       ;340.3
        and       esi, 1                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, edx                                      ;340.3
        or        ebx, DWORD PTR [_des_skb+512+eax*4]           ;340.3
        mov       eax, ecx                                      ;340.3
        shr       eax, 22                                       ;340.3
        and       eax, 56                                       ;340.3
        or        esi, eax                                      ;340.3
        mov       eax, edx                                      ;340.3
        shr       edi, 8                                        ;340.3
        and       eax, 63                                       ;340.3
        and       edi, 60                                       ;340.3
        mov       DWORD PTR [248+esp], edx                      ;340.3
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;340.3
        mov       esi, edx                                      ;340.3
        shr       esi, 7                                        ;340.3
        and       esi, 3                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, edx                                      ;340.3
        mov       eax, DWORD PTR [_des_skb+1024+eax*4]          ;340.3
        shr       edi, 15                                       ;340.3
        and       edi, 63                                       ;340.3
        or        eax, DWORD PTR [_des_skb+1280+esi*4]          ;340.3
        mov       esi, edx                                      ;340.3
        shr       esi, 21                                       ;340.3
        shr       edx, 22                                       ;340.3
        and       esi, 15                                       ;340.3
        and       edx, 48                                       ;340.3
        or        esi, edx                                      ;340.3
        or        eax, DWORD PTR [_des_skb+1536+edi*4]          ;340.3
        movzx     edi, bx                                       ;340.3
        shr       ebx, 16                                       ;340.3
        or        eax, DWORD PTR [_des_skb+1792+esi*4]          ;340.3
        mov       edx, eax                                      ;340.3
        and       eax, -65536                                   ;340.3
        shl       edx, 16                                       ;340.3
        or        ebx, eax                                      ;340.3
        mov       esi, DWORD PTR [224+esp]                      ;340.3
        or        edx, edi                                      ;340.3
        mov       edi, DWORD PTR [228+esp]                      ;340.3
        ror       edx, 30                                       ;340.3
        ror       ebx, 26                                       ;340.3
        mov       DWORD PTR [_ks_tbl+8+esi+edi], edx            ;340.3
        mov       DWORD PTR [_ks_tbl+12+esi+edi], ebx           ;340.3
        mov       edx, DWORD PTR [248+esp]                      ;340.3
        cmp       DWORD PTR [176+esp], 0                        ;340.3
        je        .B1.40        ; Prob 50%                      ;340.3
                                ; LOE rdx edx ecx dl dh xmm0
.B1.39:                         ; Preds .B1.38
        mov       ebx, ecx                                      ;340.3
        mov       eax, edx                                      ;340.3
        shr       ebx, 2                                        ;340.3
        shl       ecx, 26                                       ;340.3
        shr       eax, 2                                        ;340.3
        or        ebx, ecx                                      ;340.3
        shl       edx, 26                                       ;340.3
        or        eax, edx                                      ;340.3
        jmp       .B1.41        ; Prob 100%                     ;340.3
                                ; LOE eax ebx xmm0
.B1.40:                         ; Preds .B1.38
        mov       ebx, ecx                                      ;340.3
        mov       eax, edx                                      ;340.3
        shr       ebx, 1                                        ;340.3
        shl       ecx, 27                                       ;340.3
        shr       eax, 1                                        ;340.3
        or        ebx, ecx                                      ;340.3
        shl       edx, 27                                       ;340.3
        or        eax, edx                                      ;340.3
                                ; LOE eax ebx xmm0
.B1.41:                         ; Preds .B1.39 .B1.40
        and       ebx, 268435455                                ;340.3
        and       eax, 268435455                                ;340.3
        mov       edx, ebx                                      ;340.3
        mov       edi, ebx                                      ;340.3
        shr       edx, 6                                        ;340.3
        mov       esi, ebx                                      ;340.3
        shr       edi, 7                                        ;340.3
        and       esi, 63                                       ;340.3
        and       edx, 3                                        ;340.3
        and       edi, 60                                       ;340.3
        or        edx, edi                                      ;340.3
        mov       edi, ebx                                      ;340.3
        shr       edi, 21                                       ;340.3
        mov       ecx, DWORD PTR [_des_skb+esi*4]               ;340.3
        mov       esi, ebx                                      ;340.3
        shr       esi, 14                                       ;340.3
        and       edi, 6                                        ;340.3
        or        ecx, DWORD PTR [_des_skb+256+edx*4]           ;340.3
        mov       edx, ebx                                      ;340.3
        shr       edx, 13                                       ;340.3
        and       esi, 48                                       ;340.3
        and       edx, 15                                       ;340.3
        or        edx, esi                                      ;340.3
        mov       esi, ebx                                      ;340.3
        shr       esi, 20                                       ;340.3
        and       esi, 1                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, eax                                      ;340.3
        or        ecx, DWORD PTR [_des_skb+512+edx*4]           ;340.3
        mov       edx, ebx                                      ;340.3
        shr       edx, 22                                       ;340.3
        and       edx, 56                                       ;340.3
        or        esi, edx                                      ;340.3
        mov       edx, eax                                      ;340.3
        shr       edi, 8                                        ;340.3
        and       edx, 63                                       ;340.3
        and       edi, 60                                       ;340.3
        mov       DWORD PTR [252+esp], eax                      ;340.3
        or        ecx, DWORD PTR [_des_skb+768+esi*4]           ;340.3
        mov       esi, eax                                      ;340.3
        shr       esi, 7                                        ;340.3
        and       esi, 3                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, eax                                      ;340.3
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;340.3
        shr       edi, 15                                       ;340.3
        and       edi, 63                                       ;340.3
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;340.3
        mov       esi, eax                                      ;340.3
        shr       esi, 21                                       ;340.3
        shr       eax, 22                                       ;340.3
        and       esi, 15                                       ;340.3
        and       eax, 48                                       ;340.3
        or        esi, eax                                      ;340.3
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;340.3
        movzx     edi, cx                                       ;340.3
        shr       ecx, 16                                       ;340.3
        or        edx, DWORD PTR [_des_skb+1792+esi*4]          ;340.3
        mov       eax, edx                                      ;340.3
        and       edx, -65536                                   ;340.3
        shl       eax, 16                                       ;340.3
        or        ecx, edx                                      ;340.3
        mov       esi, DWORD PTR [224+esp]                      ;340.3
        or        eax, edi                                      ;340.3
        mov       edi, DWORD PTR [228+esp]                      ;340.3
        ror       eax, 30                                       ;340.3
        ror       ecx, 26                                       ;340.3
        mov       DWORD PTR [_ks_tbl+16+esi+edi], eax           ;340.3
        mov       DWORD PTR [_ks_tbl+20+esi+edi], ecx           ;340.3
        mov       eax, DWORD PTR [252+esp]                      ;340.3
        cmp       DWORD PTR [180+esp], 0                        ;340.3
        je        .B1.43        ; Prob 50%                      ;340.3
                                ; LOE rax eax ebx al ah xmm0
.B1.42:                         ; Preds .B1.41
        mov       ecx, ebx                                      ;340.3
        mov       edx, eax                                      ;340.3
        shr       ecx, 2                                        ;340.3
        shl       ebx, 26                                       ;340.3
        shr       edx, 2                                        ;340.3
        or        ecx, ebx                                      ;340.3
        shl       eax, 26                                       ;340.3
        or        edx, eax                                      ;340.3
        jmp       .B1.44        ; Prob 100%                     ;340.3
                                ; LOE edx ecx xmm0
.B1.43:                         ; Preds .B1.41
        mov       ecx, ebx                                      ;340.3
        mov       edx, eax                                      ;340.3
        shr       ecx, 1                                        ;340.3
        shl       ebx, 27                                       ;340.3
        shr       edx, 1                                        ;340.3
        or        ecx, ebx                                      ;340.3
        shl       eax, 27                                       ;340.3
        or        edx, eax                                      ;340.3
                                ; LOE edx ecx xmm0
.B1.44:                         ; Preds .B1.42 .B1.43
        and       ecx, 268435455                                ;340.3
        and       edx, 268435455                                ;340.3
        mov       eax, ecx                                      ;340.3
        mov       edi, ecx                                      ;340.3
        shr       eax, 6                                        ;340.3
        mov       esi, ecx                                      ;340.3
        shr       edi, 7                                        ;340.3
        and       esi, 63                                       ;340.3
        and       eax, 3                                        ;340.3
        and       edi, 60                                       ;340.3
        or        eax, edi                                      ;340.3
        mov       edi, ecx                                      ;340.3
        shr       edi, 21                                       ;340.3
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;340.3
        mov       esi, ecx                                      ;340.3
        shr       esi, 14                                       ;340.3
        and       edi, 6                                        ;340.3
        or        ebx, DWORD PTR [_des_skb+256+eax*4]           ;340.3
        mov       eax, ecx                                      ;340.3
        shr       eax, 13                                       ;340.3
        and       esi, 48                                       ;340.3
        and       eax, 15                                       ;340.3
        or        eax, esi                                      ;340.3
        mov       esi, ecx                                      ;340.3
        shr       esi, 20                                       ;340.3
        and       esi, 1                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, edx                                      ;340.3
        or        ebx, DWORD PTR [_des_skb+512+eax*4]           ;340.3
        mov       eax, ecx                                      ;340.3
        shr       eax, 22                                       ;340.3
        and       eax, 56                                       ;340.3
        or        esi, eax                                      ;340.3
        mov       eax, edx                                      ;340.3
        shr       edi, 8                                        ;340.3
        and       eax, 63                                       ;340.3
        and       edi, 60                                       ;340.3
        mov       DWORD PTR [256+esp], edx                      ;340.3
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;340.3
        mov       esi, edx                                      ;340.3
        shr       esi, 7                                        ;340.3
        and       esi, 3                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, edx                                      ;340.3
        mov       eax, DWORD PTR [_des_skb+1024+eax*4]          ;340.3
        shr       edi, 15                                       ;340.3
        and       edi, 63                                       ;340.3
        or        eax, DWORD PTR [_des_skb+1280+esi*4]          ;340.3
        mov       esi, edx                                      ;340.3
        shr       esi, 21                                       ;340.3
        shr       edx, 22                                       ;340.3
        and       esi, 15                                       ;340.3
        and       edx, 48                                       ;340.3
        or        esi, edx                                      ;340.3
        or        eax, DWORD PTR [_des_skb+1536+edi*4]          ;340.3
        movzx     edi, bx                                       ;340.3
        shr       ebx, 16                                       ;340.3
        or        eax, DWORD PTR [_des_skb+1792+esi*4]          ;340.3
        mov       edx, eax                                      ;340.3
        and       eax, -65536                                   ;340.3
        shl       edx, 16                                       ;340.3
        or        ebx, eax                                      ;340.3
        mov       esi, DWORD PTR [224+esp]                      ;340.3
        or        edx, edi                                      ;340.3
        mov       edi, DWORD PTR [228+esp]                      ;340.3
        ror       edx, 30                                       ;340.3
        ror       ebx, 26                                       ;340.3
        mov       DWORD PTR [_ks_tbl+24+esi+edi], edx           ;340.3
        mov       DWORD PTR [_ks_tbl+28+esi+edi], ebx           ;340.3
        mov       edx, DWORD PTR [256+esp]                      ;340.3
        cmp       DWORD PTR [184+esp], 0                        ;340.3
        je        .B1.46        ; Prob 50%                      ;340.3
                                ; LOE rdx edx ecx dl dh xmm0
.B1.45:                         ; Preds .B1.44
        mov       ebx, ecx                                      ;340.3
        mov       eax, edx                                      ;340.3
        shr       ebx, 2                                        ;340.3
        shl       ecx, 26                                       ;340.3
        shr       eax, 2                                        ;340.3
        or        ebx, ecx                                      ;340.3
        shl       edx, 26                                       ;340.3
        or        eax, edx                                      ;340.3
        jmp       .B1.47        ; Prob 100%                     ;340.3
                                ; LOE eax ebx xmm0
.B1.46:                         ; Preds .B1.44
        mov       ebx, ecx                                      ;340.3
        mov       eax, edx                                      ;340.3
        shr       ebx, 1                                        ;340.3
        shl       ecx, 27                                       ;340.3
        shr       eax, 1                                        ;340.3
        or        ebx, ecx                                      ;340.3
        shl       edx, 27                                       ;340.3
        or        eax, edx                                      ;340.3
                                ; LOE eax ebx xmm0
.B1.47:                         ; Preds .B1.45 .B1.46
        and       ebx, 268435455                                ;340.3
        and       eax, 268435455                                ;340.3
        mov       edx, ebx                                      ;340.3
        mov       edi, ebx                                      ;340.3
        shr       edx, 6                                        ;340.3
        mov       esi, ebx                                      ;340.3
        shr       edi, 7                                        ;340.3
        and       esi, 63                                       ;340.3
        and       edx, 3                                        ;340.3
        and       edi, 60                                       ;340.3
        or        edx, edi                                      ;340.3
        mov       edi, ebx                                      ;340.3
        shr       edi, 21                                       ;340.3
        mov       ecx, DWORD PTR [_des_skb+esi*4]               ;340.3
        mov       esi, ebx                                      ;340.3
        shr       esi, 14                                       ;340.3
        and       edi, 6                                        ;340.3
        or        ecx, DWORD PTR [_des_skb+256+edx*4]           ;340.3
        mov       edx, ebx                                      ;340.3
        shr       edx, 13                                       ;340.3
        and       esi, 48                                       ;340.3
        and       edx, 15                                       ;340.3
        or        edx, esi                                      ;340.3
        mov       esi, ebx                                      ;340.3
        shr       esi, 20                                       ;340.3
        and       esi, 1                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, eax                                      ;340.3
        or        ecx, DWORD PTR [_des_skb+512+edx*4]           ;340.3
        mov       edx, ebx                                      ;340.3
        shr       edx, 22                                       ;340.3
        and       edx, 56                                       ;340.3
        or        esi, edx                                      ;340.3
        mov       edx, eax                                      ;340.3
        shr       edi, 8                                        ;340.3
        and       edx, 63                                       ;340.3
        and       edi, 60                                       ;340.3
        mov       DWORD PTR [260+esp], eax                      ;340.3
        or        ecx, DWORD PTR [_des_skb+768+esi*4]           ;340.3
        mov       esi, eax                                      ;340.3
        shr       esi, 7                                        ;340.3
        and       esi, 3                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, eax                                      ;340.3
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;340.3
        shr       edi, 15                                       ;340.3
        and       edi, 63                                       ;340.3
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;340.3
        mov       esi, eax                                      ;340.3
        shr       esi, 21                                       ;340.3
        shr       eax, 22                                       ;340.3
        and       esi, 15                                       ;340.3
        and       eax, 48                                       ;340.3
        or        esi, eax                                      ;340.3
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;340.3
        movzx     edi, cx                                       ;340.3
        shr       ecx, 16                                       ;340.3
        or        edx, DWORD PTR [_des_skb+1792+esi*4]          ;340.3
        mov       eax, edx                                      ;340.3
        and       edx, -65536                                   ;340.3
        shl       eax, 16                                       ;340.3
        or        ecx, edx                                      ;340.3
        mov       esi, DWORD PTR [224+esp]                      ;340.3
        or        eax, edi                                      ;340.3
        mov       edi, DWORD PTR [228+esp]                      ;340.3
        ror       eax, 30                                       ;340.3
        ror       ecx, 26                                       ;340.3
        mov       DWORD PTR [_ks_tbl+32+esi+edi], eax           ;340.3
        mov       DWORD PTR [_ks_tbl+36+esi+edi], ecx           ;340.3
        mov       eax, DWORD PTR [260+esp]                      ;340.3
        cmp       DWORD PTR [188+esp], 0                        ;340.3
        je        .B1.49        ; Prob 50%                      ;340.3
                                ; LOE rax eax ebx al ah xmm0
.B1.48:                         ; Preds .B1.47
        mov       ecx, ebx                                      ;340.3
        mov       edx, eax                                      ;340.3
        shr       ecx, 2                                        ;340.3
        shl       ebx, 26                                       ;340.3
        shr       edx, 2                                        ;340.3
        or        ecx, ebx                                      ;340.3
        shl       eax, 26                                       ;340.3
        or        edx, eax                                      ;340.3
        jmp       .B1.50        ; Prob 100%                     ;340.3
                                ; LOE edx ecx xmm0
.B1.49:                         ; Preds .B1.47
        mov       ecx, ebx                                      ;340.3
        mov       edx, eax                                      ;340.3
        shr       ecx, 1                                        ;340.3
        shl       ebx, 27                                       ;340.3
        shr       edx, 1                                        ;340.3
        or        ecx, ebx                                      ;340.3
        shl       eax, 27                                       ;340.3
        or        edx, eax                                      ;340.3
                                ; LOE edx ecx xmm0
.B1.50:                         ; Preds .B1.48 .B1.49
        and       ecx, 268435455                                ;340.3
        and       edx, 268435455                                ;340.3
        mov       eax, ecx                                      ;340.3
        mov       edi, ecx                                      ;340.3
        shr       eax, 6                                        ;340.3
        mov       esi, ecx                                      ;340.3
        shr       edi, 7                                        ;340.3
        and       esi, 63                                       ;340.3
        and       eax, 3                                        ;340.3
        and       edi, 60                                       ;340.3
        or        eax, edi                                      ;340.3
        mov       edi, ecx                                      ;340.3
        shr       edi, 21                                       ;340.3
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;340.3
        mov       esi, ecx                                      ;340.3
        shr       esi, 14                                       ;340.3
        and       edi, 6                                        ;340.3
        or        ebx, DWORD PTR [_des_skb+256+eax*4]           ;340.3
        mov       eax, ecx                                      ;340.3
        shr       eax, 13                                       ;340.3
        and       esi, 48                                       ;340.3
        and       eax, 15                                       ;340.3
        or        eax, esi                                      ;340.3
        mov       esi, ecx                                      ;340.3
        shr       esi, 20                                       ;340.3
        and       esi, 1                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, edx                                      ;340.3
        or        ebx, DWORD PTR [_des_skb+512+eax*4]           ;340.3
        mov       eax, ecx                                      ;340.3
        shr       eax, 22                                       ;340.3
        and       eax, 56                                       ;340.3
        or        esi, eax                                      ;340.3
        mov       eax, edx                                      ;340.3
        shr       edi, 8                                        ;340.3
        and       eax, 63                                       ;340.3
        and       edi, 60                                       ;340.3
        mov       DWORD PTR [264+esp], edx                      ;340.3
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;340.3
        mov       esi, edx                                      ;340.3
        shr       esi, 7                                        ;340.3
        and       esi, 3                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, edx                                      ;340.3
        mov       eax, DWORD PTR [_des_skb+1024+eax*4]          ;340.3
        shr       edi, 15                                       ;340.3
        and       edi, 63                                       ;340.3
        or        eax, DWORD PTR [_des_skb+1280+esi*4]          ;340.3
        mov       esi, edx                                      ;340.3
        shr       esi, 21                                       ;340.3
        shr       edx, 22                                       ;340.3
        and       esi, 15                                       ;340.3
        and       edx, 48                                       ;340.3
        or        esi, edx                                      ;340.3
        or        eax, DWORD PTR [_des_skb+1536+edi*4]          ;340.3
        movzx     edi, bx                                       ;340.3
        shr       ebx, 16                                       ;340.3
        or        eax, DWORD PTR [_des_skb+1792+esi*4]          ;340.3
        mov       edx, eax                                      ;340.3
        and       eax, -65536                                   ;340.3
        shl       edx, 16                                       ;340.3
        or        ebx, eax                                      ;340.3
        mov       esi, DWORD PTR [224+esp]                      ;340.3
        or        edx, edi                                      ;340.3
        mov       edi, DWORD PTR [228+esp]                      ;340.3
        ror       edx, 30                                       ;340.3
        ror       ebx, 26                                       ;340.3
        mov       DWORD PTR [_ks_tbl+40+esi+edi], edx           ;340.3
        mov       DWORD PTR [_ks_tbl+44+esi+edi], ebx           ;340.3
        mov       edx, DWORD PTR [264+esp]                      ;340.3
        cmp       DWORD PTR [192+esp], 0                        ;340.3
        je        .B1.52        ; Prob 50%                      ;340.3
                                ; LOE rdx edx ecx dl dh xmm0
.B1.51:                         ; Preds .B1.50
        mov       ebx, ecx                                      ;340.3
        mov       eax, edx                                      ;340.3
        shr       ebx, 2                                        ;340.3
        shl       ecx, 26                                       ;340.3
        shr       eax, 2                                        ;340.3
        or        ebx, ecx                                      ;340.3
        shl       edx, 26                                       ;340.3
        or        eax, edx                                      ;340.3
        jmp       .B1.53        ; Prob 100%                     ;340.3
                                ; LOE eax ebx xmm0
.B1.52:                         ; Preds .B1.50
        mov       ebx, ecx                                      ;340.3
        mov       eax, edx                                      ;340.3
        shr       ebx, 1                                        ;340.3
        shl       ecx, 27                                       ;340.3
        shr       eax, 1                                        ;340.3
        or        ebx, ecx                                      ;340.3
        shl       edx, 27                                       ;340.3
        or        eax, edx                                      ;340.3
                                ; LOE eax ebx xmm0
.B1.53:                         ; Preds .B1.51 .B1.52
        and       ebx, 268435455                                ;340.3
        and       eax, 268435455                                ;340.3
        mov       edx, ebx                                      ;340.3
        mov       edi, ebx                                      ;340.3
        shr       edx, 6                                        ;340.3
        mov       esi, ebx                                      ;340.3
        shr       edi, 7                                        ;340.3
        and       esi, 63                                       ;340.3
        and       edx, 3                                        ;340.3
        and       edi, 60                                       ;340.3
        or        edx, edi                                      ;340.3
        mov       edi, ebx                                      ;340.3
        shr       edi, 21                                       ;340.3
        mov       ecx, DWORD PTR [_des_skb+esi*4]               ;340.3
        mov       esi, ebx                                      ;340.3
        shr       esi, 14                                       ;340.3
        and       edi, 6                                        ;340.3
        or        ecx, DWORD PTR [_des_skb+256+edx*4]           ;340.3
        mov       edx, ebx                                      ;340.3
        shr       edx, 13                                       ;340.3
        and       esi, 48                                       ;340.3
        and       edx, 15                                       ;340.3
        or        edx, esi                                      ;340.3
        mov       esi, ebx                                      ;340.3
        shr       esi, 20                                       ;340.3
        and       esi, 1                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, eax                                      ;340.3
        or        ecx, DWORD PTR [_des_skb+512+edx*4]           ;340.3
        mov       edx, ebx                                      ;340.3
        shr       edx, 22                                       ;340.3
        and       edx, 56                                       ;340.3
        or        esi, edx                                      ;340.3
        mov       edx, eax                                      ;340.3
        shr       edi, 8                                        ;340.3
        and       edx, 63                                       ;340.3
        and       edi, 60                                       ;340.3
        mov       DWORD PTR [268+esp], eax                      ;340.3
        or        ecx, DWORD PTR [_des_skb+768+esi*4]           ;340.3
        mov       esi, eax                                      ;340.3
        shr       esi, 7                                        ;340.3
        and       esi, 3                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, eax                                      ;340.3
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;340.3
        shr       edi, 15                                       ;340.3
        and       edi, 63                                       ;340.3
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;340.3
        mov       esi, eax                                      ;340.3
        shr       esi, 21                                       ;340.3
        shr       eax, 22                                       ;340.3
        and       esi, 15                                       ;340.3
        and       eax, 48                                       ;340.3
        or        esi, eax                                      ;340.3
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;340.3
        movzx     edi, cx                                       ;340.3
        shr       ecx, 16                                       ;340.3
        or        edx, DWORD PTR [_des_skb+1792+esi*4]          ;340.3
        mov       eax, edx                                      ;340.3
        and       edx, -65536                                   ;340.3
        shl       eax, 16                                       ;340.3
        or        ecx, edx                                      ;340.3
        mov       esi, DWORD PTR [224+esp]                      ;340.3
        or        eax, edi                                      ;340.3
        mov       edi, DWORD PTR [228+esp]                      ;340.3
        ror       eax, 30                                       ;340.3
        ror       ecx, 26                                       ;340.3
        mov       DWORD PTR [_ks_tbl+48+esi+edi], eax           ;340.3
        mov       DWORD PTR [_ks_tbl+52+esi+edi], ecx           ;340.3
        mov       eax, DWORD PTR [268+esp]                      ;340.3
        cmp       DWORD PTR [196+esp], 0                        ;340.3
        je        .B1.55        ; Prob 50%                      ;340.3
                                ; LOE rax eax ebx al ah xmm0
.B1.54:                         ; Preds .B1.53
        mov       ecx, ebx                                      ;340.3
        mov       edx, eax                                      ;340.3
        shr       ecx, 2                                        ;340.3
        shl       ebx, 26                                       ;340.3
        shr       edx, 2                                        ;340.3
        or        ecx, ebx                                      ;340.3
        shl       eax, 26                                       ;340.3
        or        edx, eax                                      ;340.3
        jmp       .B1.56        ; Prob 100%                     ;340.3
                                ; LOE edx ecx xmm0
.B1.55:                         ; Preds .B1.53
        mov       ecx, ebx                                      ;340.3
        mov       edx, eax                                      ;340.3
        shr       ecx, 1                                        ;340.3
        shl       ebx, 27                                       ;340.3
        shr       edx, 1                                        ;340.3
        or        ecx, ebx                                      ;340.3
        shl       eax, 27                                       ;340.3
        or        edx, eax                                      ;340.3
                                ; LOE edx ecx xmm0
.B1.56:                         ; Preds .B1.54 .B1.55
        and       ecx, 268435455                                ;340.3
        and       edx, 268435455                                ;340.3
        mov       eax, ecx                                      ;340.3
        mov       edi, ecx                                      ;340.3
        shr       eax, 6                                        ;340.3
        mov       esi, ecx                                      ;340.3
        shr       edi, 7                                        ;340.3
        and       esi, 63                                       ;340.3
        and       eax, 3                                        ;340.3
        and       edi, 60                                       ;340.3
        or        eax, edi                                      ;340.3
        mov       edi, ecx                                      ;340.3
        shr       edi, 21                                       ;340.3
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;340.3
        mov       esi, ecx                                      ;340.3
        shr       esi, 14                                       ;340.3
        and       edi, 6                                        ;340.3
        or        ebx, DWORD PTR [_des_skb+256+eax*4]           ;340.3
        mov       eax, ecx                                      ;340.3
        shr       eax, 13                                       ;340.3
        and       esi, 48                                       ;340.3
        and       eax, 15                                       ;340.3
        or        eax, esi                                      ;340.3
        mov       esi, ecx                                      ;340.3
        shr       esi, 20                                       ;340.3
        and       esi, 1                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, edx                                      ;340.3
        or        ebx, DWORD PTR [_des_skb+512+eax*4]           ;340.3
        mov       eax, ecx                                      ;340.3
        shr       eax, 22                                       ;340.3
        and       eax, 56                                       ;340.3
        or        esi, eax                                      ;340.3
        mov       eax, edx                                      ;340.3
        shr       edi, 8                                        ;340.3
        and       eax, 63                                       ;340.3
        and       edi, 60                                       ;340.3
        mov       DWORD PTR [272+esp], edx                      ;340.3
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;340.3
        mov       esi, edx                                      ;340.3
        shr       esi, 7                                        ;340.3
        and       esi, 3                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, edx                                      ;340.3
        mov       eax, DWORD PTR [_des_skb+1024+eax*4]          ;340.3
        shr       edi, 15                                       ;340.3
        and       edi, 63                                       ;340.3
        or        eax, DWORD PTR [_des_skb+1280+esi*4]          ;340.3
        mov       esi, edx                                      ;340.3
        shr       esi, 21                                       ;340.3
        shr       edx, 22                                       ;340.3
        and       esi, 15                                       ;340.3
        and       edx, 48                                       ;340.3
        or        esi, edx                                      ;340.3
        or        eax, DWORD PTR [_des_skb+1536+edi*4]          ;340.3
        movzx     edi, bx                                       ;340.3
        shr       ebx, 16                                       ;340.3
        or        eax, DWORD PTR [_des_skb+1792+esi*4]          ;340.3
        mov       edx, eax                                      ;340.3
        and       eax, -65536                                   ;340.3
        shl       edx, 16                                       ;340.3
        or        ebx, eax                                      ;340.3
        mov       esi, DWORD PTR [224+esp]                      ;340.3
        or        edx, edi                                      ;340.3
        mov       edi, DWORD PTR [228+esp]                      ;340.3
        ror       edx, 30                                       ;340.3
        ror       ebx, 26                                       ;340.3
        mov       DWORD PTR [_ks_tbl+56+esi+edi], edx           ;340.3
        mov       DWORD PTR [_ks_tbl+60+esi+edi], ebx           ;340.3
        mov       edx, DWORD PTR [272+esp]                      ;340.3
        cmp       DWORD PTR [200+esp], 0                        ;340.3
        je        .B1.58        ; Prob 50%                      ;340.3
                                ; LOE rdx edx ecx dl dh xmm0
.B1.57:                         ; Preds .B1.56
        mov       ebx, ecx                                      ;340.3
        mov       eax, edx                                      ;340.3
        shr       ebx, 2                                        ;340.3
        shl       ecx, 26                                       ;340.3
        shr       eax, 2                                        ;340.3
        or        ebx, ecx                                      ;340.3
        shl       edx, 26                                       ;340.3
        or        eax, edx                                      ;340.3
        jmp       .B1.59        ; Prob 100%                     ;340.3
                                ; LOE eax ebx xmm0
.B1.58:                         ; Preds .B1.56
        mov       ebx, ecx                                      ;340.3
        mov       eax, edx                                      ;340.3
        shr       ebx, 1                                        ;340.3
        shl       ecx, 27                                       ;340.3
        shr       eax, 1                                        ;340.3
        or        ebx, ecx                                      ;340.3
        shl       edx, 27                                       ;340.3
        or        eax, edx                                      ;340.3
                                ; LOE eax ebx xmm0
.B1.59:                         ; Preds .B1.57 .B1.58
        and       ebx, 268435455                                ;340.3
        and       eax, 268435455                                ;340.3
        mov       edx, ebx                                      ;340.3
        mov       edi, ebx                                      ;340.3
        shr       edx, 6                                        ;340.3
        mov       esi, ebx                                      ;340.3
        shr       edi, 7                                        ;340.3
        and       esi, 63                                       ;340.3
        and       edx, 3                                        ;340.3
        and       edi, 60                                       ;340.3
        or        edx, edi                                      ;340.3
        mov       edi, ebx                                      ;340.3
        shr       edi, 21                                       ;340.3
        mov       ecx, DWORD PTR [_des_skb+esi*4]               ;340.3
        mov       esi, ebx                                      ;340.3
        shr       esi, 14                                       ;340.3
        and       edi, 6                                        ;340.3
        or        ecx, DWORD PTR [_des_skb+256+edx*4]           ;340.3
        mov       edx, ebx                                      ;340.3
        shr       edx, 13                                       ;340.3
        and       esi, 48                                       ;340.3
        and       edx, 15                                       ;340.3
        or        edx, esi                                      ;340.3
        mov       esi, ebx                                      ;340.3
        shr       esi, 20                                       ;340.3
        and       esi, 1                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, eax                                      ;340.3
        or        ecx, DWORD PTR [_des_skb+512+edx*4]           ;340.3
        mov       edx, ebx                                      ;340.3
        shr       edx, 22                                       ;340.3
        and       edx, 56                                       ;340.3
        or        esi, edx                                      ;340.3
        mov       edx, eax                                      ;340.3
        shr       edi, 8                                        ;340.3
        and       edx, 63                                       ;340.3
        and       edi, 60                                       ;340.3
        mov       DWORD PTR [276+esp], eax                      ;340.3
        or        ecx, DWORD PTR [_des_skb+768+esi*4]           ;340.3
        mov       esi, eax                                      ;340.3
        shr       esi, 7                                        ;340.3
        and       esi, 3                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, eax                                      ;340.3
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;340.3
        shr       edi, 15                                       ;340.3
        and       edi, 63                                       ;340.3
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;340.3
        mov       esi, eax                                      ;340.3
        shr       esi, 21                                       ;340.3
        shr       eax, 22                                       ;340.3
        and       esi, 15                                       ;340.3
        and       eax, 48                                       ;340.3
        or        esi, eax                                      ;340.3
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;340.3
        movzx     edi, cx                                       ;340.3
        shr       ecx, 16                                       ;340.3
        or        edx, DWORD PTR [_des_skb+1792+esi*4]          ;340.3
        mov       eax, edx                                      ;340.3
        and       edx, -65536                                   ;340.3
        shl       eax, 16                                       ;340.3
        or        ecx, edx                                      ;340.3
        mov       esi, DWORD PTR [224+esp]                      ;340.3
        or        eax, edi                                      ;340.3
        mov       edi, DWORD PTR [228+esp]                      ;340.3
        ror       eax, 30                                       ;340.3
        ror       ecx, 26                                       ;340.3
        mov       DWORD PTR [_ks_tbl+64+esi+edi], eax           ;340.3
        mov       DWORD PTR [_ks_tbl+68+esi+edi], ecx           ;340.3
        mov       eax, DWORD PTR [276+esp]                      ;340.3
        cmp       DWORD PTR [208+esp], 0                        ;340.3
        je        .B1.61        ; Prob 50%                      ;340.3
                                ; LOE rax eax ebx al ah xmm0
.B1.60:                         ; Preds .B1.59
        mov       ecx, ebx                                      ;340.3
        mov       edx, eax                                      ;340.3
        shr       ecx, 2                                        ;340.3
        shl       ebx, 26                                       ;340.3
        shr       edx, 2                                        ;340.3
        or        ecx, ebx                                      ;340.3
        shl       eax, 26                                       ;340.3
        or        edx, eax                                      ;340.3
        jmp       .B1.62        ; Prob 100%                     ;340.3
                                ; LOE edx ecx xmm0
.B1.61:                         ; Preds .B1.59
        mov       ecx, ebx                                      ;340.3
        mov       edx, eax                                      ;340.3
        shr       ecx, 1                                        ;340.3
        shl       ebx, 27                                       ;340.3
        shr       edx, 1                                        ;340.3
        or        ecx, ebx                                      ;340.3
        shl       eax, 27                                       ;340.3
        or        edx, eax                                      ;340.3
                                ; LOE edx ecx xmm0
.B1.62:                         ; Preds .B1.60 .B1.61
        and       ecx, 268435455                                ;340.3
        and       edx, 268435455                                ;340.3
        mov       eax, ecx                                      ;340.3
        mov       edi, ecx                                      ;340.3
        shr       eax, 6                                        ;340.3
        mov       esi, ecx                                      ;340.3
        shr       edi, 7                                        ;340.3
        and       esi, 63                                       ;340.3
        and       eax, 3                                        ;340.3
        and       edi, 60                                       ;340.3
        or        eax, edi                                      ;340.3
        mov       edi, ecx                                      ;340.3
        shr       edi, 21                                       ;340.3
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;340.3
        mov       esi, ecx                                      ;340.3
        shr       esi, 14                                       ;340.3
        and       edi, 6                                        ;340.3
        or        ebx, DWORD PTR [_des_skb+256+eax*4]           ;340.3
        mov       eax, ecx                                      ;340.3
        shr       eax, 13                                       ;340.3
        and       esi, 48                                       ;340.3
        and       eax, 15                                       ;340.3
        or        eax, esi                                      ;340.3
        mov       esi, ecx                                      ;340.3
        shr       esi, 20                                       ;340.3
        and       esi, 1                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, edx                                      ;340.3
        or        ebx, DWORD PTR [_des_skb+512+eax*4]           ;340.3
        mov       eax, ecx                                      ;340.3
        shr       eax, 22                                       ;340.3
        and       eax, 56                                       ;340.3
        or        esi, eax                                      ;340.3
        mov       eax, edx                                      ;340.3
        shr       edi, 8                                        ;340.3
        and       eax, 63                                       ;340.3
        and       edi, 60                                       ;340.3
        mov       DWORD PTR [280+esp], edx                      ;340.3
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;340.3
        mov       esi, edx                                      ;340.3
        shr       esi, 7                                        ;340.3
        and       esi, 3                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, edx                                      ;340.3
        mov       eax, DWORD PTR [_des_skb+1024+eax*4]          ;340.3
        shr       edi, 15                                       ;340.3
        and       edi, 63                                       ;340.3
        or        eax, DWORD PTR [_des_skb+1280+esi*4]          ;340.3
        mov       esi, edx                                      ;340.3
        shr       esi, 21                                       ;340.3
        shr       edx, 22                                       ;340.3
        and       esi, 15                                       ;340.3
        and       edx, 48                                       ;340.3
        or        esi, edx                                      ;340.3
        or        eax, DWORD PTR [_des_skb+1536+edi*4]          ;340.3
        movzx     edi, bx                                       ;340.3
        shr       ebx, 16                                       ;340.3
        or        eax, DWORD PTR [_des_skb+1792+esi*4]          ;340.3
        mov       edx, eax                                      ;340.3
        and       eax, -65536                                   ;340.3
        shl       edx, 16                                       ;340.3
        or        ebx, eax                                      ;340.3
        mov       esi, DWORD PTR [224+esp]                      ;340.3
        or        edx, edi                                      ;340.3
        mov       edi, DWORD PTR [228+esp]                      ;340.3
        ror       edx, 30                                       ;340.3
        ror       ebx, 26                                       ;340.3
        mov       DWORD PTR [_ks_tbl+72+esi+edi], edx           ;340.3
        mov       DWORD PTR [_ks_tbl+76+esi+edi], ebx           ;340.3
        mov       edx, DWORD PTR [280+esp]                      ;340.3
        cmp       DWORD PTR [220+esp], 0                        ;340.3
        je        .B1.64        ; Prob 50%                      ;340.3
                                ; LOE rdx edx ecx dl dh xmm0
.B1.63:                         ; Preds .B1.62
        mov       ebx, ecx                                      ;340.3
        mov       eax, edx                                      ;340.3
        shr       ebx, 2                                        ;340.3
        shl       ecx, 26                                       ;340.3
        shr       eax, 2                                        ;340.3
        or        ebx, ecx                                      ;340.3
        shl       edx, 26                                       ;340.3
        or        eax, edx                                      ;340.3
        jmp       .B1.65        ; Prob 100%                     ;340.3
                                ; LOE eax ebx xmm0
.B1.64:                         ; Preds .B1.62
        mov       ebx, ecx                                      ;340.3
        mov       eax, edx                                      ;340.3
        shr       ebx, 1                                        ;340.3
        shl       ecx, 27                                       ;340.3
        shr       eax, 1                                        ;340.3
        or        ebx, ecx                                      ;340.3
        shl       edx, 27                                       ;340.3
        or        eax, edx                                      ;340.3
                                ; LOE eax ebx xmm0
.B1.65:                         ; Preds .B1.63 .B1.64
        and       ebx, 268435455                                ;340.3
        and       eax, 268435455                                ;340.3
        mov       edx, ebx                                      ;340.3
        mov       edi, ebx                                      ;340.3
        shr       edx, 6                                        ;340.3
        mov       esi, ebx                                      ;340.3
        shr       edi, 7                                        ;340.3
        and       esi, 63                                       ;340.3
        and       edx, 3                                        ;340.3
        and       edi, 60                                       ;340.3
        or        edx, edi                                      ;340.3
        mov       edi, ebx                                      ;340.3
        shr       edi, 21                                       ;340.3
        mov       ecx, DWORD PTR [_des_skb+esi*4]               ;340.3
        mov       esi, ebx                                      ;340.3
        shr       esi, 14                                       ;340.3
        and       edi, 6                                        ;340.3
        or        ecx, DWORD PTR [_des_skb+256+edx*4]           ;340.3
        mov       edx, ebx                                      ;340.3
        shr       edx, 13                                       ;340.3
        and       esi, 48                                       ;340.3
        and       edx, 15                                       ;340.3
        or        edx, esi                                      ;340.3
        mov       esi, ebx                                      ;340.3
        shr       esi, 20                                       ;340.3
        and       esi, 1                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, eax                                      ;340.3
        or        ecx, DWORD PTR [_des_skb+512+edx*4]           ;340.3
        mov       edx, ebx                                      ;340.3
        shr       edx, 22                                       ;340.3
        and       edx, 56                                       ;340.3
        or        esi, edx                                      ;340.3
        mov       edx, eax                                      ;340.3
        shr       edi, 8                                        ;340.3
        and       edx, 63                                       ;340.3
        and       edi, 60                                       ;340.3
        mov       DWORD PTR [284+esp], eax                      ;340.3
        or        ecx, DWORD PTR [_des_skb+768+esi*4]           ;340.3
        mov       esi, eax                                      ;340.3
        shr       esi, 7                                        ;340.3
        and       esi, 3                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, eax                                      ;340.3
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;340.3
        shr       edi, 15                                       ;340.3
        and       edi, 63                                       ;340.3
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;340.3
        mov       esi, eax                                      ;340.3
        shr       esi, 21                                       ;340.3
        shr       eax, 22                                       ;340.3
        and       esi, 15                                       ;340.3
        and       eax, 48                                       ;340.3
        or        esi, eax                                      ;340.3
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;340.3
        movzx     edi, cx                                       ;340.3
        shr       ecx, 16                                       ;340.3
        or        edx, DWORD PTR [_des_skb+1792+esi*4]          ;340.3
        mov       eax, edx                                      ;340.3
        and       edx, -65536                                   ;340.3
        shl       eax, 16                                       ;340.3
        or        ecx, edx                                      ;340.3
        mov       esi, DWORD PTR [224+esp]                      ;340.3
        or        eax, edi                                      ;340.3
        mov       edi, DWORD PTR [228+esp]                      ;340.3
        ror       eax, 30                                       ;340.3
        ror       ecx, 26                                       ;340.3
        mov       DWORD PTR [_ks_tbl+80+esi+edi], eax           ;340.3
        mov       DWORD PTR [_ks_tbl+84+esi+edi], ecx           ;340.3
        mov       eax, DWORD PTR [284+esp]                      ;340.3
        cmp       DWORD PTR [216+esp], 0                        ;340.3
        je        .B1.67        ; Prob 50%                      ;340.3
                                ; LOE rax eax ebx al ah xmm0
.B1.66:                         ; Preds .B1.65
        mov       ecx, ebx                                      ;340.3
        mov       edx, eax                                      ;340.3
        shr       ecx, 2                                        ;340.3
        shl       ebx, 26                                       ;340.3
        shr       edx, 2                                        ;340.3
        or        ecx, ebx                                      ;340.3
        shl       eax, 26                                       ;340.3
        or        edx, eax                                      ;340.3
        jmp       .B1.68        ; Prob 100%                     ;340.3
                                ; LOE edx ecx xmm0
.B1.67:                         ; Preds .B1.65
        mov       ecx, ebx                                      ;340.3
        mov       edx, eax                                      ;340.3
        shr       ecx, 1                                        ;340.3
        shl       ebx, 27                                       ;340.3
        shr       edx, 1                                        ;340.3
        or        ecx, ebx                                      ;340.3
        shl       eax, 27                                       ;340.3
        or        edx, eax                                      ;340.3
                                ; LOE edx ecx xmm0
.B1.68:                         ; Preds .B1.66 .B1.67
        and       ecx, 268435455                                ;340.3
        and       edx, 268435455                                ;340.3
        mov       eax, ecx                                      ;340.3
        mov       edi, ecx                                      ;340.3
        shr       eax, 6                                        ;340.3
        mov       esi, ecx                                      ;340.3
        shr       edi, 7                                        ;340.3
        and       esi, 63                                       ;340.3
        and       eax, 3                                        ;340.3
        and       edi, 60                                       ;340.3
        or        eax, edi                                      ;340.3
        mov       edi, ecx                                      ;340.3
        shr       edi, 21                                       ;340.3
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;340.3
        mov       esi, ecx                                      ;340.3
        shr       esi, 14                                       ;340.3
        and       edi, 6                                        ;340.3
        or        ebx, DWORD PTR [_des_skb+256+eax*4]           ;340.3
        mov       eax, ecx                                      ;340.3
        shr       eax, 13                                       ;340.3
        and       esi, 48                                       ;340.3
        and       eax, 15                                       ;340.3
        or        eax, esi                                      ;340.3
        mov       esi, ecx                                      ;340.3
        shr       esi, 20                                       ;340.3
        and       esi, 1                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, edx                                      ;340.3
        or        ebx, DWORD PTR [_des_skb+512+eax*4]           ;340.3
        mov       eax, ecx                                      ;340.3
        shr       eax, 22                                       ;340.3
        and       eax, 56                                       ;340.3
        or        esi, eax                                      ;340.3
        mov       eax, edx                                      ;340.3
        shr       edi, 8                                        ;340.3
        and       eax, 63                                       ;340.3
        and       edi, 60                                       ;340.3
        mov       DWORD PTR [288+esp], edx                      ;340.3
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;340.3
        mov       esi, edx                                      ;340.3
        shr       esi, 7                                        ;340.3
        and       esi, 3                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, edx                                      ;340.3
        mov       eax, DWORD PTR [_des_skb+1024+eax*4]          ;340.3
        shr       edi, 15                                       ;340.3
        and       edi, 63                                       ;340.3
        or        eax, DWORD PTR [_des_skb+1280+esi*4]          ;340.3
        mov       esi, edx                                      ;340.3
        shr       esi, 21                                       ;340.3
        shr       edx, 22                                       ;340.3
        and       esi, 15                                       ;340.3
        and       edx, 48                                       ;340.3
        or        esi, edx                                      ;340.3
        or        eax, DWORD PTR [_des_skb+1536+edi*4]          ;340.3
        movzx     edi, bx                                       ;340.3
        shr       ebx, 16                                       ;340.3
        or        eax, DWORD PTR [_des_skb+1792+esi*4]          ;340.3
        mov       edx, eax                                      ;340.3
        and       eax, -65536                                   ;340.3
        shl       edx, 16                                       ;340.3
        or        ebx, eax                                      ;340.3
        mov       esi, DWORD PTR [224+esp]                      ;340.3
        or        edx, edi                                      ;340.3
        mov       edi, DWORD PTR [228+esp]                      ;340.3
        ror       edx, 30                                       ;340.3
        ror       ebx, 26                                       ;340.3
        mov       DWORD PTR [_ks_tbl+88+esi+edi], edx           ;340.3
        mov       DWORD PTR [_ks_tbl+92+esi+edi], ebx           ;340.3
        mov       edx, DWORD PTR [288+esp]                      ;340.3
        cmp       DWORD PTR [204+esp], 0                        ;340.3
        je        .B1.70        ; Prob 50%                      ;340.3
                                ; LOE rdx edx ecx dl dh xmm0
.B1.69:                         ; Preds .B1.68
        mov       ebx, ecx                                      ;340.3
        mov       eax, edx                                      ;340.3
        shr       ebx, 2                                        ;340.3
        shl       ecx, 26                                       ;340.3
        shr       eax, 2                                        ;340.3
        or        ebx, ecx                                      ;340.3
        shl       edx, 26                                       ;340.3
        or        eax, edx                                      ;340.3
        jmp       .B1.71        ; Prob 100%                     ;340.3
                                ; LOE eax ebx xmm0
.B1.70:                         ; Preds .B1.68
        mov       ebx, ecx                                      ;340.3
        mov       eax, edx                                      ;340.3
        shr       ebx, 1                                        ;340.3
        shl       ecx, 27                                       ;340.3
        shr       eax, 1                                        ;340.3
        or        ebx, ecx                                      ;340.3
        shl       edx, 27                                       ;340.3
        or        eax, edx                                      ;340.3
                                ; LOE eax ebx xmm0
.B1.71:                         ; Preds .B1.69 .B1.70
        and       ebx, 268435455                                ;340.3
        and       eax, 268435455                                ;340.3
        mov       edx, ebx                                      ;340.3
        mov       edi, ebx                                      ;340.3
        shr       edx, 6                                        ;340.3
        mov       esi, ebx                                      ;340.3
        shr       edi, 7                                        ;340.3
        and       esi, 63                                       ;340.3
        and       edx, 3                                        ;340.3
        and       edi, 60                                       ;340.3
        or        edx, edi                                      ;340.3
        mov       edi, ebx                                      ;340.3
        shr       edi, 21                                       ;340.3
        mov       ecx, DWORD PTR [_des_skb+esi*4]               ;340.3
        mov       esi, ebx                                      ;340.3
        shr       esi, 14                                       ;340.3
        and       edi, 6                                        ;340.3
        or        ecx, DWORD PTR [_des_skb+256+edx*4]           ;340.3
        mov       edx, ebx                                      ;340.3
        shr       edx, 13                                       ;340.3
        and       esi, 48                                       ;340.3
        and       edx, 15                                       ;340.3
        or        edx, esi                                      ;340.3
        mov       esi, ebx                                      ;340.3
        shr       esi, 20                                       ;340.3
        and       esi, 1                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, eax                                      ;340.3
        or        ecx, DWORD PTR [_des_skb+512+edx*4]           ;340.3
        mov       edx, ebx                                      ;340.3
        shr       edx, 22                                       ;340.3
        and       edx, 56                                       ;340.3
        or        esi, edx                                      ;340.3
        mov       edx, eax                                      ;340.3
        shr       edi, 8                                        ;340.3
        and       edx, 63                                       ;340.3
        and       edi, 60                                       ;340.3
        mov       DWORD PTR [292+esp], eax                      ;340.3
        or        ecx, DWORD PTR [_des_skb+768+esi*4]           ;340.3
        mov       esi, eax                                      ;340.3
        shr       esi, 7                                        ;340.3
        and       esi, 3                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, eax                                      ;340.3
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;340.3
        shr       edi, 15                                       ;340.3
        and       edi, 63                                       ;340.3
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;340.3
        mov       esi, eax                                      ;340.3
        shr       esi, 21                                       ;340.3
        shr       eax, 22                                       ;340.3
        and       esi, 15                                       ;340.3
        and       eax, 48                                       ;340.3
        or        esi, eax                                      ;340.3
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;340.3
        movzx     edi, cx                                       ;340.3
        shr       ecx, 16                                       ;340.3
        or        edx, DWORD PTR [_des_skb+1792+esi*4]          ;340.3
        mov       eax, edx                                      ;340.3
        and       edx, -65536                                   ;340.3
        shl       eax, 16                                       ;340.3
        or        ecx, edx                                      ;340.3
        mov       esi, DWORD PTR [224+esp]                      ;340.3
        or        eax, edi                                      ;340.3
        mov       edi, DWORD PTR [228+esp]                      ;340.3
        ror       eax, 30                                       ;340.3
        ror       ecx, 26                                       ;340.3
        mov       DWORD PTR [_ks_tbl+96+esi+edi], eax           ;340.3
        mov       DWORD PTR [_ks_tbl+100+esi+edi], ecx          ;340.3
        mov       eax, DWORD PTR [292+esp]                      ;340.3
        cmp       DWORD PTR [156+esp], 0                        ;340.3
        je        .B1.73        ; Prob 50%                      ;340.3
                                ; LOE rax eax ebx al ah xmm0
.B1.72:                         ; Preds .B1.71
        mov       ecx, ebx                                      ;340.3
        mov       edx, eax                                      ;340.3
        shr       ecx, 2                                        ;340.3
        shl       ebx, 26                                       ;340.3
        shr       edx, 2                                        ;340.3
        or        ecx, ebx                                      ;340.3
        shl       eax, 26                                       ;340.3
        or        edx, eax                                      ;340.3
        jmp       .B1.74        ; Prob 100%                     ;340.3
                                ; LOE edx ecx xmm0
.B1.73:                         ; Preds .B1.71
        mov       ecx, ebx                                      ;340.3
        mov       edx, eax                                      ;340.3
        shr       ecx, 1                                        ;340.3
        shl       ebx, 27                                       ;340.3
        shr       edx, 1                                        ;340.3
        or        ecx, ebx                                      ;340.3
        shl       eax, 27                                       ;340.3
        or        edx, eax                                      ;340.3
                                ; LOE edx ecx xmm0
.B1.74:                         ; Preds .B1.72 .B1.73
        and       ecx, 268435455                                ;340.3
        and       edx, 268435455                                ;340.3
        mov       eax, ecx                                      ;340.3
        mov       edi, ecx                                      ;340.3
        shr       eax, 6                                        ;340.3
        mov       esi, ecx                                      ;340.3
        shr       edi, 7                                        ;340.3
        and       esi, 63                                       ;340.3
        and       eax, 3                                        ;340.3
        and       edi, 60                                       ;340.3
        or        eax, edi                                      ;340.3
        mov       edi, ecx                                      ;340.3
        shr       edi, 21                                       ;340.3
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;340.3
        mov       esi, ecx                                      ;340.3
        shr       esi, 14                                       ;340.3
        and       edi, 6                                        ;340.3
        or        ebx, DWORD PTR [_des_skb+256+eax*4]           ;340.3
        mov       eax, ecx                                      ;340.3
        shr       eax, 13                                       ;340.3
        and       esi, 48                                       ;340.3
        and       eax, 15                                       ;340.3
        or        eax, esi                                      ;340.3
        mov       esi, ecx                                      ;340.3
        shr       esi, 20                                       ;340.3
        and       esi, 1                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, edx                                      ;340.3
        or        ebx, DWORD PTR [_des_skb+512+eax*4]           ;340.3
        mov       eax, ecx                                      ;340.3
        shr       eax, 22                                       ;340.3
        and       eax, 56                                       ;340.3
        or        esi, eax                                      ;340.3
        mov       eax, edx                                      ;340.3
        shr       edi, 8                                        ;340.3
        and       eax, 63                                       ;340.3
        and       edi, 60                                       ;340.3
        mov       DWORD PTR [296+esp], edx                      ;340.3
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;340.3
        mov       esi, edx                                      ;340.3
        shr       esi, 7                                        ;340.3
        and       esi, 3                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, edx                                      ;340.3
        mov       eax, DWORD PTR [_des_skb+1024+eax*4]          ;340.3
        shr       edi, 15                                       ;340.3
        and       edi, 63                                       ;340.3
        or        eax, DWORD PTR [_des_skb+1280+esi*4]          ;340.3
        mov       esi, edx                                      ;340.3
        shr       esi, 21                                       ;340.3
        shr       edx, 22                                       ;340.3
        and       esi, 15                                       ;340.3
        and       edx, 48                                       ;340.3
        or        esi, edx                                      ;340.3
        or        eax, DWORD PTR [_des_skb+1536+edi*4]          ;340.3
        movzx     edi, bx                                       ;340.3
        shr       ebx, 16                                       ;340.3
        or        eax, DWORD PTR [_des_skb+1792+esi*4]          ;340.3
        mov       edx, eax                                      ;340.3
        and       eax, -65536                                   ;340.3
        shl       edx, 16                                       ;340.3
        or        ebx, eax                                      ;340.3
        mov       esi, DWORD PTR [224+esp]                      ;340.3
        or        edx, edi                                      ;340.3
        mov       edi, DWORD PTR [228+esp]                      ;340.3
        ror       edx, 30                                       ;340.3
        ror       ebx, 26                                       ;340.3
        mov       DWORD PTR [_ks_tbl+104+esi+edi], edx          ;340.3
        mov       DWORD PTR [_ks_tbl+108+esi+edi], ebx          ;340.3
        mov       edx, DWORD PTR [296+esp]                      ;340.3
        cmp       DWORD PTR [140+esp], 0                        ;340.3
        je        .B1.76        ; Prob 50%                      ;340.3
                                ; LOE rdx edx ecx dl dh xmm0
.B1.75:                         ; Preds .B1.74
        mov       ebx, ecx                                      ;340.3
        mov       eax, edx                                      ;340.3
        shr       ebx, 2                                        ;340.3
        shl       ecx, 26                                       ;340.3
        shr       eax, 2                                        ;340.3
        or        ebx, ecx                                      ;340.3
        shl       edx, 26                                       ;340.3
        or        eax, edx                                      ;340.3
        jmp       .B1.77        ; Prob 100%                     ;340.3
                                ; LOE eax ebx xmm0
.B1.76:                         ; Preds .B1.74
        mov       ebx, ecx                                      ;340.3
        mov       eax, edx                                      ;340.3
        shr       ebx, 1                                        ;340.3
        shl       ecx, 27                                       ;340.3
        shr       eax, 1                                        ;340.3
        or        ebx, ecx                                      ;340.3
        shl       edx, 27                                       ;340.3
        or        eax, edx                                      ;340.3
                                ; LOE eax ebx xmm0
.B1.77:                         ; Preds .B1.75 .B1.76
        and       ebx, 268435455                                ;340.3
        and       eax, 268435455                                ;340.3
        mov       edx, ebx                                      ;340.3
        mov       edi, ebx                                      ;340.3
        shr       edx, 6                                        ;340.3
        mov       esi, ebx                                      ;340.3
        shr       edi, 7                                        ;340.3
        and       esi, 63                                       ;340.3
        and       edx, 3                                        ;340.3
        and       edi, 60                                       ;340.3
        or        edx, edi                                      ;340.3
        mov       edi, ebx                                      ;340.3
        shr       edi, 21                                       ;340.3
        mov       ecx, DWORD PTR [_des_skb+esi*4]               ;340.3
        mov       esi, ebx                                      ;340.3
        shr       esi, 14                                       ;340.3
        and       edi, 6                                        ;340.3
        or        ecx, DWORD PTR [_des_skb+256+edx*4]           ;340.3
        mov       edx, ebx                                      ;340.3
        shr       edx, 13                                       ;340.3
        and       esi, 48                                       ;340.3
        and       edx, 15                                       ;340.3
        or        edx, esi                                      ;340.3
        mov       esi, ebx                                      ;340.3
        shr       esi, 20                                       ;340.3
        and       esi, 1                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, eax                                      ;340.3
        or        ecx, DWORD PTR [_des_skb+512+edx*4]           ;340.3
        mov       edx, ebx                                      ;340.3
        shr       edx, 22                                       ;340.3
        and       edx, 56                                       ;340.3
        or        esi, edx                                      ;340.3
        mov       edx, eax                                      ;340.3
        shr       edi, 8                                        ;340.3
        and       edx, 63                                       ;340.3
        and       edi, 60                                       ;340.3
        mov       DWORD PTR [300+esp], eax                      ;340.3
        or        ecx, DWORD PTR [_des_skb+768+esi*4]           ;340.3
        mov       esi, eax                                      ;340.3
        shr       esi, 7                                        ;340.3
        and       esi, 3                                        ;340.3
        or        esi, edi                                      ;340.3
        mov       edi, eax                                      ;340.3
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;340.3
        shr       edi, 15                                       ;340.3
        and       edi, 63                                       ;340.3
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;340.3
        mov       esi, eax                                      ;340.3
        shr       esi, 21                                       ;340.3
        shr       eax, 22                                       ;340.3
        and       esi, 15                                       ;340.3
        and       eax, 48                                       ;340.3
        or        esi, eax                                      ;340.3
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;340.3
        movzx     edi, cx                                       ;340.3
        shr       ecx, 16                                       ;340.3
        or        edx, DWORD PTR [_des_skb+1792+esi*4]          ;340.3
        mov       eax, edx                                      ;340.3
        and       edx, -65536                                   ;340.3
        shl       eax, 16                                       ;340.3
        or        ecx, edx                                      ;340.3
        mov       esi, DWORD PTR [224+esp]                      ;340.3
        or        eax, edi                                      ;340.3
        mov       edi, DWORD PTR [228+esp]                      ;340.3
        ror       eax, 30                                       ;340.3
        ror       ecx, 26                                       ;340.3
        mov       DWORD PTR [_ks_tbl+112+esi+edi], eax          ;340.3
        mov       DWORD PTR [_ks_tbl+116+esi+edi], ecx          ;340.3
        mov       eax, DWORD PTR [300+esp]                      ;340.3
        cmp       DWORD PTR [136+esp], 0                        ;340.3
        je        .B1.79        ; Prob 50%                      ;340.3
                                ; LOE rax eax ebx al ah xmm0
.B1.78:                         ; Preds .B1.77
        mov       esi, ebx                                      ;340.3
        mov       ecx, eax                                      ;340.3
        shr       esi, 2                                        ;340.3
        shl       ebx, 26                                       ;340.3
        shr       ecx, 2                                        ;340.3
        or        esi, ebx                                      ;340.3
        shl       eax, 26                                       ;340.3
        or        ecx, eax                                      ;340.3
        jmp       .B1.80        ; Prob 100%                     ;340.3
                                ; LOE ecx esi xmm0
.B1.79:                         ; Preds .B1.77
        mov       esi, ebx                                      ;340.3
        mov       ecx, eax                                      ;340.3
        shr       esi, 1                                        ;340.3
        shl       ebx, 27                                       ;340.3
        shr       ecx, 1                                        ;340.3
        or        esi, ebx                                      ;340.3
        shl       eax, 27                                       ;340.3
        or        ecx, eax                                      ;340.3
                                ; LOE ecx esi xmm0
.B1.80:                         ; Preds .B1.78 .B1.79
        mov       eax, esi                                      ;340.3
        mov       edi, esi                                      ;340.3
        shr       eax, 6                                        ;340.3
        mov       ebx, esi                                      ;340.3
        shr       edi, 7                                        ;340.3
        and       ebx, 63                                       ;340.3
        and       eax, 3                                        ;340.3
        and       edi, 60                                       ;340.3
        or        eax, edi                                      ;340.3
        mov       edi, esi                                      ;340.3
        shr       edi, 21                                       ;340.3
        mov       edx, DWORD PTR [_des_skb+ebx*4]               ;340.3
        mov       ebx, esi                                      ;340.3
        shr       ebx, 14                                       ;340.3
        and       edi, 6                                        ;340.3
        or        edx, DWORD PTR [_des_skb+256+eax*4]           ;340.3
        mov       eax, esi                                      ;340.3
        shr       eax, 13                                       ;340.3
        and       ebx, 48                                       ;340.3
        and       eax, 15                                       ;340.3
        or        eax, ebx                                      ;340.3
        mov       ebx, ecx                                      ;340.3
        shr       ebx, 8                                        ;340.3
        and       ebx, 60                                       ;340.3
        or        edx, DWORD PTR [_des_skb+512+eax*4]           ;340.3
        mov       eax, esi                                      ;340.3
        shr       eax, 20                                       ;340.3
        shr       esi, 22                                       ;340.3
        and       eax, 1                                        ;340.3
        or        eax, edi                                      ;340.3
        and       esi, 56                                       ;340.3
        or        eax, esi                                      ;340.3
        mov       esi, ecx                                      ;340.3
        and       esi, 63                                       ;340.3
        mov       edi, ecx                                      ;340.3
        shr       edi, 7                                        ;340.3
        and       edi, 3                                        ;340.3
        or        edx, DWORD PTR [_des_skb+768+eax*4]           ;340.3
        or        edi, ebx                                      ;340.3
        mov       eax, DWORD PTR [_des_skb+1024+esi*4]          ;340.3
        mov       ebx, ecx                                      ;340.3
        mov       esi, ecx                                      ;340.3
        shr       ebx, 15                                       ;340.3
        shr       esi, 21                                       ;340.3
        and       ebx, 63                                       ;340.3
        shr       ecx, 22                                       ;340.3
        and       esi, 15                                       ;340.3
        and       ecx, 48                                       ;340.3
        or        esi, ecx                                      ;340.3
        or        eax, DWORD PTR [_des_skb+1280+edi*4]          ;340.3
        or        eax, DWORD PTR [_des_skb+1536+ebx*4]          ;340.3
        movzx     ecx, dx                                       ;340.3
        or        eax, DWORD PTR [_des_skb+1792+esi*4]          ;340.3
        mov       ebx, eax                                      ;340.3
        and       eax, -65536                                   ;340.3
        shl       ebx, 16                                       ;340.3
        mov       esi, DWORD PTR [228+esp]                      ;340.3
        or        ebx, ecx                                      ;340.3
        mov       ecx, DWORD PTR [224+esp]                      ;340.3
        shr       edx, 16                                       ;340.3
        or        edx, eax                                      ;340.3
        mov       eax, DWORD PTR [144+esp]                      ;340.3
        inc       eax                                           ;340.3
        ror       ebx, 30                                       ;340.3
        ror       edx, 26                                       ;340.3
        mov       DWORD PTR [_ks_tbl+120+ecx+esi], ebx          ;340.3
        mov       DWORD PTR [_ks_tbl+124+ecx+esi], edx          ;340.3
        mov       DWORD PTR [144+esp], eax                      ;340.3
        cmp       eax, DWORD PTR [152+esp]                      ;340.3
        jb        .B1.32        ; Prob 99%                      ;340.3
                                ; LOE xmm0
.B1.81:                         ; Preds .B1.80
        DB        15                                            ;
        DB        31                                            ;
        DB        0                                             ;
        mov       ebx, DWORD PTR [212+esp]                      ;
                                ; LOE ebx xmm0
.B1.82:                         ; Preds .B1.81 .B1.30
        inc       ebx                                           ;340.3
        cmp       ebx, 8                                        ;340.3
        jb        .B1.29        ; Prob 87%                      ;340.3
                                ; LOE ebx xmm0
.B1.83:                         ; Preds .B1.82
        call      _clock                                        ;342.16
                                ; LOE eax
.B1.112:                        ; Preds .B1.83
        mov       ebx, eax                                      ;342.16
                                ; LOE ebx
.B1.84:                         ; Preds .B1.112
        mov       eax, OFFSET FLAT: _ptext                      ;343.3
        mov       edx, OFFSET FLAT: _hash                       ;343.3
        call      _lm_fast.                                     ;343.3
                                ; LOE ebx
.B1.85:                         ; Preds .B1.84
        call      _clock                                        ;344.13
                                ; LOE eax ebx
.B1.113:                        ; Preds .B1.85
        mov       ecx, eax                                      ;344.13
                                ; LOE ecx ebx
.B1.86:                         ; Preds .B1.113
        fild      QWORD PTR [_completed]                        ;347.3
        sub       ecx, ebx                                      ;347.3
        pxor      xmm0, xmm0                                    ;347.3
        cvtsi2ss  xmm0, ecx                                     ;347.3
        divss     xmm0, DWORD PTR [_2il0floatpacket.8]          ;347.3
        mov       eax, DWORD PTR [_completed]                   ;347.42
        mov       edx, DWORD PTR [_completed+4]                 ;347.42
        mov       DWORD PTR [esp], OFFSET FLAT: ??_C@_0BM@A@?6?5Completed?3?5?$CFlld?5?$CF?42fM?5k?1s?$AA@ ;347.3
        mov       DWORD PTR [4+esp], eax                        ;347.3
        mov       DWORD PTR [8+esp], edx                        ;347.3
        shr       edx, 31                                       ;347.3
        fadd      QWORD PTR [_2il0floatpacket.10+edx*8]         ;347.3
        fstp      DWORD PTR [128+esp]                           ;347.3
        movss     xmm1, DWORD PTR [128+esp]                     ;347.3
        divss     xmm1, xmm0                                    ;347.3
        divss     xmm1, DWORD PTR [_2il0floatpacket.9]          ;347.3
        cvtss2sd  xmm1, xmm1                                    ;347.3
        movsd     QWORD PTR [12+esp], xmm1                      ;347.3
        call      _printf                                       ;347.3
                                ; LOE
.B1.87:                         ; Preds .B1.86
        xor       eax, eax                                      ;348.10
        add       esp, 372                                      ;348.10
        pop       ebx                                           ;348.10
        pop       edi                                           ;348.10
        pop       esi                                           ;348.10
        mov       esp, ebp                                      ;348.10
        pop       ebp                                           ;348.10
        ret                                                     ;348.10
                                ; LOE
.B1.88:                         ; Preds .B1.101 .B1.100 .B1.95
        push      edi                                           ;325.5
        push      OFFSET FLAT: ??_C@_0BF@A@?6?5?5Invalid?5hash?5?$DN?5?$CFs?$AA@ ;325.5
        call      _printf                                       ;325.5
                                ; LOE
.B1.114:                        ; Preds .B1.88
        add       esp, 8                                        ;325.5
                                ; LOE
.B1.89:                         ; Preds .B1.114
        push      2                                             ;326.5
        call      _exit                                         ;326.5
                                ; LOE
.B1.90:                         ; Preds .B1.99
        push      DWORD PTR [ebx]                               ;320.5
        push      OFFSET FLAT: ??_C@_0CO@A@?6?5?5Usage?3?5?$CFs?5?$DMhash?$DO?5?$DMstart?$DO?5?$DMend?$DO?5?$DMalphabet?$DO?6?$AA@ ;320.5
        call      _printf                                       ;320.5
                                ; LOE
.B1.115:                        ; Preds .B1.90
        add       esp, 8                                        ;320.5
                                ; LOE
.B1.91:                         ; Preds .B1.115
        push      1                                             ;321.5
        call      _exit                                         ;321.5
                                ; LOE
.B1.92:                         ; Preds .B1.109                 ; Infreq
        xor       eax, eax                                      ;335.13
        mov       ebx, DWORD PTR [128+esp]                      ;
        xor       edi, edi                                      ;335.13
        mov       esi, DWORD PTR [132+esp]                      ;
        jmp       .B1.28        ; Prob 100%                     ;
                                ; LOE eax ebx esi edi
.B1.93:                         ; Preds .B1.105                 ; Infreq
        xor       esi, esi                                      ;334.15
        xor       ebx, ebx                                      ;334.15
        jmp       .B1.22        ; Prob 100%                     ;334.15
                                ; LOE ebx esi
.B1.94:                         ; Preds .B1.8                   ; Infreq
        jne       .B1.13        ; Prob 50%                      ;324.8
                                ; LOE ebx
.B1.95:                         ; Preds .B1.94                  ; Infreq
        mov       edi, DWORD PTR [4+ebx]                        ;325.37
        jmp       .B1.88        ; Prob 100%                     ;325.37
        ALIGN     16
                                ; LOE edi
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
	PUBLIC _lm_fast
_lm_fast	PROC NEAR 
; parameter 1: eax
; parameter 2: edx
.B2.1:                          ; Preds .B2.0
        mov       eax, DWORD PTR [4+esp]                        ;222.50
        mov       edx, DWORD PTR [8+esp]                        ;222.50
	PUBLIC _lm_fast.
_lm_fast.::
        push      ebp                                           ;222.50
        mov       ebp, esp                                      ;222.50
        and       esp, -16                                      ;222.50
        push      esi                                           ;222.50
        push      edi                                           ;222.50
        push      ebx                                           ;222.50
        sub       esp, 148                                      ;222.50
        mov       ebx, DWORD PTR [4+eax]                        ;235.8
        mov       ecx, ebx                                      ;236.3
        shr       ecx, 4                                        ;236.3
        pcmpeqd   xmm0, xmm0                                    ;248.5
        mov       esi, DWORD PTR [eax]                          ;234.8
        xor       ecx, esi                                      ;236.3
        and       ecx, 252645135                                ;236.3
        movdqa    xmm3, xmm0                                    ;248.5
        xor       esi, ecx                                      ;236.3
        movdqa    xmm2, xmm0                                    ;248.5
        shl       ecx, 4                                        ;236.3
        mov       eax, esi                                      ;236.3
        shr       eax, 16                                       ;236.3
        xor       ebx, ecx                                      ;236.3
        xor       eax, ebx                                      ;236.3
        movdqa    xmm4, xmm0                                    ;248.5
        movzx     edi, ax                                       ;236.3
        pxor      xmm1, xmm1                                    ;246.3
        xor       ebx, edi                                      ;236.3
        shl       edi, 16                                       ;236.3
        mov       eax, ebx                                      ;236.3
        shr       eax, 2                                        ;236.3
        xor       esi, edi                                      ;236.3
        xor       eax, esi                                      ;236.3
        and       eax, 858993459                                ;236.3
        xor       esi, eax                                      ;236.3
        shl       eax, 2                                        ;236.3
        mov       ecx, esi                                      ;236.3
        shr       ecx, 8                                        ;236.3
        xor       ebx, eax                                      ;236.3
        xor       ecx, ebx                                      ;236.3
        and       ecx, 16711935                                 ;236.3
        xor       ebx, ecx                                      ;236.3
        shl       ecx, 8                                        ;236.3
        mov       eax, ebx                                      ;236.3
        shr       eax, 1                                        ;236.3
        xor       esi, ecx                                      ;236.3
        xor       eax, esi                                      ;236.3
        and       eax, 1431655765                               ;236.3
        xor       esi, eax                                      ;237.8
        add       eax, eax                                      ;238.8
        mov       ecx, DWORD PTR [4+edx]                        ;241.8
        xor       ebx, eax                                      ;238.8
        mov       eax, DWORD PTR [edx]                          ;240.8
        mov       edx, ecx                                      ;242.3
        shr       edx, 4                                        ;242.3
        xor       edx, eax                                      ;242.3
        and       edx, 252645135                                ;242.3
        xor       eax, edx                                      ;242.3
        shl       edx, 4                                        ;242.3
        mov       edi, eax                                      ;242.3
        shr       edi, 16                                       ;242.3
        xor       ecx, edx                                      ;242.3
        xor       edi, ecx                                      ;242.3
        movzx     edx, di                                       ;242.3
        xor       ecx, edx                                      ;242.3
        shl       edx, 16                                       ;242.3
        mov       edi, ecx                                      ;242.3
        shr       edi, 2                                        ;242.3
        xor       eax, edx                                      ;242.3
        xor       edi, eax                                      ;242.3
        and       edi, 858993459                                ;242.3
        xor       eax, edi                                      ;242.3
        shl       edi, 2                                        ;242.3
        mov       edx, eax                                      ;242.3
        shr       edx, 8                                        ;242.3
        xor       ecx, edi                                      ;242.3
        xor       edx, ecx                                      ;242.3
        and       edx, 16711935                                 ;242.3
        xor       ecx, edx                                      ;242.3
        shl       edx, 8                                        ;242.3
        mov       edi, ecx                                      ;242.3
        shr       edi, 1                                        ;242.3
        xor       eax, edx                                      ;242.3
        xor       edi, eax                                      ;242.3
        xor       edx, edx                                      ;250.3
        and       edi, 1431655765                               ;242.3
        xor       eax, edi                                      ;243.8
        add       edi, edi                                      ;244.8
        xor       ecx, edi                                      ;244.8
        ror       ecx, 29                                       ;244.8
        mov       DWORD PTR [92+esp], ecx                       ;244.8
        psrldq    xmm3, 8                                       ;248.5
        psrldq    xmm2, 4                                       ;248.5
        mov       ecx, DWORD PTR [_alpha_len]                   ;300.39
        mov       DWORD PTR [96+esp], ecx                       ;300.39
        movd      ecx, xmm2                                     ;302.24
        movd      edi, xmm3                                     ;304.22
        psrldq    xmm4, 12                                      ;248.5
        movdqa    XMMWORD PTR [16+esp], xmm0                    ;248.5
        ror       esi, 29                                       ;237.8
        ror       ebx, 29                                       ;238.8
        ror       eax, 29                                       ;243.8
        mov       DWORD PTR [104+esp], edx                      ;250.3
        mov       DWORD PTR [100+esp], edx                      ;250.3
        movdqa    XMMWORD PTR [32+esp], xmm0                    ;248.5
        mov       DWORD PTR [88+esp], ecx                       ;302.24
        mov       DWORD PTR [84+esp], edi                       ;304.22
        movd      DWORD PTR [80+esp], xmm4                      ;306.20
        movd      DWORD PTR [12+esp], xmm0                      ;308.18
        mov       DWORD PTR [8+esp], ecx                        ;310.16
        mov       DWORD PTR [4+esp], edi                        ;312.14
        movdqa    xmm2, XMMWORD PTR [_ks+128]                   ;267.17
        mov       DWORD PTR [112+esp], eax                      ;267.17
        mov       DWORD PTR [108+esp], ebx                      ;267.17
        mov       DWORD PTR [116+esp], esi                      ;267.17
                                ; LOE xmm0 xmm1 xmm2
.B2.2:                          ; Preds .B2.4 .B2.21 .B2.1
        mov       ecx, DWORD PTR [104+esp]                      ;267.17
        movdqa    xmm3, xmm2                                    ;267.17
        shl       ecx, 7                                        ;267.17
        mov       eax, DWORD PTR [116+esp]                      ;274.17
        mov       esi, eax                                      ;274.17
        mov       ebx, eax                                      ;274.17
        por       xmm3, XMMWORD PTR [_ks_tbl+ecx]               ;267.17
        movd      ecx, xmm3                                     ;272.33
        movdqa    xmm4, xmm3                                    ;267.17
        psrldq    xmm4, 4                                       ;267.17
        movdqa    xmm5, xmm3                                    ;267.17
        psrldq    xmm5, 8                                       ;267.17
        movdqa    xmm6, xmm3                                    ;267.17
        xor       esi, ecx                                      ;274.17
        mov       edi, esi                                      ;274.17
        and       edi, 252                                      ;274.17
        movd      edx, xmm4                                     ;274.17
        psrldq    xmm6, 12                                      ;267.17
        movdqa    XMMWORD PTR [_ks], xmm3                       ;267.17
        mov       DWORD PTR [132+esp], ecx                      ;272.33
        xor       ebx, edx                                      ;274.17
        mov       ecx, DWORD PTR [_des_SPtrans+edi]             ;274.17
        mov       edi, esi                                      ;274.17
        mov       DWORD PTR [124+esp], edx                      ;274.17
        mov       edx, esi                                      ;274.17
        shr       edi, 8                                        ;274.17
        shr       edx, 16                                       ;274.17
        and       edi, 252                                      ;274.17
        shr       esi, 24                                       ;274.17
        and       edx, 252                                      ;274.17
        and       esi, 252                                      ;274.17
        xor       ecx, DWORD PTR [108+esp]                      ;274.17
        xor       ecx, DWORD PTR [_des_SPtrans+512+edi]         ;274.17
        ror       ebx, 4                                        ;274.17
        xor       ecx, DWORD PTR [_des_SPtrans+1024+edx]        ;274.17
        mov       edx, ebx                                      ;274.17
        xor       ecx, DWORD PTR [_des_SPtrans+1536+esi]        ;274.17
        mov       esi, ebx                                      ;274.17
        shr       esi, 8                                        ;274.17
        mov       edi, ebx                                      ;274.17
        and       edx, 252                                      ;274.17
        and       esi, 252                                      ;274.17
        shr       edi, 16                                       ;274.17
        shr       ebx, 24                                       ;274.17
        and       edi, 252                                      ;274.17
        and       ebx, 252                                      ;274.17
        xor       ecx, DWORD PTR [_des_SPtrans+256+edx]         ;274.17
        xor       ecx, DWORD PTR [_des_SPtrans+768+esi]         ;274.17
        movd      esi, xmm5                                     ;272.33
        movdqa    XMMWORD PTR [_ks+16], xmm3                    ;267.17
        movdqa    XMMWORD PTR [_ks+32], xmm3                    ;267.17
        xor       ecx, DWORD PTR [_des_SPtrans+1280+edi]        ;274.17
        xor       ecx, DWORD PTR [_des_SPtrans+1792+ebx]        ;274.17
        mov       DWORD PTR [120+esp], esi                      ;272.33
        xor       esi, ecx                                      ;275.17
        mov       edx, esi                                      ;275.17
        mov       ebx, esi                                      ;275.17
        and       edx, 252                                      ;275.17
        shr       ebx, 16                                       ;275.17
        movd      edi, xmm6                                     ;275.17
        and       ebx, 252                                      ;275.17
        movdqa    XMMWORD PTR [_ks+48], xmm3                    ;267.17
        movdqa    XMMWORD PTR [_ks+64], xmm3                    ;267.17
        mov       edx, DWORD PTR [_des_SPtrans+edx]             ;275.17
        xor       edx, eax                                      ;275.17
        mov       eax, esi                                      ;275.17
        shr       eax, 8                                        ;275.17
        and       eax, 252                                      ;275.17
        shr       esi, 24                                       ;275.17
        and       esi, 252                                      ;275.17
        mov       DWORD PTR [128+esp], edi                      ;275.17
        xor       edi, ecx                                      ;275.17
        xor       edx, DWORD PTR [_des_SPtrans+512+eax]         ;275.17
        ror       edi, 4                                        ;275.17
        xor       edx, DWORD PTR [_des_SPtrans+1024+ebx]        ;275.17
        mov       ebx, edi                                      ;275.17
        xor       edx, DWORD PTR [_des_SPtrans+1536+esi]        ;275.17
        mov       esi, edi                                      ;275.17
        shr       esi, 8                                        ;275.17
        mov       eax, edi                                      ;275.17
        and       ebx, 252                                      ;275.17
        and       esi, 252                                      ;275.17
        shr       eax, 16                                       ;275.17
        shr       edi, 24                                       ;275.17
        and       eax, 252                                      ;275.17
        and       edi, 252                                      ;275.17
        xor       edx, DWORD PTR [_des_SPtrans+256+ebx]         ;275.17
        xor       edx, DWORD PTR [_des_SPtrans+768+esi]         ;275.17
        xor       edx, DWORD PTR [_des_SPtrans+1280+eax]        ;275.17
        xor       edx, DWORD PTR [_des_SPtrans+1792+edi]        ;275.17
        mov       ebx, DWORD PTR [132+esp]                      ;276.17
        xor       ebx, edx                                      ;276.17
        mov       edi, ebx                                      ;276.17
        mov       eax, ebx                                      ;276.17
        and       edi, 252                                      ;276.17
        shr       eax, 16                                       ;276.17
        and       eax, 252                                      ;276.17
        mov       esi, DWORD PTR [124+esp]                      ;276.17
        xor       ecx, DWORD PTR [_des_SPtrans+edi]             ;276.17
        mov       edi, ebx                                      ;276.17
        shr       edi, 8                                        ;276.17
        xor       esi, edx                                      ;276.17
        and       edi, 252                                      ;276.17
        shr       ebx, 24                                       ;276.17
        and       ebx, 252                                      ;276.17
        ror       esi, 4                                        ;276.17
        xor       ecx, DWORD PTR [_des_SPtrans+512+edi]         ;276.17
        mov       edi, esi                                      ;276.17
        xor       ecx, DWORD PTR [_des_SPtrans+1024+eax]        ;276.17
        mov       eax, esi                                      ;276.17
        xor       ecx, DWORD PTR [_des_SPtrans+1536+ebx]        ;276.17
        mov       ebx, esi                                      ;276.17
        shr       eax, 8                                        ;276.17
        and       ebx, 252                                      ;276.17
        shr       edi, 16                                       ;276.17
        and       eax, 252                                      ;276.17
        shr       esi, 24                                       ;276.17
        and       edi, 252                                      ;276.17
        and       esi, 252                                      ;276.17
        xor       ecx, DWORD PTR [_des_SPtrans+256+ebx]         ;276.17
        xor       ecx, DWORD PTR [_des_SPtrans+768+eax]         ;276.17
        xor       ecx, DWORD PTR [_des_SPtrans+1280+edi]        ;276.17
        xor       ecx, DWORD PTR [_des_SPtrans+1792+esi]        ;276.17
        mov       ebx, DWORD PTR [120+esp]                      ;277.17
        xor       ebx, ecx                                      ;277.17
        mov       eax, ebx                                      ;277.17
        mov       edi, ebx                                      ;277.17
        and       eax, 252                                      ;277.17
        shr       edi, 16                                       ;277.17
        and       edi, 252                                      ;277.17
        mov       esi, DWORD PTR [128+esp]                      ;277.17
        xor       edx, DWORD PTR [_des_SPtrans+eax]             ;277.17
        mov       eax, ebx                                      ;277.17
        shr       eax, 8                                        ;277.17
        xor       esi, ecx                                      ;277.17
        and       eax, 252                                      ;277.17
        shr       ebx, 24                                       ;277.17
        and       ebx, 252                                      ;277.17
        ror       esi, 4                                        ;277.17
        xor       edx, DWORD PTR [_des_SPtrans+512+eax]         ;277.17
        mov       eax, esi                                      ;277.17
        xor       edx, DWORD PTR [_des_SPtrans+1024+edi]        ;277.17
        mov       edi, esi                                      ;277.17
        xor       edx, DWORD PTR [_des_SPtrans+1536+ebx]        ;277.17
        mov       ebx, esi                                      ;277.17
        shr       edi, 8                                        ;277.17
        and       ebx, 252                                      ;277.17
        shr       eax, 16                                       ;277.17
        and       edi, 252                                      ;277.17
        shr       esi, 24                                       ;277.17
        and       eax, 252                                      ;277.17
        and       esi, 252                                      ;277.17
        xor       edx, DWORD PTR [_des_SPtrans+256+ebx]         ;277.17
        xor       edx, DWORD PTR [_des_SPtrans+768+edi]         ;277.17
        xor       edx, DWORD PTR [_des_SPtrans+1280+eax]        ;277.17
        xor       edx, DWORD PTR [_des_SPtrans+1792+esi]        ;277.17
        mov       ebx, DWORD PTR [132+esp]                      ;278.17
        xor       ebx, edx                                      ;278.17
        mov       edi, ebx                                      ;278.17
        mov       eax, ebx                                      ;278.17
        and       edi, 252                                      ;278.17
        shr       eax, 16                                       ;278.17
        and       eax, 252                                      ;278.17
        mov       esi, DWORD PTR [124+esp]                      ;278.17
        xor       ecx, DWORD PTR [_des_SPtrans+edi]             ;278.17
        mov       edi, ebx                                      ;278.17
        shr       edi, 8                                        ;278.17
        xor       esi, edx                                      ;278.17
        and       edi, 252                                      ;278.17
        shr       ebx, 24                                       ;278.17
        and       ebx, 252                                      ;278.17
        ror       esi, 4                                        ;278.17
        xor       ecx, DWORD PTR [_des_SPtrans+512+edi]         ;278.17
        mov       edi, esi                                      ;278.17
        xor       ecx, DWORD PTR [_des_SPtrans+1024+eax]        ;278.17
        mov       eax, esi                                      ;278.17
        xor       ecx, DWORD PTR [_des_SPtrans+1536+ebx]        ;278.17
        mov       ebx, esi                                      ;278.17
        shr       edi, 8                                        ;278.17
        and       ebx, 252                                      ;278.17
        shr       eax, 16                                       ;278.17
        and       edi, 252                                      ;278.17
        shr       esi, 24                                       ;278.17
        and       eax, 252                                      ;278.17
        and       esi, 252                                      ;278.17
        xor       ecx, DWORD PTR [_des_SPtrans+256+ebx]         ;278.17
        xor       ecx, DWORD PTR [_des_SPtrans+768+edi]         ;278.17
        xor       ecx, DWORD PTR [_des_SPtrans+1280+eax]        ;278.17
        xor       ecx, DWORD PTR [_des_SPtrans+1792+esi]        ;278.17
        mov       ebx, DWORD PTR [120+esp]                      ;279.17
        xor       ebx, ecx                                      ;279.17
        mov       eax, ebx                                      ;279.17
        mov       edi, ebx                                      ;279.17
        and       eax, 252                                      ;279.17
        shr       edi, 16                                       ;279.17
        and       edi, 252                                      ;279.17
        mov       esi, DWORD PTR [128+esp]                      ;279.17
        xor       edx, DWORD PTR [_des_SPtrans+eax]             ;279.17
        mov       eax, ebx                                      ;279.17
        shr       eax, 8                                        ;279.17
        xor       esi, ecx                                      ;279.17
        and       eax, 252                                      ;279.17
        shr       ebx, 24                                       ;279.17
        and       ebx, 252                                      ;279.17
        ror       esi, 4                                        ;279.17
        xor       edx, DWORD PTR [_des_SPtrans+512+eax]         ;279.17
        mov       eax, esi                                      ;279.17
        xor       edx, DWORD PTR [_des_SPtrans+1024+edi]        ;279.17
        mov       edi, esi                                      ;279.17
        xor       edx, DWORD PTR [_des_SPtrans+1536+ebx]        ;279.17
        mov       ebx, esi                                      ;279.17
        shr       edi, 8                                        ;279.17
        and       ebx, 252                                      ;279.17
        shr       eax, 16                                       ;279.17
        and       edi, 252                                      ;279.17
        shr       esi, 24                                       ;279.17
        and       eax, 252                                      ;279.17
        and       esi, 252                                      ;279.17
        xor       edx, DWORD PTR [_des_SPtrans+256+ebx]         ;279.17
        xor       edx, DWORD PTR [_des_SPtrans+768+edi]         ;279.17
        xor       edx, DWORD PTR [_des_SPtrans+1280+eax]        ;279.17
        xor       edx, DWORD PTR [_des_SPtrans+1792+esi]        ;279.17
        mov       ebx, DWORD PTR [132+esp]                      ;280.17
        xor       ebx, edx                                      ;280.17
        mov       edi, ebx                                      ;280.17
        mov       eax, ebx                                      ;280.17
        and       edi, 252                                      ;280.17
        shr       eax, 16                                       ;280.17
        and       eax, 252                                      ;280.17
        mov       esi, DWORD PTR [124+esp]                      ;280.17
        xor       ecx, DWORD PTR [_des_SPtrans+edi]             ;280.17
        mov       edi, ebx                                      ;280.17
        shr       edi, 8                                        ;280.17
        xor       esi, edx                                      ;280.17
        and       edi, 252                                      ;280.17
        shr       ebx, 24                                       ;280.17
        and       ebx, 252                                      ;280.17
        ror       esi, 4                                        ;280.17
        xor       ecx, DWORD PTR [_des_SPtrans+512+edi]         ;280.17
        mov       edi, esi                                      ;280.17
        xor       ecx, DWORD PTR [_des_SPtrans+1024+eax]        ;280.17
        mov       eax, esi                                      ;280.17
        xor       ecx, DWORD PTR [_des_SPtrans+1536+ebx]        ;280.17
        mov       ebx, esi                                      ;280.17
        shr       edi, 8                                        ;280.17
        and       ebx, 252                                      ;280.17
        shr       eax, 16                                       ;280.17
        and       edi, 252                                      ;280.17
        shr       esi, 24                                       ;280.17
        and       eax, 252                                      ;280.17
        and       esi, 252                                      ;280.17
        xor       ecx, DWORD PTR [_des_SPtrans+256+ebx]         ;280.17
        xor       ecx, DWORD PTR [_des_SPtrans+768+edi]         ;280.17
        xor       ecx, DWORD PTR [_des_SPtrans+1280+eax]        ;280.17
        xor       ecx, DWORD PTR [_des_SPtrans+1792+esi]        ;280.17
        mov       ebx, DWORD PTR [120+esp]                      ;281.17
        xor       ebx, ecx                                      ;281.17
        mov       eax, ebx                                      ;281.17
        mov       edi, ebx                                      ;281.17
        and       eax, 252                                      ;281.17
        shr       edi, 16                                       ;281.17
        and       edi, 252                                      ;281.17
        mov       esi, DWORD PTR [128+esp]                      ;281.17
        xor       edx, DWORD PTR [_des_SPtrans+eax]             ;281.17
        mov       eax, ebx                                      ;281.17
        shr       eax, 8                                        ;281.17
        xor       esi, ecx                                      ;281.17
        and       eax, 252                                      ;281.17
        shr       ebx, 24                                       ;281.17
        and       ebx, 252                                      ;281.17
        ror       esi, 4                                        ;281.17
        xor       edx, DWORD PTR [_des_SPtrans+512+eax]         ;281.17
        mov       eax, esi                                      ;281.17
        xor       edx, DWORD PTR [_des_SPtrans+1024+edi]        ;281.17
        mov       edi, esi                                      ;281.17
        xor       edx, DWORD PTR [_des_SPtrans+1536+ebx]        ;281.17
        mov       ebx, esi                                      ;281.17
        shr       edi, 8                                        ;281.17
        and       ebx, 252                                      ;281.17
        shr       eax, 16                                       ;281.17
        and       edi, 252                                      ;281.17
        shr       esi, 24                                       ;281.17
        and       eax, 252                                      ;281.17
        and       esi, 252                                      ;281.17
        xor       edx, DWORD PTR [_des_SPtrans+256+ebx]         ;281.17
        xor       edx, DWORD PTR [_des_SPtrans+768+edi]         ;281.17
        xor       edx, DWORD PTR [_des_SPtrans+1280+eax]        ;281.17
        xor       edx, DWORD PTR [_des_SPtrans+1792+esi]        ;281.17
        mov       ebx, DWORD PTR [132+esp]                      ;282.17
        xor       ebx, edx                                      ;282.17
        mov       edi, ebx                                      ;282.17
        mov       eax, ebx                                      ;282.17
        and       edi, 252                                      ;282.17
        shr       eax, 16                                       ;282.17
        and       eax, 252                                      ;282.17
        mov       esi, DWORD PTR [124+esp]                      ;282.17
        xor       ecx, DWORD PTR [_des_SPtrans+edi]             ;282.17
        mov       edi, ebx                                      ;282.17
        shr       edi, 8                                        ;282.17
        xor       esi, edx                                      ;282.17
        and       edi, 252                                      ;282.17
        shr       ebx, 24                                       ;282.17
        and       ebx, 252                                      ;282.17
        ror       esi, 4                                        ;282.17
        xor       ecx, DWORD PTR [_des_SPtrans+512+edi]         ;282.17
        mov       edi, esi                                      ;282.17
        xor       ecx, DWORD PTR [_des_SPtrans+1024+eax]        ;282.17
        mov       eax, esi                                      ;282.17
        xor       ecx, DWORD PTR [_des_SPtrans+1536+ebx]        ;282.17
        mov       ebx, esi                                      ;282.17
        shr       edi, 8                                        ;282.17
        and       ebx, 252                                      ;282.17
        shr       eax, 16                                       ;282.17
        and       edi, 252                                      ;282.17
        shr       esi, 24                                       ;282.17
        and       eax, 252                                      ;282.17
        and       esi, 252                                      ;282.17
        xor       ecx, DWORD PTR [_des_SPtrans+256+ebx]         ;282.17
        xor       ecx, DWORD PTR [_des_SPtrans+768+edi]         ;282.17
        xor       ecx, DWORD PTR [_des_SPtrans+1280+eax]        ;282.17
        xor       ecx, DWORD PTR [_des_SPtrans+1792+esi]        ;282.17
        mov       ebx, DWORD PTR [120+esp]                      ;283.17
        xor       ebx, ecx                                      ;283.17
        mov       eax, ebx                                      ;283.17
        mov       edi, ebx                                      ;283.17
        and       eax, 252                                      ;283.17
        shr       edi, 16                                       ;283.17
        and       edi, 252                                      ;283.17
        mov       esi, DWORD PTR [128+esp]                      ;283.17
        xor       edx, DWORD PTR [_des_SPtrans+eax]             ;283.17
        mov       eax, ebx                                      ;283.17
        shr       eax, 8                                        ;283.17
        xor       esi, ecx                                      ;283.17
        and       eax, 252                                      ;283.17
        shr       ebx, 24                                       ;283.17
        and       ebx, 252                                      ;283.17
        ror       esi, 4                                        ;283.17
        xor       edx, DWORD PTR [_des_SPtrans+512+eax]         ;283.17
        mov       eax, esi                                      ;283.17
        xor       edx, DWORD PTR [_des_SPtrans+1024+edi]        ;283.17
        mov       edi, esi                                      ;283.17
        xor       edx, DWORD PTR [_des_SPtrans+1536+ebx]        ;283.17
        mov       ebx, esi                                      ;283.17
        shr       edi, 8                                        ;283.17
        and       ebx, 252                                      ;283.17
        shr       eax, 16                                       ;283.17
        and       edi, 252                                      ;283.17
        shr       esi, 24                                       ;283.17
        and       eax, 252                                      ;283.17
        and       esi, 252                                      ;283.17
        xor       edx, DWORD PTR [_des_SPtrans+256+ebx]         ;283.17
        xor       edx, DWORD PTR [_des_SPtrans+768+edi]         ;283.17
        xor       edx, DWORD PTR [_des_SPtrans+1280+eax]        ;283.17
        xor       edx, DWORD PTR [_des_SPtrans+1792+esi]        ;283.17
        mov       ebx, DWORD PTR [132+esp]                      ;284.17
        xor       ebx, edx                                      ;284.17
        mov       esi, DWORD PTR [124+esp]                      ;284.17
        mov       eax, ebx                                      ;284.17
        xor       esi, edx                                      ;284.17
        mov       edi, ebx                                      ;284.17
        ror       esi, 4                                        ;284.17
        and       eax, 252                                      ;284.17
        mov       DWORD PTR [124+esp], esi                      ;284.17
        mov       esi, ebx                                      ;284.17
        shr       edi, 8                                        ;284.17
        shr       esi, 16                                       ;284.17
        and       edi, 252                                      ;284.17
        and       esi, 252                                      ;284.17
        xor       ecx, DWORD PTR [_des_SPtrans+eax]             ;284.17
        shr       ebx, 24                                       ;284.17
        xor       ecx, DWORD PTR [_des_SPtrans+512+edi]         ;284.17
        and       ebx, 252                                      ;284.17
        movdqa    XMMWORD PTR [_ks+80], xmm3                    ;267.17
        movdqa    XMMWORD PTR [_ks+96], xmm3                    ;267.17
        movdqa    XMMWORD PTR [_ks+112], xmm3                   ;267.17
        xor       ecx, DWORD PTR [_des_SPtrans+1024+esi]        ;284.17
        mov       DWORD PTR [132+esp], ebx                      ;284.17
                                ; LOE rbx edx ecx ebx bl bh xmm0 xmm1 xmm2
.B2.34:                         ; Preds .B2.2
        mov       esi, ebx                                      ;284.17
        xor       ecx, DWORD PTR [_des_SPtrans+1536+esi]        ;284.17
        mov       esi, DWORD PTR [124+esp]                      ;284.17
        mov       eax, esi                                      ;284.17
        mov       ebx, esi                                      ;284.17
        mov       edi, esi                                      ;284.17
        shr       ebx, 8                                        ;284.17
        and       eax, 252                                      ;284.17
        shr       edi, 16                                       ;284.17
        and       ebx, 252                                      ;284.17
        shr       esi, 24                                       ;284.17
        and       edi, 252                                      ;284.17
        and       esi, 252                                      ;284.17
        xor       ecx, DWORD PTR [_des_SPtrans+256+eax]         ;284.17
        xor       ecx, DWORD PTR [_des_SPtrans+768+ebx]         ;284.17
        xor       ecx, DWORD PTR [_des_SPtrans+1280+edi]        ;284.17
        xor       ecx, DWORD PTR [_des_SPtrans+1792+esi]        ;284.17
        mov       ebx, DWORD PTR [120+esp]                      ;285.17
        xor       ebx, ecx                                      ;285.17
        mov       esi, ebx                                      ;285.17
        mov       eax, ebx                                      ;285.17
        and       esi, 252                                      ;285.17
        shr       eax, 16                                       ;285.17
        and       eax, 252                                      ;285.17
        mov       edi, DWORD PTR [128+esp]                      ;285.17
        xor       edx, DWORD PTR [_des_SPtrans+esi]             ;285.17
        mov       esi, ebx                                      ;285.17
        shr       esi, 8                                        ;285.17
        xor       edi, ecx                                      ;285.17
        and       esi, 252                                      ;285.17
        shr       ebx, 24                                       ;285.17
        and       ebx, 252                                      ;285.17
        ror       edi, 4                                        ;285.17
        xor       edx, DWORD PTR [_des_SPtrans+512+esi]         ;285.17
        mov       esi, edi                                      ;285.17
        xor       edx, DWORD PTR [_des_SPtrans+1024+eax]        ;285.17
        mov       eax, edi                                      ;285.17
        xor       edx, DWORD PTR [_des_SPtrans+1536+ebx]        ;285.17
        mov       ebx, edi                                      ;285.17
        shr       ebx, 8                                        ;285.17
        and       eax, 252                                      ;285.17
        shr       esi, 16                                       ;285.17
        and       ebx, 252                                      ;285.17
        shr       edi, 24                                       ;285.17
        and       esi, 252                                      ;285.17
        and       edi, 252                                      ;285.17
        xor       edx, DWORD PTR [_des_SPtrans+256+eax]         ;285.17
        xor       edx, DWORD PTR [_des_SPtrans+768+ebx]         ;285.17
        xor       edx, DWORD PTR [_des_SPtrans+1280+esi]        ;285.17
        xor       edx, DWORD PTR [_des_SPtrans+1792+edi]        ;285.17
        mov       ebx, DWORD PTR [_ks+96]                       ;272.33
        xor       ebx, edx                                      ;286.17
        mov       edi, ebx                                      ;286.17
        mov       eax, ebx                                      ;286.17
        and       edi, 252                                      ;286.17
        shr       eax, 16                                       ;286.17
        and       eax, 252                                      ;286.17
        mov       esi, DWORD PTR [_ks+100]                      ;286.17
        xor       ecx, DWORD PTR [_des_SPtrans+edi]             ;286.17
        mov       edi, ebx                                      ;286.17
        shr       edi, 8                                        ;286.17
        xor       esi, edx                                      ;286.17
        and       edi, 252                                      ;286.17
        shr       ebx, 24                                       ;286.17
        and       ebx, 252                                      ;286.17
        ror       esi, 4                                        ;286.17
        xor       ecx, DWORD PTR [_des_SPtrans+512+edi]         ;286.17
        mov       edi, esi                                      ;286.17
        xor       ecx, DWORD PTR [_des_SPtrans+1024+eax]        ;286.17
        mov       eax, esi                                      ;286.17
        xor       ecx, DWORD PTR [_des_SPtrans+1536+ebx]        ;286.17
        mov       ebx, esi                                      ;286.17
        shr       ebx, 8                                        ;286.17
        and       eax, 252                                      ;286.17
        shr       edi, 16                                       ;286.17
        and       ebx, 252                                      ;286.17
        shr       esi, 24                                       ;286.17
        and       edi, 252                                      ;286.17
        and       esi, 252                                      ;286.17
        xor       ecx, DWORD PTR [_des_SPtrans+256+eax]         ;286.17
        xor       ecx, DWORD PTR [_des_SPtrans+768+ebx]         ;286.17
        xor       ecx, DWORD PTR [_des_SPtrans+1280+edi]        ;286.17
        xor       ecx, DWORD PTR [_des_SPtrans+1792+esi]        ;286.17
        mov       ebx, DWORD PTR [_ks+104]                      ;272.33
        xor       ebx, ecx                                      ;287.17
        mov       esi, ebx                                      ;287.17
        mov       eax, ebx                                      ;287.17
        and       esi, 252                                      ;287.17
        shr       eax, 16                                       ;287.17
        and       eax, 252                                      ;287.17
        mov       edi, DWORD PTR [_ks+108]                      ;287.17
        xor       edx, DWORD PTR [_des_SPtrans+esi]             ;287.17
        mov       esi, ebx                                      ;287.17
        shr       esi, 8                                        ;287.17
        xor       edi, ecx                                      ;287.17
        and       esi, 252                                      ;287.17
        shr       ebx, 24                                       ;287.17
        and       ebx, 252                                      ;287.17
        ror       edi, 4                                        ;287.17
        xor       edx, DWORD PTR [_des_SPtrans+512+esi]         ;287.17
        mov       esi, edi                                      ;287.17
        xor       edx, DWORD PTR [_des_SPtrans+1024+eax]        ;287.17
        mov       eax, edi                                      ;287.17
        xor       edx, DWORD PTR [_des_SPtrans+1536+ebx]        ;287.17
        mov       ebx, edi                                      ;287.17
        shr       ebx, 8                                        ;287.17
        and       eax, 252                                      ;287.17
        shr       esi, 16                                       ;287.17
        and       ebx, 252                                      ;287.17
        shr       edi, 24                                       ;287.17
        and       esi, 252                                      ;287.17
        and       edi, 252                                      ;287.17
        xor       edx, DWORD PTR [_des_SPtrans+256+eax]         ;287.17
        xor       edx, DWORD PTR [_des_SPtrans+768+ebx]         ;287.17
        xor       edx, DWORD PTR [_des_SPtrans+1280+esi]        ;287.17
        xor       edx, DWORD PTR [_des_SPtrans+1792+edi]        ;287.17
        mov       esi, DWORD PTR [_ks+112]                      ;272.33
        xor       esi, edx                                      ;288.17
        mov       edi, esi                                      ;288.17
        mov       ebx, esi                                      ;288.17
        and       edi, 252                                      ;288.17
        shr       ebx, 16                                       ;288.17
        and       ebx, 252                                      ;288.17
        mov       eax, DWORD PTR [_ks+116]                      ;288.17
        xor       ecx, DWORD PTR [_des_SPtrans+edi]             ;288.17
        mov       edi, esi                                      ;288.17
        shr       edi, 8                                        ;288.17
        xor       eax, edx                                      ;288.17
        and       edi, 252                                      ;288.17
        shr       esi, 24                                       ;288.17
        and       esi, 252                                      ;288.17
        ror       eax, 4                                        ;288.17
        xor       ecx, DWORD PTR [_des_SPtrans+512+edi]         ;288.17
        mov       edi, eax                                      ;288.17
        xor       ecx, DWORD PTR [_des_SPtrans+1024+ebx]        ;288.17
        mov       ebx, eax                                      ;288.17
        xor       ecx, DWORD PTR [_des_SPtrans+1536+esi]        ;288.17
        mov       esi, eax                                      ;288.17
        shr       esi, 8                                        ;288.17
        and       ebx, 252                                      ;288.17
        shr       edi, 16                                       ;288.17
        and       esi, 252                                      ;288.17
        shr       eax, 24                                       ;288.17
        and       edi, 252                                      ;288.17
        and       eax, 252                                      ;288.17
        xor       ecx, DWORD PTR [_des_SPtrans+256+ebx]         ;288.17
        xor       ecx, DWORD PTR [_des_SPtrans+768+esi]         ;288.17
        xor       ecx, DWORD PTR [_des_SPtrans+1280+edi]        ;288.17
        xor       ecx, DWORD PTR [_des_SPtrans+1792+eax]        ;288.17
        cmp       ecx, DWORD PTR [112+esp]                      ;290.27
        jne       .B2.4         ; Prob 50%                      ;290.27
                                ; LOE edx ecx xmm0 xmm1 xmm2
.B2.3:                          ; Preds .B2.34
        mov       edi, DWORD PTR [_ks+120]                      ;272.33
        xor       edi, ecx                                      ;291.19
        mov       eax, edi                                      ;291.19
        mov       ebx, edi                                      ;291.19
        shr       ebx, 8                                        ;291.19
        mov       esi, edi                                      ;291.19
        and       eax, 252                                      ;291.19
        and       ebx, 252                                      ;291.19
        shr       esi, 16                                       ;291.19
        and       esi, 252                                      ;291.19
        xor       ecx, DWORD PTR [_ks+124]                      ;291.19
        ror       ecx, 4                                        ;291.19
        xor       edx, DWORD PTR [_des_SPtrans+eax]             ;291.19
        mov       eax, ecx                                      ;291.19
        shr       edi, 24                                       ;291.19
        and       eax, 252                                      ;291.19
        xor       edx, DWORD PTR [_des_SPtrans+512+ebx]         ;291.19
        and       edi, 252                                      ;291.19
        mov       ebx, ecx                                      ;291.19
        xor       edx, DWORD PTR [_des_SPtrans+1024+esi]        ;291.19
        mov       esi, ecx                                      ;291.19
        shr       ebx, 8                                        ;291.19
        shr       esi, 16                                       ;291.19
        and       ebx, 252                                      ;291.19
        shr       ecx, 24                                       ;291.19
        and       esi, 252                                      ;291.19
        xor       edx, DWORD PTR [_des_SPtrans+1536+edi]        ;291.19
        and       ecx, 252                                      ;291.19
        xor       edx, DWORD PTR [_des_SPtrans+256+eax]         ;291.19
        xor       edx, DWORD PTR [_des_SPtrans+768+ebx]         ;291.19
        xor       edx, DWORD PTR [_des_SPtrans+1280+esi]        ;291.19
        xor       edx, DWORD PTR [_des_SPtrans+1792+ecx]        ;291.19
        cmp       edx, DWORD PTR [92+esp]                       ;292.29
        je        .B2.22        ; Prob 20%                      ;292.29
                                ; LOE xmm0 xmm1 xmm2
.B2.4:                          ; Preds .B2.34 .B2.3
        mov       eax, DWORD PTR [100+esp]                      ;300.26
        movq      xmm3, QWORD PTR [_2il0floatpacket.247]        ;299.17
        paddq     xmm1, xmm3                                    ;299.17
        lea       edx, DWORD PTR [1+eax]                        ;300.26
        mov       DWORD PTR [104+esp], edx                      ;300.26
        mov       DWORD PTR [100+esp], edx                      ;300.26
        cmp       edx, DWORD PTR [96+esp]                       ;300.39
        jb        .B2.2         ; Prob 82%                      ;300.39
                                ; LOE xmm0 xmm1 xmm2
.B2.5:                          ; Preds .B2.4                   ; Infreq
        mov       esi, DWORD PTR [88+esp]                       ;302.24
        inc       esi                                           ;302.24
        mov       DWORD PTR [104+esp], 0                        ;301.15
        mov       DWORD PTR [88+esp], esi                       ;302.24
        cmp       esi, DWORD PTR [96+esp]                       ;302.37
        jae       .B2.7         ; Prob 50%                      ;302.37
                                ; LOE rsi esi sil xmm0 xmm1
.B2.6:                          ; Preds .B2.5                   ; Infreq
        mov       eax, esi                                      ;303.13
        mov       DWORD PTR [20+esp], eax                       ;303.13
        jmp       .B2.21        ; Prob 100%                     ;303.13
                                ; LOE esi xmm0 xmm1
.B2.7:                          ; Preds .B2.5                   ; Infreq
        mov       ebx, DWORD PTR [84+esp]                       ;304.22
        xor       esi, esi                                      ;303.13
        inc       ebx                                           ;304.22
        mov       DWORD PTR [84+esp], ebx                       ;304.22
        cmp       ebx, DWORD PTR [96+esp]                       ;304.35
        jae       .B2.9         ; Prob 50%                      ;304.35
                                ; LOE rbx ebx esi bl bh xmm0 xmm1
.B2.8:                          ; Preds .B2.7                   ; Infreq
        mov       eax, ebx                                      ;305.11
        mov       DWORD PTR [24+esp], eax                       ;305.11
        mov       DWORD PTR [20+esp], 0                         ;303.13
        jmp       .B2.20        ; Prob 100%                     ;303.13
                                ; LOE ebx esi xmm0 xmm1
.B2.9:                          ; Preds .B2.7                   ; Infreq
        mov       ecx, DWORD PTR [80+esp]                       ;306.20
        xor       ebx, ebx                                      ;305.11
        inc       ecx                                           ;306.20
        mov       DWORD PTR [80+esp], ecx                       ;306.20
        cmp       ecx, DWORD PTR [96+esp]                       ;306.33
        jae       .B2.11        ; Prob 50%                      ;306.33
                                ; LOE rcx ecx ebx esi cl ch xmm0 xmm1
.B2.10:                         ; Preds .B2.9                   ; Infreq
        mov       eax, ecx                                      ;307.9
        xor       edx, edx                                      ;305.11
        mov       DWORD PTR [28+esp], eax                       ;307.9
        mov       DWORD PTR [24+esp], edx                       ;305.11
        mov       DWORD PTR [20+esp], edx                       ;303.13
        jmp       .B2.19        ; Prob 100%                     ;303.13
                                ; LOE ecx ebx esi xmm0 xmm1
.B2.11:                         ; Preds .B2.9                   ; Infreq
        mov       edx, DWORD PTR [12+esp]                       ;308.18
        xor       ecx, ecx                                      ;307.9
        inc       edx                                           ;308.18
        mov       DWORD PTR [12+esp], edx                       ;308.18
        cmp       edx, DWORD PTR [96+esp]                       ;308.31
        jae       .B2.13        ; Prob 50%                      ;308.31
                                ; LOE rdx edx ecx ebx esi dl dh xmm0 xmm1
.B2.12:                         ; Preds .B2.11                  ; Infreq
        mov       eax, edx                                      ;309.7
        xor       edi, edi                                      ;307.9
        mov       DWORD PTR [32+esp], eax                       ;309.7
        mov       DWORD PTR [28+esp], edi                       ;307.9
        mov       DWORD PTR [24+esp], edi                       ;305.11
        mov       DWORD PTR [20+esp], edi                       ;303.13
        jmp       .B2.18        ; Prob 100%                     ;303.13
                                ; LOE edx ecx ebx esi xmm0 xmm1
.B2.13:                         ; Preds .B2.11                  ; Infreq
        mov       eax, DWORD PTR [8+esp]                        ;310.16
        xor       edx, edx                                      ;309.7
        inc       eax                                           ;310.16
        mov       DWORD PTR [8+esp], eax                        ;310.16
        cmp       eax, DWORD PTR [96+esp]                       ;310.29
        jae       .B2.15        ; Prob 50%                      ;310.29
                                ; LOE rax eax edx ecx ebx esi al ah xmm0 xmm1
.B2.14:                         ; Preds .B2.13                  ; Infreq
        mov       edi, eax                                      ;311.5
        mov       DWORD PTR [36+esp], edi                       ;311.5
        xor       edi, edi                                      ;309.7
        mov       DWORD PTR [32+esp], edi                       ;309.7
        mov       DWORD PTR [28+esp], edi                       ;307.9
        mov       DWORD PTR [24+esp], edi                       ;305.11
        mov       DWORD PTR [20+esp], edi                       ;303.13
        jmp       .B2.17        ; Prob 100%                     ;303.13
                                ; LOE eax edx ecx ebx esi xmm0 xmm1
.B2.15:                         ; Preds .B2.13                  ; Infreq
        mov       edi, DWORD PTR [4+esp]                        ;312.14
        xor       eax, eax                                      ;311.5
        inc       edi                                           ;312.14
        mov       DWORD PTR [4+esp], edi                        ;312.14
        cmp       edi, DWORD PTR [96+esp]                       ;312.27
        jae       .B2.31        ; Prob 20%                      ;312.27
                                ; LOE rdi eax edx ecx ebx esi edi dil xmm0 xmm1
.B2.16:                         ; Preds .B2.15                  ; Infreq
        mov       DWORD PTR [40+esp], edi                       ;312.14
        shl       edi, 7                                        ;254.5
        mov       DWORD PTR [esp], eax                          ;
        xor       eax, eax                                      ;311.5
        mov       DWORD PTR [36+esp], eax                       ;311.5
        mov       DWORD PTR [32+esp], eax                       ;309.7
        movdqa    xmm2, XMMWORD PTR [_ks_tbl+196608+edi]        ;254.5
        movdqa    xmm3, XMMWORD PTR [_ks_tbl+196624+edi]        ;254.5
        movdqa    XMMWORD PTR [_ks+768], xmm2                   ;254.5
        movdqa    XMMWORD PTR [_ks+784], xmm3                   ;254.5
        movdqa    xmm4, XMMWORD PTR [_ks_tbl+196640+edi]        ;254.5
        movdqa    xmm5, XMMWORD PTR [_ks_tbl+196656+edi]        ;254.5
        movdqa    xmm6, XMMWORD PTR [_ks_tbl+196672+edi]        ;254.5
        movdqa    xmm7, XMMWORD PTR [_ks_tbl+196688+edi]        ;254.5
        movdqa    xmm2, XMMWORD PTR [_ks_tbl+196704+edi]        ;254.5
        movdqa    xmm3, XMMWORD PTR [_ks_tbl+196720+edi]        ;254.5
        mov       DWORD PTR [28+esp], eax                       ;307.9
        mov       DWORD PTR [24+esp], eax                       ;305.11
        mov       DWORD PTR [20+esp], eax                       ;303.13
        mov       DWORD PTR [8+esp], eax                        ;311.5
        movdqa    XMMWORD PTR [_ks+800], xmm4                   ;254.5
        movdqa    XMMWORD PTR [_ks+816], xmm5                   ;254.5
        movdqa    XMMWORD PTR [_ks+832], xmm6                   ;254.5
        movdqa    XMMWORD PTR [_ks+848], xmm7                   ;254.5
        movdqa    XMMWORD PTR [_ks+864], xmm2                   ;254.5
        movdqa    XMMWORD PTR [_ks+880], xmm3                   ;254.5
        mov       eax, DWORD PTR [esp]                          ;311.5
                                ; LOE eax edx ecx ebx esi xmm0 xmm1
.B2.17:                         ; Preds .B2.16 .B2.14           ; Infreq
        shl       eax, 7                                        ;256.7
        mov       DWORD PTR [12+esp], 0                         ;309.7
        movdqa    xmm2, XMMWORD PTR [_ks_tbl+163840+eax]        ;256.7
        por       xmm2, XMMWORD PTR [_ks+768]                   ;256.7
        movdqa    XMMWORD PTR [_ks+640], xmm2                   ;256.7
        movdqa    XMMWORD PTR [_ks+656], xmm2                   ;256.7
        movdqa    XMMWORD PTR [_ks+672], xmm2                   ;256.7
        movdqa    XMMWORD PTR [_ks+688], xmm2                   ;256.7
        movdqa    XMMWORD PTR [_ks+704], xmm2                   ;256.7
        movdqa    XMMWORD PTR [_ks+720], xmm2                   ;256.7
        movdqa    XMMWORD PTR [_ks+736], xmm2                   ;256.7
        movdqa    XMMWORD PTR [_ks+752], xmm2                   ;256.7
                                ; LOE edx ecx ebx esi xmm0 xmm1
.B2.18:                         ; Preds .B2.17 .B2.12           ; Infreq
        shl       edx, 7                                        ;258.9
        mov       DWORD PTR [80+esp], 0                         ;307.9
        movdqa    xmm2, XMMWORD PTR [_ks_tbl+131072+edx]        ;258.9
        por       xmm2, XMMWORD PTR [_ks+640]                   ;258.9
        movdqa    XMMWORD PTR [_ks+512], xmm2                   ;258.9
        movdqa    XMMWORD PTR [_ks+528], xmm2                   ;258.9
        movdqa    XMMWORD PTR [_ks+544], xmm2                   ;258.9
        movdqa    XMMWORD PTR [_ks+560], xmm2                   ;258.9
        movdqa    XMMWORD PTR [_ks+576], xmm2                   ;258.9
        movdqa    XMMWORD PTR [_ks+592], xmm2                   ;258.9
        movdqa    XMMWORD PTR [_ks+608], xmm2                   ;258.9
        movdqa    XMMWORD PTR [_ks+624], xmm2                   ;258.9
                                ; LOE ecx ebx esi xmm0 xmm1
.B2.19:                         ; Preds .B2.18 .B2.10           ; Infreq
        shl       ecx, 7                                        ;260.11
        mov       DWORD PTR [84+esp], 0                         ;305.11
        movdqa    xmm2, XMMWORD PTR [_ks_tbl+98304+ecx]         ;260.11
        por       xmm2, XMMWORD PTR [_ks+512]                   ;260.11
        movdqa    XMMWORD PTR [_ks+384], xmm2                   ;260.11
        movdqa    XMMWORD PTR [_ks+400], xmm2                   ;260.11
        movdqa    XMMWORD PTR [_ks+416], xmm2                   ;260.11
        movdqa    XMMWORD PTR [_ks+432], xmm2                   ;260.11
        movdqa    XMMWORD PTR [_ks+448], xmm2                   ;260.11
        movdqa    XMMWORD PTR [_ks+464], xmm2                   ;260.11
        movdqa    XMMWORD PTR [_ks+480], xmm2                   ;260.11
        movdqa    XMMWORD PTR [_ks+496], xmm2                   ;260.11
                                ; LOE ebx esi xmm0 xmm1
.B2.20:                         ; Preds .B2.19 .B2.8            ; Infreq
        shl       ebx, 7                                        ;262.13
        mov       DWORD PTR [88+esp], 0                         ;303.13
        movdqa    xmm2, XMMWORD PTR [_ks_tbl+65536+ebx]         ;262.13
        por       xmm2, XMMWORD PTR [_ks+384]                   ;262.13
        movdqa    XMMWORD PTR [_ks+256], xmm2                   ;262.13
        movdqa    XMMWORD PTR [_ks+272], xmm2                   ;262.13
        movdqa    XMMWORD PTR [_ks+288], xmm2                   ;262.13
        movdqa    XMMWORD PTR [_ks+304], xmm2                   ;262.13
        movdqa    XMMWORD PTR [_ks+320], xmm2                   ;262.13
        movdqa    XMMWORD PTR [_ks+336], xmm2                   ;262.13
        movdqa    XMMWORD PTR [_ks+352], xmm2                   ;262.13
        movdqa    XMMWORD PTR [_ks+368], xmm2                   ;262.13
                                ; LOE esi xmm0 xmm1
.B2.21:                         ; Preds .B2.20 .B2.6            ; Infreq
        shl       esi, 7                                        ;264.15
        mov       DWORD PTR [100+esp], 0                        ;301.15
        movdqa    xmm2, XMMWORD PTR [_ks_tbl+32768+esi]         ;264.15
        por       xmm2, XMMWORD PTR [_ks+256]                   ;264.15
        movdqa    XMMWORD PTR [_ks+128], xmm2                   ;264.15
        movdqa    XMMWORD PTR [_ks+144], xmm2                   ;264.15
        movdqa    XMMWORD PTR [_ks+160], xmm2                   ;264.15
        movdqa    XMMWORD PTR [_ks+176], xmm2                   ;264.15
        movdqa    XMMWORD PTR [_ks+192], xmm2                   ;264.15
        movdqa    XMMWORD PTR [_ks+208], xmm2                   ;264.15
        movdqa    XMMWORD PTR [_ks+224], xmm2                   ;264.15
        movdqa    XMMWORD PTR [_ks+240], xmm2                   ;264.15
        jmp       .B2.2         ; Prob 100%                     ;264.15
                                ; LOE xmm0 xmm1 xmm2
.B2.22:                         ; Preds .B2.3                   ; Infreq
        mov       eax, DWORD PTR [104+esp]                      ;301.15
        mov       DWORD PTR [16+esp], eax                       ;301.15
        movdqa    XMMWORD PTR [64+esp], xmm0                    ;248.5
        movdqa    XMMWORD PTR [48+esp], xmm0                    ;248.5
        push      OFFSET FLAT: ??_C@_0BA@A@?6Found?5password?$AA@ ;293.21
        movq      QWORD PTR [_completed], xmm1                  ;246.3
        call      _printf                                       ;293.21
                                ; LOE
.B2.23:                         ; Preds .B2.22                  ; Infreq
        push      10                                            ;294.21
        call      _putchar                                      ;294.21
                                ; LOE
.B2.35:                         ; Preds .B2.23                  ; Infreq
        add       esp, 8                                        ;294.21
                                ; LOE
.B2.24:                         ; Preds .B2.35                  ; Infreq
        xor       ebx, ebx                                      ;294.21
                                ; LOE ebx
.B2.25:                         ; Preds .B2.27 .B2.24           ; Infreq
        cmp       DWORD PTR [16+esp+ebx*4], -1                  ;294.21
        je        .B2.29        ; Prob 20%                      ;294.21
                                ; LOE ebx
.B2.26:                         ; Preds .B2.25                  ; Infreq
        mov       eax, DWORD PTR [16+esp+ebx*4]                 ;294.21
        movsx     edx, BYTE PTR [_alphabet+eax]                 ;294.21
        push      edx                                           ;294.21
        call      _putchar                                      ;294.21
                                ; LOE ebx
.B2.36:                         ; Preds .B2.26                  ; Infreq
        add       esp, 4                                        ;294.21
                                ; LOE ebx
.B2.27:                         ; Preds .B2.36                  ; Infreq
        inc       ebx                                           ;294.21
        cmp       ebx, 8                                        ;294.21
        jl        .B2.25        ; Prob 87%                      ;294.21
                                ; LOE ebx
.B2.29:                         ; Preds .B2.25 .B2.27           ; Infreq
        add       esp, 148                                      ;295.21
        pop       ebx                                           ;295.21
        pop       edi                                           ;295.21
        pop       esi                                           ;295.21
        mov       esp, ebp                                      ;295.21
        pop       ebp                                           ;295.21
        ret                                                     ;295.21
                                ; LOE
.B2.31:                         ; Preds .B2.15                  ; Infreq
        movq      QWORD PTR [_completed], xmm1                  ;246.3
        add       esp, 148                                      ;313.1
        pop       ebx                                           ;313.1
        pop       edi                                           ;313.1
        pop       esi                                           ;313.1
        mov       esp, ebp                                      ;313.1
        pop       ebp                                           ;313.1
        ret                                                     ;313.1
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
;	COMDAT _des_ecb_encrypt
TXTST2:
; -- Begin  _des_ecb_encrypt
;_des_ecb_encrypt	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _des_ecb_encrypt
; mark_begin;
       ALIGN     16
	PUBLIC _des_ecb_encrypt
_des_ecb_encrypt	PROC NEAR 
; parameter 1: 24 + esp
; parameter 2: 28 + esp
; parameter 3: 32 + esp
; parameter 4: 36 + esp
.B3.1:                          ; Preds .B3.0
        sub       esp, 20                                       ;476.1
        mov       edx, DWORD PTR [24+esp]                       ;474.6
        mov       eax, DWORD PTR [edx]                          ;480.8
        mov       ecx, DWORD PTR [4+edx]                        ;481.8
        mov       DWORD PTR [12+esp], eax                       ;480.2
        lea       eax, DWORD PTR [12+esp]                       ;483.3
        mov       DWORD PTR [4+eax], ecx                        ;481.2
        mov       edx, DWORD PTR [32+esp]                       ;483.3
        mov       ecx, DWORD PTR [36+esp]                       ;483.3
        call      _des_encrypt.                                 ;483.3
                                ; LOE ebx ebp esi edi
.B3.2:                          ; Preds .B3.1
        mov       ecx, DWORD PTR [28+esp]                       ;474.6
        mov       eax, DWORD PTR [12+esp]                       ;485.18
        mov       edx, DWORD PTR [16+esp]                       ;486.18
        mov       DWORD PTR [ecx], eax                          ;485.3
        mov       DWORD PTR [4+ecx], edx                        ;486.3
        add       esp, 20                                       ;487.1
        ret                                                     ;487.1
        ALIGN     16
                                ; LOE
; mark_end;
_des_ecb_encrypt ENDP
;_des_ecb_encrypt	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _des_ecb_encrypt
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _des_encrypt
TXTST3:
; -- Begin  _des_encrypt
;_des_encrypt	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _des_encrypt
; mark_begin;
       ALIGN     16
	PUBLIC _des_encrypt
_des_encrypt	PROC NEAR 
; parameter 1: eax
; parameter 2: edx
; parameter 3: ecx
.B4.1:                          ; Preds .B4.0
        mov       eax, DWORD PTR [4+esp]                        ;402.1
        mov       edx, DWORD PTR [8+esp]                        ;402.1
        mov       ecx, DWORD PTR [12+esp]                       ;402.1
	PUBLIC _des_encrypt.
_des_encrypt.::
        push      esi                                           ;402.1
        push      edi                                           ;402.1
        push      ebx                                           ;402.1
        push      ebp                                           ;402.1
        sub       esp, 124                                      ;402.1
        mov       edi, DWORD PTR [4+eax]                        ;408.4
        mov       ebp, edi                                      ;410.2
        shr       ebp, 4                                        ;410.2
        mov       esi, DWORD PTR [eax]                          ;407.4
        xor       ebp, esi                                      ;410.2
        and       ebp, 252645135                                ;410.2
        xor       esi, ebp                                      ;410.2
        shl       ebp, 4                                        ;410.2
        mov       ebx, esi                                      ;410.2
        shr       ebx, 16                                       ;410.2
        xor       edi, ebp                                      ;410.2
        xor       ebx, edi                                      ;410.2
        mov       DWORD PTR [8+esp], eax                        ;402.1
        movzx     eax, bx                                       ;410.2
        xor       edi, eax                                      ;410.2
        shl       eax, 16                                       ;410.2
        mov       ebx, edi                                      ;410.2
        shr       ebx, 2                                        ;410.2
        xor       esi, eax                                      ;410.2
        xor       ebx, esi                                      ;410.2
        and       ebx, 858993459                                ;410.2
        xor       esi, ebx                                      ;410.2
        shl       ebx, 2                                        ;410.2
        mov       ebp, esi                                      ;410.2
        shr       ebp, 8                                        ;410.2
        xor       edi, ebx                                      ;410.2
        xor       ebp, edi                                      ;410.2
        and       ebp, 16711935                                 ;410.2
        xor       edi, ebp                                      ;410.2
        shl       ebp, 8                                        ;410.2
        mov       ebx, edi                                      ;410.2
        xor       esi, ebp                                      ;410.2
        mov       ebp, DWORD PTR [8+edx]                        ;428.3
        mov       DWORD PTR [12+esp], ebp                       ;428.3
        mov       ebp, DWORD PTR [16+edx]                       ;429.3
        mov       DWORD PTR [20+esp], ebp                       ;429.3
        mov       ebp, DWORD PTR [24+edx]                       ;430.3
        mov       DWORD PTR [36+esp], ebp                       ;430.3
        mov       ebp, DWORD PTR [28+edx]                       ;430.3
        mov       DWORD PTR [44+esp], ebp                       ;430.3
        mov       ebp, DWORD PTR [32+edx]                       ;431.3
        mov       DWORD PTR [60+esp], ebp                       ;431.3
        mov       ebp, DWORD PTR [36+edx]                       ;431.3
        mov       DWORD PTR [120+esp], ebp                      ;431.3
        mov       ebp, DWORD PTR [40+edx]                       ;432.3
        mov       DWORD PTR [92+esp], ebp                       ;432.3
        mov       ebp, DWORD PTR [44+edx]                       ;432.3
        mov       DWORD PTR [100+esp], ebp                      ;432.3
        mov       ebp, DWORD PTR [48+edx]                       ;433.3
        mov       DWORD PTR [76+esp], ebp                       ;433.3
        mov       ebp, DWORD PTR [52+edx]                       ;433.3
        mov       DWORD PTR [104+esp], ebp                      ;433.3
        mov       ebp, DWORD PTR [56+edx]                       ;434.3
        mov       DWORD PTR [84+esp], ebp                       ;434.3
        mov       ebp, DWORD PTR [60+edx]                       ;434.3
        mov       DWORD PTR [108+esp], ebp                      ;434.3
        mov       ebp, DWORD PTR [64+edx]                       ;435.3
        mov       DWORD PTR [88+esp], ebp                       ;435.3
        mov       ebp, DWORD PTR [68+edx]                       ;435.3
        mov       DWORD PTR [96+esp], ebp                       ;435.3
        mov       ebp, DWORD PTR [72+edx]                       ;436.3
        mov       DWORD PTR [80+esp], ebp                       ;436.3
        mov       ebp, DWORD PTR [76+edx]                       ;436.3
        mov       DWORD PTR [112+esp], ebp                      ;436.3
        mov       ebp, DWORD PTR [80+edx]                       ;437.3
        mov       DWORD PTR [68+esp], ebp                       ;437.3
        mov       ebp, DWORD PTR [84+edx]                       ;437.3
        mov       DWORD PTR [116+esp], ebp                      ;437.3
        mov       ebp, DWORD PTR [88+edx]                       ;438.3
        mov       DWORD PTR [64+esp], ebp                       ;438.3
        mov       ebp, DWORD PTR [92+edx]                       ;438.3
        mov       DWORD PTR [72+esp], ebp                       ;438.3
        mov       ebp, DWORD PTR [96+edx]                       ;439.3
        mov       DWORD PTR [40+esp], ebp                       ;439.3
        mov       ebp, DWORD PTR [100+edx]                      ;439.3
        mov       DWORD PTR [48+esp], ebp                       ;439.3
        mov       ebp, DWORD PTR [104+edx]                      ;440.3
        shr       ebx, 1                                        ;410.2
        mov       DWORD PTR [24+esp], ebp                       ;440.3
        xor       ebx, esi                                      ;410.2
        mov       ebp, DWORD PTR [108+edx]                      ;440.3
        and       ebx, 1431655765                               ;410.2
        mov       DWORD PTR [52+esp], ebp                       ;440.3
        xor       esi, ebx                                      ;419.4
        mov       eax, DWORD PTR [4+edx]                        ;427.3
        add       ebx, ebx                                      ;420.4
        mov       ebp, DWORD PTR [112+edx]                      ;441.3
        xor       edi, ebx                                      ;420.4
        mov       DWORD PTR [28+esp], eax                       ;427.3
        mov       DWORD PTR [16+esp], ebp                       ;441.3
        mov       eax, DWORD PTR [12+edx]                       ;428.3
        mov       ebp, DWORD PTR [116+edx]                      ;441.3
        mov       DWORD PTR [56+esp], eax                       ;428.3
        mov       DWORD PTR [4+esp], ebp                        ;441.3
        mov       ebx, DWORD PTR [edx]                          ;427.3
        mov       eax, DWORD PTR [20+edx]                       ;429.3
        mov       ebp, DWORD PTR [120+edx]                      ;442.3
        mov       edx, DWORD PTR [124+edx]                      ;442.3
        ror       esi, 29                                       ;419.4
        ror       edi, 29                                       ;420.4
        mov       DWORD PTR [32+esp], edx                       ;442.3
        test      ecx, ecx                                      ;425.6
        mov       edx, DWORD PTR [4+esp]                        ;425.6
        je        .B4.3         ; Prob 50%                      ;425.6
                                ; LOE rdx eax edx ebx ebp esi edi dl dh
.B4.2:                          ; Preds .B4.1
        xor       ebx, esi                                      ;427.3
        mov       DWORD PTR [esp], ebp                          ;
        mov       ebp, ebx                                      ;427.3
        and       ebp, 252                                      ;427.3
        mov       DWORD PTR [4+esp], edx                        ;
        mov       edx, ebx                                      ;427.3
        shr       edx, 16                                       ;427.3
        and       edx, 252                                      ;427.3
        xor       edi, DWORD PTR [_des_SPtrans+ebp]             ;427.3
        mov       ebp, ebx                                      ;427.3
        shr       ebp, 8                                        ;427.3
        and       ebp, 252                                      ;427.3
        shr       ebx, 24                                       ;427.3
        and       ebx, 252                                      ;427.3
        mov       ecx, DWORD PTR [28+esp]                       ;427.3
        xor       edi, DWORD PTR [_des_SPtrans+512+ebp]         ;427.3
        xor       ecx, esi                                      ;427.3
        ror       ecx, 4                                        ;427.3
        xor       edi, DWORD PTR [_des_SPtrans+1024+edx]        ;427.3
        mov       edx, ecx                                      ;427.3
        xor       edi, DWORD PTR [_des_SPtrans+1536+ebx]        ;427.3
        mov       ebx, ecx                                      ;427.3
        shr       edx, 8                                        ;427.3
        mov       ebp, ecx                                      ;427.3
        and       ebx, 252                                      ;427.3
        and       edx, 252                                      ;427.3
        shr       ebp, 16                                       ;427.3
        shr       ecx, 24                                       ;427.3
        and       ebp, 252                                      ;427.3
        and       ecx, 252                                      ;427.3
        xor       edi, DWORD PTR [_des_SPtrans+256+ebx]         ;427.3
        xor       edi, DWORD PTR [_des_SPtrans+768+edx]         ;427.3
        xor       edi, DWORD PTR [_des_SPtrans+1280+ebp]        ;427.3
        xor       edi, DWORD PTR [_des_SPtrans+1792+ecx]        ;427.3
        mov       edx, DWORD PTR [12+esp]                       ;428.3
        xor       edx, edi                                      ;428.3
        mov       ecx, edx                                      ;428.3
        mov       ebx, edx                                      ;428.3
        and       ecx, 252                                      ;428.3
        shr       ebx, 16                                       ;428.3
        and       ebx, 252                                      ;428.3
        mov       ebp, DWORD PTR [56+esp]                       ;428.3
        xor       esi, DWORD PTR [_des_SPtrans+ecx]             ;428.3
        mov       ecx, edx                                      ;428.3
        shr       ecx, 8                                        ;428.3
        xor       ebp, edi                                      ;428.3
        and       ecx, 252                                      ;428.3
        shr       edx, 24                                       ;428.3
        and       edx, 252                                      ;428.3
        ror       ebp, 4                                        ;428.3
        xor       esi, DWORD PTR [_des_SPtrans+512+ecx]         ;428.3
        mov       ecx, ebp                                      ;428.3
        xor       esi, DWORD PTR [_des_SPtrans+1024+ebx]        ;428.3
        mov       ebx, ebp                                      ;428.3
        xor       esi, DWORD PTR [_des_SPtrans+1536+edx]        ;428.3
        mov       edx, ebp                                      ;428.3
        shr       edx, 8                                        ;428.3
        and       ebx, 252                                      ;428.3
        shr       ecx, 16                                       ;428.3
        and       edx, 252                                      ;428.3
        shr       ebp, 24                                       ;428.3
        and       ecx, 252                                      ;428.3
        and       ebp, 252                                      ;428.3
        xor       esi, DWORD PTR [_des_SPtrans+256+ebx]         ;428.3
        xor       esi, DWORD PTR [_des_SPtrans+768+edx]         ;428.3
        xor       esi, DWORD PTR [_des_SPtrans+1280+ecx]        ;428.3
        xor       esi, DWORD PTR [_des_SPtrans+1792+ebp]        ;428.3
        mov       ecx, DWORD PTR [20+esp]                       ;429.3
        xor       eax, esi                                      ;429.3
        xor       ecx, esi                                      ;429.3
        mov       ebp, ecx                                      ;429.3
        mov       ebx, ecx                                      ;429.3
        shr       ebx, 8                                        ;429.3
        mov       edx, ecx                                      ;429.3
        and       ebp, 252                                      ;429.3
        and       ebx, 252                                      ;429.3
        shr       edx, 16                                       ;429.3
        and       edx, 252                                      ;429.3
        ror       eax, 4                                        ;429.3
        xor       edi, DWORD PTR [_des_SPtrans+ebp]             ;429.3
        mov       ebp, eax                                      ;429.3
        xor       edi, DWORD PTR [_des_SPtrans+512+ebx]         ;429.3
        mov       ebx, eax                                      ;429.3
        shr       ecx, 24                                       ;429.3
        and       ebx, 252                                      ;429.3
        xor       edi, DWORD PTR [_des_SPtrans+1024+edx]        ;429.3
        and       ecx, 252                                      ;429.3
        mov       edx, eax                                      ;429.3
        shr       edx, 8                                        ;429.3
        shr       ebp, 16                                       ;429.3
        and       edx, 252                                      ;429.3
        shr       eax, 24                                       ;429.3
        and       ebp, 252                                      ;429.3
        xor       edi, DWORD PTR [_des_SPtrans+1536+ecx]        ;429.3
        and       eax, 252                                      ;429.3
        xor       edi, DWORD PTR [_des_SPtrans+256+ebx]         ;429.3
        xor       edi, DWORD PTR [_des_SPtrans+768+edx]         ;429.3
        xor       edi, DWORD PTR [_des_SPtrans+1280+ebp]        ;429.3
        xor       edi, DWORD PTR [_des_SPtrans+1792+eax]        ;429.3
        mov       ebp, DWORD PTR [36+esp]                       ;430.3
        xor       ebp, edi                                      ;430.3
        mov       eax, ebp                                      ;430.3
        mov       ebx, ebp                                      ;430.3
        shr       ebx, 8                                        ;430.3
        mov       edx, ebp                                      ;430.3
        and       eax, 252                                      ;430.3
        and       ebx, 252                                      ;430.3
        shr       edx, 16                                       ;430.3
        and       edx, 252                                      ;430.3
        mov       ecx, DWORD PTR [44+esp]                       ;430.3
        xor       ecx, edi                                      ;430.3
        ror       ecx, 4                                        ;430.3
        xor       esi, DWORD PTR [_des_SPtrans+eax]             ;430.3
        mov       eax, ecx                                      ;430.3
        shr       ebp, 24                                       ;430.3
        and       eax, 252                                      ;430.3
        xor       esi, DWORD PTR [_des_SPtrans+512+ebx]         ;430.3
        and       ebp, 252                                      ;430.3
        mov       ebx, ecx                                      ;430.3
        xor       esi, DWORD PTR [_des_SPtrans+1024+edx]        ;430.3
        mov       edx, ecx                                      ;430.3
        shr       ebx, 8                                        ;430.3
        shr       edx, 16                                       ;430.3
        and       ebx, 252                                      ;430.3
        shr       ecx, 24                                       ;430.3
        and       edx, 252                                      ;430.3
        xor       esi, DWORD PTR [_des_SPtrans+1536+ebp]        ;430.3
        and       ecx, 252                                      ;430.3
        xor       esi, DWORD PTR [_des_SPtrans+256+eax]         ;430.3
        xor       esi, DWORD PTR [_des_SPtrans+768+ebx]         ;430.3
        xor       esi, DWORD PTR [_des_SPtrans+1280+edx]        ;430.3
        xor       esi, DWORD PTR [_des_SPtrans+1792+ecx]        ;430.3
        mov       ebp, DWORD PTR [60+esp]                       ;431.3
        xor       ebp, esi                                      ;431.3
        mov       ecx, ebp                                      ;431.3
        mov       eax, ebp                                      ;431.3
        shr       eax, 8                                        ;431.3
        mov       ebx, ebp                                      ;431.3
        and       ecx, 252                                      ;431.3
        and       eax, 252                                      ;431.3
        shr       ebx, 16                                       ;431.3
        and       ebx, 252                                      ;431.3
        mov       edx, DWORD PTR [120+esp]                      ;431.3
        xor       edi, DWORD PTR [_des_SPtrans+ecx]             ;431.3
        xor       edx, esi                                      ;431.3
        ror       edx, 4                                        ;431.3
        xor       edi, DWORD PTR [_des_SPtrans+512+eax]         ;431.3
        mov       eax, edx                                      ;431.3
        shr       ebp, 24                                       ;431.3
        mov       ecx, edx                                      ;431.3
        xor       edi, DWORD PTR [_des_SPtrans+1024+ebx]        ;431.3
        and       ebp, 252                                      ;431.3
        mov       ebx, edx                                      ;431.3
        and       eax, 252                                      ;431.3
        shr       ebx, 8                                        ;431.3
        shr       ecx, 16                                       ;431.3
        and       ebx, 252                                      ;431.3
        shr       edx, 24                                       ;431.3
        and       ecx, 252                                      ;431.3
        xor       edi, DWORD PTR [_des_SPtrans+1536+ebp]        ;431.3
        and       edx, 252                                      ;431.3
        xor       edi, DWORD PTR [_des_SPtrans+256+eax]         ;431.3
        xor       edi, DWORD PTR [_des_SPtrans+768+ebx]         ;431.3
        xor       edi, DWORD PTR [_des_SPtrans+1280+ecx]        ;431.3
        xor       edi, DWORD PTR [_des_SPtrans+1792+edx]        ;431.3
        mov       ebp, DWORD PTR [92+esp]                       ;432.3
        xor       ebp, edi                                      ;432.3
        mov       edx, ebp                                      ;432.3
        mov       eax, ebp                                      ;432.3
        shr       eax, 8                                        ;432.3
        mov       ecx, ebp                                      ;432.3
        and       edx, 252                                      ;432.3
        and       eax, 252                                      ;432.3
        shr       ecx, 16                                       ;432.3
        and       ecx, 252                                      ;432.3
        mov       ebx, DWORD PTR [100+esp]                      ;432.3
        xor       ebx, edi                                      ;432.3
        ror       ebx, 4                                        ;432.3
        xor       esi, DWORD PTR [_des_SPtrans+edx]             ;432.3
        mov       edx, ebx                                      ;432.3
        shr       ebp, 24                                       ;432.3
        xor       esi, DWORD PTR [_des_SPtrans+512+eax]         ;432.3
        and       ebp, 252                                      ;432.3
        mov       eax, ebx                                      ;432.3
        xor       esi, DWORD PTR [_des_SPtrans+1024+ecx]        ;432.3
        mov       ecx, ebx                                      ;432.3
        shr       edx, 8                                        ;432.3
        and       eax, 252                                      ;432.3
        shr       ecx, 16                                       ;432.3
        and       edx, 252                                      ;432.3
        shr       ebx, 24                                       ;432.3
        and       ecx, 252                                      ;432.3
        xor       esi, DWORD PTR [_des_SPtrans+1536+ebp]        ;432.3
        and       ebx, 252                                      ;432.3
        xor       esi, DWORD PTR [_des_SPtrans+256+eax]         ;432.3
        xor       esi, DWORD PTR [_des_SPtrans+768+edx]         ;432.3
        xor       esi, DWORD PTR [_des_SPtrans+1280+ecx]        ;432.3
        xor       esi, DWORD PTR [_des_SPtrans+1792+ebx]        ;432.3
        mov       ebp, DWORD PTR [76+esp]                       ;433.3
        xor       ebp, esi                                      ;433.3
        mov       ebx, ebp                                      ;433.3
        mov       edx, ebp                                      ;433.3
        shr       edx, 8                                        ;433.3
        mov       ecx, ebp                                      ;433.3
        and       ebx, 252                                      ;433.3
        and       edx, 252                                      ;433.3
        shr       ecx, 16                                       ;433.3
        and       ecx, 252                                      ;433.3
        mov       eax, DWORD PTR [104+esp]                      ;433.3
        xor       eax, esi                                      ;433.3
        ror       eax, 4                                        ;433.3
        xor       edi, DWORD PTR [_des_SPtrans+ebx]             ;433.3
        mov       ebx, eax                                      ;433.3
        shr       ebp, 24                                       ;433.3
        and       ebx, 252                                      ;433.3
        xor       edi, DWORD PTR [_des_SPtrans+512+edx]         ;433.3
        and       ebp, 252                                      ;433.3
        mov       edx, eax                                      ;433.3
        xor       edi, DWORD PTR [_des_SPtrans+1024+ecx]        ;433.3
        mov       ecx, eax                                      ;433.3
        shr       edx, 8                                        ;433.3
        shr       ecx, 16                                       ;433.3
        and       edx, 252                                      ;433.3
        shr       eax, 24                                       ;433.3
        and       ecx, 252                                      ;433.3
        xor       edi, DWORD PTR [_des_SPtrans+1536+ebp]        ;433.3
        and       eax, 252                                      ;433.3
        xor       edi, DWORD PTR [_des_SPtrans+256+ebx]         ;433.3
        xor       edi, DWORD PTR [_des_SPtrans+768+edx]         ;433.3
        xor       edi, DWORD PTR [_des_SPtrans+1280+ecx]        ;433.3
        xor       edi, DWORD PTR [_des_SPtrans+1792+eax]        ;433.3
        mov       ecx, DWORD PTR [84+esp]                       ;434.3
        xor       ecx, edi                                      ;434.3
        mov       eax, ecx                                      ;434.3
        mov       ebx, ecx                                      ;434.3
        shr       ebx, 8                                        ;434.3
        mov       edx, ecx                                      ;434.3
        and       eax, 252                                      ;434.3
        and       ebx, 252                                      ;434.3
        shr       edx, 16                                       ;434.3
        and       edx, 252                                      ;434.3
        mov       ebp, DWORD PTR [108+esp]                      ;434.3
        xor       ebp, edi                                      ;434.3
        ror       ebp, 4                                        ;434.3
        xor       esi, DWORD PTR [_des_SPtrans+eax]             ;434.3
        mov       eax, ebp                                      ;434.3
        shr       ecx, 24                                       ;434.3
        and       eax, 252                                      ;434.3
        xor       esi, DWORD PTR [_des_SPtrans+512+ebx]         ;434.3
        and       ecx, 252                                      ;434.3
        mov       ebx, ebp                                      ;434.3
        xor       esi, DWORD PTR [_des_SPtrans+1024+edx]        ;434.3
        mov       edx, ebp                                      ;434.3
        shr       ebx, 8                                        ;434.3
        shr       edx, 16                                       ;434.3
        and       ebx, 252                                      ;434.3
        shr       ebp, 24                                       ;434.3
        and       edx, 252                                      ;434.3
        xor       esi, DWORD PTR [_des_SPtrans+1536+ecx]        ;434.3
        and       ebp, 252                                      ;434.3
        xor       esi, DWORD PTR [_des_SPtrans+256+eax]         ;434.3
        xor       esi, DWORD PTR [_des_SPtrans+768+ebx]         ;434.3
        xor       esi, DWORD PTR [_des_SPtrans+1280+edx]        ;434.3
        xor       esi, DWORD PTR [_des_SPtrans+1792+ebp]        ;434.3
        mov       edx, DWORD PTR [88+esp]                       ;435.3
        xor       edx, esi                                      ;435.3
        mov       ebp, edx                                      ;435.3
        mov       eax, edx                                      ;435.3
        shr       eax, 8                                        ;435.3
        mov       ebx, edx                                      ;435.3
        and       ebp, 252                                      ;435.3
        and       eax, 252                                      ;435.3
        shr       ebx, 16                                       ;435.3
        and       ebx, 252                                      ;435.3
        mov       ecx, DWORD PTR [96+esp]                       ;435.3
        xor       edi, DWORD PTR [_des_SPtrans+ebp]             ;435.3
        xor       ecx, esi                                      ;435.3
        ror       ecx, 4                                        ;435.3
        xor       edi, DWORD PTR [_des_SPtrans+512+eax]         ;435.3
        mov       eax, ecx                                      ;435.3
        shr       edx, 24                                       ;435.3
        mov       ebp, ecx                                      ;435.3
        xor       edi, DWORD PTR [_des_SPtrans+1024+ebx]        ;435.3
        and       edx, 252                                      ;435.3
        mov       ebx, ecx                                      ;435.3
        and       eax, 252                                      ;435.3
        shr       ebx, 8                                        ;435.3
        shr       ebp, 16                                       ;435.3
        and       ebx, 252                                      ;435.3
        shr       ecx, 24                                       ;435.3
        and       ebp, 252                                      ;435.3
        xor       edi, DWORD PTR [_des_SPtrans+1536+edx]        ;435.3
        and       ecx, 252                                      ;435.3
        xor       edi, DWORD PTR [_des_SPtrans+256+eax]         ;435.3
        xor       edi, DWORD PTR [_des_SPtrans+768+ebx]         ;435.3
        xor       edi, DWORD PTR [_des_SPtrans+1280+ebp]        ;435.3
        xor       edi, DWORD PTR [_des_SPtrans+1792+ecx]        ;435.3
        mov       ebp, DWORD PTR [80+esp]                       ;436.3
        xor       ebp, edi                                      ;436.3
        mov       ecx, ebp                                      ;436.3
        mov       eax, ebp                                      ;436.3
        shr       eax, 8                                        ;436.3
        mov       ebx, ebp                                      ;436.3
        and       ecx, 252                                      ;436.3
        and       eax, 252                                      ;436.3
        shr       ebx, 16                                       ;436.3
        and       ebx, 252                                      ;436.3
        mov       edx, DWORD PTR [112+esp]                      ;436.3
        xor       esi, DWORD PTR [_des_SPtrans+ecx]             ;436.3
        xor       edx, edi                                      ;436.3
        ror       edx, 4                                        ;436.3
        xor       esi, DWORD PTR [_des_SPtrans+512+eax]         ;436.3
        mov       eax, edx                                      ;436.3
        shr       ebp, 24                                       ;436.3
        mov       ecx, edx                                      ;436.3
        xor       esi, DWORD PTR [_des_SPtrans+1024+ebx]        ;436.3
        and       ebp, 252                                      ;436.3
        mov       ebx, edx                                      ;436.3
        and       eax, 252                                      ;436.3
        shr       ebx, 8                                        ;436.3
        shr       ecx, 16                                       ;436.3
        and       ebx, 252                                      ;436.3
        shr       edx, 24                                       ;436.3
        and       ecx, 252                                      ;436.3
        xor       esi, DWORD PTR [_des_SPtrans+1536+ebp]        ;436.3
        and       edx, 252                                      ;436.3
        xor       esi, DWORD PTR [_des_SPtrans+256+eax]         ;436.3
        xor       esi, DWORD PTR [_des_SPtrans+768+ebx]         ;436.3
        xor       esi, DWORD PTR [_des_SPtrans+1280+ecx]        ;436.3
        xor       esi, DWORD PTR [_des_SPtrans+1792+edx]        ;436.3
        mov       ebp, DWORD PTR [68+esp]                       ;437.3
        xor       ebp, esi                                      ;437.3
        mov       edx, ebp                                      ;437.3
        mov       eax, ebp                                      ;437.3
        shr       eax, 8                                        ;437.3
        mov       ecx, ebp                                      ;437.3
        and       edx, 252                                      ;437.3
        and       eax, 252                                      ;437.3
        shr       ecx, 16                                       ;437.3
        and       ecx, 252                                      ;437.3
        mov       ebx, DWORD PTR [116+esp]                      ;437.3
        xor       ebx, esi                                      ;437.3
        ror       ebx, 4                                        ;437.3
        xor       edi, DWORD PTR [_des_SPtrans+edx]             ;437.3
        mov       edx, ebx                                      ;437.3
        shr       ebp, 24                                       ;437.3
        xor       edi, DWORD PTR [_des_SPtrans+512+eax]         ;437.3
        and       ebp, 252                                      ;437.3
        mov       eax, ebx                                      ;437.3
        xor       edi, DWORD PTR [_des_SPtrans+1024+ecx]        ;437.3
        mov       ecx, ebx                                      ;437.3
        shr       edx, 8                                        ;437.3
        and       eax, 252                                      ;437.3
        shr       ecx, 16                                       ;437.3
        and       edx, 252                                      ;437.3
        shr       ebx, 24                                       ;437.3
        and       ecx, 252                                      ;437.3
        xor       edi, DWORD PTR [_des_SPtrans+1536+ebp]        ;437.3
        and       ebx, 252                                      ;437.3
        xor       edi, DWORD PTR [_des_SPtrans+256+eax]         ;437.3
        xor       edi, DWORD PTR [_des_SPtrans+768+edx]         ;437.3
        xor       edi, DWORD PTR [_des_SPtrans+1280+ecx]        ;437.3
        xor       edi, DWORD PTR [_des_SPtrans+1792+ebx]        ;437.3
        mov       ebp, DWORD PTR [64+esp]                       ;438.3
        xor       ebp, edi                                      ;438.3
        mov       ebx, ebp                                      ;438.3
        mov       edx, ebp                                      ;438.3
        shr       edx, 8                                        ;438.3
        mov       ecx, ebp                                      ;438.3
        and       ebx, 252                                      ;438.3
        and       edx, 252                                      ;438.3
        shr       ecx, 16                                       ;438.3
        and       ecx, 252                                      ;438.3
        mov       eax, DWORD PTR [72+esp]                       ;438.3
        xor       esi, DWORD PTR [_des_SPtrans+ebx]             ;438.3
        xor       eax, edi                                      ;438.3
        ror       eax, 4                                        ;438.3
        xor       esi, DWORD PTR [_des_SPtrans+512+edx]         ;438.3
        mov       edx, eax                                      ;438.3
        shr       ebp, 24                                       ;438.3
        mov       ebx, eax                                      ;438.3
        xor       esi, DWORD PTR [_des_SPtrans+1024+ecx]        ;438.3
        and       ebp, 252                                      ;438.3
        mov       ecx, eax                                      ;438.3
        and       edx, 252                                      ;438.3
        shr       ecx, 8                                        ;438.3
        shr       ebx, 16                                       ;438.3
        and       ecx, 252                                      ;438.3
        shr       eax, 24                                       ;438.3
        and       ebx, 252                                      ;438.3
        xor       esi, DWORD PTR [_des_SPtrans+1536+ebp]        ;438.3
        and       eax, 252                                      ;438.3
        xor       esi, DWORD PTR [_des_SPtrans+256+edx]         ;438.3
        xor       esi, DWORD PTR [_des_SPtrans+768+ecx]         ;438.3
        xor       esi, DWORD PTR [_des_SPtrans+1280+ebx]        ;438.3
        xor       esi, DWORD PTR [_des_SPtrans+1792+eax]        ;438.3
        mov       eax, DWORD PTR [48+esp]                       ;439.3
        xor       eax, esi                                      ;439.3
        ror       eax, 4                                        ;439.3
        xor       DWORD PTR [40+esp], esi                       ;439.3
        mov       ebp, DWORD PTR [esp]                          ;439.3
        mov       edx, DWORD PTR [4+esp]                        ;439.3
        mov       DWORD PTR [48+esp], eax                       ;439.3
                                ; LOE rdx rbp edx ebp esi edi dl dh bpl
.B4.7:                          ; Preds .B4.2
        mov       DWORD PTR [esp], ebp                          ;
        mov       ebp, DWORD PTR [40+esp]                       ;439.3
        mov       eax, ebp                                      ;439.3
        mov       ecx, ebp                                      ;439.3
        mov       ebx, ebp                                      ;439.3
        shr       ecx, 8                                        ;439.3
        and       eax, 252                                      ;439.3
        shr       ebx, 16                                       ;439.3
        and       ecx, 252                                      ;439.3
        and       ebx, 252                                      ;439.3
        shr       ebp, 24                                       ;439.3
        xor       edi, DWORD PTR [_des_SPtrans+eax]             ;439.3
        and       ebp, 252                                      ;439.3
        xor       edi, DWORD PTR [_des_SPtrans+512+ecx]         ;439.3
        xor       edi, DWORD PTR [_des_SPtrans+1024+ebx]        ;439.3
        mov       ebx, DWORD PTR [48+esp]                       ;439.3
        mov       eax, ebx                                      ;439.3
        mov       ecx, ebx                                      ;439.3
        and       eax, 252                                      ;439.3
        xor       edi, DWORD PTR [_des_SPtrans+1536+ebp]        ;439.3
        mov       ebp, ebx                                      ;439.3
        shr       ecx, 8                                        ;439.3
        shr       ebp, 16                                       ;439.3
        and       ecx, 252                                      ;439.3
        shr       ebx, 24                                       ;439.3
        and       ebp, 252                                      ;439.3
        and       ebx, 252                                      ;439.3
        xor       edi, DWORD PTR [_des_SPtrans+256+eax]         ;439.3
        xor       edi, DWORD PTR [_des_SPtrans+768+ecx]         ;439.3
        xor       edi, DWORD PTR [_des_SPtrans+1280+ebp]        ;439.3
        xor       edi, DWORD PTR [_des_SPtrans+1792+ebx]        ;439.3
        mov       ebx, DWORD PTR [24+esp]                       ;440.3
        xor       ebx, edi                                      ;440.3
        mov       eax, ebx                                      ;440.3
        mov       ecx, ebx                                      ;440.3
        and       eax, 252                                      ;440.3
        shr       ecx, 16                                       ;440.3
        and       ecx, 252                                      ;440.3
        mov       ebp, DWORD PTR [52+esp]                       ;440.3
        xor       esi, DWORD PTR [_des_SPtrans+eax]             ;440.3
        mov       eax, ebx                                      ;440.3
        shr       eax, 8                                        ;440.3
        xor       ebp, edi                                      ;440.3
        and       eax, 252                                      ;440.3
        shr       ebx, 24                                       ;440.3
        and       ebx, 252                                      ;440.3
        ror       ebp, 4                                        ;440.3
        xor       esi, DWORD PTR [_des_SPtrans+512+eax]         ;440.3
        mov       eax, ebp                                      ;440.3
        xor       esi, DWORD PTR [_des_SPtrans+1024+ecx]        ;440.3
        mov       ecx, ebp                                      ;440.3
        xor       esi, DWORD PTR [_des_SPtrans+1536+ebx]        ;440.3
        mov       ebx, ebp                                      ;440.3
        shr       ebx, 8                                        ;440.3
        and       ecx, 252                                      ;440.3
        shr       eax, 16                                       ;440.3
        and       ebx, 252                                      ;440.3
        shr       ebp, 24                                       ;440.3
        and       eax, 252                                      ;440.3
        and       ebp, 252                                      ;440.3
        xor       esi, DWORD PTR [_des_SPtrans+256+ecx]         ;440.3
        xor       esi, DWORD PTR [_des_SPtrans+768+ebx]         ;440.3
        xor       esi, DWORD PTR [_des_SPtrans+1280+eax]        ;440.3
        xor       esi, DWORD PTR [_des_SPtrans+1792+ebp]        ;440.3
        mov       ebx, DWORD PTR [16+esp]                       ;441.3
        xor       edx, esi                                      ;441.3
        xor       ebx, esi                                      ;441.3
        mov       ebp, ebx                                      ;441.3
        mov       eax, ebx                                      ;441.3
        shr       eax, 8                                        ;441.3
        mov       ecx, ebx                                      ;441.3
        and       ebp, 252                                      ;441.3
        and       eax, 252                                      ;441.3
        shr       ecx, 16                                       ;441.3
        and       ecx, 252                                      ;441.3
        ror       edx, 4                                        ;441.3
        xor       edi, DWORD PTR [_des_SPtrans+ebp]             ;441.3
        mov       ebp, edx                                      ;441.3
        xor       edi, DWORD PTR [_des_SPtrans+512+eax]         ;441.3
        mov       eax, edx                                      ;441.3
        shr       ebx, 24                                       ;441.3
        and       eax, 252                                      ;441.3
        xor       edi, DWORD PTR [_des_SPtrans+1024+ecx]        ;441.3
        and       ebx, 252                                      ;441.3
        mov       ecx, edx                                      ;441.3
        shr       ecx, 8                                        ;441.3
        shr       ebp, 16                                       ;441.3
        and       ecx, 252                                      ;441.3
        shr       edx, 24                                       ;441.3
        and       ebp, 252                                      ;441.3
        xor       edi, DWORD PTR [_des_SPtrans+1536+ebx]        ;441.3
        and       edx, 252                                      ;441.3
        xor       edi, DWORD PTR [_des_SPtrans+256+eax]         ;441.3
        xor       edi, DWORD PTR [_des_SPtrans+768+ecx]         ;441.3
        xor       edi, DWORD PTR [_des_SPtrans+1280+ebp]        ;441.3
        xor       edi, DWORD PTR [_des_SPtrans+1792+edx]        ;441.3
        mov       eax, DWORD PTR [esp]                          ;442.3
        xor       eax, edi                                      ;442.3
        mov       ecx, eax                                      ;442.3
        mov       ebx, eax                                      ;442.3
        shr       ebx, 8                                        ;442.3
        mov       ebp, eax                                      ;442.3
        and       ecx, 252                                      ;442.3
        and       ebx, 252                                      ;442.3
        shr       ebp, 16                                       ;442.3
        shr       eax, 24                                       ;442.3
        and       ebp, 252                                      ;442.3
        and       eax, 252                                      ;442.3
        xor       esi, DWORD PTR [_des_SPtrans+ecx]             ;442.3
        mov       edx, DWORD PTR [32+esp]                       ;442.3
        xor       esi, DWORD PTR [_des_SPtrans+512+ebx]         ;442.3
        xor       edx, edi                                      ;442.3
        ror       edx, 4                                        ;442.3
        xor       esi, DWORD PTR [_des_SPtrans+1024+ebp]        ;442.3
        mov       ecx, edx                                      ;442.3
        xor       esi, DWORD PTR [_des_SPtrans+1536+eax]        ;442.3
        mov       eax, edx                                      ;442.3
        mov       DWORD PTR [4+esp], edi                        ;441.3
        mov       edi, edx                                      ;442.3
        shr       ecx, 8                                        ;442.3
        and       eax, 252                                      ;442.3
        shr       edi, 16                                       ;442.3
        and       ecx, 252                                      ;442.3
        shr       edx, 24                                       ;442.3
        and       edi, 252                                      ;442.3
        and       edx, 252                                      ;442.3
        xor       esi, DWORD PTR [_des_SPtrans+256+eax]         ;442.3
        xor       esi, DWORD PTR [_des_SPtrans+768+ecx]         ;442.3
        xor       esi, DWORD PTR [_des_SPtrans+1280+edi]        ;442.3
        xor       esi, DWORD PTR [_des_SPtrans+1792+edx]        ;442.3
        mov       edi, DWORD PTR [4+esp]                        ;442.3
        jmp       .B4.4         ; Prob 100%                     ;442.3
                                ; LOE rdi esi edi dil
.B4.3:                          ; Preds .B4.1
        xor       ebp, esi                                      ;446.3
        mov       ecx, ebp                                      ;446.3
        and       ecx, 252                                      ;446.3
        mov       DWORD PTR [4+esp], eax                        ;
        mov       eax, ebp                                      ;446.3
        shr       eax, 16                                       ;446.3
        and       eax, 252                                      ;446.3
        xor       edi, DWORD PTR [_des_SPtrans+ecx]             ;446.3
        mov       ecx, ebp                                      ;446.3
        shr       ecx, 8                                        ;446.3
        and       ecx, 252                                      ;446.3
        shr       ebp, 24                                       ;446.3
        and       ebp, 252                                      ;446.3
        mov       DWORD PTR [esp], ebx                          ;
        mov       ebx, DWORD PTR [32+esp]                       ;446.3
        xor       edi, DWORD PTR [_des_SPtrans+512+ecx]         ;446.3
        xor       ebx, esi                                      ;446.3
        ror       ebx, 4                                        ;446.3
        xor       edi, DWORD PTR [_des_SPtrans+1024+eax]        ;446.3
        mov       eax, ebx                                      ;446.3
        xor       edi, DWORD PTR [_des_SPtrans+1536+ebp]        ;446.3
        mov       ebp, ebx                                      ;446.3
        shr       eax, 8                                        ;446.3
        mov       ecx, ebx                                      ;446.3
        and       ebp, 252                                      ;446.3
        and       eax, 252                                      ;446.3
        shr       ecx, 16                                       ;446.3
        shr       ebx, 24                                       ;446.3
        and       ecx, 252                                      ;446.3
        and       ebx, 252                                      ;446.3
        xor       edi, DWORD PTR [_des_SPtrans+256+ebp]         ;446.3
        xor       edi, DWORD PTR [_des_SPtrans+768+eax]         ;446.3
        xor       edi, DWORD PTR [_des_SPtrans+1280+ecx]        ;446.3
        xor       edi, DWORD PTR [_des_SPtrans+1792+ebx]        ;446.3
        mov       ecx, DWORD PTR [16+esp]                       ;447.3
        xor       edx, edi                                      ;447.3
        xor       ecx, edi                                      ;447.3
        mov       ebx, ecx                                      ;447.3
        mov       ebp, ecx                                      ;447.3
        shr       ebp, 8                                        ;447.3
        mov       eax, ecx                                      ;447.3
        and       ebx, 252                                      ;447.3
        and       ebp, 252                                      ;447.3
        shr       eax, 16                                       ;447.3
        and       eax, 252                                      ;447.3
        ror       edx, 4                                        ;447.3
        xor       esi, DWORD PTR [_des_SPtrans+ebx]             ;447.3
        mov       ebx, edx                                      ;447.3
        xor       esi, DWORD PTR [_des_SPtrans+512+ebp]         ;447.3
        mov       ebp, edx                                      ;447.3
        shr       ecx, 24                                       ;447.3
        and       ebp, 252                                      ;447.3
        xor       esi, DWORD PTR [_des_SPtrans+1024+eax]        ;447.3
        and       ecx, 252                                      ;447.3
        mov       eax, edx                                      ;447.3
        shr       eax, 8                                        ;447.3
        shr       ebx, 16                                       ;447.3
        and       eax, 252                                      ;447.3
        shr       edx, 24                                       ;447.3
        and       ebx, 252                                      ;447.3
        xor       esi, DWORD PTR [_des_SPtrans+1536+ecx]        ;447.3
        and       edx, 252                                      ;447.3
        xor       esi, DWORD PTR [_des_SPtrans+256+ebp]         ;447.3
        xor       esi, DWORD PTR [_des_SPtrans+768+eax]         ;447.3
        xor       esi, DWORD PTR [_des_SPtrans+1280+ebx]        ;447.3
        xor       esi, DWORD PTR [_des_SPtrans+1792+edx]        ;447.3
        mov       ebx, DWORD PTR [24+esp]                       ;448.3
        xor       ebx, esi                                      ;448.3
        mov       ebp, ebx                                      ;448.3
        mov       eax, ebx                                      ;448.3
        shr       eax, 8                                        ;448.3
        mov       ecx, ebx                                      ;448.3
        and       ebp, 252                                      ;448.3
        and       eax, 252                                      ;448.3
        shr       ecx, 16                                       ;448.3
        and       ecx, 252                                      ;448.3
        mov       edx, DWORD PTR [52+esp]                       ;448.3
        xor       edx, esi                                      ;448.3
        ror       edx, 4                                        ;448.3
        xor       edi, DWORD PTR [_des_SPtrans+ebp]             ;448.3
        mov       ebp, edx                                      ;448.3
        shr       ebx, 24                                       ;448.3
        and       ebp, 252                                      ;448.3
        xor       edi, DWORD PTR [_des_SPtrans+512+eax]         ;448.3
        and       ebx, 252                                      ;448.3
        mov       eax, edx                                      ;448.3
        xor       edi, DWORD PTR [_des_SPtrans+1024+ecx]        ;448.3
        mov       ecx, edx                                      ;448.3
        shr       eax, 8                                        ;448.3
        shr       ecx, 16                                       ;448.3
        and       eax, 252                                      ;448.3
        shr       edx, 24                                       ;448.3
        and       ecx, 252                                      ;448.3
        xor       edi, DWORD PTR [_des_SPtrans+1536+ebx]        ;448.3
        and       edx, 252                                      ;448.3
        xor       edi, DWORD PTR [_des_SPtrans+256+ebp]         ;448.3
        xor       edi, DWORD PTR [_des_SPtrans+768+eax]         ;448.3
        xor       edi, DWORD PTR [_des_SPtrans+1280+ecx]        ;448.3
        xor       edi, DWORD PTR [_des_SPtrans+1792+edx]        ;448.3
        mov       ebx, DWORD PTR [40+esp]                       ;449.3
        xor       ebx, edi                                      ;449.3
        mov       edx, ebx                                      ;449.3
        mov       ebp, ebx                                      ;449.3
        shr       ebp, 8                                        ;449.3
        mov       eax, ebx                                      ;449.3
        and       edx, 252                                      ;449.3
        and       ebp, 252                                      ;449.3
        shr       eax, 16                                       ;449.3
        and       eax, 252                                      ;449.3
        mov       ecx, DWORD PTR [48+esp]                       ;449.3
        xor       ecx, edi                                      ;449.3
        ror       ecx, 4                                        ;449.3
        xor       esi, DWORD PTR [_des_SPtrans+edx]             ;449.3
        mov       edx, ecx                                      ;449.3
        shr       ebx, 24                                       ;449.3
        and       edx, 252                                      ;449.3
        xor       esi, DWORD PTR [_des_SPtrans+512+ebp]         ;449.3
        and       ebx, 252                                      ;449.3
        mov       ebp, ecx                                      ;449.3
        xor       esi, DWORD PTR [_des_SPtrans+1024+eax]        ;449.3
        mov       eax, ecx                                      ;449.3
        shr       ebp, 8                                        ;449.3
        shr       eax, 16                                       ;449.3
        and       ebp, 252                                      ;449.3
        shr       ecx, 24                                       ;449.3
        and       eax, 252                                      ;449.3
        xor       esi, DWORD PTR [_des_SPtrans+1536+ebx]        ;449.3
        and       ecx, 252                                      ;449.3
        xor       esi, DWORD PTR [_des_SPtrans+256+edx]         ;449.3
        xor       esi, DWORD PTR [_des_SPtrans+768+ebp]         ;449.3
        xor       esi, DWORD PTR [_des_SPtrans+1280+eax]        ;449.3
        xor       esi, DWORD PTR [_des_SPtrans+1792+ecx]        ;449.3
        mov       ebx, DWORD PTR [64+esp]                       ;450.3
        xor       ebx, esi                                      ;450.3
        mov       ecx, ebx                                      ;450.3
        mov       edx, ebx                                      ;450.3
        shr       edx, 8                                        ;450.3
        mov       ebp, ebx                                      ;450.3
        and       ecx, 252                                      ;450.3
        and       edx, 252                                      ;450.3
        shr       ebp, 16                                       ;450.3
        and       ebp, 252                                      ;450.3
        mov       eax, DWORD PTR [72+esp]                       ;450.3
        xor       edi, DWORD PTR [_des_SPtrans+ecx]             ;450.3
        xor       eax, esi                                      ;450.3
        ror       eax, 4                                        ;450.3
        xor       edi, DWORD PTR [_des_SPtrans+512+edx]         ;450.3
        mov       edx, eax                                      ;450.3
        shr       ebx, 24                                       ;450.3
        mov       ecx, eax                                      ;450.3
        xor       edi, DWORD PTR [_des_SPtrans+1024+ebp]        ;450.3
        and       ebx, 252                                      ;450.3
        mov       ebp, eax                                      ;450.3
        and       edx, 252                                      ;450.3
        shr       ebp, 8                                        ;450.3
        shr       ecx, 16                                       ;450.3
        and       ebp, 252                                      ;450.3
        shr       eax, 24                                       ;450.3
        and       ecx, 252                                      ;450.3
        xor       edi, DWORD PTR [_des_SPtrans+1536+ebx]        ;450.3
        and       eax, 252                                      ;450.3
        xor       edi, DWORD PTR [_des_SPtrans+256+edx]         ;450.3
        xor       edi, DWORD PTR [_des_SPtrans+768+ebp]         ;450.3
        xor       edi, DWORD PTR [_des_SPtrans+1280+ecx]        ;450.3
        xor       edi, DWORD PTR [_des_SPtrans+1792+eax]        ;450.3
        mov       ebx, DWORD PTR [68+esp]                       ;451.3
        xor       ebx, edi                                      ;451.3
        mov       eax, ebx                                      ;451.3
        mov       edx, ebx                                      ;451.3
        shr       edx, 8                                        ;451.3
        mov       ecx, ebx                                      ;451.3
        and       eax, 252                                      ;451.3
        and       edx, 252                                      ;451.3
        shr       ecx, 16                                       ;451.3
        and       ecx, 252                                      ;451.3
        mov       ebp, DWORD PTR [116+esp]                      ;451.3
        xor       ebp, edi                                      ;451.3
        ror       ebp, 4                                        ;451.3
        xor       esi, DWORD PTR [_des_SPtrans+eax]             ;451.3
        mov       eax, ebp                                      ;451.3
        shr       ebx, 24                                       ;451.3
        xor       esi, DWORD PTR [_des_SPtrans+512+edx]         ;451.3
        and       ebx, 252                                      ;451.3
        mov       edx, ebp                                      ;451.3
        xor       esi, DWORD PTR [_des_SPtrans+1024+ecx]        ;451.3
        mov       ecx, ebp                                      ;451.3
        shr       eax, 8                                        ;451.3
        and       edx, 252                                      ;451.3
        shr       ecx, 16                                       ;451.3
        and       eax, 252                                      ;451.3
        shr       ebp, 24                                       ;451.3
        and       ecx, 252                                      ;451.3
        xor       esi, DWORD PTR [_des_SPtrans+1536+ebx]        ;451.3
        and       ebp, 252                                      ;451.3
        xor       esi, DWORD PTR [_des_SPtrans+256+edx]         ;451.3
        xor       esi, DWORD PTR [_des_SPtrans+768+eax]         ;451.3
        xor       esi, DWORD PTR [_des_SPtrans+1280+ecx]        ;451.3
        xor       esi, DWORD PTR [_des_SPtrans+1792+ebp]        ;451.3
        mov       ebx, DWORD PTR [80+esp]                       ;452.3
        xor       ebx, esi                                      ;452.3
        mov       ebp, ebx                                      ;452.3
        mov       eax, ebx                                      ;452.3
        shr       eax, 8                                        ;452.3
        mov       ecx, ebx                                      ;452.3
        and       ebp, 252                                      ;452.3
        and       eax, 252                                      ;452.3
        shr       ecx, 16                                       ;452.3
        and       ecx, 252                                      ;452.3
        mov       edx, DWORD PTR [112+esp]                      ;452.3
        xor       edx, esi                                      ;452.3
        ror       edx, 4                                        ;452.3
        xor       edi, DWORD PTR [_des_SPtrans+ebp]             ;452.3
        mov       ebp, edx                                      ;452.3
        shr       ebx, 24                                       ;452.3
        and       ebp, 252                                      ;452.3
        xor       edi, DWORD PTR [_des_SPtrans+512+eax]         ;452.3
        and       ebx, 252                                      ;452.3
        mov       eax, edx                                      ;452.3
        xor       edi, DWORD PTR [_des_SPtrans+1024+ecx]        ;452.3
        mov       ecx, edx                                      ;452.3
        shr       eax, 8                                        ;452.3
        shr       ecx, 16                                       ;452.3
        and       eax, 252                                      ;452.3
        shr       edx, 24                                       ;452.3
        and       ecx, 252                                      ;452.3
        xor       edi, DWORD PTR [_des_SPtrans+1536+ebx]        ;452.3
        and       edx, 252                                      ;452.3
        xor       edi, DWORD PTR [_des_SPtrans+256+ebp]         ;452.3
        xor       edi, DWORD PTR [_des_SPtrans+768+eax]         ;452.3
        xor       edi, DWORD PTR [_des_SPtrans+1280+ecx]        ;452.3
        xor       edi, DWORD PTR [_des_SPtrans+1792+edx]        ;452.3
        mov       ecx, DWORD PTR [88+esp]                       ;453.3
        xor       ecx, edi                                      ;453.3
        mov       edx, ecx                                      ;453.3
        mov       ebp, ecx                                      ;453.3
        shr       ebp, 8                                        ;453.3
        mov       eax, ecx                                      ;453.3
        and       edx, 252                                      ;453.3
        and       ebp, 252                                      ;453.3
        shr       eax, 16                                       ;453.3
        and       eax, 252                                      ;453.3
        mov       ebx, DWORD PTR [96+esp]                       ;453.3
        xor       ebx, edi                                      ;453.3
        ror       ebx, 4                                        ;453.3
        xor       esi, DWORD PTR [_des_SPtrans+edx]             ;453.3
        mov       edx, ebx                                      ;453.3
        shr       ecx, 24                                       ;453.3
        and       edx, 252                                      ;453.3
        xor       esi, DWORD PTR [_des_SPtrans+512+ebp]         ;453.3
        and       ecx, 252                                      ;453.3
        mov       ebp, ebx                                      ;453.3
        xor       esi, DWORD PTR [_des_SPtrans+1024+eax]        ;453.3
        mov       eax, ebx                                      ;453.3
        shr       ebp, 8                                        ;453.3
        shr       eax, 16                                       ;453.3
        and       ebp, 252                                      ;453.3
        shr       ebx, 24                                       ;453.3
        and       eax, 252                                      ;453.3
        xor       esi, DWORD PTR [_des_SPtrans+1536+ecx]        ;453.3
        and       ebx, 252                                      ;453.3
        xor       esi, DWORD PTR [_des_SPtrans+256+edx]         ;453.3
        xor       esi, DWORD PTR [_des_SPtrans+768+ebp]         ;453.3
        xor       esi, DWORD PTR [_des_SPtrans+1280+eax]        ;453.3
        xor       esi, DWORD PTR [_des_SPtrans+1792+ebx]        ;453.3
        mov       eax, DWORD PTR [84+esp]                       ;454.3
        xor       eax, esi                                      ;454.3
        mov       ebx, eax                                      ;454.3
        mov       edx, eax                                      ;454.3
        shr       edx, 8                                        ;454.3
        mov       ebp, eax                                      ;454.3
        and       ebx, 252                                      ;454.3
        and       edx, 252                                      ;454.3
        shr       ebp, 16                                       ;454.3
        and       ebp, 252                                      ;454.3
        mov       ecx, DWORD PTR [108+esp]                      ;454.3
        xor       edi, DWORD PTR [_des_SPtrans+ebx]             ;454.3
        xor       ecx, esi                                      ;454.3
        ror       ecx, 4                                        ;454.3
        xor       edi, DWORD PTR [_des_SPtrans+512+edx]         ;454.3
        mov       edx, ecx                                      ;454.3
        shr       eax, 24                                       ;454.3
        mov       ebx, ecx                                      ;454.3
        xor       edi, DWORD PTR [_des_SPtrans+1024+ebp]        ;454.3
        and       eax, 252                                      ;454.3
        mov       ebp, ecx                                      ;454.3
        and       edx, 252                                      ;454.3
        shr       ebp, 8                                        ;454.3
        shr       ebx, 16                                       ;454.3
        and       ebp, 252                                      ;454.3
        shr       ecx, 24                                       ;454.3
        and       ebx, 252                                      ;454.3
        xor       edi, DWORD PTR [_des_SPtrans+1536+eax]        ;454.3
        and       ecx, 252                                      ;454.3
        xor       edi, DWORD PTR [_des_SPtrans+256+edx]         ;454.3
        xor       edi, DWORD PTR [_des_SPtrans+768+ebp]         ;454.3
        xor       edi, DWORD PTR [_des_SPtrans+1280+ebx]        ;454.3
        xor       edi, DWORD PTR [_des_SPtrans+1792+ecx]        ;454.3
        mov       ebx, DWORD PTR [76+esp]                       ;455.3
        xor       ebx, edi                                      ;455.3
        mov       ecx, ebx                                      ;455.3
        mov       edx, ebx                                      ;455.3
        shr       edx, 8                                        ;455.3
        mov       ebp, ebx                                      ;455.3
        and       ecx, 252                                      ;455.3
        and       edx, 252                                      ;455.3
        shr       ebp, 16                                       ;455.3
        and       ebp, 252                                      ;455.3
        mov       eax, DWORD PTR [104+esp]                      ;455.3
        xor       esi, DWORD PTR [_des_SPtrans+ecx]             ;455.3
        xor       eax, edi                                      ;455.3
        ror       eax, 4                                        ;455.3
        xor       esi, DWORD PTR [_des_SPtrans+512+edx]         ;455.3
        mov       edx, eax                                      ;455.3
        shr       ebx, 24                                       ;455.3
        mov       ecx, eax                                      ;455.3
        xor       esi, DWORD PTR [_des_SPtrans+1024+ebp]        ;455.3
        and       ebx, 252                                      ;455.3
        mov       ebp, eax                                      ;455.3
        and       edx, 252                                      ;455.3
        shr       ebp, 8                                        ;455.3
        shr       ecx, 16                                       ;455.3
        and       ebp, 252                                      ;455.3
        shr       eax, 24                                       ;455.3
        and       ecx, 252                                      ;455.3
        xor       esi, DWORD PTR [_des_SPtrans+1536+ebx]        ;455.3
        and       eax, 252                                      ;455.3
        xor       esi, DWORD PTR [_des_SPtrans+256+edx]         ;455.3
        xor       esi, DWORD PTR [_des_SPtrans+768+ebp]         ;455.3
        xor       esi, DWORD PTR [_des_SPtrans+1280+ecx]        ;455.3
        xor       esi, DWORD PTR [_des_SPtrans+1792+eax]        ;455.3
        mov       ebx, DWORD PTR [92+esp]                       ;456.3
        xor       ebx, esi                                      ;456.3
        mov       eax, ebx                                      ;456.3
        mov       edx, ebx                                      ;456.3
        shr       edx, 8                                        ;456.3
        mov       ecx, ebx                                      ;456.3
        and       eax, 252                                      ;456.3
        and       edx, 252                                      ;456.3
        shr       ecx, 16                                       ;456.3
        and       ecx, 252                                      ;456.3
        mov       ebp, DWORD PTR [100+esp]                      ;456.3
        xor       ebp, esi                                      ;456.3
        ror       ebp, 4                                        ;456.3
        xor       edi, DWORD PTR [_des_SPtrans+eax]             ;456.3
        mov       eax, ebp                                      ;456.3
        shr       ebx, 24                                       ;456.3
        xor       edi, DWORD PTR [_des_SPtrans+512+edx]         ;456.3
        and       ebx, 252                                      ;456.3
        mov       edx, ebp                                      ;456.3
        xor       edi, DWORD PTR [_des_SPtrans+1024+ecx]        ;456.3
        mov       ecx, ebp                                      ;456.3
        shr       eax, 8                                        ;456.3
        and       edx, 252                                      ;456.3
        shr       ecx, 16                                       ;456.3
        and       eax, 252                                      ;456.3
        shr       ebp, 24                                       ;456.3
        and       ecx, 252                                      ;456.3
        xor       edi, DWORD PTR [_des_SPtrans+1536+ebx]        ;456.3
        and       ebp, 252                                      ;456.3
        xor       edi, DWORD PTR [_des_SPtrans+256+edx]         ;456.3
        xor       edi, DWORD PTR [_des_SPtrans+768+eax]         ;456.3
        xor       edi, DWORD PTR [_des_SPtrans+1280+ecx]        ;456.3
        xor       edi, DWORD PTR [_des_SPtrans+1792+ebp]        ;456.3
        mov       ebx, DWORD PTR [60+esp]                       ;457.3
        xor       ebx, edi                                      ;457.3
        mov       ebp, ebx                                      ;457.3
        mov       eax, ebx                                      ;457.3
        shr       eax, 8                                        ;457.3
        mov       ecx, ebx                                      ;457.3
        and       ebp, 252                                      ;457.3
        and       eax, 252                                      ;457.3
        shr       ecx, 16                                       ;457.3
        and       ecx, 252                                      ;457.3
        mov       edx, DWORD PTR [120+esp]                      ;457.3
        xor       esi, DWORD PTR [_des_SPtrans+ebp]             ;457.3
        xor       edx, edi                                      ;457.3
        ror       edx, 4                                        ;457.3
        xor       esi, DWORD PTR [_des_SPtrans+512+eax]         ;457.3
        mov       eax, edx                                      ;457.3
        shr       ebx, 24                                       ;457.3
        mov       ebp, edx                                      ;457.3
        xor       esi, DWORD PTR [_des_SPtrans+1024+ecx]        ;457.3
        and       ebx, 252                                      ;457.3
        mov       ecx, edx                                      ;457.3
        and       eax, 252                                      ;457.3
        shr       ecx, 8                                        ;457.3
        shr       ebp, 16                                       ;457.3
        and       ecx, 252                                      ;457.3
        shr       edx, 24                                       ;457.3
        and       ebp, 252                                      ;457.3
        xor       esi, DWORD PTR [_des_SPtrans+1536+ebx]        ;457.3
        and       edx, 252                                      ;457.3
        xor       esi, DWORD PTR [_des_SPtrans+256+eax]         ;457.3
        xor       esi, DWORD PTR [_des_SPtrans+768+ecx]         ;457.3
        xor       esi, DWORD PTR [_des_SPtrans+1280+ebp]        ;457.3
        xor       esi, DWORD PTR [_des_SPtrans+1792+edx]        ;457.3
        mov       edx, DWORD PTR [44+esp]                       ;458.3
        xor       edx, esi                                      ;458.3
        ror       edx, 4                                        ;458.3
        xor       DWORD PTR [36+esp], esi                       ;458.3
        mov       eax, DWORD PTR [4+esp]                        ;458.3
        mov       ebx, DWORD PTR [esp]                          ;458.3
        mov       DWORD PTR [44+esp], edx                       ;458.3
                                ; LOE rax rbx eax ebx esi edi al bl ah bh
.B4.8:                          ; Preds .B4.3
        mov       ecx, DWORD PTR [36+esp]                       ;458.3
        mov       edx, ecx                                      ;458.3
        and       edx, 252                                      ;458.3
        mov       ebp, ecx                                      ;458.3
        shr       ebp, 16                                       ;458.3
        and       ebp, 252                                      ;458.3
        xor       edi, DWORD PTR [_des_SPtrans+edx]             ;458.3
        mov       edx, ecx                                      ;458.3
        shr       edx, 8                                        ;458.3
        and       edx, 252                                      ;458.3
        shr       ecx, 24                                       ;458.3
        and       ecx, 252                                      ;458.3
        xor       edi, DWORD PTR [_des_SPtrans+512+edx]         ;458.3
        xor       edi, DWORD PTR [_des_SPtrans+1024+ebp]        ;458.3
        mov       edx, DWORD PTR [44+esp]                       ;458.3
        mov       ebp, edx                                      ;458.3
        xor       edi, DWORD PTR [_des_SPtrans+1536+ecx]        ;458.3
        mov       ecx, edx                                      ;458.3
        and       ecx, 252                                      ;458.3
        shr       ebp, 16                                       ;458.3
        and       ebp, 252                                      ;458.3
        xor       edi, DWORD PTR [_des_SPtrans+256+ecx]         ;458.3
        mov       ecx, edx                                      ;458.3
        shr       ecx, 8                                        ;458.3
        and       ecx, 252                                      ;458.3
        shr       edx, 24                                       ;458.3
        and       edx, 252                                      ;458.3
        xor       edi, DWORD PTR [_des_SPtrans+768+ecx]         ;458.3
        xor       edi, DWORD PTR [_des_SPtrans+1280+ebp]        ;458.3
        xor       edi, DWORD PTR [_des_SPtrans+1792+edx]        ;458.3
        mov       ecx, DWORD PTR [20+esp]                       ;459.3
        xor       eax, edi                                      ;459.3
        xor       ecx, edi                                      ;459.3
        mov       ebp, ecx                                      ;459.3
        mov       edx, ecx                                      ;459.3
        and       ebp, 252                                      ;459.3
        shr       edx, 16                                       ;459.3
        and       edx, 252                                      ;459.3
        ror       eax, 4                                        ;459.3
        xor       esi, DWORD PTR [_des_SPtrans+ebp]             ;459.3
        mov       ebp, ecx                                      ;459.3
        shr       ebp, 8                                        ;459.3
        and       ebp, 252                                      ;459.3
        shr       ecx, 24                                       ;459.3
        and       ecx, 252                                      ;459.3
        xor       esi, DWORD PTR [_des_SPtrans+512+ebp]         ;459.3
        mov       ebp, eax                                      ;459.3
        xor       esi, DWORD PTR [_des_SPtrans+1024+edx]        ;459.3
        mov       edx, eax                                      ;459.3
        xor       esi, DWORD PTR [_des_SPtrans+1536+ecx]        ;459.3
        mov       ecx, eax                                      ;459.3
        shr       ecx, 8                                        ;459.3
        and       edx, 252                                      ;459.3
        shr       ebp, 16                                       ;459.3
        and       ecx, 252                                      ;459.3
        shr       eax, 24                                       ;459.3
        and       ebp, 252                                      ;459.3
        and       eax, 252                                      ;459.3
        xor       esi, DWORD PTR [_des_SPtrans+256+edx]         ;459.3
        xor       esi, DWORD PTR [_des_SPtrans+768+ecx]         ;459.3
        xor       esi, DWORD PTR [_des_SPtrans+1280+ebp]        ;459.3
        xor       esi, DWORD PTR [_des_SPtrans+1792+eax]        ;459.3
        mov       ecx, DWORD PTR [12+esp]                       ;460.3
        xor       ecx, esi                                      ;460.3
        mov       eax, ecx                                      ;460.3
        mov       edx, ecx                                      ;460.3
        and       eax, 252                                      ;460.3
        shr       edx, 16                                       ;460.3
        and       edx, 252                                      ;460.3
        mov       ebp, DWORD PTR [56+esp]                       ;460.3
        xor       edi, DWORD PTR [_des_SPtrans+eax]             ;460.3
        mov       eax, ecx                                      ;460.3
        shr       eax, 8                                        ;460.3
        xor       ebp, esi                                      ;460.3
        and       eax, 252                                      ;460.3
        shr       ecx, 24                                       ;460.3
        and       ecx, 252                                      ;460.3
        ror       ebp, 4                                        ;460.3
        xor       edi, DWORD PTR [_des_SPtrans+512+eax]         ;460.3
        mov       eax, ebp                                      ;460.3
        xor       edi, DWORD PTR [_des_SPtrans+1024+edx]        ;460.3
        mov       edx, ebp                                      ;460.3
        xor       edi, DWORD PTR [_des_SPtrans+1536+ecx]        ;460.3
        mov       ecx, ebp                                      ;460.3
        shr       ecx, 8                                        ;460.3
        and       edx, 252                                      ;460.3
        shr       eax, 16                                       ;460.3
        and       ecx, 252                                      ;460.3
        shr       ebp, 24                                       ;460.3
        and       eax, 252                                      ;460.3
        and       ebp, 252                                      ;460.3
        xor       edi, DWORD PTR [_des_SPtrans+256+edx]         ;460.3
        xor       edi, DWORD PTR [_des_SPtrans+768+ecx]         ;460.3
        xor       edi, DWORD PTR [_des_SPtrans+1280+eax]        ;460.3
        xor       edi, DWORD PTR [_des_SPtrans+1792+ebp]        ;460.3
        xor       ebx, edi                                      ;461.3
        mov       ebp, ebx                                      ;461.3
        mov       edx, ebx                                      ;461.3
        shr       edx, 8                                        ;461.3
        mov       ecx, ebx                                      ;461.3
        and       ebp, 252                                      ;461.3
        and       edx, 252                                      ;461.3
        shr       ecx, 16                                       ;461.3
        shr       ebx, 24                                       ;461.3
        and       ecx, 252                                      ;461.3
        and       ebx, 252                                      ;461.3
        xor       esi, DWORD PTR [_des_SPtrans+ebp]             ;461.3
        mov       eax, DWORD PTR [28+esp]                       ;461.3
        xor       esi, DWORD PTR [_des_SPtrans+512+edx]         ;461.3
        xor       eax, edi                                      ;461.3
        ror       eax, 4                                        ;461.3
        xor       esi, DWORD PTR [_des_SPtrans+1024+ecx]        ;461.3
        mov       edx, eax                                      ;461.3
        xor       esi, DWORD PTR [_des_SPtrans+1536+ebx]        ;461.3
        mov       ebx, eax                                      ;461.3
        mov       DWORD PTR [4+esp], edi                        ;460.3
        mov       edi, eax                                      ;461.3
        shr       edx, 8                                        ;461.3
        and       ebx, 252                                      ;461.3
        shr       edi, 16                                       ;461.3
        and       edx, 252                                      ;461.3
        shr       eax, 24                                       ;461.3
        and       edi, 252                                      ;461.3
        and       eax, 252                                      ;461.3
        xor       esi, DWORD PTR [_des_SPtrans+256+ebx]         ;461.3
        xor       esi, DWORD PTR [_des_SPtrans+768+edx]         ;461.3
        xor       esi, DWORD PTR [_des_SPtrans+1280+edi]        ;461.3
        xor       esi, DWORD PTR [_des_SPtrans+1792+eax]        ;461.3
        mov       edi, DWORD PTR [4+esp]                        ;461.3
                                ; LOE rdi esi edi dil
.B4.4:                          ; Preds .B4.7 .B4.8
        ror       esi, 3                                        ;466.4
        mov       eax, esi                                      ;468.2
        ror       edi, 3                                        ;465.4
        shr       eax, 1                                        ;468.2
        xor       eax, edi                                      ;468.2
        and       eax, 1431655765                               ;468.2
        xor       edi, eax                                      ;468.2
        add       eax, eax                                      ;468.2
        mov       edx, edi                                      ;468.2
        xor       esi, eax                                      ;468.2
        shr       edx, 8                                        ;468.2
        xor       edx, esi                                      ;468.2
        and       edx, 16711935                                 ;468.2
        xor       esi, edx                                      ;468.2
        shl       edx, 8                                        ;468.2
        mov       ecx, esi                                      ;468.2
        shr       ecx, 2                                        ;468.2
        xor       edi, edx                                      ;468.2
        xor       ecx, edi                                      ;468.2
        and       ecx, 858993459                                ;468.2
        xor       edi, ecx                                      ;468.2
        shl       ecx, 2                                        ;468.2
        mov       ebx, edi                                      ;468.2
        shr       ebx, 16                                       ;468.2
        xor       esi, ecx                                      ;468.2
        xor       ebx, esi                                      ;468.2
        movzx     ebp, bx                                       ;468.2
        xor       esi, ebp                                      ;468.2
        shl       ebp, 16                                       ;468.2
        mov       eax, esi                                      ;468.2
        shr       eax, 4                                        ;468.2
        xor       edi, ebp                                      ;468.2
        xor       eax, edi                                      ;468.2
        mov       edx, DWORD PTR [8+esp]                        ;469.2
        and       eax, 252645135                                ;468.2
        xor       edi, eax                                      ;468.2
        shl       eax, 4                                        ;468.2
        xor       esi, eax                                      ;468.2
        mov       DWORD PTR [edx], edi                          ;469.2
        mov       DWORD PTR [4+edx], esi                        ;470.2
        add       esp, 124                                      ;472.2
        pop       ebp                                           ;472.2
        pop       ebx                                           ;472.2
        pop       edi                                           ;472.2
        pop       esi                                           ;472.2
        ret                                                     ;472.2
        ALIGN     16
                                ; LOE
; mark_end;
_des_encrypt ENDP
;_des_encrypt	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _des_encrypt
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _DES_set_key
TXTST4:
; -- Begin  _DES_set_key
;_DES_set_key	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _DES_set_key
; mark_begin;
       ALIGN     16
	PUBLIC _DES_set_key
_DES_set_key	PROC NEAR 
; parameter 1: 20 + esp
; parameter 2: 24 + esp
.B5.1:                          ; Preds .B5.0
        push      esi                                           ;497.2
        push      edi                                           ;497.2
        push      ebx                                           ;497.2
        push      ebp                                           ;497.2
        mov       ecx, DWORD PTR [20+esp]                       ;496.5
        mov       eax, DWORD PTR [4+ecx]                        ;506.4
        mov       ebx, eax                                      ;511.2
        shr       ebx, 4                                        ;511.2
        mov       edx, DWORD PTR [ecx]                          ;505.5
        xor       ebx, edx                                      ;511.2
        and       ebx, 252645135                                ;511.2
        xor       edx, ebx                                      ;511.2
        shl       ebx, 4                                        ;511.2
        mov       ebp, edx                                      ;512.2
        xor       eax, ebx                                      ;511.2
        mov       esi, eax                                      ;513.2
        shl       esi, 18                                       ;513.2
        xor       esi, eax                                      ;513.2
        shl       ebp, 18                                       ;512.2
        and       esi, -859045888                               ;513.2
        xor       ebp, edx                                      ;512.2
        xor       eax, esi                                      ;513.2
        shr       esi, 18                                       ;513.2
        and       ebp, -859045888                               ;512.2
        xor       eax, esi                                      ;513.2
        xor       edx, ebp                                      ;512.2
        shr       ebp, 18                                       ;512.2
        mov       edi, eax                                      ;514.2
        shr       edi, 1                                        ;514.2
        xor       edx, ebp                                      ;512.2
        xor       edi, edx                                      ;514.2
        and       edi, 1431655765                               ;514.2
        xor       edx, edi                                      ;514.2
        add       edi, edi                                      ;514.2
        mov       ecx, edx                                      ;515.2
        xor       eax, edi                                      ;514.2
        shr       ecx, 8                                        ;515.2
        xor       ecx, eax                                      ;515.2
        and       ecx, 16711935                                 ;515.2
        xor       eax, ecx                                      ;515.2
        shl       ecx, 8                                        ;515.2
        mov       ebx, eax                                      ;516.2
        shr       ebx, 1                                        ;516.2
        xor       edx, ecx                                      ;515.2
        xor       ebx, edx                                      ;516.2
        and       ebx, 1431655765                               ;516.2
        xor       edx, ebx                                      ;516.2
        add       ebx, ebx                                      ;516.2
        xor       eax, ebx                                      ;516.2
        movzx     ecx, al                                       ;518.10
        mov       ebp, eax                                      ;518.33
        shl       ecx, 16                                       ;518.24
        and       ebp, 65280                                    ;518.33
        and       eax, 16711680                                 ;519.8
        or        ecx, ebp                                      ;518.33
        shr       eax, 16                                       ;519.22
        or        ecx, eax                                      ;519.22
        mov       eax, edx                                      ;519.31
        and       eax, -268435456                               ;519.31
        and       edx, 268435455                                ;520.2
        shr       eax, 4                                        ;519.45
        or        ecx, eax                                      ;519.45
        cmp       DWORD PTR [shifts2.1460.0.3], 0               ;524.7
        je        .B5.3         ; Prob 50%                      ;524.7
                                ; LOE edx ecx
.B5.2:                          ; Preds .B5.1
        mov       ebp, edx                                      ;525.13
        mov       ebx, ecx                                      ;525.35
        shr       ebp, 2                                        ;525.13
        shl       edx, 26                                       ;525.21
        shr       ebx, 2                                        ;525.35
        or        ebp, edx                                      ;525.21
        shl       ecx, 26                                       ;525.43
        or        ebx, ecx                                      ;525.43
        jmp       .B5.4         ; Prob 100%                     ;525.43
                                ; LOE ebx ebp
.B5.3:                          ; Preds .B5.1
        mov       ebp, edx                                      ;527.13
        mov       ebx, ecx                                      ;527.35
        shr       ebp, 1                                        ;527.13
        shl       edx, 27                                       ;527.21
        shr       ebx, 1                                        ;527.35
        or        ebp, edx                                      ;527.21
        shl       ecx, 27                                       ;527.43
        or        ebx, ecx                                      ;527.43
                                ; LOE ebx ebp
.B5.4:                          ; Preds .B5.2 .B5.3
        and       ebp, 268435455                                ;528.3
        and       ebx, 268435455                                ;529.3
        mov       edx, ebp                                      ;533.21
        mov       edi, ebp                                      ;533.36
        shr       edx, 6                                        ;533.21
        mov       esi, ebp                                      ;532.26
        shr       edi, 7                                        ;533.36
        and       esi, 63                                       ;532.26
        and       edx, 3                                        ;533.24
        and       edi, 60                                       ;533.40
        or        edx, edi                                      ;533.40
        mov       edi, ebp                                      ;535.35
        shr       edi, 21                                       ;535.35
        mov       ecx, DWORD PTR [_des_skb+esi*4]               ;532.6
        mov       esi, ebp                                      ;534.35
        shr       esi, 14                                       ;534.35
        and       edi, 6                                        ;535.40
        or        ecx, DWORD PTR [_des_skb+256+edx*4]           ;533.4
        mov       edx, ebp                                      ;534.20
        shr       edx, 13                                       ;534.20
        and       esi, 48                                       ;534.40
        and       edx, 15                                       ;534.24
        or        edx, esi                                      ;534.40
        mov       esi, ebp                                      ;535.20
        shr       esi, 20                                       ;535.20
        and       esi, 1                                        ;535.24
        or        esi, edi                                      ;535.40
        mov       edi, ebx                                      ;538.37
        or        ecx, DWORD PTR [_des_skb+512+edx*4]           ;534.4
        mov       edx, ebp                                      ;536.14
        shr       edx, 22                                       ;536.14
        and       edx, 56                                       ;536.19
        or        esi, edx                                      ;536.19
        mov       edx, ebx                                      ;537.26
        shr       edi, 8                                        ;538.37
        and       edx, 63                                       ;537.26
        and       edi, 60                                       ;538.41
        mov       eax, DWORD PTR [24+esp]                       ;496.5
        or        ecx, DWORD PTR [_des_skb+768+esi*4]           ;535.4
        mov       esi, ebx                                      ;538.21
        shr       esi, 7                                        ;538.21
        and       esi, 3                                        ;538.25
        or        esi, edi                                      ;538.41
        mov       edi, ebx                                      ;539.20
        shr       edi, 15                                       ;539.20
        and       edi, 63                                       ;539.25
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;537.6
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;538.4
        mov       esi, ebx                                      ;540.36
        shr       esi, 22                                       ;540.36
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;539.4
        mov       edi, ebx                                      ;540.20
        shr       edi, 21                                       ;540.20
        and       esi, 48                                       ;540.41
        and       edi, 15                                       ;540.25
        or        edi, esi                                      ;540.41
        movzx     esi, cx                                       ;544.10
        shr       ecx, 16                                       ;547.10
        or        edx, DWORD PTR [_des_skb+1792+edi*4]          ;540.4
        mov       edi, edx                                      ;544.10
        and       edx, -65536                                   ;547.10
        shl       edi, 16                                       ;544.10
        or        ecx, edx                                      ;547.10
        or        edi, esi                                      ;544.10
        ror       edi, 30                                       ;544.10
        ror       ecx, 26                                       ;547.10
        mov       DWORD PTR [eax], edi                          ;544.5
        mov       DWORD PTR [4+eax], ecx                        ;547.5
        cmp       DWORD PTR [shifts2.1460.0.3+4], 0             ;524.7
        je        .B5.6         ; Prob 50%                      ;524.7
                                ; LOE eax ebx ebp
.B5.5:                          ; Preds .B5.4
        mov       edx, ebp                                      ;525.13
        mov       ecx, ebx                                      ;525.35
        shr       edx, 2                                        ;525.13
        shl       ebp, 26                                       ;525.21
        shr       ecx, 2                                        ;525.35
        or        edx, ebp                                      ;525.21
        shl       ebx, 26                                       ;525.43
        or        ecx, ebx                                      ;525.43
        jmp       .B5.7         ; Prob 100%                     ;525.43
                                ; LOE eax edx ecx
.B5.6:                          ; Preds .B5.4
        mov       edx, ebp                                      ;527.13
        mov       ecx, ebx                                      ;527.35
        shr       edx, 1                                        ;527.13
        shl       ebp, 27                                       ;527.21
        shr       ecx, 1                                        ;527.35
        or        edx, ebp                                      ;527.21
        shl       ebx, 27                                       ;527.43
        or        ecx, ebx                                      ;527.43
                                ; LOE eax edx ecx
.B5.7:                          ; Preds .B5.5 .B5.6
        and       edx, 268435455                                ;528.3
        and       ecx, 268435455                                ;529.3
        mov       ebx, edx                                      ;533.21
        mov       edi, edx                                      ;533.36
        shr       ebx, 6                                        ;533.21
        mov       esi, edx                                      ;532.26
        shr       edi, 7                                        ;533.36
        and       esi, 63                                       ;532.26
        and       ebx, 3                                        ;533.24
        and       edi, 60                                       ;533.40
        or        ebx, edi                                      ;533.40
        mov       edi, edx                                      ;535.35
        shr       edi, 21                                       ;535.35
        mov       ebp, DWORD PTR [_des_skb+esi*4]               ;532.6
        mov       esi, edx                                      ;534.35
        shr       esi, 14                                       ;534.35
        and       edi, 6                                        ;535.40
        or        ebp, DWORD PTR [_des_skb+256+ebx*4]           ;533.4
        mov       ebx, edx                                      ;534.20
        shr       ebx, 13                                       ;534.20
        and       esi, 48                                       ;534.40
        and       ebx, 15                                       ;534.24
        or        ebx, esi                                      ;534.40
        mov       esi, edx                                      ;535.20
        shr       esi, 20                                       ;535.20
        and       esi, 1                                        ;535.24
        or        esi, edi                                      ;535.40
        mov       edi, ecx                                      ;538.37
        or        ebp, DWORD PTR [_des_skb+512+ebx*4]           ;534.4
        mov       ebx, edx                                      ;536.14
        shr       ebx, 22                                       ;536.14
        and       ebx, 56                                       ;536.19
        or        esi, ebx                                      ;536.19
        mov       ebx, ecx                                      ;537.26
        shr       edi, 8                                        ;538.37
        and       ebx, 63                                       ;537.26
        and       edi, 60                                       ;538.41
        or        ebp, DWORD PTR [_des_skb+768+esi*4]           ;535.4
        mov       esi, ecx                                      ;538.21
        shr       esi, 7                                        ;538.21
        and       esi, 3                                        ;538.25
        or        esi, edi                                      ;538.41
        mov       edi, ecx                                      ;539.20
        shr       edi, 15                                       ;539.20
        and       edi, 63                                       ;539.25
        mov       ebx, DWORD PTR [_des_skb+1024+ebx*4]          ;537.6
        or        ebx, DWORD PTR [_des_skb+1280+esi*4]          ;538.4
        mov       esi, ecx                                      ;540.36
        shr       esi, 22                                       ;540.36
        or        ebx, DWORD PTR [_des_skb+1536+edi*4]          ;539.4
        mov       edi, ecx                                      ;540.20
        shr       edi, 21                                       ;540.20
        and       esi, 48                                       ;540.41
        and       edi, 15                                       ;540.25
        or        edi, esi                                      ;540.41
        movzx     esi, bp                                       ;544.10
        shr       ebp, 16                                       ;547.10
        or        ebx, DWORD PTR [_des_skb+1792+edi*4]          ;540.4
        mov       edi, ebx                                      ;544.10
        and       ebx, -65536                                   ;547.10
        shl       edi, 16                                       ;544.10
        or        ebp, ebx                                      ;547.10
        or        edi, esi                                      ;544.10
        ror       edi, 30                                       ;544.10
        ror       ebp, 26                                       ;547.10
        mov       DWORD PTR [8+eax], edi                        ;544.5
        mov       DWORD PTR [12+eax], ebp                       ;547.5
        cmp       DWORD PTR [shifts2.1460.0.3+8], 0             ;524.7
        je        .B5.9         ; Prob 50%                      ;524.7
                                ; LOE eax edx ecx
.B5.8:                          ; Preds .B5.7
        mov       ebx, edx                                      ;525.13
        shr       ebx, 2                                        ;525.13
        shl       edx, 26                                       ;525.21
        or        ebx, edx                                      ;525.21
        mov       edx, ecx                                      ;525.35
        shr       edx, 2                                        ;525.35
        shl       ecx, 26                                       ;525.43
        or        edx, ecx                                      ;525.43
        jmp       .B5.10        ; Prob 100%                     ;525.43
                                ; LOE eax edx ebx
.B5.9:                          ; Preds .B5.7
        mov       ebx, edx                                      ;527.13
        shr       ebx, 1                                        ;527.13
        shl       edx, 27                                       ;527.21
        or        ebx, edx                                      ;527.21
        mov       edx, ecx                                      ;527.35
        shr       edx, 1                                        ;527.35
        shl       ecx, 27                                       ;527.43
        or        edx, ecx                                      ;527.43
                                ; LOE eax edx ebx
.B5.10:                         ; Preds .B5.8 .B5.9
        and       ebx, 268435455                                ;528.3
        and       edx, 268435455                                ;529.3
        mov       ecx, ebx                                      ;533.21
        mov       edi, ebx                                      ;533.36
        shr       ecx, 6                                        ;533.21
        mov       esi, ebx                                      ;532.26
        shr       edi, 7                                        ;533.36
        and       esi, 63                                       ;532.26
        and       ecx, 3                                        ;533.24
        and       edi, 60                                       ;533.40
        or        ecx, edi                                      ;533.40
        mov       edi, ebx                                      ;535.35
        shr       edi, 21                                       ;535.35
        mov       ebp, DWORD PTR [_des_skb+esi*4]               ;532.6
        mov       esi, ebx                                      ;534.35
        shr       esi, 14                                       ;534.35
        and       edi, 6                                        ;535.40
        or        ebp, DWORD PTR [_des_skb+256+ecx*4]           ;533.4
        mov       ecx, ebx                                      ;534.20
        shr       ecx, 13                                       ;534.20
        and       esi, 48                                       ;534.40
        and       ecx, 15                                       ;534.24
        or        ecx, esi                                      ;534.40
        mov       esi, ebx                                      ;535.20
        shr       esi, 20                                       ;535.20
        and       esi, 1                                        ;535.24
        or        esi, edi                                      ;535.40
        mov       edi, edx                                      ;538.37
        or        ebp, DWORD PTR [_des_skb+512+ecx*4]           ;534.4
        mov       ecx, ebx                                      ;536.14
        shr       ecx, 22                                       ;536.14
        and       ecx, 56                                       ;536.19
        or        esi, ecx                                      ;536.19
        mov       ecx, edx                                      ;537.26
        shr       edi, 8                                        ;538.37
        and       ecx, 63                                       ;537.26
        and       edi, 60                                       ;538.41
        or        ebp, DWORD PTR [_des_skb+768+esi*4]           ;535.4
        mov       esi, edx                                      ;538.21
        shr       esi, 7                                        ;538.21
        and       esi, 3                                        ;538.25
        or        esi, edi                                      ;538.41
        mov       edi, edx                                      ;539.20
        shr       edi, 15                                       ;539.20
        and       edi, 63                                       ;539.25
        mov       ecx, DWORD PTR [_des_skb+1024+ecx*4]          ;537.6
        or        ecx, DWORD PTR [_des_skb+1280+esi*4]          ;538.4
        mov       esi, edx                                      ;540.36
        shr       esi, 22                                       ;540.36
        or        ecx, DWORD PTR [_des_skb+1536+edi*4]          ;539.4
        mov       edi, edx                                      ;540.20
        shr       edi, 21                                       ;540.20
        and       esi, 48                                       ;540.41
        and       edi, 15                                       ;540.25
        or        edi, esi                                      ;540.41
        movzx     esi, bp                                       ;544.10
        shr       ebp, 16                                       ;547.10
        or        ecx, DWORD PTR [_des_skb+1792+edi*4]          ;540.4
        mov       edi, ecx                                      ;544.10
        and       ecx, -65536                                   ;547.10
        shl       edi, 16                                       ;544.10
        or        ebp, ecx                                      ;547.10
        or        edi, esi                                      ;544.10
        ror       edi, 30                                       ;544.10
        ror       ebp, 26                                       ;547.10
        mov       DWORD PTR [16+eax], edi                       ;544.5
        mov       DWORD PTR [20+eax], ebp                       ;547.5
        cmp       DWORD PTR [shifts2.1460.0.3+12], 0            ;524.7
        je        .B5.12        ; Prob 50%                      ;524.7
                                ; LOE eax edx ebx
.B5.11:                         ; Preds .B5.10
        mov       ebp, ebx                                      ;525.13
        mov       ecx, edx                                      ;525.35
        shr       ebp, 2                                        ;525.13
        shl       ebx, 26                                       ;525.21
        shr       ecx, 2                                        ;525.35
        or        ebp, ebx                                      ;525.21
        shl       edx, 26                                       ;525.43
        or        ecx, edx                                      ;525.43
        jmp       .B5.13        ; Prob 100%                     ;525.43
                                ; LOE eax ecx ebp
.B5.12:                         ; Preds .B5.10
        mov       ebp, ebx                                      ;527.13
        mov       ecx, edx                                      ;527.35
        shr       ebp, 1                                        ;527.13
        shl       ebx, 27                                       ;527.21
        shr       ecx, 1                                        ;527.35
        or        ebp, ebx                                      ;527.21
        shl       edx, 27                                       ;527.43
        or        ecx, edx                                      ;527.43
                                ; LOE eax ecx ebp
.B5.13:                         ; Preds .B5.11 .B5.12
        and       ebp, 268435455                                ;528.3
        and       ecx, 268435455                                ;529.3
        mov       edx, ebp                                      ;533.21
        mov       edi, ebp                                      ;533.36
        shr       edx, 6                                        ;533.21
        mov       esi, ebp                                      ;532.26
        shr       edi, 7                                        ;533.36
        and       esi, 63                                       ;532.26
        and       edx, 3                                        ;533.24
        and       edi, 60                                       ;533.40
        or        edx, edi                                      ;533.40
        mov       edi, ebp                                      ;535.35
        shr       edi, 21                                       ;535.35
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;532.6
        mov       esi, ebp                                      ;534.35
        shr       esi, 14                                       ;534.35
        and       edi, 6                                        ;535.40
        or        ebx, DWORD PTR [_des_skb+256+edx*4]           ;533.4
        mov       edx, ebp                                      ;534.20
        shr       edx, 13                                       ;534.20
        and       esi, 48                                       ;534.40
        and       edx, 15                                       ;534.24
        or        edx, esi                                      ;534.40
        mov       esi, ebp                                      ;535.20
        shr       esi, 20                                       ;535.20
        and       esi, 1                                        ;535.24
        or        esi, edi                                      ;535.40
        mov       edi, ecx                                      ;538.37
        or        ebx, DWORD PTR [_des_skb+512+edx*4]           ;534.4
        mov       edx, ebp                                      ;536.14
        shr       edx, 22                                       ;536.14
        and       edx, 56                                       ;536.19
        or        esi, edx                                      ;536.19
        mov       edx, ecx                                      ;537.26
        shr       edi, 8                                        ;538.37
        and       edx, 63                                       ;537.26
        and       edi, 60                                       ;538.41
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;535.4
        mov       esi, ecx                                      ;538.21
        shr       esi, 7                                        ;538.21
        and       esi, 3                                        ;538.25
        or        esi, edi                                      ;538.41
        mov       edi, ecx                                      ;539.20
        shr       edi, 15                                       ;539.20
        and       edi, 63                                       ;539.25
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;537.6
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;538.4
        mov       esi, ecx                                      ;540.36
        shr       esi, 22                                       ;540.36
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;539.4
        mov       edi, ecx                                      ;540.20
        shr       edi, 21                                       ;540.20
        and       esi, 48                                       ;540.41
        and       edi, 15                                       ;540.25
        or        edi, esi                                      ;540.41
        movzx     esi, bx                                       ;544.10
        shr       ebx, 16                                       ;547.10
        or        edx, DWORD PTR [_des_skb+1792+edi*4]          ;540.4
        mov       edi, edx                                      ;544.10
        and       edx, -65536                                   ;547.10
        shl       edi, 16                                       ;544.10
        or        ebx, edx                                      ;547.10
        or        edi, esi                                      ;544.10
        ror       edi, 30                                       ;544.10
        ror       ebx, 26                                       ;547.10
        mov       DWORD PTR [24+eax], edi                       ;544.5
        mov       DWORD PTR [28+eax], ebx                       ;547.5
        cmp       DWORD PTR [shifts2.1460.0.3+16], 0            ;524.7
        je        .B5.15        ; Prob 50%                      ;524.7
                                ; LOE eax ecx ebp
.B5.14:                         ; Preds .B5.13
        mov       ebx, ebp                                      ;525.13
        mov       edx, ecx                                      ;525.35
        shr       ebx, 2                                        ;525.13
        shl       ebp, 26                                       ;525.21
        shr       edx, 2                                        ;525.35
        or        ebx, ebp                                      ;525.21
        shl       ecx, 26                                       ;525.43
        or        edx, ecx                                      ;525.43
        jmp       .B5.16        ; Prob 100%                     ;525.43
                                ; LOE eax edx ebx
.B5.15:                         ; Preds .B5.13
        mov       ebx, ebp                                      ;527.13
        mov       edx, ecx                                      ;527.35
        shr       ebx, 1                                        ;527.13
        shl       ebp, 27                                       ;527.21
        shr       edx, 1                                        ;527.35
        or        ebx, ebp                                      ;527.21
        shl       ecx, 27                                       ;527.43
        or        edx, ecx                                      ;527.43
                                ; LOE eax edx ebx
.B5.16:                         ; Preds .B5.14 .B5.15
        and       ebx, 268435455                                ;528.3
        and       edx, 268435455                                ;529.3
        mov       ecx, ebx                                      ;533.21
        mov       edi, ebx                                      ;533.36
        shr       ecx, 6                                        ;533.21
        mov       esi, ebx                                      ;532.26
        shr       edi, 7                                        ;533.36
        and       esi, 63                                       ;532.26
        and       ecx, 3                                        ;533.24
        and       edi, 60                                       ;533.40
        or        ecx, edi                                      ;533.40
        mov       edi, ebx                                      ;535.35
        shr       edi, 21                                       ;535.35
        mov       ebp, DWORD PTR [_des_skb+esi*4]               ;532.6
        mov       esi, ebx                                      ;534.35
        shr       esi, 14                                       ;534.35
        and       edi, 6                                        ;535.40
        or        ebp, DWORD PTR [_des_skb+256+ecx*4]           ;533.4
        mov       ecx, ebx                                      ;534.20
        shr       ecx, 13                                       ;534.20
        and       esi, 48                                       ;534.40
        and       ecx, 15                                       ;534.24
        or        ecx, esi                                      ;534.40
        mov       esi, ebx                                      ;535.20
        shr       esi, 20                                       ;535.20
        and       esi, 1                                        ;535.24
        or        esi, edi                                      ;535.40
        mov       edi, edx                                      ;538.37
        or        ebp, DWORD PTR [_des_skb+512+ecx*4]           ;534.4
        mov       ecx, ebx                                      ;536.14
        shr       ecx, 22                                       ;536.14
        and       ecx, 56                                       ;536.19
        or        esi, ecx                                      ;536.19
        mov       ecx, edx                                      ;537.26
        shr       edi, 8                                        ;538.37
        and       ecx, 63                                       ;537.26
        and       edi, 60                                       ;538.41
        or        ebp, DWORD PTR [_des_skb+768+esi*4]           ;535.4
        mov       esi, edx                                      ;538.21
        shr       esi, 7                                        ;538.21
        and       esi, 3                                        ;538.25
        or        esi, edi                                      ;538.41
        mov       edi, edx                                      ;539.20
        shr       edi, 15                                       ;539.20
        and       edi, 63                                       ;539.25
        mov       ecx, DWORD PTR [_des_skb+1024+ecx*4]          ;537.6
        or        ecx, DWORD PTR [_des_skb+1280+esi*4]          ;538.4
        mov       esi, edx                                      ;540.36
        shr       esi, 22                                       ;540.36
        or        ecx, DWORD PTR [_des_skb+1536+edi*4]          ;539.4
        mov       edi, edx                                      ;540.20
        shr       edi, 21                                       ;540.20
        and       esi, 48                                       ;540.41
        and       edi, 15                                       ;540.25
        or        edi, esi                                      ;540.41
        movzx     esi, bp                                       ;544.10
        shr       ebp, 16                                       ;547.10
        or        ecx, DWORD PTR [_des_skb+1792+edi*4]          ;540.4
        mov       edi, ecx                                      ;544.10
        and       ecx, -65536                                   ;547.10
        shl       edi, 16                                       ;544.10
        or        ebp, ecx                                      ;547.10
        or        edi, esi                                      ;544.10
        ror       edi, 30                                       ;544.10
        ror       ebp, 26                                       ;547.10
        mov       DWORD PTR [32+eax], edi                       ;544.5
        mov       DWORD PTR [36+eax], ebp                       ;547.5
        cmp       DWORD PTR [shifts2.1460.0.3+20], 0            ;524.7
        je        .B5.18        ; Prob 50%                      ;524.7
                                ; LOE eax edx ebx
.B5.17:                         ; Preds .B5.16
        mov       ebp, ebx                                      ;525.13
        mov       ecx, edx                                      ;525.35
        shr       ebp, 2                                        ;525.13
        shl       ebx, 26                                       ;525.21
        shr       ecx, 2                                        ;525.35
        or        ebp, ebx                                      ;525.21
        shl       edx, 26                                       ;525.43
        or        ecx, edx                                      ;525.43
        jmp       .B5.19        ; Prob 100%                     ;525.43
                                ; LOE eax ecx ebp
.B5.18:                         ; Preds .B5.16
        mov       ebp, ebx                                      ;527.13
        mov       ecx, edx                                      ;527.35
        shr       ebp, 1                                        ;527.13
        shl       ebx, 27                                       ;527.21
        shr       ecx, 1                                        ;527.35
        or        ebp, ebx                                      ;527.21
        shl       edx, 27                                       ;527.43
        or        ecx, edx                                      ;527.43
                                ; LOE eax ecx ebp
.B5.19:                         ; Preds .B5.17 .B5.18
        and       ebp, 268435455                                ;528.3
        and       ecx, 268435455                                ;529.3
        mov       edx, ebp                                      ;533.21
        mov       edi, ebp                                      ;533.36
        shr       edx, 6                                        ;533.21
        mov       esi, ebp                                      ;532.26
        shr       edi, 7                                        ;533.36
        and       esi, 63                                       ;532.26
        and       edx, 3                                        ;533.24
        and       edi, 60                                       ;533.40
        or        edx, edi                                      ;533.40
        mov       edi, ebp                                      ;535.35
        shr       edi, 21                                       ;535.35
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;532.6
        mov       esi, ebp                                      ;534.35
        shr       esi, 14                                       ;534.35
        and       edi, 6                                        ;535.40
        or        ebx, DWORD PTR [_des_skb+256+edx*4]           ;533.4
        mov       edx, ebp                                      ;534.20
        shr       edx, 13                                       ;534.20
        and       esi, 48                                       ;534.40
        and       edx, 15                                       ;534.24
        or        edx, esi                                      ;534.40
        mov       esi, ebp                                      ;535.20
        shr       esi, 20                                       ;535.20
        and       esi, 1                                        ;535.24
        or        esi, edi                                      ;535.40
        mov       edi, ecx                                      ;538.37
        or        ebx, DWORD PTR [_des_skb+512+edx*4]           ;534.4
        mov       edx, ebp                                      ;536.14
        shr       edx, 22                                       ;536.14
        and       edx, 56                                       ;536.19
        or        esi, edx                                      ;536.19
        mov       edx, ecx                                      ;537.26
        shr       edi, 8                                        ;538.37
        and       edx, 63                                       ;537.26
        and       edi, 60                                       ;538.41
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;535.4
        mov       esi, ecx                                      ;538.21
        shr       esi, 7                                        ;538.21
        and       esi, 3                                        ;538.25
        or        esi, edi                                      ;538.41
        mov       edi, ecx                                      ;539.20
        shr       edi, 15                                       ;539.20
        and       edi, 63                                       ;539.25
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;537.6
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;538.4
        mov       esi, ecx                                      ;540.36
        shr       esi, 22                                       ;540.36
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;539.4
        mov       edi, ecx                                      ;540.20
        shr       edi, 21                                       ;540.20
        and       esi, 48                                       ;540.41
        and       edi, 15                                       ;540.25
        or        edi, esi                                      ;540.41
        movzx     esi, bx                                       ;544.10
        shr       ebx, 16                                       ;547.10
        or        edx, DWORD PTR [_des_skb+1792+edi*4]          ;540.4
        mov       edi, edx                                      ;544.10
        and       edx, -65536                                   ;547.10
        shl       edi, 16                                       ;544.10
        or        ebx, edx                                      ;547.10
        or        edi, esi                                      ;544.10
        ror       edi, 30                                       ;544.10
        ror       ebx, 26                                       ;547.10
        mov       DWORD PTR [40+eax], edi                       ;544.5
        mov       DWORD PTR [44+eax], ebx                       ;547.5
        cmp       DWORD PTR [shifts2.1460.0.3+24], 0            ;524.7
        je        .B5.21        ; Prob 50%                      ;524.7
                                ; LOE eax ecx ebp
.B5.20:                         ; Preds .B5.19
        mov       ebx, ebp                                      ;525.13
        mov       edx, ecx                                      ;525.35
        shr       ebx, 2                                        ;525.13
        shl       ebp, 26                                       ;525.21
        shr       edx, 2                                        ;525.35
        or        ebx, ebp                                      ;525.21
        shl       ecx, 26                                       ;525.43
        or        edx, ecx                                      ;525.43
        jmp       .B5.22        ; Prob 100%                     ;525.43
                                ; LOE eax edx ebx
.B5.21:                         ; Preds .B5.19
        mov       ebx, ebp                                      ;527.13
        mov       edx, ecx                                      ;527.35
        shr       ebx, 1                                        ;527.13
        shl       ebp, 27                                       ;527.21
        shr       edx, 1                                        ;527.35
        or        ebx, ebp                                      ;527.21
        shl       ecx, 27                                       ;527.43
        or        edx, ecx                                      ;527.43
                                ; LOE eax edx ebx
.B5.22:                         ; Preds .B5.20 .B5.21
        and       ebx, 268435455                                ;528.3
        and       edx, 268435455                                ;529.3
        mov       ecx, ebx                                      ;533.21
        mov       edi, ebx                                      ;533.36
        shr       ecx, 6                                        ;533.21
        mov       esi, ebx                                      ;532.26
        shr       edi, 7                                        ;533.36
        and       esi, 63                                       ;532.26
        and       ecx, 3                                        ;533.24
        and       edi, 60                                       ;533.40
        or        ecx, edi                                      ;533.40
        mov       edi, ebx                                      ;535.35
        shr       edi, 21                                       ;535.35
        mov       ebp, DWORD PTR [_des_skb+esi*4]               ;532.6
        mov       esi, ebx                                      ;534.35
        shr       esi, 14                                       ;534.35
        and       edi, 6                                        ;535.40
        or        ebp, DWORD PTR [_des_skb+256+ecx*4]           ;533.4
        mov       ecx, ebx                                      ;534.20
        shr       ecx, 13                                       ;534.20
        and       esi, 48                                       ;534.40
        and       ecx, 15                                       ;534.24
        or        ecx, esi                                      ;534.40
        mov       esi, ebx                                      ;535.20
        shr       esi, 20                                       ;535.20
        and       esi, 1                                        ;535.24
        or        esi, edi                                      ;535.40
        mov       edi, edx                                      ;538.37
        or        ebp, DWORD PTR [_des_skb+512+ecx*4]           ;534.4
        mov       ecx, ebx                                      ;536.14
        shr       ecx, 22                                       ;536.14
        and       ecx, 56                                       ;536.19
        or        esi, ecx                                      ;536.19
        mov       ecx, edx                                      ;537.26
        shr       edi, 8                                        ;538.37
        and       ecx, 63                                       ;537.26
        and       edi, 60                                       ;538.41
        or        ebp, DWORD PTR [_des_skb+768+esi*4]           ;535.4
        mov       esi, edx                                      ;538.21
        shr       esi, 7                                        ;538.21
        and       esi, 3                                        ;538.25
        or        esi, edi                                      ;538.41
        mov       edi, edx                                      ;539.20
        shr       edi, 15                                       ;539.20
        and       edi, 63                                       ;539.25
        mov       ecx, DWORD PTR [_des_skb+1024+ecx*4]          ;537.6
        or        ecx, DWORD PTR [_des_skb+1280+esi*4]          ;538.4
        mov       esi, edx                                      ;540.36
        shr       esi, 22                                       ;540.36
        or        ecx, DWORD PTR [_des_skb+1536+edi*4]          ;539.4
        mov       edi, edx                                      ;540.20
        shr       edi, 21                                       ;540.20
        and       esi, 48                                       ;540.41
        and       edi, 15                                       ;540.25
        or        edi, esi                                      ;540.41
        movzx     esi, bp                                       ;544.10
        shr       ebp, 16                                       ;547.10
        or        ecx, DWORD PTR [_des_skb+1792+edi*4]          ;540.4
        mov       edi, ecx                                      ;544.10
        and       ecx, -65536                                   ;547.10
        shl       edi, 16                                       ;544.10
        or        ebp, ecx                                      ;547.10
        or        edi, esi                                      ;544.10
        ror       edi, 30                                       ;544.10
        ror       ebp, 26                                       ;547.10
        mov       DWORD PTR [48+eax], edi                       ;544.5
        mov       DWORD PTR [52+eax], ebp                       ;547.5
        cmp       DWORD PTR [shifts2.1460.0.3+28], 0            ;524.7
        je        .B5.24        ; Prob 50%                      ;524.7
                                ; LOE eax edx ebx
.B5.23:                         ; Preds .B5.22
        mov       ebp, ebx                                      ;525.13
        mov       ecx, edx                                      ;525.35
        shr       ebp, 2                                        ;525.13
        shl       ebx, 26                                       ;525.21
        shr       ecx, 2                                        ;525.35
        or        ebp, ebx                                      ;525.21
        shl       edx, 26                                       ;525.43
        or        ecx, edx                                      ;525.43
        jmp       .B5.25        ; Prob 100%                     ;525.43
                                ; LOE eax ecx ebp
.B5.24:                         ; Preds .B5.22
        mov       ebp, ebx                                      ;527.13
        mov       ecx, edx                                      ;527.35
        shr       ebp, 1                                        ;527.13
        shl       ebx, 27                                       ;527.21
        shr       ecx, 1                                        ;527.35
        or        ebp, ebx                                      ;527.21
        shl       edx, 27                                       ;527.43
        or        ecx, edx                                      ;527.43
                                ; LOE eax ecx ebp
.B5.25:                         ; Preds .B5.23 .B5.24
        and       ebp, 268435455                                ;528.3
        and       ecx, 268435455                                ;529.3
        mov       edx, ebp                                      ;533.21
        mov       edi, ebp                                      ;533.36
        shr       edx, 6                                        ;533.21
        mov       esi, ebp                                      ;532.26
        shr       edi, 7                                        ;533.36
        and       esi, 63                                       ;532.26
        and       edx, 3                                        ;533.24
        and       edi, 60                                       ;533.40
        or        edx, edi                                      ;533.40
        mov       edi, ebp                                      ;535.35
        shr       edi, 21                                       ;535.35
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;532.6
        mov       esi, ebp                                      ;534.35
        shr       esi, 14                                       ;534.35
        and       edi, 6                                        ;535.40
        or        ebx, DWORD PTR [_des_skb+256+edx*4]           ;533.4
        mov       edx, ebp                                      ;534.20
        shr       edx, 13                                       ;534.20
        and       esi, 48                                       ;534.40
        and       edx, 15                                       ;534.24
        or        edx, esi                                      ;534.40
        mov       esi, ebp                                      ;535.20
        shr       esi, 20                                       ;535.20
        and       esi, 1                                        ;535.24
        or        esi, edi                                      ;535.40
        mov       edi, ecx                                      ;538.37
        or        ebx, DWORD PTR [_des_skb+512+edx*4]           ;534.4
        mov       edx, ebp                                      ;536.14
        shr       edx, 22                                       ;536.14
        and       edx, 56                                       ;536.19
        or        esi, edx                                      ;536.19
        mov       edx, ecx                                      ;537.26
        shr       edi, 8                                        ;538.37
        and       edx, 63                                       ;537.26
        and       edi, 60                                       ;538.41
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;535.4
        mov       esi, ecx                                      ;538.21
        shr       esi, 7                                        ;538.21
        and       esi, 3                                        ;538.25
        or        esi, edi                                      ;538.41
        mov       edi, ecx                                      ;539.20
        shr       edi, 15                                       ;539.20
        and       edi, 63                                       ;539.25
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;537.6
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;538.4
        mov       esi, ecx                                      ;540.36
        shr       esi, 22                                       ;540.36
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;539.4
        mov       edi, ecx                                      ;540.20
        shr       edi, 21                                       ;540.20
        and       esi, 48                                       ;540.41
        and       edi, 15                                       ;540.25
        or        edi, esi                                      ;540.41
        movzx     esi, bx                                       ;544.10
        shr       ebx, 16                                       ;547.10
        or        edx, DWORD PTR [_des_skb+1792+edi*4]          ;540.4
        mov       edi, edx                                      ;544.10
        and       edx, -65536                                   ;547.10
        shl       edi, 16                                       ;544.10
        or        ebx, edx                                      ;547.10
        or        edi, esi                                      ;544.10
        ror       edi, 30                                       ;544.10
        ror       ebx, 26                                       ;547.10
        mov       DWORD PTR [56+eax], edi                       ;544.5
        mov       DWORD PTR [60+eax], ebx                       ;547.5
        cmp       DWORD PTR [shifts2.1460.0.3+32], 0            ;524.7
        je        .B5.27        ; Prob 50%                      ;524.7
                                ; LOE eax ecx ebp
.B5.26:                         ; Preds .B5.25
        mov       ebx, ebp                                      ;525.13
        mov       edx, ecx                                      ;525.35
        shr       ebx, 2                                        ;525.13
        shl       ebp, 26                                       ;525.21
        shr       edx, 2                                        ;525.35
        or        ebx, ebp                                      ;525.21
        shl       ecx, 26                                       ;525.43
        or        edx, ecx                                      ;525.43
        jmp       .B5.28        ; Prob 100%                     ;525.43
                                ; LOE eax edx ebx
.B5.27:                         ; Preds .B5.25
        mov       ebx, ebp                                      ;527.13
        mov       edx, ecx                                      ;527.35
        shr       ebx, 1                                        ;527.13
        shl       ebp, 27                                       ;527.21
        shr       edx, 1                                        ;527.35
        or        ebx, ebp                                      ;527.21
        shl       ecx, 27                                       ;527.43
        or        edx, ecx                                      ;527.43
                                ; LOE eax edx ebx
.B5.28:                         ; Preds .B5.26 .B5.27
        and       ebx, 268435455                                ;528.3
        and       edx, 268435455                                ;529.3
        mov       ecx, ebx                                      ;533.21
        mov       edi, ebx                                      ;533.36
        shr       ecx, 6                                        ;533.21
        mov       esi, ebx                                      ;532.26
        shr       edi, 7                                        ;533.36
        and       esi, 63                                       ;532.26
        and       ecx, 3                                        ;533.24
        and       edi, 60                                       ;533.40
        or        ecx, edi                                      ;533.40
        mov       edi, ebx                                      ;535.35
        shr       edi, 21                                       ;535.35
        mov       ebp, DWORD PTR [_des_skb+esi*4]               ;532.6
        mov       esi, ebx                                      ;534.35
        shr       esi, 14                                       ;534.35
        and       edi, 6                                        ;535.40
        or        ebp, DWORD PTR [_des_skb+256+ecx*4]           ;533.4
        mov       ecx, ebx                                      ;534.20
        shr       ecx, 13                                       ;534.20
        and       esi, 48                                       ;534.40
        and       ecx, 15                                       ;534.24
        or        ecx, esi                                      ;534.40
        mov       esi, ebx                                      ;535.20
        shr       esi, 20                                       ;535.20
        and       esi, 1                                        ;535.24
        or        esi, edi                                      ;535.40
        mov       edi, edx                                      ;538.37
        or        ebp, DWORD PTR [_des_skb+512+ecx*4]           ;534.4
        mov       ecx, ebx                                      ;536.14
        shr       ecx, 22                                       ;536.14
        and       ecx, 56                                       ;536.19
        or        esi, ecx                                      ;536.19
        mov       ecx, edx                                      ;537.26
        shr       edi, 8                                        ;538.37
        and       ecx, 63                                       ;537.26
        and       edi, 60                                       ;538.41
        or        ebp, DWORD PTR [_des_skb+768+esi*4]           ;535.4
        mov       esi, edx                                      ;538.21
        shr       esi, 7                                        ;538.21
        and       esi, 3                                        ;538.25
        or        esi, edi                                      ;538.41
        mov       edi, edx                                      ;539.20
        shr       edi, 15                                       ;539.20
        and       edi, 63                                       ;539.25
        mov       ecx, DWORD PTR [_des_skb+1024+ecx*4]          ;537.6
        or        ecx, DWORD PTR [_des_skb+1280+esi*4]          ;538.4
        mov       esi, edx                                      ;540.36
        shr       esi, 22                                       ;540.36
        or        ecx, DWORD PTR [_des_skb+1536+edi*4]          ;539.4
        mov       edi, edx                                      ;540.20
        shr       edi, 21                                       ;540.20
        and       esi, 48                                       ;540.41
        and       edi, 15                                       ;540.25
        or        edi, esi                                      ;540.41
        movzx     esi, bp                                       ;544.10
        shr       ebp, 16                                       ;547.10
        or        ecx, DWORD PTR [_des_skb+1792+edi*4]          ;540.4
        mov       edi, ecx                                      ;544.10
        and       ecx, -65536                                   ;547.10
        shl       edi, 16                                       ;544.10
        or        ebp, ecx                                      ;547.10
        or        edi, esi                                      ;544.10
        ror       edi, 30                                       ;544.10
        ror       ebp, 26                                       ;547.10
        mov       DWORD PTR [64+eax], edi                       ;544.5
        mov       DWORD PTR [68+eax], ebp                       ;547.5
        cmp       DWORD PTR [shifts2.1460.0.3+36], 0            ;524.7
        je        .B5.30        ; Prob 50%                      ;524.7
                                ; LOE eax edx ebx
.B5.29:                         ; Preds .B5.28
        mov       ebp, ebx                                      ;525.13
        mov       ecx, edx                                      ;525.35
        shr       ebp, 2                                        ;525.13
        shl       ebx, 26                                       ;525.21
        shr       ecx, 2                                        ;525.35
        or        ebp, ebx                                      ;525.21
        shl       edx, 26                                       ;525.43
        or        ecx, edx                                      ;525.43
        jmp       .B5.31        ; Prob 100%                     ;525.43
                                ; LOE eax ecx ebp
.B5.30:                         ; Preds .B5.28
        mov       ebp, ebx                                      ;527.13
        mov       ecx, edx                                      ;527.35
        shr       ebp, 1                                        ;527.13
        shl       ebx, 27                                       ;527.21
        shr       ecx, 1                                        ;527.35
        or        ebp, ebx                                      ;527.21
        shl       edx, 27                                       ;527.43
        or        ecx, edx                                      ;527.43
                                ; LOE eax ecx ebp
.B5.31:                         ; Preds .B5.29 .B5.30
        and       ebp, 268435455                                ;528.3
        and       ecx, 268435455                                ;529.3
        mov       edx, ebp                                      ;533.21
        mov       edi, ebp                                      ;533.36
        shr       edx, 6                                        ;533.21
        mov       esi, ebp                                      ;532.26
        shr       edi, 7                                        ;533.36
        and       esi, 63                                       ;532.26
        and       edx, 3                                        ;533.24
        and       edi, 60                                       ;533.40
        or        edx, edi                                      ;533.40
        mov       edi, ebp                                      ;535.35
        shr       edi, 21                                       ;535.35
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;532.6
        mov       esi, ebp                                      ;534.35
        shr       esi, 14                                       ;534.35
        and       edi, 6                                        ;535.40
        or        ebx, DWORD PTR [_des_skb+256+edx*4]           ;533.4
        mov       edx, ebp                                      ;534.20
        shr       edx, 13                                       ;534.20
        and       esi, 48                                       ;534.40
        and       edx, 15                                       ;534.24
        or        edx, esi                                      ;534.40
        mov       esi, ebp                                      ;535.20
        shr       esi, 20                                       ;535.20
        and       esi, 1                                        ;535.24
        or        esi, edi                                      ;535.40
        mov       edi, ecx                                      ;538.37
        or        ebx, DWORD PTR [_des_skb+512+edx*4]           ;534.4
        mov       edx, ebp                                      ;536.14
        shr       edx, 22                                       ;536.14
        and       edx, 56                                       ;536.19
        or        esi, edx                                      ;536.19
        mov       edx, ecx                                      ;537.26
        shr       edi, 8                                        ;538.37
        and       edx, 63                                       ;537.26
        and       edi, 60                                       ;538.41
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;535.4
        mov       esi, ecx                                      ;538.21
        shr       esi, 7                                        ;538.21
        and       esi, 3                                        ;538.25
        or        esi, edi                                      ;538.41
        mov       edi, ecx                                      ;539.20
        shr       edi, 15                                       ;539.20
        and       edi, 63                                       ;539.25
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;537.6
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;538.4
        mov       esi, ecx                                      ;540.36
        shr       esi, 22                                       ;540.36
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;539.4
        mov       edi, ecx                                      ;540.20
        shr       edi, 21                                       ;540.20
        and       esi, 48                                       ;540.41
        and       edi, 15                                       ;540.25
        or        edi, esi                                      ;540.41
        movzx     esi, bx                                       ;544.10
        shr       ebx, 16                                       ;547.10
        or        edx, DWORD PTR [_des_skb+1792+edi*4]          ;540.4
        mov       edi, edx                                      ;544.10
        and       edx, -65536                                   ;547.10
        shl       edi, 16                                       ;544.10
        or        ebx, edx                                      ;547.10
        or        edi, esi                                      ;544.10
        ror       edi, 30                                       ;544.10
        ror       ebx, 26                                       ;547.10
        mov       DWORD PTR [72+eax], edi                       ;544.5
        mov       DWORD PTR [76+eax], ebx                       ;547.5
        cmp       DWORD PTR [shifts2.1460.0.3+40], 0            ;524.7
        je        .B5.33        ; Prob 50%                      ;524.7
                                ; LOE eax ecx ebp
.B5.32:                         ; Preds .B5.31
        mov       ebx, ebp                                      ;525.13
        mov       edx, ecx                                      ;525.35
        shr       ebx, 2                                        ;525.13
        shl       ebp, 26                                       ;525.21
        shr       edx, 2                                        ;525.35
        or        ebx, ebp                                      ;525.21
        shl       ecx, 26                                       ;525.43
        or        edx, ecx                                      ;525.43
        jmp       .B5.34        ; Prob 100%                     ;525.43
                                ; LOE eax edx ebx
.B5.33:                         ; Preds .B5.31
        mov       ebx, ebp                                      ;527.13
        mov       edx, ecx                                      ;527.35
        shr       ebx, 1                                        ;527.13
        shl       ebp, 27                                       ;527.21
        shr       edx, 1                                        ;527.35
        or        ebx, ebp                                      ;527.21
        shl       ecx, 27                                       ;527.43
        or        edx, ecx                                      ;527.43
                                ; LOE eax edx ebx
.B5.34:                         ; Preds .B5.32 .B5.33
        and       ebx, 268435455                                ;528.3
        and       edx, 268435455                                ;529.3
        mov       ecx, ebx                                      ;533.21
        mov       edi, ebx                                      ;533.36
        shr       ecx, 6                                        ;533.21
        mov       esi, ebx                                      ;532.26
        shr       edi, 7                                        ;533.36
        and       esi, 63                                       ;532.26
        and       ecx, 3                                        ;533.24
        and       edi, 60                                       ;533.40
        or        ecx, edi                                      ;533.40
        mov       edi, ebx                                      ;535.35
        shr       edi, 21                                       ;535.35
        mov       ebp, DWORD PTR [_des_skb+esi*4]               ;532.6
        mov       esi, ebx                                      ;534.35
        shr       esi, 14                                       ;534.35
        and       edi, 6                                        ;535.40
        or        ebp, DWORD PTR [_des_skb+256+ecx*4]           ;533.4
        mov       ecx, ebx                                      ;534.20
        shr       ecx, 13                                       ;534.20
        and       esi, 48                                       ;534.40
        and       ecx, 15                                       ;534.24
        or        ecx, esi                                      ;534.40
        mov       esi, ebx                                      ;535.20
        shr       esi, 20                                       ;535.20
        and       esi, 1                                        ;535.24
        or        esi, edi                                      ;535.40
        mov       edi, edx                                      ;538.37
        or        ebp, DWORD PTR [_des_skb+512+ecx*4]           ;534.4
        mov       ecx, ebx                                      ;536.14
        shr       ecx, 22                                       ;536.14
        and       ecx, 56                                       ;536.19
        or        esi, ecx                                      ;536.19
        mov       ecx, edx                                      ;537.26
        shr       edi, 8                                        ;538.37
        and       ecx, 63                                       ;537.26
        and       edi, 60                                       ;538.41
        or        ebp, DWORD PTR [_des_skb+768+esi*4]           ;535.4
        mov       esi, edx                                      ;538.21
        shr       esi, 7                                        ;538.21
        and       esi, 3                                        ;538.25
        or        esi, edi                                      ;538.41
        mov       edi, edx                                      ;539.20
        shr       edi, 15                                       ;539.20
        and       edi, 63                                       ;539.25
        mov       ecx, DWORD PTR [_des_skb+1024+ecx*4]          ;537.6
        or        ecx, DWORD PTR [_des_skb+1280+esi*4]          ;538.4
        mov       esi, edx                                      ;540.36
        shr       esi, 22                                       ;540.36
        or        ecx, DWORD PTR [_des_skb+1536+edi*4]          ;539.4
        mov       edi, edx                                      ;540.20
        shr       edi, 21                                       ;540.20
        and       esi, 48                                       ;540.41
        and       edi, 15                                       ;540.25
        or        edi, esi                                      ;540.41
        movzx     esi, bp                                       ;544.10
        shr       ebp, 16                                       ;547.10
        or        ecx, DWORD PTR [_des_skb+1792+edi*4]          ;540.4
        mov       edi, ecx                                      ;544.10
        and       ecx, -65536                                   ;547.10
        shl       edi, 16                                       ;544.10
        or        ebp, ecx                                      ;547.10
        or        edi, esi                                      ;544.10
        ror       edi, 30                                       ;544.10
        ror       ebp, 26                                       ;547.10
        mov       DWORD PTR [80+eax], edi                       ;544.5
        mov       DWORD PTR [84+eax], ebp                       ;547.5
        cmp       DWORD PTR [shifts2.1460.0.3+44], 0            ;524.7
        je        .B5.36        ; Prob 50%                      ;524.7
                                ; LOE eax edx ebx
.B5.35:                         ; Preds .B5.34
        mov       ebp, ebx                                      ;525.13
        mov       ecx, edx                                      ;525.35
        shr       ebp, 2                                        ;525.13
        shl       ebx, 26                                       ;525.21
        shr       ecx, 2                                        ;525.35
        or        ebp, ebx                                      ;525.21
        shl       edx, 26                                       ;525.43
        or        ecx, edx                                      ;525.43
        jmp       .B5.37        ; Prob 100%                     ;525.43
                                ; LOE eax ecx ebp
.B5.36:                         ; Preds .B5.34
        mov       ebp, ebx                                      ;527.13
        mov       ecx, edx                                      ;527.35
        shr       ebp, 1                                        ;527.13
        shl       ebx, 27                                       ;527.21
        shr       ecx, 1                                        ;527.35
        or        ebp, ebx                                      ;527.21
        shl       edx, 27                                       ;527.43
        or        ecx, edx                                      ;527.43
                                ; LOE eax ecx ebp
.B5.37:                         ; Preds .B5.35 .B5.36
        and       ebp, 268435455                                ;528.3
        and       ecx, 268435455                                ;529.3
        mov       edx, ebp                                      ;533.21
        mov       edi, ebp                                      ;533.36
        shr       edx, 6                                        ;533.21
        mov       esi, ebp                                      ;532.26
        shr       edi, 7                                        ;533.36
        and       esi, 63                                       ;532.26
        and       edx, 3                                        ;533.24
        and       edi, 60                                       ;533.40
        or        edx, edi                                      ;533.40
        mov       edi, ebp                                      ;535.35
        shr       edi, 21                                       ;535.35
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;532.6
        mov       esi, ebp                                      ;534.35
        shr       esi, 14                                       ;534.35
        and       edi, 6                                        ;535.40
        or        ebx, DWORD PTR [_des_skb+256+edx*4]           ;533.4
        mov       edx, ebp                                      ;534.20
        shr       edx, 13                                       ;534.20
        and       esi, 48                                       ;534.40
        and       edx, 15                                       ;534.24
        or        edx, esi                                      ;534.40
        mov       esi, ebp                                      ;535.20
        shr       esi, 20                                       ;535.20
        and       esi, 1                                        ;535.24
        or        esi, edi                                      ;535.40
        mov       edi, ecx                                      ;538.37
        or        ebx, DWORD PTR [_des_skb+512+edx*4]           ;534.4
        mov       edx, ebp                                      ;536.14
        shr       edx, 22                                       ;536.14
        and       edx, 56                                       ;536.19
        or        esi, edx                                      ;536.19
        mov       edx, ecx                                      ;537.26
        shr       edi, 8                                        ;538.37
        and       edx, 63                                       ;537.26
        and       edi, 60                                       ;538.41
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;535.4
        mov       esi, ecx                                      ;538.21
        shr       esi, 7                                        ;538.21
        and       esi, 3                                        ;538.25
        or        esi, edi                                      ;538.41
        mov       edi, ecx                                      ;539.20
        shr       edi, 15                                       ;539.20
        and       edi, 63                                       ;539.25
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;537.6
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;538.4
        mov       esi, ecx                                      ;540.36
        shr       esi, 22                                       ;540.36
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;539.4
        mov       edi, ecx                                      ;540.20
        shr       edi, 21                                       ;540.20
        and       esi, 48                                       ;540.41
        and       edi, 15                                       ;540.25
        or        edi, esi                                      ;540.41
        movzx     esi, bx                                       ;544.10
        shr       ebx, 16                                       ;547.10
        or        edx, DWORD PTR [_des_skb+1792+edi*4]          ;540.4
        mov       edi, edx                                      ;544.10
        and       edx, -65536                                   ;547.10
        shl       edi, 16                                       ;544.10
        or        ebx, edx                                      ;547.10
        or        edi, esi                                      ;544.10
        ror       edi, 30                                       ;544.10
        ror       ebx, 26                                       ;547.10
        mov       DWORD PTR [88+eax], edi                       ;544.5
        mov       DWORD PTR [92+eax], ebx                       ;547.5
        cmp       DWORD PTR [shifts2.1460.0.3+48], 0            ;524.7
        je        .B5.39        ; Prob 50%                      ;524.7
                                ; LOE eax ecx ebp
.B5.38:                         ; Preds .B5.37
        mov       ebx, ebp                                      ;525.13
        mov       edx, ecx                                      ;525.35
        shr       ebx, 2                                        ;525.13
        shl       ebp, 26                                       ;525.21
        shr       edx, 2                                        ;525.35
        or        ebx, ebp                                      ;525.21
        shl       ecx, 26                                       ;525.43
        or        edx, ecx                                      ;525.43
        jmp       .B5.40        ; Prob 100%                     ;525.43
                                ; LOE eax edx ebx
.B5.39:                         ; Preds .B5.37
        mov       ebx, ebp                                      ;527.13
        mov       edx, ecx                                      ;527.35
        shr       ebx, 1                                        ;527.13
        shl       ebp, 27                                       ;527.21
        shr       edx, 1                                        ;527.35
        or        ebx, ebp                                      ;527.21
        shl       ecx, 27                                       ;527.43
        or        edx, ecx                                      ;527.43
                                ; LOE eax edx ebx
.B5.40:                         ; Preds .B5.38 .B5.39
        and       ebx, 268435455                                ;528.3
        and       edx, 268435455                                ;529.3
        mov       ecx, ebx                                      ;533.21
        mov       edi, ebx                                      ;533.36
        shr       ecx, 6                                        ;533.21
        mov       esi, ebx                                      ;532.26
        shr       edi, 7                                        ;533.36
        and       esi, 63                                       ;532.26
        and       ecx, 3                                        ;533.24
        and       edi, 60                                       ;533.40
        or        ecx, edi                                      ;533.40
        mov       edi, ebx                                      ;535.35
        shr       edi, 21                                       ;535.35
        mov       ebp, DWORD PTR [_des_skb+esi*4]               ;532.6
        mov       esi, ebx                                      ;534.35
        shr       esi, 14                                       ;534.35
        and       edi, 6                                        ;535.40
        or        ebp, DWORD PTR [_des_skb+256+ecx*4]           ;533.4
        mov       ecx, ebx                                      ;534.20
        shr       ecx, 13                                       ;534.20
        and       esi, 48                                       ;534.40
        and       ecx, 15                                       ;534.24
        or        ecx, esi                                      ;534.40
        mov       esi, ebx                                      ;535.20
        shr       esi, 20                                       ;535.20
        and       esi, 1                                        ;535.24
        or        esi, edi                                      ;535.40
        mov       edi, edx                                      ;538.37
        or        ebp, DWORD PTR [_des_skb+512+ecx*4]           ;534.4
        mov       ecx, ebx                                      ;536.14
        shr       ecx, 22                                       ;536.14
        and       ecx, 56                                       ;536.19
        or        esi, ecx                                      ;536.19
        mov       ecx, edx                                      ;537.26
        shr       edi, 8                                        ;538.37
        and       ecx, 63                                       ;537.26
        and       edi, 60                                       ;538.41
        or        ebp, DWORD PTR [_des_skb+768+esi*4]           ;535.4
        mov       esi, edx                                      ;538.21
        shr       esi, 7                                        ;538.21
        and       esi, 3                                        ;538.25
        or        esi, edi                                      ;538.41
        mov       edi, edx                                      ;539.20
        shr       edi, 15                                       ;539.20
        and       edi, 63                                       ;539.25
        mov       ecx, DWORD PTR [_des_skb+1024+ecx*4]          ;537.6
        or        ecx, DWORD PTR [_des_skb+1280+esi*4]          ;538.4
        mov       esi, edx                                      ;540.36
        shr       esi, 22                                       ;540.36
        or        ecx, DWORD PTR [_des_skb+1536+edi*4]          ;539.4
        mov       edi, edx                                      ;540.20
        shr       edi, 21                                       ;540.20
        and       esi, 48                                       ;540.41
        and       edi, 15                                       ;540.25
        or        edi, esi                                      ;540.41
        movzx     esi, bp                                       ;544.10
        shr       ebp, 16                                       ;547.10
        or        ecx, DWORD PTR [_des_skb+1792+edi*4]          ;540.4
        mov       edi, ecx                                      ;544.10
        and       ecx, -65536                                   ;547.10
        shl       edi, 16                                       ;544.10
        or        ebp, ecx                                      ;547.10
        or        edi, esi                                      ;544.10
        ror       edi, 30                                       ;544.10
        ror       ebp, 26                                       ;547.10
        mov       DWORD PTR [96+eax], edi                       ;544.5
        mov       DWORD PTR [100+eax], ebp                      ;547.5
        cmp       DWORD PTR [shifts2.1460.0.3+52], 0            ;524.7
        je        .B5.42        ; Prob 50%                      ;524.7
                                ; LOE eax edx ebx
.B5.41:                         ; Preds .B5.40
        mov       ebp, ebx                                      ;525.13
        mov       ecx, edx                                      ;525.35
        shr       ebp, 2                                        ;525.13
        shl       ebx, 26                                       ;525.21
        shr       ecx, 2                                        ;525.35
        or        ebp, ebx                                      ;525.21
        shl       edx, 26                                       ;525.43
        or        ecx, edx                                      ;525.43
        jmp       .B5.43        ; Prob 100%                     ;525.43
                                ; LOE eax ecx ebp
.B5.42:                         ; Preds .B5.40
        mov       ebp, ebx                                      ;527.13
        mov       ecx, edx                                      ;527.35
        shr       ebp, 1                                        ;527.13
        shl       ebx, 27                                       ;527.21
        shr       ecx, 1                                        ;527.35
        or        ebp, ebx                                      ;527.21
        shl       edx, 27                                       ;527.43
        or        ecx, edx                                      ;527.43
                                ; LOE eax ecx ebp
.B5.43:                         ; Preds .B5.41 .B5.42
        and       ebp, 268435455                                ;528.3
        and       ecx, 268435455                                ;529.3
        mov       edx, ebp                                      ;533.21
        mov       edi, ebp                                      ;533.36
        shr       edx, 6                                        ;533.21
        mov       esi, ebp                                      ;532.26
        shr       edi, 7                                        ;533.36
        and       esi, 63                                       ;532.26
        and       edx, 3                                        ;533.24
        and       edi, 60                                       ;533.40
        or        edx, edi                                      ;533.40
        mov       edi, ebp                                      ;535.35
        shr       edi, 21                                       ;535.35
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;532.6
        mov       esi, ebp                                      ;534.35
        shr       esi, 14                                       ;534.35
        and       edi, 6                                        ;535.40
        or        ebx, DWORD PTR [_des_skb+256+edx*4]           ;533.4
        mov       edx, ebp                                      ;534.20
        shr       edx, 13                                       ;534.20
        and       esi, 48                                       ;534.40
        and       edx, 15                                       ;534.24
        or        edx, esi                                      ;534.40
        mov       esi, ebp                                      ;535.20
        shr       esi, 20                                       ;535.20
        and       esi, 1                                        ;535.24
        or        esi, edi                                      ;535.40
        mov       edi, ecx                                      ;538.37
        or        ebx, DWORD PTR [_des_skb+512+edx*4]           ;534.4
        mov       edx, ebp                                      ;536.14
        shr       edx, 22                                       ;536.14
        and       edx, 56                                       ;536.19
        or        esi, edx                                      ;536.19
        mov       edx, ecx                                      ;537.26
        shr       edi, 8                                        ;538.37
        and       edx, 63                                       ;537.26
        and       edi, 60                                       ;538.41
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;535.4
        mov       esi, ecx                                      ;538.21
        shr       esi, 7                                        ;538.21
        and       esi, 3                                        ;538.25
        or        esi, edi                                      ;538.41
        mov       edi, ecx                                      ;539.20
        shr       edi, 15                                       ;539.20
        and       edi, 63                                       ;539.25
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;537.6
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;538.4
        mov       esi, ecx                                      ;540.36
        shr       esi, 22                                       ;540.36
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;539.4
        mov       edi, ecx                                      ;540.20
        shr       edi, 21                                       ;540.20
        and       esi, 48                                       ;540.41
        and       edi, 15                                       ;540.25
        or        edi, esi                                      ;540.41
        movzx     esi, bx                                       ;544.10
        shr       ebx, 16                                       ;547.10
        or        edx, DWORD PTR [_des_skb+1792+edi*4]          ;540.4
        mov       edi, edx                                      ;544.10
        and       edx, -65536                                   ;547.10
        shl       edi, 16                                       ;544.10
        or        ebx, edx                                      ;547.10
        or        edi, esi                                      ;544.10
        ror       edi, 30                                       ;544.10
        ror       ebx, 26                                       ;547.10
        mov       DWORD PTR [104+eax], edi                      ;544.5
        mov       DWORD PTR [108+eax], ebx                      ;547.5
        cmp       DWORD PTR [shifts2.1460.0.3+56], 0            ;524.7
        je        .B5.45        ; Prob 50%                      ;524.7
                                ; LOE eax ecx ebp
.B5.44:                         ; Preds .B5.43
        mov       ebx, ebp                                      ;525.13
        mov       edx, ecx                                      ;525.35
        shr       ebx, 2                                        ;525.13
        shl       ebp, 26                                       ;525.21
        shr       edx, 2                                        ;525.35
        or        ebx, ebp                                      ;525.21
        shl       ecx, 26                                       ;525.43
        or        edx, ecx                                      ;525.43
        jmp       .B5.46        ; Prob 100%                     ;525.43
                                ; LOE eax edx ebx
.B5.45:                         ; Preds .B5.43
        mov       ebx, ebp                                      ;527.13
        mov       edx, ecx                                      ;527.35
        shr       ebx, 1                                        ;527.13
        shl       ebp, 27                                       ;527.21
        shr       edx, 1                                        ;527.35
        or        ebx, ebp                                      ;527.21
        shl       ecx, 27                                       ;527.43
        or        edx, ecx                                      ;527.43
                                ; LOE eax edx ebx
.B5.46:                         ; Preds .B5.44 .B5.45
        and       ebx, 268435455                                ;528.3
        and       edx, 268435455                                ;529.3
        mov       ecx, ebx                                      ;533.21
        mov       edi, ebx                                      ;533.36
        shr       ecx, 6                                        ;533.21
        mov       esi, ebx                                      ;532.26
        shr       edi, 7                                        ;533.36
        and       esi, 63                                       ;532.26
        and       ecx, 3                                        ;533.24
        and       edi, 60                                       ;533.40
        or        ecx, edi                                      ;533.40
        mov       edi, ebx                                      ;535.35
        shr       edi, 21                                       ;535.35
        mov       ebp, DWORD PTR [_des_skb+esi*4]               ;532.6
        mov       esi, ebx                                      ;534.35
        shr       esi, 14                                       ;534.35
        and       edi, 6                                        ;535.40
        or        ebp, DWORD PTR [_des_skb+256+ecx*4]           ;533.4
        mov       ecx, ebx                                      ;534.20
        shr       ecx, 13                                       ;534.20
        and       esi, 48                                       ;534.40
        and       ecx, 15                                       ;534.24
        or        ecx, esi                                      ;534.40
        mov       esi, ebx                                      ;535.20
        shr       esi, 20                                       ;535.20
        and       esi, 1                                        ;535.24
        or        esi, edi                                      ;535.40
        mov       edi, edx                                      ;538.37
        or        ebp, DWORD PTR [_des_skb+512+ecx*4]           ;534.4
        mov       ecx, ebx                                      ;536.14
        shr       ecx, 22                                       ;536.14
        and       ecx, 56                                       ;536.19
        or        esi, ecx                                      ;536.19
        mov       ecx, edx                                      ;537.26
        shr       edi, 8                                        ;538.37
        and       ecx, 63                                       ;537.26
        and       edi, 60                                       ;538.41
        or        ebp, DWORD PTR [_des_skb+768+esi*4]           ;535.4
        mov       esi, edx                                      ;538.21
        shr       esi, 7                                        ;538.21
        and       esi, 3                                        ;538.25
        or        esi, edi                                      ;538.41
        mov       edi, edx                                      ;539.20
        shr       edi, 15                                       ;539.20
        and       edi, 63                                       ;539.25
        mov       ecx, DWORD PTR [_des_skb+1024+ecx*4]          ;537.6
        or        ecx, DWORD PTR [_des_skb+1280+esi*4]          ;538.4
        mov       esi, edx                                      ;540.36
        shr       esi, 22                                       ;540.36
        or        ecx, DWORD PTR [_des_skb+1536+edi*4]          ;539.4
        mov       edi, edx                                      ;540.20
        shr       edi, 21                                       ;540.20
        and       esi, 48                                       ;540.41
        and       edi, 15                                       ;540.25
        or        edi, esi                                      ;540.41
        movzx     esi, bp                                       ;544.10
        shr       ebp, 16                                       ;547.10
        or        ecx, DWORD PTR [_des_skb+1792+edi*4]          ;540.4
        mov       edi, ecx                                      ;544.10
        and       ecx, -65536                                   ;547.10
        shl       edi, 16                                       ;544.10
        or        ebp, ecx                                      ;547.10
        or        edi, esi                                      ;544.10
        ror       edi, 30                                       ;544.10
        ror       ebp, 26                                       ;547.10
        mov       DWORD PTR [112+eax], edi                      ;544.5
        mov       DWORD PTR [116+eax], ebp                      ;547.5
        cmp       DWORD PTR [shifts2.1460.0.3+60], 0            ;524.7
        je        .B5.48        ; Prob 50%                      ;524.7
                                ; LOE eax edx ebx
.B5.47:                         ; Preds .B5.46
        mov       ebp, ebx                                      ;525.13
        shr       ebp, 2                                        ;525.13
        shl       ebx, 26                                       ;525.21
        or        ebp, ebx                                      ;525.21
        mov       ebx, edx                                      ;525.35
        shr       ebx, 2                                        ;525.35
        shl       edx, 26                                       ;525.43
        or        ebx, edx                                      ;525.43
        jmp       .B5.49        ; Prob 100%                     ;525.43
                                ; LOE eax ebx ebp
.B5.48:                         ; Preds .B5.46
        mov       ebp, ebx                                      ;527.13
        shr       ebp, 1                                        ;527.13
        shl       ebx, 27                                       ;527.21
        or        ebp, ebx                                      ;527.21
        mov       ebx, edx                                      ;527.35
        shr       ebx, 1                                        ;527.35
        shl       edx, 27                                       ;527.43
        or        ebx, edx                                      ;527.43
                                ; LOE eax ebx ebp
.B5.49:                         ; Preds .B5.47 .B5.48
        mov       edx, ebp                                      ;533.21
        mov       edi, ebp                                      ;533.36
        shr       edx, 6                                        ;533.21
        mov       esi, ebp                                      ;532.26
        shr       edi, 7                                        ;533.36
        and       esi, 63                                       ;532.26
        and       edx, 3                                        ;533.24
        and       edi, 60                                       ;533.40
        or        edx, edi                                      ;533.40
        mov       edi, ebp                                      ;535.35
        shr       edi, 21                                       ;535.35
        mov       ecx, DWORD PTR [_des_skb+esi*4]               ;532.6
        mov       esi, ebp                                      ;534.35
        shr       esi, 14                                       ;534.35
        and       edi, 6                                        ;535.40
        or        ecx, DWORD PTR [_des_skb+256+edx*4]           ;533.4
        mov       edx, ebp                                      ;534.20
        shr       edx, 13                                       ;534.20
        and       esi, 48                                       ;534.40
        and       edx, 15                                       ;534.24
        or        edx, esi                                      ;534.40
        mov       esi, ebx                                      ;538.37
        shr       esi, 8                                        ;538.37
        and       esi, 60                                       ;538.41
        or        ecx, DWORD PTR [_des_skb+512+edx*4]           ;534.4
        mov       edx, ebp                                      ;535.20
        shr       edx, 20                                       ;535.20
        shr       ebp, 22                                       ;536.14
        and       edx, 1                                        ;535.24
        or        edx, edi                                      ;535.40
        and       ebp, 56                                       ;536.19
        or        edx, ebp                                      ;536.19
        mov       ebp, ebx                                      ;537.26
        and       ebp, 63                                       ;537.26
        mov       edi, ebx                                      ;538.21
        shr       edi, 7                                        ;538.21
        and       edi, 3                                        ;538.25
        or        ecx, DWORD PTR [_des_skb+768+edx*4]           ;535.4
        or        edi, esi                                      ;538.41
        mov       edx, DWORD PTR [_des_skb+1024+ebp*4]          ;537.6
        mov       ebp, ebx                                      ;539.20
        mov       esi, ebx                                      ;540.20
        shr       ebp, 15                                       ;539.20
        shr       esi, 21                                       ;540.20
        and       ebp, 63                                       ;539.25
        shr       ebx, 22                                       ;540.36
        and       esi, 15                                       ;540.25
        and       ebx, 48                                       ;540.41
        or        esi, ebx                                      ;540.41
        or        edx, DWORD PTR [_des_skb+1280+edi*4]          ;538.4
        or        edx, DWORD PTR [_des_skb+1536+ebp*4]          ;539.4
        movzx     ebx, cx                                       ;544.10
        or        edx, DWORD PTR [_des_skb+1792+esi*4]          ;540.4
        mov       ebp, edx                                      ;544.10
        and       edx, -65536                                   ;547.10
        shl       ebp, 16                                       ;544.10
        shr       ecx, 16                                       ;547.10
        or        ebp, ebx                                      ;544.10
        or        ecx, edx                                      ;547.10
        ror       ebp, 30                                       ;544.10
        ror       ecx, 26                                       ;547.10
        mov       DWORD PTR [120+eax], ebp                      ;544.5
        mov       DWORD PTR [124+eax], ecx                      ;547.5
        xor       eax, eax                                      ;549.8
        pop       ebp                                           ;549.8
        pop       ebx                                           ;549.8
        pop       edi                                           ;549.8
        pop       esi                                           ;549.8
        ret                                                     ;549.8
        ALIGN     16
                                ; LOE
; mark_end;
_DES_set_key ENDP
;_DES_set_key	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _DES_set_key
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _des_set_odd_parity
TXTST5:
; -- Begin  _des_set_odd_parity
;_des_set_odd_parity	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _des_set_odd_parity
; mark_begin;
       ALIGN     16
	PUBLIC _des_set_odd_parity
_des_set_odd_parity	PROC NEAR 
; parameter 1: 4 + esp
.B6.1:                          ; Preds .B6.0
        mov       eax, DWORD PTR [4+esp]                        ;552.6
        movzx     edx, BYTE PTR [eax]                           ;557.25
        movzx     ecx, BYTE PTR [_odd_parity+edx]               ;557.14
        movzx     edx, BYTE PTR [1+eax]                         ;557.25
        mov       BYTE PTR [eax], cl                            ;557.3
        movzx     ecx, BYTE PTR [_odd_parity+edx]               ;557.14
        movzx     edx, BYTE PTR [2+eax]                         ;557.25
        mov       BYTE PTR [1+eax], cl                          ;557.3
        movzx     ecx, BYTE PTR [_odd_parity+edx]               ;557.14
        movzx     edx, BYTE PTR [3+eax]                         ;557.25
        mov       BYTE PTR [2+eax], cl                          ;557.3
        movzx     ecx, BYTE PTR [_odd_parity+edx]               ;557.14
        movzx     edx, BYTE PTR [4+eax]                         ;557.25
        mov       BYTE PTR [3+eax], cl                          ;557.3
        movzx     ecx, BYTE PTR [_odd_parity+edx]               ;557.14
        movzx     edx, BYTE PTR [5+eax]                         ;557.25
        mov       BYTE PTR [4+eax], cl                          ;557.3
        movzx     ecx, BYTE PTR [_odd_parity+edx]               ;557.14
        movzx     edx, BYTE PTR [6+eax]                         ;557.25
        mov       BYTE PTR [5+eax], cl                          ;557.3
        movzx     ecx, BYTE PTR [_odd_parity+edx]               ;557.14
        movzx     edx, BYTE PTR [7+eax]                         ;557.25
        mov       BYTE PTR [6+eax], cl                          ;557.3
        movzx     ecx, BYTE PTR [_odd_parity+edx]               ;557.14
        mov       BYTE PTR [7+eax], cl                          ;557.3
        ret                                                     ;558.2
        ALIGN     16
                                ; LOE
; mark_end;
_des_set_odd_parity ENDP
;_des_set_odd_parity	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _des_set_odd_parity
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _DES_str_to_key
TXTST6:
; -- Begin  _DES_str_to_key
;_DES_str_to_key	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _DES_str_to_key
; mark_begin;
       ALIGN     16
	PUBLIC _DES_str_to_key
_DES_str_to_key	PROC NEAR 
; parameter 1: 12 + esp
; parameter 2: 16 + esp
.B7.1:                          ; Preds .B7.0
        push      ebx                                           ;561.1
        push      esi                                           ;561.1
        mov       edx, DWORD PTR [12+esp]                       ;560.7
        mov       eax, DWORD PTR [16+esp]                       ;560.7
        movzx     ecx, BYTE PTR [edx]                           ;564.11
        shr       ecx, 1                                        ;564.19
        mov       BYTE PTR [eax], cl                            ;564.2
        lea       ecx, DWORD PTR [1+eax]                        ;565.2
        mov       DWORD PTR [esp], ecx                          ;565.2
        cmp       ecx, edx                                      ;565.13
        jbe       .B7.3         ; Prob 50%                      ;565.13
                                ; LOE rcx eax edx ecx ebp esi edi cl ch
.B7.2:                          ; Preds .B7.1
        sub       ecx, edx                                      ;565.13
        cmp       ecx, 6                                        ;565.13
        jge       .B7.5         ; Prob 50%                      ;565.13
                                ; LOE eax edx ebp esi edi
.B7.3:                          ; Preds .B7.1 .B7.2
        cmp       edx, DWORD PTR [esp]                          ;565.13
        jbe       .B7.10        ; Prob 50%                      ;565.13
                                ; LOE eax edx ebp esi edi
.B7.4:                          ; Preds .B7.3
        mov       ecx, edx                                      ;565.13
        sub       ecx, DWORD PTR [esp]                          ;565.13
        cmp       ecx, 6                                        ;565.13
        jl        .B7.10        ; Prob 50%                      ;565.13
                                ; LOE eax edx ebp esi edi
.B7.5:                          ; Preds .B7.2 .B7.4
        lea       ebx, DWORD PTR [1+edx]                        ;565.33
        cmp       ebx, DWORD PTR [esp]                          ;565.33
        jae       .B7.7         ; Prob 50%                      ;565.33
                                ; LOE eax edx ebx ebp esi edi
.B7.6:                          ; Preds .B7.5
        mov       ecx, DWORD PTR [esp]                          ;565.33
        sub       ecx, ebx                                      ;565.33
        cmp       ecx, 6                                        ;565.33
        jge       .B7.10        ; Prob 50%                      ;565.33
                                ; LOE eax edx ebx ebp esi edi
.B7.7:                          ; Preds .B7.6 .B7.5
        cmp       ebx, DWORD PTR [esp]                          ;565.33
        jbe       .B7.10        ; Prob 50%                      ;565.33
                                ; LOE eax edx ebx ebp esi edi
.B7.8:                          ; Preds .B7.7
        sub       ebx, DWORD PTR [esp]                          ;565.33
        cmp       ebx, 6                                        ;565.33
                                ; LOE eax edx ebp esi edi
.B7.10:                         ; Preds .B7.6 .B7.8 .B7.3 .B7.4 .B7.8
                                ;       .B7.7
        movzx     ebx, BYTE PTR [edx]                           ;565.13
        and       ebx, 1                                        ;565.20
        movzx     ecx, BYTE PTR [1+edx]                         ;565.33
        shl       ebx, 6                                        ;565.27
        shr       ecx, 2                                        ;565.41
        or        ebx, ecx                                      ;565.41
        mov       BYTE PTR [1+eax], bl                          ;565.2
        movzx     ebx, BYTE PTR [1+edx]                         ;565.13
        and       ebx, 3                                        ;565.20
        movzx     ecx, BYTE PTR [2+edx]                         ;565.33
        shl       ebx, 5                                        ;565.27
        shr       ecx, 3                                        ;565.41
        or        ebx, ecx                                      ;565.41
        mov       BYTE PTR [2+eax], bl                          ;565.2
        movzx     ebx, BYTE PTR [2+edx]                         ;565.13
        and       ebx, 7                                        ;565.20
        movzx     ecx, BYTE PTR [3+edx]                         ;565.33
        shl       ebx, 4                                        ;565.27
        shr       ecx, 4                                        ;565.41
        or        ebx, ecx                                      ;565.41
        mov       BYTE PTR [3+eax], bl                          ;565.2
        movzx     ebx, BYTE PTR [3+edx]                         ;565.13
        and       ebx, 15                                       ;565.20
        movzx     ecx, BYTE PTR [4+edx]                         ;565.33
        shl       ebx, 3                                        ;565.27
        shr       ecx, 5                                        ;565.41
        or        ebx, ecx                                      ;565.41
        mov       BYTE PTR [4+eax], bl                          ;565.2
        movzx     ebx, BYTE PTR [4+edx]                         ;565.13
        and       ebx, 31                                       ;565.20
        movzx     ecx, BYTE PTR [5+edx]                         ;565.33
        shl       ebx, 2                                        ;565.27
        shr       ecx, 6                                        ;565.41
        or        ebx, ecx                                      ;565.41
        mov       BYTE PTR [5+eax], bl                          ;565.2
        movzx     ebx, BYTE PTR [5+edx]                         ;565.13
        and       ebx, 63                                       ;565.20
        movzx     ecx, BYTE PTR [6+edx]                         ;565.33
        add       ebx, ebx                                      ;565.27
        shr       ecx, 7                                        ;565.41
        or        ebx, ecx                                      ;565.41
        mov       BYTE PTR [6+eax], bl                          ;565.2
                                ; LOE eax edx ebp esi edi
.B7.11:                         ; Preds .B7.10
        movzx     edx, BYTE PTR [6+edx]                         ;571.11
        and       edx, 127                                      ;571.18
        mov       BYTE PTR [7+eax], dl                          ;571.2
        movq      xmm0, QWORD PTR [eax]                         ;574.13
        psllw     xmm0, 1                                       ;574.21
        pand      xmm0, XMMWORD PTR [_2il0floatpacket.251]      ;574.21
        movq      QWORD PTR [eax], xmm0                         ;574.3
        movzx     ecx, BYTE PTR [eax]                           ;576.2
        movzx     edx, BYTE PTR [1+eax]                         ;576.2
        movzx     ebx, BYTE PTR [_odd_parity+ecx]               ;576.2
        movzx     ecx, BYTE PTR [_odd_parity+edx]               ;576.2
        mov       BYTE PTR [eax], bl                            ;576.2
        mov       BYTE PTR [1+eax], cl                          ;576.2
        movzx     ebx, BYTE PTR [2+eax]                         ;576.2
        movzx     ecx, BYTE PTR [3+eax]                         ;576.2
        movzx     edx, BYTE PTR [_odd_parity+ebx]               ;576.2
        movzx     ebx, BYTE PTR [_odd_parity+ecx]               ;576.2
        mov       BYTE PTR [2+eax], dl                          ;576.2
        mov       BYTE PTR [3+eax], bl                          ;576.2
        movzx     edx, BYTE PTR [4+eax]                         ;576.2
        movzx     ebx, BYTE PTR [5+eax]                         ;576.2
        movzx     ecx, BYTE PTR [_odd_parity+edx]               ;576.2
        movzx     edx, BYTE PTR [_odd_parity+ebx]               ;576.2
        mov       BYTE PTR [4+eax], cl                          ;576.2
        mov       BYTE PTR [5+eax], dl                          ;576.2
        movzx     ecx, BYTE PTR [6+eax]                         ;576.2
        movzx     edx, BYTE PTR [7+eax]                         ;576.2
        movzx     ebx, BYTE PTR [_odd_parity+ecx]               ;576.2
        movzx     ecx, BYTE PTR [_odd_parity+edx]               ;576.2
        mov       BYTE PTR [6+eax], bl                          ;576.2
        mov       BYTE PTR [7+eax], cl                          ;576.2
        pop       ecx                                           ;577.1
        pop       ebx                                           ;577.1
        ret                                                     ;577.1
        ALIGN     16
                                ; LOE
; mark_end;
_DES_str_to_key ENDP
;_DES_str_to_key	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _DES_str_to_key
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _hex2bin
TXTST7:
; -- Begin  _hex2bin
;_hex2bin	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _hex2bin
; mark_begin;
       ALIGN     16
	PUBLIC _hex2bin
_hex2bin	PROC NEAR 
; parameter 1: 24 + esp
; parameter 2: 28 + esp
.B8.1:                          ; Preds .B8.0
        push      esi                                           ;53.49
        sub       esp, 16                                       ;53.49
        mov       esi, DWORD PTR [24+esp]                       ;53.8
        mov       edx, esi                                      ;57.9
        mov       ecx, edx                                      ;57.9
        and       edx, -16                                      ;57.9
        pxor      xmm0, xmm0                                    ;57.9
        pcmpeqb   xmm0, XMMWORD PTR [edx]                       ;57.9
        pmovmskb  eax, xmm0                                     ;57.9
        and       ecx, 15                                       ;57.9
        shr       eax, cl                                       ;57.9
        bsf       eax, eax                                      ;57.9
        jne       L38           ; Prob 60%                      ;57.9
        mov       eax, edx                                      ;57.9
        add       edx, ecx                                      ;57.9
        call      ___intel_sse2_strlen                          ;57.9
L38:                                                            ;
                                ; LOE eax ebx ebp esi edi
.B8.17:                         ; Preds .B8.1
        test      al, 1                                         ;59.14
        jne       .B8.13        ; Prob 28%                      ;59.20
                                ; LOE eax ebx ebp esi edi
.B8.2:                          ; Preds .B8.17
        test      eax, eax                                      ;63.18
        jbe       .B8.7         ; Prob 15%                      ;63.18
                                ; LOE eax ebx ebp esi edi
.B8.3:                          ; Preds .B8.2
        xor       edx, edx                                      ;63.8
        mov       DWORD PTR [4+esp], edi                        ;63.8
        mov       edi, esi                                      ;63.8
        mov       DWORD PTR [esp], ebx                          ;63.8
        mov       ebx, eax                                      ;63.8
        mov       esi, edx                                      ;63.8
                                ; LOE ebx ebp esi edi
.B8.4:                          ; Preds .B8.5 .B8.3
        movsx     ecx, BYTE PTR [esi+edi]                       ;64.9
        push      ecx                                           ;64.9
        call      _isxdigit                                     ;64.9
                                ; LOE eax ebx ebp esi edi
.B8.18:                         ; Preds .B8.4
        add       esp, 4                                        ;64.9
        test      eax, eax                                      ;64.34
        je        .B8.14        ; Prob 20%                      ;64.34
                                ; LOE ebx ebp esi edi
.B8.5:                          ; Preds .B8.18
        inc       esi                                           ;63.22
        cmp       esi, ebx                                      ;63.18
        jb        .B8.4         ; Prob 82%                      ;63.18
                                ; LOE ebx ebp esi edi
.B8.6:                          ; Preds .B8.5
        mov       eax, ebx                                      ;
        mov       esi, edi                                      ;
        mov       edi, DWORD PTR [4+esp]                        ;
        mov       ebx, DWORD PTR [esp]                          ;
                                ; LOE eax ebx ebp esi edi
.B8.7:                          ; Preds .B8.2 .B8.6
        shr       eax, 1                                        ;69.24
        test      eax, eax                                      ;69.24
        jbe       .B8.12        ; Prob 10%                      ;69.24
                                ; LOE eax ebx ebp esi edi
.B8.8:                          ; Preds .B8.7
        xor       edx, edx                                      ;69.8
        mov       DWORD PTR [12+esp], eax                       ;69.8
        mov       DWORD PTR [4+esp], edi                        ;69.8
        mov       edi, esi                                      ;69.8
        mov       DWORD PTR [esp], ebx                          ;69.8
        mov       ebx, edx                                      ;69.8
        mov       esi, DWORD PTR [28+esp]                       ;69.8
                                ; LOE ebx ebp esi edi
.B8.9:                          ; Preds .B8.10 .B8.8
        lea       eax, DWORD PTR [8+esp]                        ;70.5
        push      eax                                           ;70.5
        push      OFFSET FLAT: ??_C@_03A@?$CF2x?$AA@            ;70.5
        lea       ecx, DWORD PTR [edi+ebx*2]                    ;70.5
        push      ecx                                           ;70.5
        call      _sscanf                                       ;70.5
                                ; LOE ebx ebp esi edi
.B8.19:                         ; Preds .B8.9
        add       esp, 12                                       ;70.5
                                ; LOE ebx ebp esi edi
.B8.10:                         ; Preds .B8.19
        mov       eax, DWORD PTR [8+esp]                        ;71.23
        mov       BYTE PTR [ebx+esi], al                        ;71.5
        inc       ebx                                           ;69.26
        cmp       ebx, DWORD PTR [12+esp]                       ;69.24
        jb        .B8.9         ; Prob 82%                      ;69.24
                                ; LOE ebx ebp esi edi
.B8.11:                         ; Preds .B8.10
        mov       eax, DWORD PTR [12+esp]                       ;
        mov       edi, DWORD PTR [4+esp]                        ;
        mov       ebx, DWORD PTR [esp]                          ;
                                ; LOE eax ebx ebp edi
.B8.12:                         ; Preds .B8.11 .B8.7
        add       esp, 16                                       ;73.16
        pop       esi                                           ;73.16
        ret                                                     ;73.16
                                ; LOE
.B8.13:                         ; Preds .B8.17
        xor       eax, eax                                      ;60.12
        add       esp, 16                                       ;60.12
        pop       esi                                           ;60.12
        ret                                                     ;60.12
                                ; LOE
.B8.14:                         ; Preds .B8.18                  ; Infreq
        mov       edi, DWORD PTR [4+esp]                        ;
        xor       eax, eax                                      ;65.14
        mov       ebx, DWORD PTR [esp]                          ;
        add       esp, 16                                       ;65.14
        pop       esi                                           ;65.14
        ret                                                     ;65.14
        ALIGN     16
                                ; LOE
; mark_end;
_hex2bin ENDP
;_hex2bin	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _hex2bin
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _pw2cbn
TXTST8:
; -- Begin  _pw2cbn
;_pw2cbn	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _pw2cbn
; mark_begin;
       ALIGN     16
	PUBLIC _pw2cbn
_pw2cbn	PROC NEAR 
; parameter 1: 32 + esp
.B9.1:                          ; Preds .B9.0
        push      esi                                           ;81.34
        push      edi                                           ;81.34
        push      ebx                                           ;81.34
        sub       esp, 16                                       ;81.34
        mov       edx, DWORD PTR [32+esp]                       ;87.12
        mov       ecx, edx                                      ;87.12
        and       edx, -16                                      ;87.12
        pxor      xmm0, xmm0                                    ;87.12
        pcmpeqb   xmm0, XMMWORD PTR [edx]                       ;87.12
        pmovmskb  eax, xmm0                                     ;87.12
        and       ecx, 15                                       ;87.12
        shr       eax, cl                                       ;87.12
        bsf       eax, eax                                      ;87.12
        jne       L40           ; Prob 60%                      ;87.12
        mov       eax, edx                                      ;87.12
        add       edx, ecx                                      ;87.12
        call      ___intel_sse2_strlen                          ;87.12
L40:                                                            ;
                                ; LOE eax ebp
.B9.10:                         ; Preds .B9.1
        mov       ecx, eax                                      ;87.12
        xor       eax, eax                                      ;82.16
        xor       edx, edx                                      ;82.16
        test      ecx, ecx                                      ;89.18
        jbe       .B9.6         ; Prob 4%                       ;89.18
                                ; LOE eax edx ecx ebp
.B9.2:                          ; Preds .B9.10
        mov       edi, DWORD PTR [_alpha_len]                   ;95.12
        xor       ebx, ebx                                      ;83.16
        mov       DWORD PTR [4+esp], edi                        ;95.12
        mov       edi, 1                                        ;83.16
        mov       DWORD PTR [12+esp], edx                       ;89.8
        xor       esi, esi                                      ;89.8
        mov       DWORD PTR [8+esp], ecx                        ;89.8
        mov       DWORD PTR [esp], ebp                          ;89.8
        mov       ebp, eax                                      ;89.8
                                ; LOE ebx ebp esi edi
.B9.3:                          ; Preds .B9.12 .B9.2
        mov       ecx, DWORD PTR [32+esp]                       ;90.11
        mov       eax, OFFSET FLAT: _alphabet                   ;90.11
        movsx     edx, BYTE PTR [esi+ecx]                       ;90.11
        mov       ecx, eax                                      ;90.11
        and       ecx, 15                                       ;90.11
        and       eax, -16                                      ;90.11
        push      eax                                           ;90.11
        pxor      xmm2, xmm2                                    ;90.11
        movd      xmm1, edx                                     ;90.11
        punpcklbw xmm1, xmm1                                    ;90.11
        punpcklbw xmm1, xmm1                                    ;90.11
        pshufd    xmm1, xmm1, 0                                 ;90.11
        movdqa    xmm0, XMMWORD PTR [eax]                       ;90.11
        pcmpeqb   xmm2, xmm0                                    ;90.11
        pcmpeqb   xmm0, xmm1                                    ;90.11
        pmovmskb  edx, xmm0                                     ;90.11
        pmovmskb  eax, xmm2                                     ;90.11
        shr       edx, cl                                       ;90.11
        shr       eax, cl                                       ;90.11
        test      edx, edx                                      ;90.11
        jne       L41           ; Prob 25%                      ;90.11
        test      eax, eax                                      ;90.11
        je        L44           ; Prob 25%                      ;90.11
        jmp       L43           ; Prob 100%                     ;90.11
L41:                                                            ;
        bsf       edx, edx                                      ;90.11
        bsf       eax, eax                                      ;90.11
        jz        L42           ; Prob 50%                      ;90.11
        cmp       edx, eax                                      ;90.11
        jg        L43           ; Prob 25%                      ;90.11
L42:                                                            ;
        pop       eax                                           ;90.11
        add       eax, ecx                                      ;90.11
        add       eax, edx                                      ;90.11
        jmp       L45           ; Prob 25%                      ;90.11
L43:                                                            ;
        pop       edx                                           ;90.11
        xor       eax, eax                                      ;90.11
        jmp       L45           ; Prob 100%                     ;90.11
L44:                                                            ;
        pop       eax                                           ;90.11
        call      ___intel_sse2_strchr                          ;90.11
L45:                                                            ;
                                ; LOE eax ebx ebp esi edi
.B9.11:                         ; Preds .B9.3
        inc       eax                                           ;90.48
        mov       edx, OFFSET FLAT: _alphabet                   ;90.11
        sub       eax, edx                                      ;90.11
        je        .B9.7         ; Prob 20%                      ;91.16
                                ; LOE eax ebx ebp esi edi
.B9.4:                          ; Preds .B9.11
        push      0                                             ;94.18
        push      eax                                           ;94.18
        push      ebx                                           ;94.18
        push      edi                                           ;94.18
        call      __allmul                                      ;94.18
                                ; LOE eax edx ebx ebp esi edi
.B9.13:                         ; Preds .B9.4
        push      0                                             ;95.5
        push      DWORD PTR [8+esp]                             ;95.5
        push      ebx                                           ;95.5
        add       ebp, eax                                      ;94.5
        push      edi                                           ;95.5
        adc       DWORD PTR [28+esp], edx                       ;94.5
        call      __allmul                                      ;95.5
                                ; LOE eax edx ebp esi
.B9.12:                         ; Preds .B9.13
        inc       esi                                           ;89.25
        mov       edi, eax                                      ;95.5
        mov       ebx, edx                                      ;95.5
        cmp       esi, DWORD PTR [8+esp]                        ;89.18
        jb        .B9.3         ; Prob 82%                      ;89.18
                                ; LOE ebx ebp esi edi
.B9.5:                          ; Preds .B9.12
        mov       edx, DWORD PTR [12+esp]                       ;
        mov       eax, ebp                                      ;
        mov       ebp, DWORD PTR [esp]                          ;
                                ; LOE eax edx ebp
.B9.6:                          ; Preds .B9.10 .B9.5
        add       esp, 16                                       ;97.10
        pop       ebx                                           ;97.10
        pop       edi                                           ;97.10
        pop       esi                                           ;97.10
        ret                                                     ;97.10
                                ; LOE
.B9.7:                          ; Preds .B9.11                  ; Infreq
        xor       eax, eax                                      ;92.14
        mov       ebp, DWORD PTR [esp]                          ;
        xor       edx, edx                                      ;92.14
        add       esp, 16                                       ;92.14
        pop       ebx                                           ;92.14
        pop       edi                                           ;92.14
        pop       esi                                           ;92.14
        ret                                                     ;92.14
        ALIGN     16
                                ; LOE
; mark_end;
_pw2cbn ENDP
;_pw2cbn	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _pw2cbn
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _sse2_DES_set_key
TXTST9:
; -- Begin  _sse2_DES_set_key
;_sse2_DES_set_key	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _sse2_DES_set_key
; mark_begin;
       ALIGN     16
	PUBLIC _sse2_DES_set_key
_sse2_DES_set_key	PROC NEAR 
; parameter 1: 12 + esp
; parameter 2: 16 + esp
.B10.1:                         ; Preds .B10.0
        push      esi                                           ;145.66
        push      edi                                           ;145.66
        xor       eax, eax                                      ;154.3
        pxor      xmm7, xmm7                                    ;151.14
        movdqa    xmm6, xmm7                                    ;151.14
        movdqa    xmm5, xmm6                                    ;151.14
        movdqa    xmm4, xmm5                                    ;151.14
        movdqa    xmm3, xmm4                                    ;151.14
        mov       edx, DWORD PTR [16+esp]                       ;145.6
        movdqa    xmm2, xmm3                                    ;151.14
        movdqa    xmm1, xmm2                                    ;151.14
        mov       ecx, DWORD PTR [12+esp]                       ;145.6
        movdqa    xmm0, xmm1                                    ;151.14
        movdqa    XMMWORD PTR [edx], xmm7                       ;151.5
        movdqa    XMMWORD PTR [16+edx], xmm7                    ;151.5
        movdqa    XMMWORD PTR [32+edx], xmm7                    ;151.5
        movdqa    XMMWORD PTR [48+edx], xmm7                    ;151.5
        movdqa    XMMWORD PTR [64+edx], xmm7                    ;151.5
        movdqa    XMMWORD PTR [80+edx], xmm7                    ;151.5
        movdqa    XMMWORD PTR [96+edx], xmm7                    ;151.5
        movdqa    XMMWORD PTR [112+edx], xmm7                   ;151.5
                                ; LOE eax edx ecx ebx ebp xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7
.B10.2:                         ; Preds .B10.2 .B10.1
        mov       edi, eax                                      ;154.3
        movzx     esi, BYTE PTR [eax+ecx]                       ;155.32
        inc       eax                                           ;154.3
        shl       edi, 15                                       ;154.3
        shl       esi, 7                                        ;155.32
        cmp       eax, 8                                        ;154.3
        pxor      xmm7, XMMWORD PTR [_ks_tbl+esi+edi]           ;158.16
        movdqa    XMMWORD PTR [edx], xmm7                       ;158.7
        pxor      xmm6, XMMWORD PTR [_ks_tbl+16+esi+edi]        ;158.16
        movdqa    XMMWORD PTR [16+edx], xmm6                    ;158.7
        pxor      xmm5, XMMWORD PTR [_ks_tbl+32+esi+edi]        ;158.16
        movdqa    XMMWORD PTR [32+edx], xmm5                    ;158.7
        pxor      xmm4, XMMWORD PTR [_ks_tbl+48+esi+edi]        ;158.16
        movdqa    XMMWORD PTR [48+edx], xmm4                    ;158.7
        pxor      xmm3, XMMWORD PTR [_ks_tbl+64+esi+edi]        ;158.16
        movdqa    XMMWORD PTR [64+edx], xmm3                    ;158.7
        pxor      xmm2, XMMWORD PTR [_ks_tbl+80+esi+edi]        ;158.16
        movdqa    XMMWORD PTR [80+edx], xmm2                    ;158.7
        pxor      xmm1, XMMWORD PTR [_ks_tbl+96+esi+edi]        ;158.16
        movdqa    XMMWORD PTR [96+edx], xmm1                    ;158.7
        pxor      xmm0, XMMWORD PTR [_ks_tbl+112+esi+edi]       ;158.16
        movdqa    XMMWORD PTR [112+edx], xmm0                   ;158.7
        jb        .B10.2        ; Prob 87%                      ;154.3
                                ; LOE eax edx ecx ebx ebp xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7
.B10.3:                         ; Preds .B10.2
        pop       edi                                           ;161.1
        pop       esi                                           ;161.1
        ret                                                     ;161.1
        ALIGN     16
                                ; LOE
; mark_end;
_sse2_DES_set_key ENDP
;_sse2_DES_set_key	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _sse2_DES_set_key
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _x86_DES_set_key
TXTST10:
; -- Begin  _x86_DES_set_key
;_x86_DES_set_key	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _x86_DES_set_key
; mark_begin;
       ALIGN     16
	PUBLIC _x86_DES_set_key
_x86_DES_set_key	PROC NEAR 
; parameter 1: 12 + esp
; parameter 2: 16 + esp
.B11.1:                         ; Preds .B11.0
        push      esi                                           ;168.65
        push      edi                                           ;168.65
        xor       eax, eax                                      ;177.3
        mov       ecx, DWORD PTR [16+esp]                       ;168.6
        pxor      xmm0, xmm0                                    ;174.5
        mov       edx, DWORD PTR [12+esp]                       ;168.6
        movdqu    XMMWORD PTR [ecx], xmm0                       ;174.5
        movdqu    XMMWORD PTR [16+ecx], xmm0                    ;174.5
                                ; LOE eax edx ecx ebx ebp
.B11.2:                         ; Preds .B11.8 .B11.1
        movzx     edi, BYTE PTR [eax+edx]                       ;178.33
        mov       esi, eax                                      ;177.3
        shl       edi, 7                                        ;178.33
        shl       esi, 15                                       ;177.3
        lea       edi, DWORD PTR [_ks_tbl+edi]                  ;178.5
        add       esi, edi                                      ;178.5
        cmp       ecx, esi                                      ;181.17
        jbe       .B11.4        ; Prob 50%                      ;181.17
                                ; LOE eax edx ecx ebx ebp esi
.B11.3:                         ; Preds .B11.2
        mov       edi, ecx                                      ;181.17
        sub       edi, esi                                      ;181.17
        cmp       edi, 32                                       ;181.17
        jge       .B11.6        ; Prob 50%                      ;181.17
                                ; LOE eax edx ecx ebx ebp esi
.B11.4:                         ; Preds .B11.2 .B11.3
        cmp       esi, ecx                                      ;181.17
        jbe       .B11.7        ; Prob 50%                      ;181.17
                                ; LOE eax edx ecx ebx ebp esi
.B11.5:                         ; Preds .B11.4
        mov       edi, esi                                      ;181.17
        sub       edi, ecx                                      ;181.17
        cmp       edi, 32                                       ;181.17
        jl        .B11.7        ; Prob 50%                      ;181.17
                                ; LOE eax edx ecx ebx ebp esi
.B11.6:                         ; Preds .B11.5 .B11.3
        movdqu    xmm1, XMMWORD PTR [ecx]                       ;181.7
        movdqu    xmm0, XMMWORD PTR [esi]                       ;181.7
        movdqu    xmm3, XMMWORD PTR [16+ecx]                    ;181.7
        pxor      xmm1, xmm0                                    ;181.7
        movdqu    XMMWORD PTR [ecx], xmm1                       ;181.7
        movdqu    xmm2, XMMWORD PTR [16+esi]                    ;181.7
        pxor      xmm3, xmm2                                    ;181.7
        movdqu    XMMWORD PTR [16+ecx], xmm3                    ;181.7
        jmp       .B11.8        ; Prob 100%                     ;181.7
                                ; LOE eax edx ecx ebx ebp
.B11.7:                         ; Preds .B11.5 .B11.4
        mov       edi, DWORD PTR [esi]                          ;181.17
        xor       DWORD PTR [ecx], edi                          ;181.7
        mov       edi, DWORD PTR [4+esi]                        ;181.17
        xor       DWORD PTR [4+ecx], edi                        ;181.7
        mov       edi, DWORD PTR [8+esi]                        ;181.17
        xor       DWORD PTR [8+ecx], edi                        ;181.7
        mov       edi, DWORD PTR [12+esi]                       ;181.17
        xor       DWORD PTR [12+ecx], edi                       ;181.7
        mov       edi, DWORD PTR [16+esi]                       ;181.17
        xor       DWORD PTR [16+ecx], edi                       ;181.7
        mov       edi, DWORD PTR [20+esi]                       ;181.17
        xor       DWORD PTR [20+ecx], edi                       ;181.7
        mov       edi, DWORD PTR [24+esi]                       ;181.17
        xor       DWORD PTR [24+ecx], edi                       ;181.7
        mov       esi, DWORD PTR [28+esi]                       ;181.17
        xor       DWORD PTR [28+ecx], esi                       ;181.7
                                ; LOE eax edx ecx ebx ebp
.B11.8:                         ; Preds .B11.7 .B11.6
        inc       eax                                           ;177.3
        cmp       eax, 8                                        ;177.3
        jb        .B11.2        ; Prob 87%                      ;177.3
                                ; LOE eax edx ecx ebx ebp
.B11.9:                         ; Preds .B11.8
        pop       edi                                           ;184.1
        pop       esi                                           ;184.1
        ret                                                     ;184.1
        ALIGN     16
                                ; LOE
; mark_end;
_x86_DES_set_key ENDP
;_x86_DES_set_key	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _x86_DES_set_key
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _lm
TXTST11:
; -- Begin  _lm
;_lm	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _lm
; mark_begin;
       ALIGN     16
	PUBLIC _lm
_lm	PROC NEAR 
; parameter 1: 8 + ebp
.B12.1:                         ; Preds .B12.0
        push      ebp                                           ;187.20
        mov       ebp, esp                                      ;187.20
        and       esp, -16                                      ;187.20
        sub       esp, 160                                      ;187.20
        xor       eax, eax                                      ;202.3
        pxor      xmm7, xmm7                                    ;202.3
        movdqa    xmm6, xmm7                                    ;202.3
        movdqa    xmm5, xmm6                                    ;202.3
        movdqa    xmm4, xmm5                                    ;202.3
        movdqa    xmm3, xmm4                                    ;202.3
        movdqa    xmm2, xmm3                                    ;202.3
        movdqa    xmm1, xmm2                                    ;202.3
        movdqa    xmm0, xmm1                                    ;202.3
        ALIGN     16
                                ; LOE eax ebx esi edi xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7
.B12.2:                         ; Preds .B12.2 .B12.1
        mov       ecx, eax                                      ;202.3
        movzx     edx, BYTE PTR [_start_pw+eax]                 ;202.20
        inc       eax                                           ;202.3
        shl       ecx, 15                                       ;202.3
        shl       edx, 7                                        ;202.3
        cmp       eax, 8                                        ;202.3
        pxor      xmm7, XMMWORD PTR [_ks_tbl+edx+ecx]           ;202.3
        pxor      xmm6, XMMWORD PTR [_ks_tbl+16+edx+ecx]        ;202.3
        pxor      xmm5, XMMWORD PTR [_ks_tbl+32+edx+ecx]        ;202.3
        pxor      xmm4, XMMWORD PTR [_ks_tbl+48+edx+ecx]        ;202.3
        pxor      xmm3, XMMWORD PTR [_ks_tbl+64+edx+ecx]        ;202.3
        pxor      xmm2, XMMWORD PTR [_ks_tbl+80+edx+ecx]        ;202.3
        pxor      xmm1, XMMWORD PTR [_ks_tbl+96+edx+ecx]        ;202.3
        pxor      xmm0, XMMWORD PTR [_ks_tbl+112+edx+ecx]       ;202.3
        jb        .B12.2        ; Prob 87%                      ;202.3
                                ; LOE eax ebx esi edi xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7
.B12.3:                         ; Preds .B12.2
        mov       eax, DWORD PTR [_ptext]                       ;203.3
        mov       ecx, 1                                        ;203.3
        mov       edx, DWORD PTR [_ptext+4]                     ;203.3
        mov       DWORD PTR [144+esp], eax                      ;203.3
        lea       eax, DWORD PTR [144+esp]                      ;203.3
        mov       DWORD PTR [4+eax], edx                        ;203.3
        lea       edx, DWORD PTR [16+esp]                       ;203.3
        movdqa    XMMWORD PTR [-16+eax], xmm0                   ;202.3
        movdqa    XMMWORD PTR [-32+eax], xmm1                   ;202.3
        movdqa    XMMWORD PTR [-48+eax], xmm2                   ;202.3
        movdqa    XMMWORD PTR [-64+eax], xmm3                   ;202.3
        movdqa    XMMWORD PTR [-80+eax], xmm4                   ;202.3
        movdqa    XMMWORD PTR [-96+eax], xmm5                   ;202.3
        movdqa    XMMWORD PTR [-112+eax], xmm6                  ;202.3
        movdqa    XMMWORD PTR [-128+eax], xmm7                  ;202.3
        call      _des_encrypt.                                 ;203.3
                                ; LOE ebx esi edi
.B12.4:                         ; Preds .B12.3
        mov       eax, DWORD PTR [144+esp]                      ;203.3
        mov       edx, DWORD PTR [148+esp]                      ;203.3
        cmp       eax, DWORD PTR [_hash]                        ;208.18
        jne       .B12.7        ; Prob 50%                      ;208.18
                                ; LOE edx ebx esi edi
.B12.5:                         ; Preds .B12.4
        cmp       edx, DWORD PTR [_hash+4]                      ;209.18
        jne       .B12.7        ; Prob 50%                      ;209.18
                                ; LOE ebx esi edi
.B12.6:                         ; Preds .B12.5
        mov       eax, 1                                        ;208.18
        mov       esp, ebp                                      ;208.18
        pop       ebp                                           ;208.18
        ret                                                     ;208.18
                                ; LOE eax ebx esi edi
.B12.7:                         ; Preds .B12.5 .B12.4
        xor       eax, eax                                      ;208.18
                                ; LOE eax ebx esi edi
.B12.8:                         ; Preds .B12.7
        mov       esp, ebp                                      ;208.18
        pop       ebp                                           ;208.18
        ret                                                     ;208.18
        ALIGN     16
                                ; LOE
; mark_end;
_lm ENDP
;_lm	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _lm
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _dump_pw
TXTST12:
; -- Begin  _dump_pw
;_dump_pw	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _dump_pw
; mark_begin;
       ALIGN     16
	PUBLIC _dump_pw
_dump_pw	PROC NEAR 
; parameter 1: 12 + esp
.B13.1:                         ; Preds .B13.0
        sub       esp, 8                                        ;212.30
        push      10                                            ;214.3
        call      _putchar                                      ;214.3
                                ; LOE ebx ebp esi edi
.B13.11:                        ; Preds .B13.1
        add       esp, 4                                        ;214.3
                                ; LOE ebx ebp esi edi
.B13.2:                         ; Preds .B13.11
        xor       eax, eax                                      ;215.8
        mov       edx, DWORD PTR [12+esp]                       ;212.6
        mov       DWORD PTR [4+esp], esi                        ;215.8
        mov       esi, eax                                      ;215.8
        mov       DWORD PTR [esp], edi                          ;215.8
        mov       edi, edx                                      ;215.8
                                ; LOE ebx ebp esi edi
.B13.3:                         ; Preds .B13.5 .B13.2
        cmp       DWORD PTR [edi+esi*4], -1                     ;215.33
        je        .B13.6        ; Prob 20%                      ;215.33
                                ; LOE ebx ebp esi edi
.B13.4:                         ; Preds .B13.3
        mov       ecx, DWORD PTR [edi+esi*4]                    ;216.5
        movsx     ecx, BYTE PTR [_alphabet+ecx]                 ;216.5
        push      ecx                                           ;216.5
        call      _putchar                                      ;216.5
                                ; LOE ebx ebp esi edi
.B13.12:                        ; Preds .B13.4
        add       esp, 4                                        ;216.5
                                ; LOE ebx ebp esi edi
.B13.5:                         ; Preds .B13.12
        inc       esi                                           ;215.36
        cmp       esi, 8                                        ;215.18
        jl        .B13.3        ; Prob 87%                      ;215.18
                                ; LOE ebx ebp esi edi
.B13.6:                         ; Preds .B13.3 .B13.5
        mov       esi, DWORD PTR [4+esp]                        ;
        mov       edi, DWORD PTR [esp]                          ;
                                ; LOE rsi rdi ebx ebp esi edi sil dil
.B13.7:                         ; Preds .B13.6
        add       esp, 8                                        ;218.1
        ret                                                     ;218.1
        ALIGN     16
                                ; LOE
; mark_end;
_dump_pw ENDP
;_dump_pw	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _dump_pw
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _DES_init_keys
TXTST13:
; -- Begin  _DES_init_keys
;_DES_init_keys	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _DES_init_keys
; mark_begin;
       ALIGN     16
	PUBLIC _DES_init_keys
_DES_init_keys	PROC NEAR 
; parameter 1: 8 + ebp
.B14.1:                         ; Preds .B14.0
        push      ebp                                           ;124.36
        mov       ebp, esp                                      ;124.36
        and       esp, -16                                      ;124.36
        push      esi                                           ;124.36
        push      edi                                           ;124.36
        push      ebx                                           ;124.36
        sub       esp, 180                                      ;124.36
        mov       edx, DWORD PTR [8+ebp]                        ;128.9
        mov       ecx, edx                                      ;128.9
        and       edx, -16                                      ;128.9
        pxor      xmm0, xmm0                                    ;128.9
        pcmpeqb   xmm0, XMMWORD PTR [edx]                       ;128.9
        pmovmskb  eax, xmm0                                     ;128.9
        and       ecx, 15                                       ;128.9
        shr       eax, cl                                       ;128.9
        bsf       eax, eax                                      ;128.9
        jne       L51           ; Prob 60%                      ;128.9
        mov       eax, edx                                      ;128.9
        add       edx, ecx                                      ;128.9
        call      ___intel_sse2_strlen                          ;128.9
L51:                                                            ;
                                ; LOE eax ebx esi edi
.B14.59:                        ; Preds .B14.1
        mov       edx, eax                                      ;128.9
        xor       eax, eax                                      ;130.3
        mov       DWORD PTR [8+esp], edx                        ;130.3
        pxor      xmm0, xmm0                                    ;130.3
                                ; LOE eax xmm0
.B14.2:                         ; Preds .B14.55 .B14.59
        movq      QWORD PTR [16+esp], xmm0                      ;131.5
                                ; LOE eax xmm0
.B14.3:                         ; Preds .B14.2
        cmp       DWORD PTR [8+esp], 0                          ;132.21
        jbe       .B14.55       ; Prob 10%                      ;132.21
                                ; LOE eax xmm0
.B14.4:                         ; Preds .B14.3
        mov       edi, DWORD PTR [shifts2.1460.0.3+12]          ;135.7
        mov       esi, eax                                      ;130.3
        mov       DWORD PTR [48+esp], edi                       ;135.7
        mov       edi, DWORD PTR [shifts2.1460.0.3+28]          ;135.7
        mov       DWORD PTR [64+esp], edi                       ;135.7
        mov       edx, DWORD PTR [shifts2.1460.0.3]             ;135.7
        mov       edi, DWORD PTR [shifts2.1460.0.3+48]          ;135.7
        mov       DWORD PTR [36+esp], edx                       ;135.7
        mov       DWORD PTR [72+esp], edi                       ;135.7
        mov       ecx, DWORD PTR [shifts2.1460.0.3+4]           ;135.7
        mov       ebx, DWORD PTR [shifts2.1460.0.3+8]           ;135.7
        mov       edx, DWORD PTR [shifts2.1460.0.3+16]          ;135.7
        mov       edi, DWORD PTR [shifts2.1460.0.3+52]          ;135.7
        mov       DWORD PTR [40+esp], ecx                       ;135.7
        mov       DWORD PTR [44+esp], ebx                       ;135.7
        mov       DWORD PTR [52+esp], edx                       ;135.7
        mov       DWORD PTR [32+esp], edi                       ;135.7
        mov       ecx, DWORD PTR [shifts2.1460.0.3+20]          ;135.7
        mov       ebx, DWORD PTR [shifts2.1460.0.3+24]          ;135.7
        mov       edx, DWORD PTR [shifts2.1460.0.3+32]          ;135.7
        mov       edi, DWORD PTR [shifts2.1460.0.3+56]          ;135.7
        mov       DWORD PTR [56+esp], ecx                       ;135.7
        mov       DWORD PTR [60+esp], ebx                       ;135.7
        mov       DWORD PTR [68+esp], edx                       ;135.7
        mov       DWORD PTR [24+esp], edi                       ;135.7
        shl       esi, 15                                       ;130.3
        mov       ebx, DWORD PTR [shifts2.1460.0.3+36]          ;135.7
        mov       ecx, DWORD PTR [shifts2.1460.0.3+40]          ;135.7
        mov       edx, DWORD PTR [shifts2.1460.0.3+44]          ;135.7
        mov       edi, DWORD PTR [shifts2.1460.0.3+60]          ;135.7
        mov       DWORD PTR [28+esp], 0                         ;132.5
        mov       DWORD PTR [12+esp], edi                       ;135.7
        mov       DWORD PTR [84+esp], edx                       ;135.7
        mov       DWORD PTR [80+esp], ecx                       ;135.7
        mov       DWORD PTR [76+esp], ebx                       ;135.7
        mov       DWORD PTR [92+esp], esi                       ;135.7
        mov       DWORD PTR [88+esp], eax                       ;135.7
                                ; LOE xmm0
.B14.5:                         ; Preds .B14.53 .B14.4
        mov       esi, DWORD PTR [8+ebp]                        ;133.15
        mov       eax, DWORD PTR [28+esp]                       ;133.15
        movzx     edx, BYTE PTR [eax+esi]                       ;133.15
        mov       eax, DWORD PTR [88+esp]                       ;133.7
        mov       BYTE PTR [16+esp+eax], dl                     ;133.7
        movzx     ecx, BYTE PTR [18+esp]                        ;134.22
        mov       edi, ecx                                      ;134.7
        movzx     eax, BYTE PTR [17+esp]                        ;134.22
        mov       ebx, eax                                      ;134.7
        movzx     edx, BYTE PTR [16+esp]                        ;134.22
        mov       esi, edx                                      ;134.7
        shl       eax, 5                                        ;134.7
        and       esi, 254                                      ;134.7
        shr       edi, 3                                        ;134.7
        shl       edx, 6                                        ;134.7
        or        eax, edi                                      ;134.7
        shr       ebx, 2                                        ;134.7
        add       eax, eax                                      ;134.7
        movzx     edi, BYTE PTR [19+esp]                        ;134.7
        or        edx, ebx                                      ;134.7
        mov       ebx, edi                                      ;134.7
        add       edx, edx                                      ;134.7
        shl       ecx, 4                                        ;134.7
        shr       ebx, 4                                        ;134.7
        or        ecx, ebx                                      ;134.7
        add       ecx, ecx                                      ;134.7
        mov       DWORD PTR [100+esp], ecx                      ;134.7
        movzx     ecx, BYTE PTR [20+esp]                        ;134.7
        mov       ebx, ecx                                      ;134.7
        shl       edi, 3                                        ;134.7
        shr       ebx, 5                                        ;134.7
        or        edi, ebx                                      ;134.7
        add       edi, edi                                      ;134.7
        mov       DWORD PTR [104+esp], edi                      ;134.7
        movzx     edi, BYTE PTR [21+esp]                        ;134.7
        mov       ebx, edi                                      ;134.7
        shl       ecx, 2                                        ;134.7
        add       edi, edi                                      ;134.7
        shr       ebx, 6                                        ;134.7
        or        ecx, ebx                                      ;134.7
        movzx     ebx, BYTE PTR [22+esp]                        ;134.7
        add       ecx, ecx                                      ;134.7
        mov       DWORD PTR [108+esp], ecx                      ;134.7
        mov       ecx, ebx                                      ;134.7
        shr       ecx, 7                                        ;134.7
        add       ebx, ebx                                      ;134.7
        movzx     edx, dl                                       ;134.7
        or        edi, ecx                                      ;134.7
        movzx     eax, al                                       ;134.7
        add       edi, edi                                      ;134.7
        movzx     ecx, BYTE PTR [_odd_parity+esi]               ;134.7
        movzx     esi, BYTE PTR [100+esp]                       ;134.7
        mov       BYTE PTR [esp], cl                            ;134.7
        movzx     ecx, BYTE PTR [_odd_parity+edx]               ;134.7
        movzx     edx, BYTE PTR [_odd_parity+eax]               ;134.7
        movzx     eax, BYTE PTR [_odd_parity+esi]               ;134.7
        movzx     esi, BYTE PTR [108+esp]                       ;134.7
        and       edi, 255                                      ;134.7
        movzx     ebx, bl                                       ;134.7
        mov       BYTE PTR [1+esp], cl                          ;134.7
        movzx     ecx, BYTE PTR [104+esp]                       ;134.7
        mov       BYTE PTR [3+esp], al                          ;134.7
        movzx     eax, BYTE PTR [_odd_parity+esi]               ;134.7
        mov       BYTE PTR [2+esp], dl                          ;134.7
        movzx     edx, BYTE PTR [_odd_parity+ecx]               ;134.7
        mov       BYTE PTR [5+esp], al                          ;134.7
        movzx     ecx, BYTE PTR [_odd_parity+edi]               ;134.7
        movzx     eax, BYTE PTR [_odd_parity+ebx]               ;134.7
        mov       BYTE PTR [4+esp], dl                          ;134.7
        mov       BYTE PTR [6+esp], cl                          ;134.7
        mov       BYTE PTR [7+esp], al                          ;134.7
        mov       ebx, DWORD PTR [4+esp]                        ;135.7
        mov       edx, ebx                                      ;135.7
        shr       edx, 4                                        ;135.7
        mov       eax, DWORD PTR [esp]                          ;135.7
        xor       edx, eax                                      ;135.7
        and       edx, 252645135                                ;135.7
        xor       eax, edx                                      ;135.7
        shl       edx, 4                                        ;135.7
        mov       esi, eax                                      ;135.7
        xor       ebx, edx                                      ;135.7
        mov       ecx, DWORD PTR [28+esp]                       ;132.5
        shl       ecx, 7                                        ;132.5
        mov       DWORD PTR [96+esp], ecx                       ;132.5
        mov       ecx, ebx                                      ;135.7
        shl       ecx, 18                                       ;135.7
        xor       ecx, ebx                                      ;135.7
        shl       esi, 18                                       ;135.7
        and       ecx, -859045888                               ;135.7
        xor       esi, eax                                      ;135.7
        xor       ebx, ecx                                      ;135.7
        shr       ecx, 18                                       ;135.7
        and       esi, -859045888                               ;135.7
        xor       ebx, ecx                                      ;135.7
        xor       eax, esi                                      ;135.7
        shr       esi, 18                                       ;135.7
        mov       edx, ebx                                      ;135.7
        shr       edx, 1                                        ;135.7
        xor       eax, esi                                      ;135.7
        xor       edx, eax                                      ;135.7
        and       edx, 1431655765                               ;135.7
        xor       eax, edx                                      ;135.7
        add       edx, edx                                      ;135.7
        mov       edi, eax                                      ;135.7
        xor       ebx, edx                                      ;135.7
        shr       edi, 8                                        ;135.7
        xor       edi, ebx                                      ;135.7
        and       edi, 16711935                                 ;135.7
        xor       ebx, edi                                      ;135.7
        shl       edi, 8                                        ;135.7
        mov       ecx, ebx                                      ;135.7
        shr       ecx, 1                                        ;135.7
        xor       eax, edi                                      ;135.7
        xor       ecx, eax                                      ;135.7
        and       ecx, 1431655765                               ;135.7
        xor       eax, ecx                                      ;135.7
        add       ecx, ecx                                      ;135.7
        xor       ebx, ecx                                      ;135.7
        movzx     ecx, bl                                       ;135.7
        mov       edx, ebx                                      ;135.7
        shl       ecx, 16                                       ;135.7
        and       edx, 65280                                    ;135.7
        and       ebx, 16711680                                 ;135.7
        or        ecx, edx                                      ;135.7
        shr       ebx, 16                                       ;135.7
        or        ecx, ebx                                      ;135.7
        mov       ebx, eax                                      ;135.7
        and       ebx, -268435456                               ;135.7
        and       eax, 268435455                                ;135.7
        shr       ebx, 4                                        ;135.7
        or        ecx, ebx                                      ;135.7
        cmp       DWORD PTR [36+esp], 0                         ;135.7
        je        .B14.7        ; Prob 50%                      ;135.7
                                ; LOE eax ecx xmm0
.B14.6:                         ; Preds .B14.5
        mov       edx, eax                                      ;135.7
        shr       edx, 2                                        ;135.7
        shl       eax, 26                                       ;135.7
        or        edx, eax                                      ;135.7
        mov       eax, ecx                                      ;135.7
        shr       eax, 2                                        ;135.7
        shl       ecx, 26                                       ;135.7
        or        eax, ecx                                      ;135.7
        jmp       .B14.8        ; Prob 100%                     ;135.7
                                ; LOE eax edx xmm0
.B14.7:                         ; Preds .B14.5
        mov       edx, eax                                      ;135.7
        shr       edx, 1                                        ;135.7
        shl       eax, 27                                       ;135.7
        or        edx, eax                                      ;135.7
        mov       eax, ecx                                      ;135.7
        shr       eax, 1                                        ;135.7
        shl       ecx, 27                                       ;135.7
        or        eax, ecx                                      ;135.7
                                ; LOE eax edx xmm0
.B14.8:                         ; Preds .B14.6 .B14.7
        and       edx, 268435455                                ;135.7
        and       eax, 268435455                                ;135.7
        mov       ecx, edx                                      ;135.7
        mov       edi, edx                                      ;135.7
        shr       ecx, 6                                        ;135.7
        mov       esi, edx                                      ;135.7
        shr       edi, 7                                        ;135.7
        and       esi, 63                                       ;135.7
        and       ecx, 3                                        ;135.7
        and       edi, 60                                       ;135.7
        or        ecx, edi                                      ;135.7
        mov       edi, edx                                      ;135.7
        shr       edi, 21                                       ;135.7
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;135.7
        mov       esi, edx                                      ;135.7
        shr       esi, 14                                       ;135.7
        and       edi, 6                                        ;135.7
        or        ebx, DWORD PTR [_des_skb+256+ecx*4]           ;135.7
        mov       ecx, edx                                      ;135.7
        shr       ecx, 13                                       ;135.7
        and       esi, 48                                       ;135.7
        and       ecx, 15                                       ;135.7
        or        ecx, esi                                      ;135.7
        mov       esi, edx                                      ;135.7
        shr       esi, 20                                       ;135.7
        and       esi, 1                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, eax                                      ;135.7
        or        ebx, DWORD PTR [_des_skb+512+ecx*4]           ;135.7
        mov       ecx, edx                                      ;135.7
        shr       ecx, 22                                       ;135.7
        and       ecx, 56                                       ;135.7
        or        esi, ecx                                      ;135.7
        mov       ecx, eax                                      ;135.7
        shr       edi, 8                                        ;135.7
        and       ecx, 63                                       ;135.7
        and       edi, 60                                       ;135.7
        mov       DWORD PTR [112+esp], eax                      ;135.7
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;135.7
        mov       esi, eax                                      ;135.7
        shr       esi, 7                                        ;135.7
        and       esi, 3                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, eax                                      ;135.7
        mov       ecx, DWORD PTR [_des_skb+1024+ecx*4]          ;135.7
        shr       edi, 15                                       ;135.7
        and       edi, 63                                       ;135.7
        or        ecx, DWORD PTR [_des_skb+1280+esi*4]          ;135.7
        mov       esi, eax                                      ;135.7
        shr       esi, 21                                       ;135.7
        shr       eax, 22                                       ;135.7
        and       esi, 15                                       ;135.7
        and       eax, 48                                       ;135.7
        or        esi, eax                                      ;135.7
        or        ecx, DWORD PTR [_des_skb+1536+edi*4]          ;135.7
        movzx     edi, bx                                       ;135.7
        shr       ebx, 16                                       ;135.7
        or        ecx, DWORD PTR [_des_skb+1792+esi*4]          ;135.7
        mov       eax, ecx                                      ;135.7
        and       ecx, -65536                                   ;135.7
        shl       eax, 16                                       ;135.7
        or        ebx, ecx                                      ;135.7
        mov       esi, DWORD PTR [92+esp]                       ;135.7
        or        eax, edi                                      ;135.7
        mov       edi, DWORD PTR [96+esp]                       ;135.7
        ror       eax, 30                                       ;135.7
        ror       ebx, 26                                       ;135.7
        mov       DWORD PTR [_ks_tbl+esi+edi], eax              ;135.7
        mov       DWORD PTR [_ks_tbl+4+esi+edi], ebx            ;135.7
        mov       eax, DWORD PTR [112+esp]                      ;135.7
        cmp       DWORD PTR [40+esp], 0                         ;135.7
        je        .B14.10       ; Prob 50%                      ;135.7
                                ; LOE rax eax edx al ah xmm0
.B14.9:                         ; Preds .B14.8
        mov       ecx, edx                                      ;135.7
        shr       ecx, 2                                        ;135.7
        shl       edx, 26                                       ;135.7
        or        ecx, edx                                      ;135.7
        mov       edx, eax                                      ;135.7
        shr       edx, 2                                        ;135.7
        shl       eax, 26                                       ;135.7
        or        edx, eax                                      ;135.7
        jmp       .B14.11       ; Prob 100%                     ;135.7
                                ; LOE edx ecx xmm0
.B14.10:                        ; Preds .B14.8
        mov       ecx, edx                                      ;135.7
        shr       ecx, 1                                        ;135.7
        shl       edx, 27                                       ;135.7
        or        ecx, edx                                      ;135.7
        mov       edx, eax                                      ;135.7
        shr       edx, 1                                        ;135.7
        shl       eax, 27                                       ;135.7
        or        edx, eax                                      ;135.7
                                ; LOE edx ecx xmm0
.B14.11:                        ; Preds .B14.9 .B14.10
        and       ecx, 268435455                                ;135.7
        and       edx, 268435455                                ;135.7
        mov       eax, ecx                                      ;135.7
        mov       edi, ecx                                      ;135.7
        shr       eax, 6                                        ;135.7
        mov       esi, ecx                                      ;135.7
        shr       edi, 7                                        ;135.7
        and       esi, 63                                       ;135.7
        and       eax, 3                                        ;135.7
        and       edi, 60                                       ;135.7
        or        eax, edi                                      ;135.7
        mov       edi, ecx                                      ;135.7
        shr       edi, 21                                       ;135.7
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;135.7
        mov       esi, ecx                                      ;135.7
        shr       esi, 14                                       ;135.7
        and       edi, 6                                        ;135.7
        or        ebx, DWORD PTR [_des_skb+256+eax*4]           ;135.7
        mov       eax, ecx                                      ;135.7
        shr       eax, 13                                       ;135.7
        and       esi, 48                                       ;135.7
        and       eax, 15                                       ;135.7
        or        eax, esi                                      ;135.7
        mov       esi, ecx                                      ;135.7
        shr       esi, 20                                       ;135.7
        and       esi, 1                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, edx                                      ;135.7
        or        ebx, DWORD PTR [_des_skb+512+eax*4]           ;135.7
        mov       eax, ecx                                      ;135.7
        shr       eax, 22                                       ;135.7
        and       eax, 56                                       ;135.7
        or        esi, eax                                      ;135.7
        mov       eax, edx                                      ;135.7
        shr       edi, 8                                        ;135.7
        and       eax, 63                                       ;135.7
        and       edi, 60                                       ;135.7
        mov       DWORD PTR [116+esp], edx                      ;135.7
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;135.7
        mov       esi, edx                                      ;135.7
        shr       esi, 7                                        ;135.7
        and       esi, 3                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, edx                                      ;135.7
        mov       eax, DWORD PTR [_des_skb+1024+eax*4]          ;135.7
        shr       edi, 15                                       ;135.7
        and       edi, 63                                       ;135.7
        or        eax, DWORD PTR [_des_skb+1280+esi*4]          ;135.7
        mov       esi, edx                                      ;135.7
        shr       esi, 21                                       ;135.7
        shr       edx, 22                                       ;135.7
        and       esi, 15                                       ;135.7
        and       edx, 48                                       ;135.7
        or        esi, edx                                      ;135.7
        or        eax, DWORD PTR [_des_skb+1536+edi*4]          ;135.7
        movzx     edi, bx                                       ;135.7
        shr       ebx, 16                                       ;135.7
        or        eax, DWORD PTR [_des_skb+1792+esi*4]          ;135.7
        mov       edx, eax                                      ;135.7
        and       eax, -65536                                   ;135.7
        shl       edx, 16                                       ;135.7
        or        ebx, eax                                      ;135.7
        mov       esi, DWORD PTR [92+esp]                       ;135.7
        or        edx, edi                                      ;135.7
        mov       edi, DWORD PTR [96+esp]                       ;135.7
        ror       edx, 30                                       ;135.7
        ror       ebx, 26                                       ;135.7
        mov       DWORD PTR [_ks_tbl+8+esi+edi], edx            ;135.7
        mov       DWORD PTR [_ks_tbl+12+esi+edi], ebx           ;135.7
        mov       edx, DWORD PTR [116+esp]                      ;135.7
        cmp       DWORD PTR [44+esp], 0                         ;135.7
        je        .B14.13       ; Prob 50%                      ;135.7
                                ; LOE rdx edx ecx dl dh xmm0
.B14.12:                        ; Preds .B14.11
        mov       ebx, ecx                                      ;135.7
        mov       eax, edx                                      ;135.7
        shr       ebx, 2                                        ;135.7
        shl       ecx, 26                                       ;135.7
        shr       eax, 2                                        ;135.7
        or        ebx, ecx                                      ;135.7
        shl       edx, 26                                       ;135.7
        or        eax, edx                                      ;135.7
        jmp       .B14.14       ; Prob 100%                     ;135.7
                                ; LOE eax ebx xmm0
.B14.13:                        ; Preds .B14.11
        mov       ebx, ecx                                      ;135.7
        mov       eax, edx                                      ;135.7
        shr       ebx, 1                                        ;135.7
        shl       ecx, 27                                       ;135.7
        shr       eax, 1                                        ;135.7
        or        ebx, ecx                                      ;135.7
        shl       edx, 27                                       ;135.7
        or        eax, edx                                      ;135.7
                                ; LOE eax ebx xmm0
.B14.14:                        ; Preds .B14.12 .B14.13
        and       ebx, 268435455                                ;135.7
        and       eax, 268435455                                ;135.7
        mov       edx, ebx                                      ;135.7
        mov       edi, ebx                                      ;135.7
        shr       edx, 6                                        ;135.7
        mov       esi, ebx                                      ;135.7
        shr       edi, 7                                        ;135.7
        and       esi, 63                                       ;135.7
        and       edx, 3                                        ;135.7
        and       edi, 60                                       ;135.7
        or        edx, edi                                      ;135.7
        mov       edi, ebx                                      ;135.7
        shr       edi, 21                                       ;135.7
        mov       ecx, DWORD PTR [_des_skb+esi*4]               ;135.7
        mov       esi, ebx                                      ;135.7
        shr       esi, 14                                       ;135.7
        and       edi, 6                                        ;135.7
        or        ecx, DWORD PTR [_des_skb+256+edx*4]           ;135.7
        mov       edx, ebx                                      ;135.7
        shr       edx, 13                                       ;135.7
        and       esi, 48                                       ;135.7
        and       edx, 15                                       ;135.7
        or        edx, esi                                      ;135.7
        mov       esi, ebx                                      ;135.7
        shr       esi, 20                                       ;135.7
        and       esi, 1                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, eax                                      ;135.7
        or        ecx, DWORD PTR [_des_skb+512+edx*4]           ;135.7
        mov       edx, ebx                                      ;135.7
        shr       edx, 22                                       ;135.7
        and       edx, 56                                       ;135.7
        or        esi, edx                                      ;135.7
        mov       edx, eax                                      ;135.7
        shr       edi, 8                                        ;135.7
        and       edx, 63                                       ;135.7
        and       edi, 60                                       ;135.7
        mov       DWORD PTR [120+esp], eax                      ;135.7
        or        ecx, DWORD PTR [_des_skb+768+esi*4]           ;135.7
        mov       esi, eax                                      ;135.7
        shr       esi, 7                                        ;135.7
        and       esi, 3                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, eax                                      ;135.7
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;135.7
        shr       edi, 15                                       ;135.7
        and       edi, 63                                       ;135.7
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;135.7
        mov       esi, eax                                      ;135.7
        shr       esi, 21                                       ;135.7
        shr       eax, 22                                       ;135.7
        and       esi, 15                                       ;135.7
        and       eax, 48                                       ;135.7
        or        esi, eax                                      ;135.7
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;135.7
        movzx     edi, cx                                       ;135.7
        shr       ecx, 16                                       ;135.7
        or        edx, DWORD PTR [_des_skb+1792+esi*4]          ;135.7
        mov       eax, edx                                      ;135.7
        and       edx, -65536                                   ;135.7
        shl       eax, 16                                       ;135.7
        or        ecx, edx                                      ;135.7
        mov       esi, DWORD PTR [92+esp]                       ;135.7
        or        eax, edi                                      ;135.7
        mov       edi, DWORD PTR [96+esp]                       ;135.7
        ror       eax, 30                                       ;135.7
        ror       ecx, 26                                       ;135.7
        mov       DWORD PTR [_ks_tbl+16+esi+edi], eax           ;135.7
        mov       DWORD PTR [_ks_tbl+20+esi+edi], ecx           ;135.7
        mov       eax, DWORD PTR [120+esp]                      ;135.7
        cmp       DWORD PTR [48+esp], 0                         ;135.7
        je        .B14.16       ; Prob 50%                      ;135.7
                                ; LOE rax eax ebx al ah xmm0
.B14.15:                        ; Preds .B14.14
        mov       ecx, ebx                                      ;135.7
        mov       edx, eax                                      ;135.7
        shr       ecx, 2                                        ;135.7
        shl       ebx, 26                                       ;135.7
        shr       edx, 2                                        ;135.7
        or        ecx, ebx                                      ;135.7
        shl       eax, 26                                       ;135.7
        or        edx, eax                                      ;135.7
        jmp       .B14.17       ; Prob 100%                     ;135.7
                                ; LOE edx ecx xmm0
.B14.16:                        ; Preds .B14.14
        mov       ecx, ebx                                      ;135.7
        mov       edx, eax                                      ;135.7
        shr       ecx, 1                                        ;135.7
        shl       ebx, 27                                       ;135.7
        shr       edx, 1                                        ;135.7
        or        ecx, ebx                                      ;135.7
        shl       eax, 27                                       ;135.7
        or        edx, eax                                      ;135.7
                                ; LOE edx ecx xmm0
.B14.17:                        ; Preds .B14.15 .B14.16
        and       ecx, 268435455                                ;135.7
        and       edx, 268435455                                ;135.7
        mov       eax, ecx                                      ;135.7
        mov       edi, ecx                                      ;135.7
        shr       eax, 6                                        ;135.7
        mov       esi, ecx                                      ;135.7
        shr       edi, 7                                        ;135.7
        and       esi, 63                                       ;135.7
        and       eax, 3                                        ;135.7
        and       edi, 60                                       ;135.7
        or        eax, edi                                      ;135.7
        mov       edi, ecx                                      ;135.7
        shr       edi, 21                                       ;135.7
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;135.7
        mov       esi, ecx                                      ;135.7
        shr       esi, 14                                       ;135.7
        and       edi, 6                                        ;135.7
        or        ebx, DWORD PTR [_des_skb+256+eax*4]           ;135.7
        mov       eax, ecx                                      ;135.7
        shr       eax, 13                                       ;135.7
        and       esi, 48                                       ;135.7
        and       eax, 15                                       ;135.7
        or        eax, esi                                      ;135.7
        mov       esi, ecx                                      ;135.7
        shr       esi, 20                                       ;135.7
        and       esi, 1                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, edx                                      ;135.7
        or        ebx, DWORD PTR [_des_skb+512+eax*4]           ;135.7
        mov       eax, ecx                                      ;135.7
        shr       eax, 22                                       ;135.7
        and       eax, 56                                       ;135.7
        or        esi, eax                                      ;135.7
        mov       eax, edx                                      ;135.7
        shr       edi, 8                                        ;135.7
        and       eax, 63                                       ;135.7
        and       edi, 60                                       ;135.7
        mov       DWORD PTR [124+esp], edx                      ;135.7
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;135.7
        mov       esi, edx                                      ;135.7
        shr       esi, 7                                        ;135.7
        and       esi, 3                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, edx                                      ;135.7
        mov       eax, DWORD PTR [_des_skb+1024+eax*4]          ;135.7
        shr       edi, 15                                       ;135.7
        and       edi, 63                                       ;135.7
        or        eax, DWORD PTR [_des_skb+1280+esi*4]          ;135.7
        mov       esi, edx                                      ;135.7
        shr       esi, 21                                       ;135.7
        shr       edx, 22                                       ;135.7
        and       esi, 15                                       ;135.7
        and       edx, 48                                       ;135.7
        or        esi, edx                                      ;135.7
        or        eax, DWORD PTR [_des_skb+1536+edi*4]          ;135.7
        movzx     edi, bx                                       ;135.7
        shr       ebx, 16                                       ;135.7
        or        eax, DWORD PTR [_des_skb+1792+esi*4]          ;135.7
        mov       edx, eax                                      ;135.7
        and       eax, -65536                                   ;135.7
        shl       edx, 16                                       ;135.7
        or        ebx, eax                                      ;135.7
        mov       esi, DWORD PTR [92+esp]                       ;135.7
        or        edx, edi                                      ;135.7
        mov       edi, DWORD PTR [96+esp]                       ;135.7
        ror       edx, 30                                       ;135.7
        ror       ebx, 26                                       ;135.7
        mov       DWORD PTR [_ks_tbl+24+esi+edi], edx           ;135.7
        mov       DWORD PTR [_ks_tbl+28+esi+edi], ebx           ;135.7
        mov       edx, DWORD PTR [124+esp]                      ;135.7
        cmp       DWORD PTR [52+esp], 0                         ;135.7
        je        .B14.19       ; Prob 50%                      ;135.7
                                ; LOE rdx edx ecx dl dh xmm0
.B14.18:                        ; Preds .B14.17
        mov       ebx, ecx                                      ;135.7
        mov       eax, edx                                      ;135.7
        shr       ebx, 2                                        ;135.7
        shl       ecx, 26                                       ;135.7
        shr       eax, 2                                        ;135.7
        or        ebx, ecx                                      ;135.7
        shl       edx, 26                                       ;135.7
        or        eax, edx                                      ;135.7
        jmp       .B14.20       ; Prob 100%                     ;135.7
                                ; LOE eax ebx xmm0
.B14.19:                        ; Preds .B14.17
        mov       ebx, ecx                                      ;135.7
        mov       eax, edx                                      ;135.7
        shr       ebx, 1                                        ;135.7
        shl       ecx, 27                                       ;135.7
        shr       eax, 1                                        ;135.7
        or        ebx, ecx                                      ;135.7
        shl       edx, 27                                       ;135.7
        or        eax, edx                                      ;135.7
                                ; LOE eax ebx xmm0
.B14.20:                        ; Preds .B14.18 .B14.19
        and       ebx, 268435455                                ;135.7
        and       eax, 268435455                                ;135.7
        mov       edx, ebx                                      ;135.7
        mov       edi, ebx                                      ;135.7
        shr       edx, 6                                        ;135.7
        mov       esi, ebx                                      ;135.7
        shr       edi, 7                                        ;135.7
        and       esi, 63                                       ;135.7
        and       edx, 3                                        ;135.7
        and       edi, 60                                       ;135.7
        or        edx, edi                                      ;135.7
        mov       edi, ebx                                      ;135.7
        shr       edi, 21                                       ;135.7
        mov       ecx, DWORD PTR [_des_skb+esi*4]               ;135.7
        mov       esi, ebx                                      ;135.7
        shr       esi, 14                                       ;135.7
        and       edi, 6                                        ;135.7
        or        ecx, DWORD PTR [_des_skb+256+edx*4]           ;135.7
        mov       edx, ebx                                      ;135.7
        shr       edx, 13                                       ;135.7
        and       esi, 48                                       ;135.7
        and       edx, 15                                       ;135.7
        or        edx, esi                                      ;135.7
        mov       esi, ebx                                      ;135.7
        shr       esi, 20                                       ;135.7
        and       esi, 1                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, eax                                      ;135.7
        or        ecx, DWORD PTR [_des_skb+512+edx*4]           ;135.7
        mov       edx, ebx                                      ;135.7
        shr       edx, 22                                       ;135.7
        and       edx, 56                                       ;135.7
        or        esi, edx                                      ;135.7
        mov       edx, eax                                      ;135.7
        shr       edi, 8                                        ;135.7
        and       edx, 63                                       ;135.7
        and       edi, 60                                       ;135.7
        mov       DWORD PTR [128+esp], eax                      ;135.7
        or        ecx, DWORD PTR [_des_skb+768+esi*4]           ;135.7
        mov       esi, eax                                      ;135.7
        shr       esi, 7                                        ;135.7
        and       esi, 3                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, eax                                      ;135.7
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;135.7
        shr       edi, 15                                       ;135.7
        and       edi, 63                                       ;135.7
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;135.7
        mov       esi, eax                                      ;135.7
        shr       esi, 21                                       ;135.7
        shr       eax, 22                                       ;135.7
        and       esi, 15                                       ;135.7
        and       eax, 48                                       ;135.7
        or        esi, eax                                      ;135.7
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;135.7
        movzx     edi, cx                                       ;135.7
        shr       ecx, 16                                       ;135.7
        or        edx, DWORD PTR [_des_skb+1792+esi*4]          ;135.7
        mov       eax, edx                                      ;135.7
        and       edx, -65536                                   ;135.7
        shl       eax, 16                                       ;135.7
        or        ecx, edx                                      ;135.7
        mov       esi, DWORD PTR [92+esp]                       ;135.7
        or        eax, edi                                      ;135.7
        mov       edi, DWORD PTR [96+esp]                       ;135.7
        ror       eax, 30                                       ;135.7
        ror       ecx, 26                                       ;135.7
        mov       DWORD PTR [_ks_tbl+32+esi+edi], eax           ;135.7
        mov       DWORD PTR [_ks_tbl+36+esi+edi], ecx           ;135.7
        mov       eax, DWORD PTR [128+esp]                      ;135.7
        cmp       DWORD PTR [56+esp], 0                         ;135.7
        je        .B14.22       ; Prob 50%                      ;135.7
                                ; LOE rax eax ebx al ah xmm0
.B14.21:                        ; Preds .B14.20
        mov       ecx, ebx                                      ;135.7
        mov       edx, eax                                      ;135.7
        shr       ecx, 2                                        ;135.7
        shl       ebx, 26                                       ;135.7
        shr       edx, 2                                        ;135.7
        or        ecx, ebx                                      ;135.7
        shl       eax, 26                                       ;135.7
        or        edx, eax                                      ;135.7
        jmp       .B14.23       ; Prob 100%                     ;135.7
                                ; LOE edx ecx xmm0
.B14.22:                        ; Preds .B14.20
        mov       ecx, ebx                                      ;135.7
        mov       edx, eax                                      ;135.7
        shr       ecx, 1                                        ;135.7
        shl       ebx, 27                                       ;135.7
        shr       edx, 1                                        ;135.7
        or        ecx, ebx                                      ;135.7
        shl       eax, 27                                       ;135.7
        or        edx, eax                                      ;135.7
                                ; LOE edx ecx xmm0
.B14.23:                        ; Preds .B14.21 .B14.22
        and       ecx, 268435455                                ;135.7
        and       edx, 268435455                                ;135.7
        mov       eax, ecx                                      ;135.7
        mov       edi, ecx                                      ;135.7
        shr       eax, 6                                        ;135.7
        mov       esi, ecx                                      ;135.7
        shr       edi, 7                                        ;135.7
        and       esi, 63                                       ;135.7
        and       eax, 3                                        ;135.7
        and       edi, 60                                       ;135.7
        or        eax, edi                                      ;135.7
        mov       edi, ecx                                      ;135.7
        shr       edi, 21                                       ;135.7
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;135.7
        mov       esi, ecx                                      ;135.7
        shr       esi, 14                                       ;135.7
        and       edi, 6                                        ;135.7
        or        ebx, DWORD PTR [_des_skb+256+eax*4]           ;135.7
        mov       eax, ecx                                      ;135.7
        shr       eax, 13                                       ;135.7
        and       esi, 48                                       ;135.7
        and       eax, 15                                       ;135.7
        or        eax, esi                                      ;135.7
        mov       esi, ecx                                      ;135.7
        shr       esi, 20                                       ;135.7
        and       esi, 1                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, edx                                      ;135.7
        or        ebx, DWORD PTR [_des_skb+512+eax*4]           ;135.7
        mov       eax, ecx                                      ;135.7
        shr       eax, 22                                       ;135.7
        and       eax, 56                                       ;135.7
        or        esi, eax                                      ;135.7
        mov       eax, edx                                      ;135.7
        shr       edi, 8                                        ;135.7
        and       eax, 63                                       ;135.7
        and       edi, 60                                       ;135.7
        mov       DWORD PTR [132+esp], edx                      ;135.7
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;135.7
        mov       esi, edx                                      ;135.7
        shr       esi, 7                                        ;135.7
        and       esi, 3                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, edx                                      ;135.7
        mov       eax, DWORD PTR [_des_skb+1024+eax*4]          ;135.7
        shr       edi, 15                                       ;135.7
        and       edi, 63                                       ;135.7
        or        eax, DWORD PTR [_des_skb+1280+esi*4]          ;135.7
        mov       esi, edx                                      ;135.7
        shr       esi, 21                                       ;135.7
        shr       edx, 22                                       ;135.7
        and       esi, 15                                       ;135.7
        and       edx, 48                                       ;135.7
        or        esi, edx                                      ;135.7
        or        eax, DWORD PTR [_des_skb+1536+edi*4]          ;135.7
        movzx     edi, bx                                       ;135.7
        shr       ebx, 16                                       ;135.7
        or        eax, DWORD PTR [_des_skb+1792+esi*4]          ;135.7
        mov       edx, eax                                      ;135.7
        and       eax, -65536                                   ;135.7
        shl       edx, 16                                       ;135.7
        or        ebx, eax                                      ;135.7
        mov       esi, DWORD PTR [92+esp]                       ;135.7
        or        edx, edi                                      ;135.7
        mov       edi, DWORD PTR [96+esp]                       ;135.7
        ror       edx, 30                                       ;135.7
        ror       ebx, 26                                       ;135.7
        mov       DWORD PTR [_ks_tbl+40+esi+edi], edx           ;135.7
        mov       DWORD PTR [_ks_tbl+44+esi+edi], ebx           ;135.7
        mov       edx, DWORD PTR [132+esp]                      ;135.7
        cmp       DWORD PTR [60+esp], 0                         ;135.7
        je        .B14.25       ; Prob 50%                      ;135.7
                                ; LOE rdx edx ecx dl dh xmm0
.B14.24:                        ; Preds .B14.23
        mov       ebx, ecx                                      ;135.7
        mov       eax, edx                                      ;135.7
        shr       ebx, 2                                        ;135.7
        shl       ecx, 26                                       ;135.7
        shr       eax, 2                                        ;135.7
        or        ebx, ecx                                      ;135.7
        shl       edx, 26                                       ;135.7
        or        eax, edx                                      ;135.7
        jmp       .B14.26       ; Prob 100%                     ;135.7
                                ; LOE eax ebx xmm0
.B14.25:                        ; Preds .B14.23
        mov       ebx, ecx                                      ;135.7
        mov       eax, edx                                      ;135.7
        shr       ebx, 1                                        ;135.7
        shl       ecx, 27                                       ;135.7
        shr       eax, 1                                        ;135.7
        or        ebx, ecx                                      ;135.7
        shl       edx, 27                                       ;135.7
        or        eax, edx                                      ;135.7
                                ; LOE eax ebx xmm0
.B14.26:                        ; Preds .B14.24 .B14.25
        and       ebx, 268435455                                ;135.7
        and       eax, 268435455                                ;135.7
        mov       edx, ebx                                      ;135.7
        mov       edi, ebx                                      ;135.7
        shr       edx, 6                                        ;135.7
        mov       esi, ebx                                      ;135.7
        shr       edi, 7                                        ;135.7
        and       esi, 63                                       ;135.7
        and       edx, 3                                        ;135.7
        and       edi, 60                                       ;135.7
        or        edx, edi                                      ;135.7
        mov       edi, ebx                                      ;135.7
        shr       edi, 21                                       ;135.7
        mov       ecx, DWORD PTR [_des_skb+esi*4]               ;135.7
        mov       esi, ebx                                      ;135.7
        shr       esi, 14                                       ;135.7
        and       edi, 6                                        ;135.7
        or        ecx, DWORD PTR [_des_skb+256+edx*4]           ;135.7
        mov       edx, ebx                                      ;135.7
        shr       edx, 13                                       ;135.7
        and       esi, 48                                       ;135.7
        and       edx, 15                                       ;135.7
        or        edx, esi                                      ;135.7
        mov       esi, ebx                                      ;135.7
        shr       esi, 20                                       ;135.7
        and       esi, 1                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, eax                                      ;135.7
        or        ecx, DWORD PTR [_des_skb+512+edx*4]           ;135.7
        mov       edx, ebx                                      ;135.7
        shr       edx, 22                                       ;135.7
        and       edx, 56                                       ;135.7
        or        esi, edx                                      ;135.7
        mov       edx, eax                                      ;135.7
        shr       edi, 8                                        ;135.7
        and       edx, 63                                       ;135.7
        and       edi, 60                                       ;135.7
        mov       DWORD PTR [136+esp], eax                      ;135.7
        or        ecx, DWORD PTR [_des_skb+768+esi*4]           ;135.7
        mov       esi, eax                                      ;135.7
        shr       esi, 7                                        ;135.7
        and       esi, 3                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, eax                                      ;135.7
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;135.7
        shr       edi, 15                                       ;135.7
        and       edi, 63                                       ;135.7
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;135.7
        mov       esi, eax                                      ;135.7
        shr       esi, 21                                       ;135.7
        shr       eax, 22                                       ;135.7
        and       esi, 15                                       ;135.7
        and       eax, 48                                       ;135.7
        or        esi, eax                                      ;135.7
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;135.7
        movzx     edi, cx                                       ;135.7
        shr       ecx, 16                                       ;135.7
        or        edx, DWORD PTR [_des_skb+1792+esi*4]          ;135.7
        mov       eax, edx                                      ;135.7
        and       edx, -65536                                   ;135.7
        shl       eax, 16                                       ;135.7
        or        ecx, edx                                      ;135.7
        mov       esi, DWORD PTR [92+esp]                       ;135.7
        or        eax, edi                                      ;135.7
        mov       edi, DWORD PTR [96+esp]                       ;135.7
        ror       eax, 30                                       ;135.7
        ror       ecx, 26                                       ;135.7
        mov       DWORD PTR [_ks_tbl+48+esi+edi], eax           ;135.7
        mov       DWORD PTR [_ks_tbl+52+esi+edi], ecx           ;135.7
        mov       eax, DWORD PTR [136+esp]                      ;135.7
        cmp       DWORD PTR [64+esp], 0                         ;135.7
        je        .B14.28       ; Prob 50%                      ;135.7
                                ; LOE rax eax ebx al ah xmm0
.B14.27:                        ; Preds .B14.26
        mov       ecx, ebx                                      ;135.7
        mov       edx, eax                                      ;135.7
        shr       ecx, 2                                        ;135.7
        shl       ebx, 26                                       ;135.7
        shr       edx, 2                                        ;135.7
        or        ecx, ebx                                      ;135.7
        shl       eax, 26                                       ;135.7
        or        edx, eax                                      ;135.7
        jmp       .B14.29       ; Prob 100%                     ;135.7
                                ; LOE edx ecx xmm0
.B14.28:                        ; Preds .B14.26
        mov       ecx, ebx                                      ;135.7
        mov       edx, eax                                      ;135.7
        shr       ecx, 1                                        ;135.7
        shl       ebx, 27                                       ;135.7
        shr       edx, 1                                        ;135.7
        or        ecx, ebx                                      ;135.7
        shl       eax, 27                                       ;135.7
        or        edx, eax                                      ;135.7
                                ; LOE edx ecx xmm0
.B14.29:                        ; Preds .B14.27 .B14.28
        and       ecx, 268435455                                ;135.7
        and       edx, 268435455                                ;135.7
        mov       eax, ecx                                      ;135.7
        mov       edi, ecx                                      ;135.7
        shr       eax, 6                                        ;135.7
        mov       esi, ecx                                      ;135.7
        shr       edi, 7                                        ;135.7
        and       esi, 63                                       ;135.7
        and       eax, 3                                        ;135.7
        and       edi, 60                                       ;135.7
        or        eax, edi                                      ;135.7
        mov       edi, ecx                                      ;135.7
        shr       edi, 21                                       ;135.7
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;135.7
        mov       esi, ecx                                      ;135.7
        shr       esi, 14                                       ;135.7
        and       edi, 6                                        ;135.7
        or        ebx, DWORD PTR [_des_skb+256+eax*4]           ;135.7
        mov       eax, ecx                                      ;135.7
        shr       eax, 13                                       ;135.7
        and       esi, 48                                       ;135.7
        and       eax, 15                                       ;135.7
        or        eax, esi                                      ;135.7
        mov       esi, ecx                                      ;135.7
        shr       esi, 20                                       ;135.7
        and       esi, 1                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, edx                                      ;135.7
        or        ebx, DWORD PTR [_des_skb+512+eax*4]           ;135.7
        mov       eax, ecx                                      ;135.7
        shr       eax, 22                                       ;135.7
        and       eax, 56                                       ;135.7
        or        esi, eax                                      ;135.7
        mov       eax, edx                                      ;135.7
        shr       edi, 8                                        ;135.7
        and       eax, 63                                       ;135.7
        and       edi, 60                                       ;135.7
        mov       DWORD PTR [140+esp], edx                      ;135.7
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;135.7
        mov       esi, edx                                      ;135.7
        shr       esi, 7                                        ;135.7
        and       esi, 3                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, edx                                      ;135.7
        mov       eax, DWORD PTR [_des_skb+1024+eax*4]          ;135.7
        shr       edi, 15                                       ;135.7
        and       edi, 63                                       ;135.7
        or        eax, DWORD PTR [_des_skb+1280+esi*4]          ;135.7
        mov       esi, edx                                      ;135.7
        shr       esi, 21                                       ;135.7
        shr       edx, 22                                       ;135.7
        and       esi, 15                                       ;135.7
        and       edx, 48                                       ;135.7
        or        esi, edx                                      ;135.7
        or        eax, DWORD PTR [_des_skb+1536+edi*4]          ;135.7
        movzx     edi, bx                                       ;135.7
        shr       ebx, 16                                       ;135.7
        or        eax, DWORD PTR [_des_skb+1792+esi*4]          ;135.7
        mov       edx, eax                                      ;135.7
        and       eax, -65536                                   ;135.7
        shl       edx, 16                                       ;135.7
        or        ebx, eax                                      ;135.7
        mov       esi, DWORD PTR [92+esp]                       ;135.7
        or        edx, edi                                      ;135.7
        mov       edi, DWORD PTR [96+esp]                       ;135.7
        ror       edx, 30                                       ;135.7
        ror       ebx, 26                                       ;135.7
        mov       DWORD PTR [_ks_tbl+56+esi+edi], edx           ;135.7
        mov       DWORD PTR [_ks_tbl+60+esi+edi], ebx           ;135.7
        mov       edx, DWORD PTR [140+esp]                      ;135.7
        cmp       DWORD PTR [68+esp], 0                         ;135.7
        je        .B14.31       ; Prob 50%                      ;135.7
                                ; LOE rdx edx ecx dl dh xmm0
.B14.30:                        ; Preds .B14.29
        mov       ebx, ecx                                      ;135.7
        mov       eax, edx                                      ;135.7
        shr       ebx, 2                                        ;135.7
        shl       ecx, 26                                       ;135.7
        shr       eax, 2                                        ;135.7
        or        ebx, ecx                                      ;135.7
        shl       edx, 26                                       ;135.7
        or        eax, edx                                      ;135.7
        jmp       .B14.32       ; Prob 100%                     ;135.7
                                ; LOE eax ebx xmm0
.B14.31:                        ; Preds .B14.29
        mov       ebx, ecx                                      ;135.7
        mov       eax, edx                                      ;135.7
        shr       ebx, 1                                        ;135.7
        shl       ecx, 27                                       ;135.7
        shr       eax, 1                                        ;135.7
        or        ebx, ecx                                      ;135.7
        shl       edx, 27                                       ;135.7
        or        eax, edx                                      ;135.7
                                ; LOE eax ebx xmm0
.B14.32:                        ; Preds .B14.30 .B14.31
        and       ebx, 268435455                                ;135.7
        and       eax, 268435455                                ;135.7
        mov       edx, ebx                                      ;135.7
        mov       edi, ebx                                      ;135.7
        shr       edx, 6                                        ;135.7
        mov       esi, ebx                                      ;135.7
        shr       edi, 7                                        ;135.7
        and       esi, 63                                       ;135.7
        and       edx, 3                                        ;135.7
        and       edi, 60                                       ;135.7
        or        edx, edi                                      ;135.7
        mov       edi, ebx                                      ;135.7
        shr       edi, 21                                       ;135.7
        mov       ecx, DWORD PTR [_des_skb+esi*4]               ;135.7
        mov       esi, ebx                                      ;135.7
        shr       esi, 14                                       ;135.7
        and       edi, 6                                        ;135.7
        or        ecx, DWORD PTR [_des_skb+256+edx*4]           ;135.7
        mov       edx, ebx                                      ;135.7
        shr       edx, 13                                       ;135.7
        and       esi, 48                                       ;135.7
        and       edx, 15                                       ;135.7
        or        edx, esi                                      ;135.7
        mov       esi, ebx                                      ;135.7
        shr       esi, 20                                       ;135.7
        and       esi, 1                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, eax                                      ;135.7
        or        ecx, DWORD PTR [_des_skb+512+edx*4]           ;135.7
        mov       edx, ebx                                      ;135.7
        shr       edx, 22                                       ;135.7
        and       edx, 56                                       ;135.7
        or        esi, edx                                      ;135.7
        mov       edx, eax                                      ;135.7
        shr       edi, 8                                        ;135.7
        and       edx, 63                                       ;135.7
        and       edi, 60                                       ;135.7
        mov       DWORD PTR [144+esp], eax                      ;135.7
        or        ecx, DWORD PTR [_des_skb+768+esi*4]           ;135.7
        mov       esi, eax                                      ;135.7
        shr       esi, 7                                        ;135.7
        and       esi, 3                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, eax                                      ;135.7
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;135.7
        shr       edi, 15                                       ;135.7
        and       edi, 63                                       ;135.7
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;135.7
        mov       esi, eax                                      ;135.7
        shr       esi, 21                                       ;135.7
        shr       eax, 22                                       ;135.7
        and       esi, 15                                       ;135.7
        and       eax, 48                                       ;135.7
        or        esi, eax                                      ;135.7
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;135.7
        movzx     edi, cx                                       ;135.7
        shr       ecx, 16                                       ;135.7
        or        edx, DWORD PTR [_des_skb+1792+esi*4]          ;135.7
        mov       eax, edx                                      ;135.7
        and       edx, -65536                                   ;135.7
        shl       eax, 16                                       ;135.7
        or        ecx, edx                                      ;135.7
        mov       esi, DWORD PTR [92+esp]                       ;135.7
        or        eax, edi                                      ;135.7
        mov       edi, DWORD PTR [96+esp]                       ;135.7
        ror       eax, 30                                       ;135.7
        ror       ecx, 26                                       ;135.7
        mov       DWORD PTR [_ks_tbl+64+esi+edi], eax           ;135.7
        mov       DWORD PTR [_ks_tbl+68+esi+edi], ecx           ;135.7
        mov       eax, DWORD PTR [144+esp]                      ;135.7
        cmp       DWORD PTR [76+esp], 0                         ;135.7
        je        .B14.34       ; Prob 50%                      ;135.7
                                ; LOE rax eax ebx al ah xmm0
.B14.33:                        ; Preds .B14.32
        mov       ecx, ebx                                      ;135.7
        mov       edx, eax                                      ;135.7
        shr       ecx, 2                                        ;135.7
        shl       ebx, 26                                       ;135.7
        shr       edx, 2                                        ;135.7
        or        ecx, ebx                                      ;135.7
        shl       eax, 26                                       ;135.7
        or        edx, eax                                      ;135.7
        jmp       .B14.35       ; Prob 100%                     ;135.7
                                ; LOE edx ecx xmm0
.B14.34:                        ; Preds .B14.32
        mov       ecx, ebx                                      ;135.7
        mov       edx, eax                                      ;135.7
        shr       ecx, 1                                        ;135.7
        shl       ebx, 27                                       ;135.7
        shr       edx, 1                                        ;135.7
        or        ecx, ebx                                      ;135.7
        shl       eax, 27                                       ;135.7
        or        edx, eax                                      ;135.7
                                ; LOE edx ecx xmm0
.B14.35:                        ; Preds .B14.33 .B14.34
        and       ecx, 268435455                                ;135.7
        and       edx, 268435455                                ;135.7
        mov       eax, ecx                                      ;135.7
        mov       edi, ecx                                      ;135.7
        shr       eax, 6                                        ;135.7
        mov       esi, ecx                                      ;135.7
        shr       edi, 7                                        ;135.7
        and       esi, 63                                       ;135.7
        and       eax, 3                                        ;135.7
        and       edi, 60                                       ;135.7
        or        eax, edi                                      ;135.7
        mov       edi, ecx                                      ;135.7
        shr       edi, 21                                       ;135.7
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;135.7
        mov       esi, ecx                                      ;135.7
        shr       esi, 14                                       ;135.7
        and       edi, 6                                        ;135.7
        or        ebx, DWORD PTR [_des_skb+256+eax*4]           ;135.7
        mov       eax, ecx                                      ;135.7
        shr       eax, 13                                       ;135.7
        and       esi, 48                                       ;135.7
        and       eax, 15                                       ;135.7
        or        eax, esi                                      ;135.7
        mov       esi, ecx                                      ;135.7
        shr       esi, 20                                       ;135.7
        and       esi, 1                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, edx                                      ;135.7
        or        ebx, DWORD PTR [_des_skb+512+eax*4]           ;135.7
        mov       eax, ecx                                      ;135.7
        shr       eax, 22                                       ;135.7
        and       eax, 56                                       ;135.7
        or        esi, eax                                      ;135.7
        mov       eax, edx                                      ;135.7
        shr       edi, 8                                        ;135.7
        and       eax, 63                                       ;135.7
        and       edi, 60                                       ;135.7
        mov       DWORD PTR [148+esp], edx                      ;135.7
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;135.7
        mov       esi, edx                                      ;135.7
        shr       esi, 7                                        ;135.7
        and       esi, 3                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, edx                                      ;135.7
        mov       eax, DWORD PTR [_des_skb+1024+eax*4]          ;135.7
        shr       edi, 15                                       ;135.7
        and       edi, 63                                       ;135.7
        or        eax, DWORD PTR [_des_skb+1280+esi*4]          ;135.7
        mov       esi, edx                                      ;135.7
        shr       esi, 21                                       ;135.7
        shr       edx, 22                                       ;135.7
        and       esi, 15                                       ;135.7
        and       edx, 48                                       ;135.7
        or        esi, edx                                      ;135.7
        or        eax, DWORD PTR [_des_skb+1536+edi*4]          ;135.7
        movzx     edi, bx                                       ;135.7
        shr       ebx, 16                                       ;135.7
        or        eax, DWORD PTR [_des_skb+1792+esi*4]          ;135.7
        mov       edx, eax                                      ;135.7
        and       eax, -65536                                   ;135.7
        shl       edx, 16                                       ;135.7
        or        ebx, eax                                      ;135.7
        mov       esi, DWORD PTR [92+esp]                       ;135.7
        or        edx, edi                                      ;135.7
        mov       edi, DWORD PTR [96+esp]                       ;135.7
        ror       edx, 30                                       ;135.7
        ror       ebx, 26                                       ;135.7
        mov       DWORD PTR [_ks_tbl+72+esi+edi], edx           ;135.7
        mov       DWORD PTR [_ks_tbl+76+esi+edi], ebx           ;135.7
        mov       edx, DWORD PTR [148+esp]                      ;135.7
        cmp       DWORD PTR [80+esp], 0                         ;135.7
        je        .B14.37       ; Prob 50%                      ;135.7
                                ; LOE rdx edx ecx dl dh xmm0
.B14.36:                        ; Preds .B14.35
        mov       ebx, ecx                                      ;135.7
        mov       eax, edx                                      ;135.7
        shr       ebx, 2                                        ;135.7
        shl       ecx, 26                                       ;135.7
        shr       eax, 2                                        ;135.7
        or        ebx, ecx                                      ;135.7
        shl       edx, 26                                       ;135.7
        or        eax, edx                                      ;135.7
        jmp       .B14.38       ; Prob 100%                     ;135.7
                                ; LOE eax ebx xmm0
.B14.37:                        ; Preds .B14.35
        mov       ebx, ecx                                      ;135.7
        mov       eax, edx                                      ;135.7
        shr       ebx, 1                                        ;135.7
        shl       ecx, 27                                       ;135.7
        shr       eax, 1                                        ;135.7
        or        ebx, ecx                                      ;135.7
        shl       edx, 27                                       ;135.7
        or        eax, edx                                      ;135.7
                                ; LOE eax ebx xmm0
.B14.38:                        ; Preds .B14.36 .B14.37
        and       ebx, 268435455                                ;135.7
        and       eax, 268435455                                ;135.7
        mov       edx, ebx                                      ;135.7
        mov       edi, ebx                                      ;135.7
        shr       edx, 6                                        ;135.7
        mov       esi, ebx                                      ;135.7
        shr       edi, 7                                        ;135.7
        and       esi, 63                                       ;135.7
        and       edx, 3                                        ;135.7
        and       edi, 60                                       ;135.7
        or        edx, edi                                      ;135.7
        mov       edi, ebx                                      ;135.7
        shr       edi, 21                                       ;135.7
        mov       ecx, DWORD PTR [_des_skb+esi*4]               ;135.7
        mov       esi, ebx                                      ;135.7
        shr       esi, 14                                       ;135.7
        and       edi, 6                                        ;135.7
        or        ecx, DWORD PTR [_des_skb+256+edx*4]           ;135.7
        mov       edx, ebx                                      ;135.7
        shr       edx, 13                                       ;135.7
        and       esi, 48                                       ;135.7
        and       edx, 15                                       ;135.7
        or        edx, esi                                      ;135.7
        mov       esi, ebx                                      ;135.7
        shr       esi, 20                                       ;135.7
        and       esi, 1                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, eax                                      ;135.7
        or        ecx, DWORD PTR [_des_skb+512+edx*4]           ;135.7
        mov       edx, ebx                                      ;135.7
        shr       edx, 22                                       ;135.7
        and       edx, 56                                       ;135.7
        or        esi, edx                                      ;135.7
        mov       edx, eax                                      ;135.7
        shr       edi, 8                                        ;135.7
        and       edx, 63                                       ;135.7
        and       edi, 60                                       ;135.7
        mov       DWORD PTR [152+esp], eax                      ;135.7
        or        ecx, DWORD PTR [_des_skb+768+esi*4]           ;135.7
        mov       esi, eax                                      ;135.7
        shr       esi, 7                                        ;135.7
        and       esi, 3                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, eax                                      ;135.7
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;135.7
        shr       edi, 15                                       ;135.7
        and       edi, 63                                       ;135.7
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;135.7
        mov       esi, eax                                      ;135.7
        shr       esi, 21                                       ;135.7
        shr       eax, 22                                       ;135.7
        and       esi, 15                                       ;135.7
        and       eax, 48                                       ;135.7
        or        esi, eax                                      ;135.7
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;135.7
        movzx     edi, cx                                       ;135.7
        shr       ecx, 16                                       ;135.7
        or        edx, DWORD PTR [_des_skb+1792+esi*4]          ;135.7
        mov       eax, edx                                      ;135.7
        and       edx, -65536                                   ;135.7
        shl       eax, 16                                       ;135.7
        or        ecx, edx                                      ;135.7
        mov       esi, DWORD PTR [92+esp]                       ;135.7
        or        eax, edi                                      ;135.7
        mov       edi, DWORD PTR [96+esp]                       ;135.7
        ror       eax, 30                                       ;135.7
        ror       ecx, 26                                       ;135.7
        mov       DWORD PTR [_ks_tbl+80+esi+edi], eax           ;135.7
        mov       DWORD PTR [_ks_tbl+84+esi+edi], ecx           ;135.7
        mov       eax, DWORD PTR [152+esp]                      ;135.7
        cmp       DWORD PTR [84+esp], 0                         ;135.7
        je        .B14.40       ; Prob 50%                      ;135.7
                                ; LOE rax eax ebx al ah xmm0
.B14.39:                        ; Preds .B14.38
        mov       ecx, ebx                                      ;135.7
        mov       edx, eax                                      ;135.7
        shr       ecx, 2                                        ;135.7
        shl       ebx, 26                                       ;135.7
        shr       edx, 2                                        ;135.7
        or        ecx, ebx                                      ;135.7
        shl       eax, 26                                       ;135.7
        or        edx, eax                                      ;135.7
        jmp       .B14.41       ; Prob 100%                     ;135.7
                                ; LOE edx ecx xmm0
.B14.40:                        ; Preds .B14.38
        mov       ecx, ebx                                      ;135.7
        mov       edx, eax                                      ;135.7
        shr       ecx, 1                                        ;135.7
        shl       ebx, 27                                       ;135.7
        shr       edx, 1                                        ;135.7
        or        ecx, ebx                                      ;135.7
        shl       eax, 27                                       ;135.7
        or        edx, eax                                      ;135.7
                                ; LOE edx ecx xmm0
.B14.41:                        ; Preds .B14.39 .B14.40
        and       ecx, 268435455                                ;135.7
        and       edx, 268435455                                ;135.7
        mov       eax, ecx                                      ;135.7
        mov       edi, ecx                                      ;135.7
        shr       eax, 6                                        ;135.7
        mov       esi, ecx                                      ;135.7
        shr       edi, 7                                        ;135.7
        and       esi, 63                                       ;135.7
        and       eax, 3                                        ;135.7
        and       edi, 60                                       ;135.7
        or        eax, edi                                      ;135.7
        mov       edi, ecx                                      ;135.7
        shr       edi, 21                                       ;135.7
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;135.7
        mov       esi, ecx                                      ;135.7
        shr       esi, 14                                       ;135.7
        and       edi, 6                                        ;135.7
        or        ebx, DWORD PTR [_des_skb+256+eax*4]           ;135.7
        mov       eax, ecx                                      ;135.7
        shr       eax, 13                                       ;135.7
        and       esi, 48                                       ;135.7
        and       eax, 15                                       ;135.7
        or        eax, esi                                      ;135.7
        mov       esi, ecx                                      ;135.7
        shr       esi, 20                                       ;135.7
        and       esi, 1                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, edx                                      ;135.7
        or        ebx, DWORD PTR [_des_skb+512+eax*4]           ;135.7
        mov       eax, ecx                                      ;135.7
        shr       eax, 22                                       ;135.7
        and       eax, 56                                       ;135.7
        or        esi, eax                                      ;135.7
        mov       eax, edx                                      ;135.7
        shr       edi, 8                                        ;135.7
        and       eax, 63                                       ;135.7
        and       edi, 60                                       ;135.7
        mov       DWORD PTR [156+esp], edx                      ;135.7
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;135.7
        mov       esi, edx                                      ;135.7
        shr       esi, 7                                        ;135.7
        and       esi, 3                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, edx                                      ;135.7
        mov       eax, DWORD PTR [_des_skb+1024+eax*4]          ;135.7
        shr       edi, 15                                       ;135.7
        and       edi, 63                                       ;135.7
        or        eax, DWORD PTR [_des_skb+1280+esi*4]          ;135.7
        mov       esi, edx                                      ;135.7
        shr       esi, 21                                       ;135.7
        shr       edx, 22                                       ;135.7
        and       esi, 15                                       ;135.7
        and       edx, 48                                       ;135.7
        or        esi, edx                                      ;135.7
        or        eax, DWORD PTR [_des_skb+1536+edi*4]          ;135.7
        movzx     edi, bx                                       ;135.7
        shr       ebx, 16                                       ;135.7
        or        eax, DWORD PTR [_des_skb+1792+esi*4]          ;135.7
        mov       edx, eax                                      ;135.7
        and       eax, -65536                                   ;135.7
        shl       edx, 16                                       ;135.7
        or        ebx, eax                                      ;135.7
        mov       esi, DWORD PTR [92+esp]                       ;135.7
        or        edx, edi                                      ;135.7
        mov       edi, DWORD PTR [96+esp]                       ;135.7
        ror       edx, 30                                       ;135.7
        ror       ebx, 26                                       ;135.7
        mov       DWORD PTR [_ks_tbl+88+esi+edi], edx           ;135.7
        mov       DWORD PTR [_ks_tbl+92+esi+edi], ebx           ;135.7
        mov       edx, DWORD PTR [156+esp]                      ;135.7
        cmp       DWORD PTR [72+esp], 0                         ;135.7
        je        .B14.43       ; Prob 50%                      ;135.7
                                ; LOE rdx edx ecx dl dh xmm0
.B14.42:                        ; Preds .B14.41
        mov       ebx, ecx                                      ;135.7
        mov       eax, edx                                      ;135.7
        shr       ebx, 2                                        ;135.7
        shl       ecx, 26                                       ;135.7
        shr       eax, 2                                        ;135.7
        or        ebx, ecx                                      ;135.7
        shl       edx, 26                                       ;135.7
        or        eax, edx                                      ;135.7
        jmp       .B14.44       ; Prob 100%                     ;135.7
                                ; LOE eax ebx xmm0
.B14.43:                        ; Preds .B14.41
        mov       ebx, ecx                                      ;135.7
        mov       eax, edx                                      ;135.7
        shr       ebx, 1                                        ;135.7
        shl       ecx, 27                                       ;135.7
        shr       eax, 1                                        ;135.7
        or        ebx, ecx                                      ;135.7
        shl       edx, 27                                       ;135.7
        or        eax, edx                                      ;135.7
                                ; LOE eax ebx xmm0
.B14.44:                        ; Preds .B14.42 .B14.43
        and       ebx, 268435455                                ;135.7
        and       eax, 268435455                                ;135.7
        mov       edx, ebx                                      ;135.7
        mov       edi, ebx                                      ;135.7
        shr       edx, 6                                        ;135.7
        mov       esi, ebx                                      ;135.7
        shr       edi, 7                                        ;135.7
        and       esi, 63                                       ;135.7
        and       edx, 3                                        ;135.7
        and       edi, 60                                       ;135.7
        or        edx, edi                                      ;135.7
        mov       edi, ebx                                      ;135.7
        shr       edi, 21                                       ;135.7
        mov       ecx, DWORD PTR [_des_skb+esi*4]               ;135.7
        mov       esi, ebx                                      ;135.7
        shr       esi, 14                                       ;135.7
        and       edi, 6                                        ;135.7
        or        ecx, DWORD PTR [_des_skb+256+edx*4]           ;135.7
        mov       edx, ebx                                      ;135.7
        shr       edx, 13                                       ;135.7
        and       esi, 48                                       ;135.7
        and       edx, 15                                       ;135.7
        or        edx, esi                                      ;135.7
        mov       esi, ebx                                      ;135.7
        shr       esi, 20                                       ;135.7
        and       esi, 1                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, eax                                      ;135.7
        or        ecx, DWORD PTR [_des_skb+512+edx*4]           ;135.7
        mov       edx, ebx                                      ;135.7
        shr       edx, 22                                       ;135.7
        and       edx, 56                                       ;135.7
        or        esi, edx                                      ;135.7
        mov       edx, eax                                      ;135.7
        shr       edi, 8                                        ;135.7
        and       edx, 63                                       ;135.7
        and       edi, 60                                       ;135.7
        mov       DWORD PTR [160+esp], eax                      ;135.7
        or        ecx, DWORD PTR [_des_skb+768+esi*4]           ;135.7
        mov       esi, eax                                      ;135.7
        shr       esi, 7                                        ;135.7
        and       esi, 3                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, eax                                      ;135.7
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;135.7
        shr       edi, 15                                       ;135.7
        and       edi, 63                                       ;135.7
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;135.7
        mov       esi, eax                                      ;135.7
        shr       esi, 21                                       ;135.7
        shr       eax, 22                                       ;135.7
        and       esi, 15                                       ;135.7
        and       eax, 48                                       ;135.7
        or        esi, eax                                      ;135.7
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;135.7
        movzx     edi, cx                                       ;135.7
        shr       ecx, 16                                       ;135.7
        or        edx, DWORD PTR [_des_skb+1792+esi*4]          ;135.7
        mov       eax, edx                                      ;135.7
        and       edx, -65536                                   ;135.7
        shl       eax, 16                                       ;135.7
        or        ecx, edx                                      ;135.7
        mov       esi, DWORD PTR [92+esp]                       ;135.7
        or        eax, edi                                      ;135.7
        mov       edi, DWORD PTR [96+esp]                       ;135.7
        ror       eax, 30                                       ;135.7
        ror       ecx, 26                                       ;135.7
        mov       DWORD PTR [_ks_tbl+96+esi+edi], eax           ;135.7
        mov       DWORD PTR [_ks_tbl+100+esi+edi], ecx          ;135.7
        mov       eax, DWORD PTR [160+esp]                      ;135.7
        cmp       DWORD PTR [32+esp], 0                         ;135.7
        je        .B14.46       ; Prob 50%                      ;135.7
                                ; LOE rax eax ebx al ah xmm0
.B14.45:                        ; Preds .B14.44
        mov       ecx, ebx                                      ;135.7
        mov       edx, eax                                      ;135.7
        shr       ecx, 2                                        ;135.7
        shl       ebx, 26                                       ;135.7
        shr       edx, 2                                        ;135.7
        or        ecx, ebx                                      ;135.7
        shl       eax, 26                                       ;135.7
        or        edx, eax                                      ;135.7
        jmp       .B14.47       ; Prob 100%                     ;135.7
                                ; LOE edx ecx xmm0
.B14.46:                        ; Preds .B14.44
        mov       ecx, ebx                                      ;135.7
        mov       edx, eax                                      ;135.7
        shr       ecx, 1                                        ;135.7
        shl       ebx, 27                                       ;135.7
        shr       edx, 1                                        ;135.7
        or        ecx, ebx                                      ;135.7
        shl       eax, 27                                       ;135.7
        or        edx, eax                                      ;135.7
                                ; LOE edx ecx xmm0
.B14.47:                        ; Preds .B14.45 .B14.46
        and       ecx, 268435455                                ;135.7
        and       edx, 268435455                                ;135.7
        mov       eax, ecx                                      ;135.7
        mov       edi, ecx                                      ;135.7
        shr       eax, 6                                        ;135.7
        mov       esi, ecx                                      ;135.7
        shr       edi, 7                                        ;135.7
        and       esi, 63                                       ;135.7
        and       eax, 3                                        ;135.7
        and       edi, 60                                       ;135.7
        or        eax, edi                                      ;135.7
        mov       edi, ecx                                      ;135.7
        shr       edi, 21                                       ;135.7
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;135.7
        mov       esi, ecx                                      ;135.7
        shr       esi, 14                                       ;135.7
        and       edi, 6                                        ;135.7
        or        ebx, DWORD PTR [_des_skb+256+eax*4]           ;135.7
        mov       eax, ecx                                      ;135.7
        shr       eax, 13                                       ;135.7
        and       esi, 48                                       ;135.7
        and       eax, 15                                       ;135.7
        or        eax, esi                                      ;135.7
        mov       esi, ecx                                      ;135.7
        shr       esi, 20                                       ;135.7
        and       esi, 1                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, edx                                      ;135.7
        or        ebx, DWORD PTR [_des_skb+512+eax*4]           ;135.7
        mov       eax, ecx                                      ;135.7
        shr       eax, 22                                       ;135.7
        and       eax, 56                                       ;135.7
        or        esi, eax                                      ;135.7
        mov       eax, edx                                      ;135.7
        shr       edi, 8                                        ;135.7
        and       eax, 63                                       ;135.7
        and       edi, 60                                       ;135.7
        mov       DWORD PTR [164+esp], edx                      ;135.7
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;135.7
        mov       esi, edx                                      ;135.7
        shr       esi, 7                                        ;135.7
        and       esi, 3                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, edx                                      ;135.7
        mov       eax, DWORD PTR [_des_skb+1024+eax*4]          ;135.7
        shr       edi, 15                                       ;135.7
        and       edi, 63                                       ;135.7
        or        eax, DWORD PTR [_des_skb+1280+esi*4]          ;135.7
        mov       esi, edx                                      ;135.7
        shr       esi, 21                                       ;135.7
        shr       edx, 22                                       ;135.7
        and       esi, 15                                       ;135.7
        and       edx, 48                                       ;135.7
        or        esi, edx                                      ;135.7
        or        eax, DWORD PTR [_des_skb+1536+edi*4]          ;135.7
        movzx     edi, bx                                       ;135.7
        shr       ebx, 16                                       ;135.7
        or        eax, DWORD PTR [_des_skb+1792+esi*4]          ;135.7
        mov       edx, eax                                      ;135.7
        and       eax, -65536                                   ;135.7
        shl       edx, 16                                       ;135.7
        or        ebx, eax                                      ;135.7
        mov       esi, DWORD PTR [92+esp]                       ;135.7
        or        edx, edi                                      ;135.7
        mov       edi, DWORD PTR [96+esp]                       ;135.7
        ror       edx, 30                                       ;135.7
        ror       ebx, 26                                       ;135.7
        mov       DWORD PTR [_ks_tbl+104+esi+edi], edx          ;135.7
        mov       DWORD PTR [_ks_tbl+108+esi+edi], ebx          ;135.7
        mov       edx, DWORD PTR [164+esp]                      ;135.7
        cmp       DWORD PTR [24+esp], 0                         ;135.7
        je        .B14.49       ; Prob 50%                      ;135.7
                                ; LOE rdx edx ecx dl dh xmm0
.B14.48:                        ; Preds .B14.47
        mov       ebx, ecx                                      ;135.7
        mov       eax, edx                                      ;135.7
        shr       ebx, 2                                        ;135.7
        shl       ecx, 26                                       ;135.7
        shr       eax, 2                                        ;135.7
        or        ebx, ecx                                      ;135.7
        shl       edx, 26                                       ;135.7
        or        eax, edx                                      ;135.7
        jmp       .B14.50       ; Prob 100%                     ;135.7
                                ; LOE eax ebx xmm0
.B14.49:                        ; Preds .B14.47
        mov       ebx, ecx                                      ;135.7
        mov       eax, edx                                      ;135.7
        shr       ebx, 1                                        ;135.7
        shl       ecx, 27                                       ;135.7
        shr       eax, 1                                        ;135.7
        or        ebx, ecx                                      ;135.7
        shl       edx, 27                                       ;135.7
        or        eax, edx                                      ;135.7
                                ; LOE eax ebx xmm0
.B14.50:                        ; Preds .B14.48 .B14.49
        and       ebx, 268435455                                ;135.7
        and       eax, 268435455                                ;135.7
        mov       edx, ebx                                      ;135.7
        mov       edi, ebx                                      ;135.7
        shr       edx, 6                                        ;135.7
        mov       esi, ebx                                      ;135.7
        shr       edi, 7                                        ;135.7
        and       esi, 63                                       ;135.7
        and       edx, 3                                        ;135.7
        and       edi, 60                                       ;135.7
        or        edx, edi                                      ;135.7
        mov       edi, ebx                                      ;135.7
        shr       edi, 21                                       ;135.7
        mov       ecx, DWORD PTR [_des_skb+esi*4]               ;135.7
        mov       esi, ebx                                      ;135.7
        shr       esi, 14                                       ;135.7
        and       edi, 6                                        ;135.7
        or        ecx, DWORD PTR [_des_skb+256+edx*4]           ;135.7
        mov       edx, ebx                                      ;135.7
        shr       edx, 13                                       ;135.7
        and       esi, 48                                       ;135.7
        and       edx, 15                                       ;135.7
        or        edx, esi                                      ;135.7
        mov       esi, ebx                                      ;135.7
        shr       esi, 20                                       ;135.7
        and       esi, 1                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, eax                                      ;135.7
        or        ecx, DWORD PTR [_des_skb+512+edx*4]           ;135.7
        mov       edx, ebx                                      ;135.7
        shr       edx, 22                                       ;135.7
        and       edx, 56                                       ;135.7
        or        esi, edx                                      ;135.7
        mov       edx, eax                                      ;135.7
        shr       edi, 8                                        ;135.7
        and       edx, 63                                       ;135.7
        and       edi, 60                                       ;135.7
        mov       DWORD PTR [168+esp], eax                      ;135.7
        or        ecx, DWORD PTR [_des_skb+768+esi*4]           ;135.7
        mov       esi, eax                                      ;135.7
        shr       esi, 7                                        ;135.7
        and       esi, 3                                        ;135.7
        or        esi, edi                                      ;135.7
        mov       edi, eax                                      ;135.7
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;135.7
        shr       edi, 15                                       ;135.7
        and       edi, 63                                       ;135.7
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;135.7
        mov       esi, eax                                      ;135.7
        shr       esi, 21                                       ;135.7
        shr       eax, 22                                       ;135.7
        and       esi, 15                                       ;135.7
        and       eax, 48                                       ;135.7
        or        esi, eax                                      ;135.7
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;135.7
        movzx     edi, cx                                       ;135.7
        shr       ecx, 16                                       ;135.7
        or        edx, DWORD PTR [_des_skb+1792+esi*4]          ;135.7
        mov       eax, edx                                      ;135.7
        and       edx, -65536                                   ;135.7
        shl       eax, 16                                       ;135.7
        or        ecx, edx                                      ;135.7
        mov       esi, DWORD PTR [92+esp]                       ;135.7
        or        eax, edi                                      ;135.7
        mov       edi, DWORD PTR [96+esp]                       ;135.7
        ror       eax, 30                                       ;135.7
        ror       ecx, 26                                       ;135.7
        mov       DWORD PTR [_ks_tbl+112+esi+edi], eax          ;135.7
        mov       DWORD PTR [_ks_tbl+116+esi+edi], ecx          ;135.7
        mov       eax, DWORD PTR [168+esp]                      ;135.7
        cmp       DWORD PTR [12+esp], 0                         ;135.7
        je        .B14.52       ; Prob 50%                      ;135.7
                                ; LOE rax eax ebx al ah xmm0
.B14.51:                        ; Preds .B14.50
        mov       esi, ebx                                      ;135.7
        mov       ecx, eax                                      ;135.7
        shr       esi, 2                                        ;135.7
        shl       ebx, 26                                       ;135.7
        shr       ecx, 2                                        ;135.7
        or        esi, ebx                                      ;135.7
        shl       eax, 26                                       ;135.7
        or        ecx, eax                                      ;135.7
        jmp       .B14.53       ; Prob 100%                     ;135.7
                                ; LOE ecx esi xmm0
.B14.52:                        ; Preds .B14.50
        mov       esi, ebx                                      ;135.7
        mov       ecx, eax                                      ;135.7
        shr       esi, 1                                        ;135.7
        shl       ebx, 27                                       ;135.7
        shr       ecx, 1                                        ;135.7
        or        esi, ebx                                      ;135.7
        shl       eax, 27                                       ;135.7
        or        ecx, eax                                      ;135.7
                                ; LOE ecx esi xmm0
.B14.53:                        ; Preds .B14.51 .B14.52
        mov       eax, esi                                      ;135.7
        mov       edi, esi                                      ;135.7
        shr       eax, 6                                        ;135.7
        mov       ebx, esi                                      ;135.7
        shr       edi, 7                                        ;135.7
        and       ebx, 63                                       ;135.7
        and       eax, 3                                        ;135.7
        and       edi, 60                                       ;135.7
        or        eax, edi                                      ;135.7
        mov       edi, esi                                      ;135.7
        shr       edi, 21                                       ;135.7
        mov       edx, DWORD PTR [_des_skb+ebx*4]               ;135.7
        mov       ebx, esi                                      ;135.7
        shr       ebx, 14                                       ;135.7
        and       edi, 6                                        ;135.7
        or        edx, DWORD PTR [_des_skb+256+eax*4]           ;135.7
        mov       eax, esi                                      ;135.7
        shr       eax, 13                                       ;135.7
        and       ebx, 48                                       ;135.7
        and       eax, 15                                       ;135.7
        or        eax, ebx                                      ;135.7
        mov       ebx, ecx                                      ;135.7
        shr       ebx, 8                                        ;135.7
        and       ebx, 60                                       ;135.7
        or        edx, DWORD PTR [_des_skb+512+eax*4]           ;135.7
        mov       eax, esi                                      ;135.7
        shr       eax, 20                                       ;135.7
        shr       esi, 22                                       ;135.7
        and       eax, 1                                        ;135.7
        or        eax, edi                                      ;135.7
        and       esi, 56                                       ;135.7
        or        eax, esi                                      ;135.7
        mov       esi, ecx                                      ;135.7
        and       esi, 63                                       ;135.7
        mov       edi, ecx                                      ;135.7
        shr       edi, 7                                        ;135.7
        and       edi, 3                                        ;135.7
        or        edx, DWORD PTR [_des_skb+768+eax*4]           ;135.7
        or        edi, ebx                                      ;135.7
        mov       eax, DWORD PTR [_des_skb+1024+esi*4]          ;135.7
        mov       ebx, ecx                                      ;135.7
        mov       esi, ecx                                      ;135.7
        shr       ebx, 15                                       ;135.7
        shr       esi, 21                                       ;135.7
        and       ebx, 63                                       ;135.7
        shr       ecx, 22                                       ;135.7
        and       esi, 15                                       ;135.7
        and       ecx, 48                                       ;135.7
        or        esi, ecx                                      ;135.7
        or        eax, DWORD PTR [_des_skb+1280+edi*4]          ;135.7
        or        eax, DWORD PTR [_des_skb+1536+ebx*4]          ;135.7
        movzx     ecx, dx                                       ;135.7
        or        eax, DWORD PTR [_des_skb+1792+esi*4]          ;135.7
        mov       ebx, eax                                      ;135.7
        and       eax, -65536                                   ;135.7
        shl       ebx, 16                                       ;135.7
        mov       esi, DWORD PTR [96+esp]                       ;135.7
        or        ebx, ecx                                      ;135.7
        mov       ecx, DWORD PTR [92+esp]                       ;135.7
        shr       edx, 16                                       ;135.7
        or        edx, eax                                      ;135.7
        mov       eax, DWORD PTR [28+esp]                       ;132.5
        inc       eax                                           ;132.5
        ror       ebx, 30                                       ;135.7
        ror       edx, 26                                       ;135.7
        mov       DWORD PTR [_ks_tbl+120+ecx+esi], ebx          ;135.7
        mov       DWORD PTR [_ks_tbl+124+ecx+esi], edx          ;135.7
        mov       DWORD PTR [28+esp], eax                       ;132.5
        cmp       eax, DWORD PTR [8+esp]                        ;132.5
        jb        .B14.5        ; Prob 99%                      ;132.5
                                ; LOE xmm0
.B14.54:                        ; Preds .B14.53
        DB        102                                           ;
        DB        15                                            ;
        DB        31                                            ;
        DB        68                                            ;
        DB        0                                             ;
        DB        0                                             ;
        mov       eax, DWORD PTR [88+esp]                       ;
                                ; LOE eax xmm0
.B14.55:                        ; Preds .B14.3 .B14.54
        inc       eax                                           ;130.3
        cmp       eax, 8                                        ;130.3
        jb        .B14.2        ; Prob 87%                      ;130.3
                                ; LOE eax xmm0
.B14.56:                        ; Preds .B14.55
        add       esp, 180                                      ;138.1
        pop       ebx                                           ;138.1
        pop       edi                                           ;138.1
        pop       esi                                           ;138.1
        mov       esp, ebp                                      ;138.1
        pop       ebp                                           ;138.1
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
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _DES_init_keys1
TXTST14:
; -- Begin  _DES_init_keys1
;_DES_init_keys1	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _DES_init_keys1
; mark_begin;
       ALIGN     16
	PUBLIC _DES_init_keys1
_DES_init_keys1	PROC NEAR 
.B15.1:                         ; Preds .B15.0
        push      ebp                                           ;105.27
        mov       ebp, esp                                      ;105.27
        and       esp, -16                                      ;105.27
        push      esi                                           ;105.27
        push      edi                                           ;105.27
        push      ebx                                           ;105.27
        sub       esp, 180                                      ;105.27
        xor       eax, eax                                      ;109.3
        mov       DWORD PTR [8+esp], eax                        ;109.3
        pxor      xmm0, xmm0                                    ;109.3
                                ; LOE xmm0
.B15.2:                         ; Preds .B15.53 .B15.1
        movq      QWORD PTR [16+esp], xmm0                      ;110.5
                                ; LOE xmm0
.B15.3:                         ; Preds .B15.2
        mov       edi, DWORD PTR [shifts2.1460.0.3+16]          ;114.7
        mov       DWORD PTR [48+esp], edi                       ;114.7
        mov       eax, DWORD PTR [shifts2.1460.0.3]             ;114.7
        mov       edx, DWORD PTR [shifts2.1460.0.3+4]           ;114.7
        mov       ecx, DWORD PTR [shifts2.1460.0.3+8]           ;114.7
        mov       ebx, DWORD PTR [shifts2.1460.0.3+12]          ;114.7
        mov       edi, DWORD PTR [shifts2.1460.0.3+52]          ;114.7
        mov       DWORD PTR [32+esp], eax                       ;114.7
        mov       DWORD PTR [36+esp], edx                       ;114.7
        mov       DWORD PTR [40+esp], ecx                       ;114.7
        mov       DWORD PTR [44+esp], ebx                       ;114.7
        mov       DWORD PTR [68+esp], edi                       ;114.7
        mov       eax, DWORD PTR [shifts2.1460.0.3+20]          ;114.7
        mov       edx, DWORD PTR [shifts2.1460.0.3+24]          ;114.7
        mov       ecx, DWORD PTR [shifts2.1460.0.3+28]          ;114.7
        mov       ebx, DWORD PTR [shifts2.1460.0.3+32]          ;114.7
        mov       edi, DWORD PTR [shifts2.1460.0.3+56]          ;114.7
        mov       esi, DWORD PTR [8+esp]                        ;109.3
        mov       DWORD PTR [52+esp], eax                       ;114.7
        mov       DWORD PTR [56+esp], edx                       ;114.7
        mov       DWORD PTR [60+esp], ecx                       ;114.7
        mov       DWORD PTR [64+esp], ebx                       ;114.7
        mov       DWORD PTR [28+esp], edi                       ;114.7
        shl       esi, 15                                       ;109.3
        mov       eax, DWORD PTR [shifts2.1460.0.3+36]          ;114.7
        mov       ebx, DWORD PTR [shifts2.1460.0.3+40]          ;114.7
        mov       ecx, DWORD PTR [shifts2.1460.0.3+44]          ;114.7
        mov       edx, DWORD PTR [shifts2.1460.0.3+48]          ;114.7
        mov       edi, DWORD PTR [shifts2.1460.0.3+60]          ;114.7
        mov       DWORD PTR [24+esp], 0                         ;111.5
        mov       DWORD PTR [12+esp], edi                       ;114.7
        mov       DWORD PTR [84+esp], edx                       ;114.7
        mov       DWORD PTR [80+esp], ecx                       ;114.7
        mov       DWORD PTR [76+esp], ebx                       ;114.7
        mov       DWORD PTR [72+esp], eax                       ;114.7
        mov       DWORD PTR [88+esp], esi                       ;114.7
                                ; LOE xmm0
.B15.4:                         ; Preds .B15.52 .B15.3
        mov       esi, DWORD PTR [8+esp]                        ;112.7
        mov       eax, DWORD PTR [24+esp]                       ;112.7
        mov       BYTE PTR [16+esp+esi], al                     ;112.7
        movzx     ecx, BYTE PTR [18+esp]                        ;113.32
        mov       edi, ecx                                      ;113.7
        movzx     eax, BYTE PTR [17+esp]                        ;113.32
        mov       ebx, eax                                      ;113.7
        movzx     edx, BYTE PTR [16+esp]                        ;113.32
        mov       esi, edx                                      ;113.7
        shl       eax, 5                                        ;113.7
        and       esi, 254                                      ;113.7
        shr       edi, 3                                        ;113.7
        shl       edx, 6                                        ;113.7
        or        eax, edi                                      ;113.7
        shr       ebx, 2                                        ;113.7
        add       eax, eax                                      ;113.7
        movzx     edi, BYTE PTR [19+esp]                        ;113.7
        or        edx, ebx                                      ;113.7
        mov       ebx, edi                                      ;113.7
        add       edx, edx                                      ;113.7
        shl       ecx, 4                                        ;113.7
        shr       ebx, 4                                        ;113.7
        or        ecx, ebx                                      ;113.7
        add       ecx, ecx                                      ;113.7
        mov       DWORD PTR [96+esp], ecx                       ;113.7
        movzx     ecx, BYTE PTR [20+esp]                        ;113.7
        mov       ebx, ecx                                      ;113.7
        shl       edi, 3                                        ;113.7
        shr       ebx, 5                                        ;113.7
        or        edi, ebx                                      ;113.7
        add       edi, edi                                      ;113.7
        mov       DWORD PTR [100+esp], edi                      ;113.7
        movzx     edi, BYTE PTR [21+esp]                        ;113.7
        mov       ebx, edi                                      ;113.7
        shl       ecx, 2                                        ;113.7
        add       edi, edi                                      ;113.7
        shr       ebx, 6                                        ;113.7
        or        ecx, ebx                                      ;113.7
        movzx     ebx, BYTE PTR [22+esp]                        ;113.7
        add       ecx, ecx                                      ;113.7
        mov       DWORD PTR [104+esp], ecx                      ;113.7
        mov       ecx, ebx                                      ;113.7
        shr       ecx, 7                                        ;113.7
        add       ebx, ebx                                      ;113.7
        movzx     edx, dl                                       ;113.7
        or        edi, ecx                                      ;113.7
        movzx     eax, al                                       ;113.7
        add       edi, edi                                      ;113.7
        movzx     ecx, BYTE PTR [_odd_parity+esi]               ;113.7
        movzx     esi, BYTE PTR [96+esp]                        ;113.7
        mov       BYTE PTR [esp], cl                            ;113.7
        movzx     ecx, BYTE PTR [_odd_parity+edx]               ;113.7
        movzx     edx, BYTE PTR [_odd_parity+eax]               ;113.7
        movzx     eax, BYTE PTR [_odd_parity+esi]               ;113.7
        movzx     esi, BYTE PTR [104+esp]                       ;113.7
        and       edi, 255                                      ;113.7
        movzx     ebx, bl                                       ;113.7
        mov       BYTE PTR [1+esp], cl                          ;113.7
        movzx     ecx, BYTE PTR [100+esp]                       ;113.7
        mov       BYTE PTR [3+esp], al                          ;113.7
        movzx     eax, BYTE PTR [_odd_parity+esi]               ;113.7
        mov       BYTE PTR [2+esp], dl                          ;113.7
        movzx     edx, BYTE PTR [_odd_parity+ecx]               ;113.7
        mov       BYTE PTR [5+esp], al                          ;113.7
        movzx     ecx, BYTE PTR [_odd_parity+edi]               ;113.7
        movzx     eax, BYTE PTR [_odd_parity+ebx]               ;113.7
        mov       BYTE PTR [4+esp], dl                          ;113.7
        mov       BYTE PTR [6+esp], cl                          ;113.7
        mov       BYTE PTR [7+esp], al                          ;113.7
        mov       ebx, DWORD PTR [4+esp]                        ;114.7
        mov       edx, ebx                                      ;114.7
        shr       edx, 4                                        ;114.7
        mov       eax, DWORD PTR [esp]                          ;114.7
        xor       edx, eax                                      ;114.7
        and       edx, 252645135                                ;114.7
        xor       eax, edx                                      ;114.7
        shl       edx, 4                                        ;114.7
        mov       esi, eax                                      ;114.7
        xor       ebx, edx                                      ;114.7
        mov       ecx, DWORD PTR [24+esp]                       ;111.5
        shl       ecx, 7                                        ;111.5
        mov       DWORD PTR [92+esp], ecx                       ;111.5
        mov       ecx, ebx                                      ;114.7
        shl       ecx, 18                                       ;114.7
        xor       ecx, ebx                                      ;114.7
        shl       esi, 18                                       ;114.7
        and       ecx, -859045888                               ;114.7
        xor       esi, eax                                      ;114.7
        xor       ebx, ecx                                      ;114.7
        shr       ecx, 18                                       ;114.7
        and       esi, -859045888                               ;114.7
        xor       ebx, ecx                                      ;114.7
        xor       eax, esi                                      ;114.7
        shr       esi, 18                                       ;114.7
        mov       edx, ebx                                      ;114.7
        shr       edx, 1                                        ;114.7
        xor       eax, esi                                      ;114.7
        xor       edx, eax                                      ;114.7
        and       edx, 1431655765                               ;114.7
        xor       eax, edx                                      ;114.7
        add       edx, edx                                      ;114.7
        mov       edi, eax                                      ;114.7
        xor       ebx, edx                                      ;114.7
        shr       edi, 8                                        ;114.7
        xor       edi, ebx                                      ;114.7
        and       edi, 16711935                                 ;114.7
        xor       ebx, edi                                      ;114.7
        shl       edi, 8                                        ;114.7
        mov       ecx, ebx                                      ;114.7
        shr       ecx, 1                                        ;114.7
        xor       eax, edi                                      ;114.7
        xor       ecx, eax                                      ;114.7
        and       ecx, 1431655765                               ;114.7
        xor       eax, ecx                                      ;114.7
        add       ecx, ecx                                      ;114.7
        xor       ebx, ecx                                      ;114.7
        movzx     ecx, bl                                       ;114.7
        mov       edx, ebx                                      ;114.7
        shl       ecx, 16                                       ;114.7
        and       edx, 65280                                    ;114.7
        and       ebx, 16711680                                 ;114.7
        or        ecx, edx                                      ;114.7
        shr       ebx, 16                                       ;114.7
        or        ecx, ebx                                      ;114.7
        mov       ebx, eax                                      ;114.7
        and       ebx, -268435456                               ;114.7
        and       eax, 268435455                                ;114.7
        shr       ebx, 4                                        ;114.7
        or        ecx, ebx                                      ;114.7
        cmp       DWORD PTR [32+esp], 0                         ;114.7
        je        .B15.6        ; Prob 50%                      ;114.7
                                ; LOE eax ecx xmm0
.B15.5:                         ; Preds .B15.4
        mov       edx, eax                                      ;114.7
        shr       edx, 2                                        ;114.7
        shl       eax, 26                                       ;114.7
        or        edx, eax                                      ;114.7
        mov       eax, ecx                                      ;114.7
        shr       eax, 2                                        ;114.7
        shl       ecx, 26                                       ;114.7
        or        eax, ecx                                      ;114.7
        jmp       .B15.7        ; Prob 100%                     ;114.7
                                ; LOE eax edx xmm0
.B15.6:                         ; Preds .B15.4
        mov       edx, eax                                      ;114.7
        shr       edx, 1                                        ;114.7
        shl       eax, 27                                       ;114.7
        or        edx, eax                                      ;114.7
        mov       eax, ecx                                      ;114.7
        shr       eax, 1                                        ;114.7
        shl       ecx, 27                                       ;114.7
        or        eax, ecx                                      ;114.7
                                ; LOE eax edx xmm0
.B15.7:                         ; Preds .B15.5 .B15.6
        and       edx, 268435455                                ;114.7
        and       eax, 268435455                                ;114.7
        mov       ecx, edx                                      ;114.7
        mov       edi, edx                                      ;114.7
        shr       ecx, 6                                        ;114.7
        mov       esi, edx                                      ;114.7
        shr       edi, 7                                        ;114.7
        and       esi, 63                                       ;114.7
        and       ecx, 3                                        ;114.7
        and       edi, 60                                       ;114.7
        or        ecx, edi                                      ;114.7
        mov       edi, edx                                      ;114.7
        shr       edi, 21                                       ;114.7
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;114.7
        mov       esi, edx                                      ;114.7
        shr       esi, 14                                       ;114.7
        and       edi, 6                                        ;114.7
        or        ebx, DWORD PTR [_des_skb+256+ecx*4]           ;114.7
        mov       ecx, edx                                      ;114.7
        shr       ecx, 13                                       ;114.7
        and       esi, 48                                       ;114.7
        and       ecx, 15                                       ;114.7
        or        ecx, esi                                      ;114.7
        mov       esi, edx                                      ;114.7
        shr       esi, 20                                       ;114.7
        and       esi, 1                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, eax                                      ;114.7
        or        ebx, DWORD PTR [_des_skb+512+ecx*4]           ;114.7
        mov       ecx, edx                                      ;114.7
        shr       ecx, 22                                       ;114.7
        and       ecx, 56                                       ;114.7
        or        esi, ecx                                      ;114.7
        mov       ecx, eax                                      ;114.7
        shr       edi, 8                                        ;114.7
        and       ecx, 63                                       ;114.7
        and       edi, 60                                       ;114.7
        mov       DWORD PTR [108+esp], eax                      ;114.7
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;114.7
        mov       esi, eax                                      ;114.7
        shr       esi, 7                                        ;114.7
        and       esi, 3                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, eax                                      ;114.7
        mov       ecx, DWORD PTR [_des_skb+1024+ecx*4]          ;114.7
        shr       edi, 15                                       ;114.7
        and       edi, 63                                       ;114.7
        or        ecx, DWORD PTR [_des_skb+1280+esi*4]          ;114.7
        mov       esi, eax                                      ;114.7
        shr       esi, 21                                       ;114.7
        shr       eax, 22                                       ;114.7
        and       esi, 15                                       ;114.7
        and       eax, 48                                       ;114.7
        or        esi, eax                                      ;114.7
        or        ecx, DWORD PTR [_des_skb+1536+edi*4]          ;114.7
        movzx     edi, bx                                       ;114.7
        shr       ebx, 16                                       ;114.7
        or        ecx, DWORD PTR [_des_skb+1792+esi*4]          ;114.7
        mov       eax, ecx                                      ;114.7
        and       ecx, -65536                                   ;114.7
        shl       eax, 16                                       ;114.7
        or        ebx, ecx                                      ;114.7
        mov       esi, DWORD PTR [88+esp]                       ;114.7
        or        eax, edi                                      ;114.7
        mov       edi, DWORD PTR [92+esp]                       ;114.7
        ror       eax, 30                                       ;114.7
        ror       ebx, 26                                       ;114.7
        mov       DWORD PTR [_ks_tbl+esi+edi], eax              ;114.7
        mov       DWORD PTR [_ks_tbl+4+esi+edi], ebx            ;114.7
        mov       eax, DWORD PTR [108+esp]                      ;114.7
        cmp       DWORD PTR [36+esp], 0                         ;114.7
        je        .B15.9        ; Prob 50%                      ;114.7
                                ; LOE rax eax edx al ah xmm0
.B15.8:                         ; Preds .B15.7
        mov       ecx, edx                                      ;114.7
        shr       ecx, 2                                        ;114.7
        shl       edx, 26                                       ;114.7
        or        ecx, edx                                      ;114.7
        mov       edx, eax                                      ;114.7
        shr       edx, 2                                        ;114.7
        shl       eax, 26                                       ;114.7
        or        edx, eax                                      ;114.7
        jmp       .B15.10       ; Prob 100%                     ;114.7
                                ; LOE edx ecx xmm0
.B15.9:                         ; Preds .B15.7
        mov       ecx, edx                                      ;114.7
        shr       ecx, 1                                        ;114.7
        shl       edx, 27                                       ;114.7
        or        ecx, edx                                      ;114.7
        mov       edx, eax                                      ;114.7
        shr       edx, 1                                        ;114.7
        shl       eax, 27                                       ;114.7
        or        edx, eax                                      ;114.7
                                ; LOE edx ecx xmm0
.B15.10:                        ; Preds .B15.8 .B15.9
        and       ecx, 268435455                                ;114.7
        and       edx, 268435455                                ;114.7
        mov       eax, ecx                                      ;114.7
        mov       edi, ecx                                      ;114.7
        shr       eax, 6                                        ;114.7
        mov       esi, ecx                                      ;114.7
        shr       edi, 7                                        ;114.7
        and       esi, 63                                       ;114.7
        and       eax, 3                                        ;114.7
        and       edi, 60                                       ;114.7
        or        eax, edi                                      ;114.7
        mov       edi, ecx                                      ;114.7
        shr       edi, 21                                       ;114.7
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;114.7
        mov       esi, ecx                                      ;114.7
        shr       esi, 14                                       ;114.7
        and       edi, 6                                        ;114.7
        or        ebx, DWORD PTR [_des_skb+256+eax*4]           ;114.7
        mov       eax, ecx                                      ;114.7
        shr       eax, 13                                       ;114.7
        and       esi, 48                                       ;114.7
        and       eax, 15                                       ;114.7
        or        eax, esi                                      ;114.7
        mov       esi, ecx                                      ;114.7
        shr       esi, 20                                       ;114.7
        and       esi, 1                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, edx                                      ;114.7
        or        ebx, DWORD PTR [_des_skb+512+eax*4]           ;114.7
        mov       eax, ecx                                      ;114.7
        shr       eax, 22                                       ;114.7
        and       eax, 56                                       ;114.7
        or        esi, eax                                      ;114.7
        mov       eax, edx                                      ;114.7
        shr       edi, 8                                        ;114.7
        and       eax, 63                                       ;114.7
        and       edi, 60                                       ;114.7
        mov       DWORD PTR [112+esp], edx                      ;114.7
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;114.7
        mov       esi, edx                                      ;114.7
        shr       esi, 7                                        ;114.7
        and       esi, 3                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, edx                                      ;114.7
        mov       eax, DWORD PTR [_des_skb+1024+eax*4]          ;114.7
        shr       edi, 15                                       ;114.7
        and       edi, 63                                       ;114.7
        or        eax, DWORD PTR [_des_skb+1280+esi*4]          ;114.7
        mov       esi, edx                                      ;114.7
        shr       esi, 21                                       ;114.7
        shr       edx, 22                                       ;114.7
        and       esi, 15                                       ;114.7
        and       edx, 48                                       ;114.7
        or        esi, edx                                      ;114.7
        or        eax, DWORD PTR [_des_skb+1536+edi*4]          ;114.7
        movzx     edi, bx                                       ;114.7
        shr       ebx, 16                                       ;114.7
        or        eax, DWORD PTR [_des_skb+1792+esi*4]          ;114.7
        mov       edx, eax                                      ;114.7
        and       eax, -65536                                   ;114.7
        shl       edx, 16                                       ;114.7
        or        ebx, eax                                      ;114.7
        mov       esi, DWORD PTR [88+esp]                       ;114.7
        or        edx, edi                                      ;114.7
        mov       edi, DWORD PTR [92+esp]                       ;114.7
        ror       edx, 30                                       ;114.7
        ror       ebx, 26                                       ;114.7
        mov       DWORD PTR [_ks_tbl+8+esi+edi], edx            ;114.7
        mov       DWORD PTR [_ks_tbl+12+esi+edi], ebx           ;114.7
        mov       edx, DWORD PTR [112+esp]                      ;114.7
        cmp       DWORD PTR [40+esp], 0                         ;114.7
        je        .B15.12       ; Prob 50%                      ;114.7
                                ; LOE rdx edx ecx dl dh xmm0
.B15.11:                        ; Preds .B15.10
        mov       ebx, ecx                                      ;114.7
        mov       eax, edx                                      ;114.7
        shr       ebx, 2                                        ;114.7
        shl       ecx, 26                                       ;114.7
        shr       eax, 2                                        ;114.7
        or        ebx, ecx                                      ;114.7
        shl       edx, 26                                       ;114.7
        or        eax, edx                                      ;114.7
        jmp       .B15.13       ; Prob 100%                     ;114.7
                                ; LOE eax ebx xmm0
.B15.12:                        ; Preds .B15.10
        mov       ebx, ecx                                      ;114.7
        mov       eax, edx                                      ;114.7
        shr       ebx, 1                                        ;114.7
        shl       ecx, 27                                       ;114.7
        shr       eax, 1                                        ;114.7
        or        ebx, ecx                                      ;114.7
        shl       edx, 27                                       ;114.7
        or        eax, edx                                      ;114.7
                                ; LOE eax ebx xmm0
.B15.13:                        ; Preds .B15.11 .B15.12
        and       ebx, 268435455                                ;114.7
        and       eax, 268435455                                ;114.7
        mov       edx, ebx                                      ;114.7
        mov       edi, ebx                                      ;114.7
        shr       edx, 6                                        ;114.7
        mov       esi, ebx                                      ;114.7
        shr       edi, 7                                        ;114.7
        and       esi, 63                                       ;114.7
        and       edx, 3                                        ;114.7
        and       edi, 60                                       ;114.7
        or        edx, edi                                      ;114.7
        mov       edi, ebx                                      ;114.7
        shr       edi, 21                                       ;114.7
        mov       ecx, DWORD PTR [_des_skb+esi*4]               ;114.7
        mov       esi, ebx                                      ;114.7
        shr       esi, 14                                       ;114.7
        and       edi, 6                                        ;114.7
        or        ecx, DWORD PTR [_des_skb+256+edx*4]           ;114.7
        mov       edx, ebx                                      ;114.7
        shr       edx, 13                                       ;114.7
        and       esi, 48                                       ;114.7
        and       edx, 15                                       ;114.7
        or        edx, esi                                      ;114.7
        mov       esi, ebx                                      ;114.7
        shr       esi, 20                                       ;114.7
        and       esi, 1                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, eax                                      ;114.7
        or        ecx, DWORD PTR [_des_skb+512+edx*4]           ;114.7
        mov       edx, ebx                                      ;114.7
        shr       edx, 22                                       ;114.7
        and       edx, 56                                       ;114.7
        or        esi, edx                                      ;114.7
        mov       edx, eax                                      ;114.7
        shr       edi, 8                                        ;114.7
        and       edx, 63                                       ;114.7
        and       edi, 60                                       ;114.7
        mov       DWORD PTR [116+esp], eax                      ;114.7
        or        ecx, DWORD PTR [_des_skb+768+esi*4]           ;114.7
        mov       esi, eax                                      ;114.7
        shr       esi, 7                                        ;114.7
        and       esi, 3                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, eax                                      ;114.7
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;114.7
        shr       edi, 15                                       ;114.7
        and       edi, 63                                       ;114.7
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;114.7
        mov       esi, eax                                      ;114.7
        shr       esi, 21                                       ;114.7
        shr       eax, 22                                       ;114.7
        and       esi, 15                                       ;114.7
        and       eax, 48                                       ;114.7
        or        esi, eax                                      ;114.7
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;114.7
        movzx     edi, cx                                       ;114.7
        shr       ecx, 16                                       ;114.7
        or        edx, DWORD PTR [_des_skb+1792+esi*4]          ;114.7
        mov       eax, edx                                      ;114.7
        and       edx, -65536                                   ;114.7
        shl       eax, 16                                       ;114.7
        or        ecx, edx                                      ;114.7
        mov       esi, DWORD PTR [88+esp]                       ;114.7
        or        eax, edi                                      ;114.7
        mov       edi, DWORD PTR [92+esp]                       ;114.7
        ror       eax, 30                                       ;114.7
        ror       ecx, 26                                       ;114.7
        mov       DWORD PTR [_ks_tbl+16+esi+edi], eax           ;114.7
        mov       DWORD PTR [_ks_tbl+20+esi+edi], ecx           ;114.7
        mov       eax, DWORD PTR [116+esp]                      ;114.7
        cmp       DWORD PTR [44+esp], 0                         ;114.7
        je        .B15.15       ; Prob 50%                      ;114.7
                                ; LOE rax eax ebx al ah xmm0
.B15.14:                        ; Preds .B15.13
        mov       ecx, ebx                                      ;114.7
        mov       edx, eax                                      ;114.7
        shr       ecx, 2                                        ;114.7
        shl       ebx, 26                                       ;114.7
        shr       edx, 2                                        ;114.7
        or        ecx, ebx                                      ;114.7
        shl       eax, 26                                       ;114.7
        or        edx, eax                                      ;114.7
        jmp       .B15.16       ; Prob 100%                     ;114.7
                                ; LOE edx ecx xmm0
.B15.15:                        ; Preds .B15.13
        mov       ecx, ebx                                      ;114.7
        mov       edx, eax                                      ;114.7
        shr       ecx, 1                                        ;114.7
        shl       ebx, 27                                       ;114.7
        shr       edx, 1                                        ;114.7
        or        ecx, ebx                                      ;114.7
        shl       eax, 27                                       ;114.7
        or        edx, eax                                      ;114.7
                                ; LOE edx ecx xmm0
.B15.16:                        ; Preds .B15.14 .B15.15
        and       ecx, 268435455                                ;114.7
        and       edx, 268435455                                ;114.7
        mov       eax, ecx                                      ;114.7
        mov       edi, ecx                                      ;114.7
        shr       eax, 6                                        ;114.7
        mov       esi, ecx                                      ;114.7
        shr       edi, 7                                        ;114.7
        and       esi, 63                                       ;114.7
        and       eax, 3                                        ;114.7
        and       edi, 60                                       ;114.7
        or        eax, edi                                      ;114.7
        mov       edi, ecx                                      ;114.7
        shr       edi, 21                                       ;114.7
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;114.7
        mov       esi, ecx                                      ;114.7
        shr       esi, 14                                       ;114.7
        and       edi, 6                                        ;114.7
        or        ebx, DWORD PTR [_des_skb+256+eax*4]           ;114.7
        mov       eax, ecx                                      ;114.7
        shr       eax, 13                                       ;114.7
        and       esi, 48                                       ;114.7
        and       eax, 15                                       ;114.7
        or        eax, esi                                      ;114.7
        mov       esi, ecx                                      ;114.7
        shr       esi, 20                                       ;114.7
        and       esi, 1                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, edx                                      ;114.7
        or        ebx, DWORD PTR [_des_skb+512+eax*4]           ;114.7
        mov       eax, ecx                                      ;114.7
        shr       eax, 22                                       ;114.7
        and       eax, 56                                       ;114.7
        or        esi, eax                                      ;114.7
        mov       eax, edx                                      ;114.7
        shr       edi, 8                                        ;114.7
        and       eax, 63                                       ;114.7
        and       edi, 60                                       ;114.7
        mov       DWORD PTR [120+esp], edx                      ;114.7
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;114.7
        mov       esi, edx                                      ;114.7
        shr       esi, 7                                        ;114.7
        and       esi, 3                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, edx                                      ;114.7
        mov       eax, DWORD PTR [_des_skb+1024+eax*4]          ;114.7
        shr       edi, 15                                       ;114.7
        and       edi, 63                                       ;114.7
        or        eax, DWORD PTR [_des_skb+1280+esi*4]          ;114.7
        mov       esi, edx                                      ;114.7
        shr       esi, 21                                       ;114.7
        shr       edx, 22                                       ;114.7
        and       esi, 15                                       ;114.7
        and       edx, 48                                       ;114.7
        or        esi, edx                                      ;114.7
        or        eax, DWORD PTR [_des_skb+1536+edi*4]          ;114.7
        movzx     edi, bx                                       ;114.7
        shr       ebx, 16                                       ;114.7
        or        eax, DWORD PTR [_des_skb+1792+esi*4]          ;114.7
        mov       edx, eax                                      ;114.7
        and       eax, -65536                                   ;114.7
        shl       edx, 16                                       ;114.7
        or        ebx, eax                                      ;114.7
        mov       esi, DWORD PTR [88+esp]                       ;114.7
        or        edx, edi                                      ;114.7
        mov       edi, DWORD PTR [92+esp]                       ;114.7
        ror       edx, 30                                       ;114.7
        ror       ebx, 26                                       ;114.7
        mov       DWORD PTR [_ks_tbl+24+esi+edi], edx           ;114.7
        mov       DWORD PTR [_ks_tbl+28+esi+edi], ebx           ;114.7
        mov       edx, DWORD PTR [120+esp]                      ;114.7
        cmp       DWORD PTR [48+esp], 0                         ;114.7
        je        .B15.18       ; Prob 50%                      ;114.7
                                ; LOE rdx edx ecx dl dh xmm0
.B15.17:                        ; Preds .B15.16
        mov       ebx, ecx                                      ;114.7
        mov       eax, edx                                      ;114.7
        shr       ebx, 2                                        ;114.7
        shl       ecx, 26                                       ;114.7
        shr       eax, 2                                        ;114.7
        or        ebx, ecx                                      ;114.7
        shl       edx, 26                                       ;114.7
        or        eax, edx                                      ;114.7
        jmp       .B15.19       ; Prob 100%                     ;114.7
                                ; LOE eax ebx xmm0
.B15.18:                        ; Preds .B15.16
        mov       ebx, ecx                                      ;114.7
        mov       eax, edx                                      ;114.7
        shr       ebx, 1                                        ;114.7
        shl       ecx, 27                                       ;114.7
        shr       eax, 1                                        ;114.7
        or        ebx, ecx                                      ;114.7
        shl       edx, 27                                       ;114.7
        or        eax, edx                                      ;114.7
                                ; LOE eax ebx xmm0
.B15.19:                        ; Preds .B15.17 .B15.18
        and       ebx, 268435455                                ;114.7
        and       eax, 268435455                                ;114.7
        mov       edx, ebx                                      ;114.7
        mov       edi, ebx                                      ;114.7
        shr       edx, 6                                        ;114.7
        mov       esi, ebx                                      ;114.7
        shr       edi, 7                                        ;114.7
        and       esi, 63                                       ;114.7
        and       edx, 3                                        ;114.7
        and       edi, 60                                       ;114.7
        or        edx, edi                                      ;114.7
        mov       edi, ebx                                      ;114.7
        shr       edi, 21                                       ;114.7
        mov       ecx, DWORD PTR [_des_skb+esi*4]               ;114.7
        mov       esi, ebx                                      ;114.7
        shr       esi, 14                                       ;114.7
        and       edi, 6                                        ;114.7
        or        ecx, DWORD PTR [_des_skb+256+edx*4]           ;114.7
        mov       edx, ebx                                      ;114.7
        shr       edx, 13                                       ;114.7
        and       esi, 48                                       ;114.7
        and       edx, 15                                       ;114.7
        or        edx, esi                                      ;114.7
        mov       esi, ebx                                      ;114.7
        shr       esi, 20                                       ;114.7
        and       esi, 1                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, eax                                      ;114.7
        or        ecx, DWORD PTR [_des_skb+512+edx*4]           ;114.7
        mov       edx, ebx                                      ;114.7
        shr       edx, 22                                       ;114.7
        and       edx, 56                                       ;114.7
        or        esi, edx                                      ;114.7
        mov       edx, eax                                      ;114.7
        shr       edi, 8                                        ;114.7
        and       edx, 63                                       ;114.7
        and       edi, 60                                       ;114.7
        mov       DWORD PTR [124+esp], eax                      ;114.7
        or        ecx, DWORD PTR [_des_skb+768+esi*4]           ;114.7
        mov       esi, eax                                      ;114.7
        shr       esi, 7                                        ;114.7
        and       esi, 3                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, eax                                      ;114.7
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;114.7
        shr       edi, 15                                       ;114.7
        and       edi, 63                                       ;114.7
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;114.7
        mov       esi, eax                                      ;114.7
        shr       esi, 21                                       ;114.7
        shr       eax, 22                                       ;114.7
        and       esi, 15                                       ;114.7
        and       eax, 48                                       ;114.7
        or        esi, eax                                      ;114.7
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;114.7
        movzx     edi, cx                                       ;114.7
        shr       ecx, 16                                       ;114.7
        or        edx, DWORD PTR [_des_skb+1792+esi*4]          ;114.7
        mov       eax, edx                                      ;114.7
        and       edx, -65536                                   ;114.7
        shl       eax, 16                                       ;114.7
        or        ecx, edx                                      ;114.7
        mov       esi, DWORD PTR [88+esp]                       ;114.7
        or        eax, edi                                      ;114.7
        mov       edi, DWORD PTR [92+esp]                       ;114.7
        ror       eax, 30                                       ;114.7
        ror       ecx, 26                                       ;114.7
        mov       DWORD PTR [_ks_tbl+32+esi+edi], eax           ;114.7
        mov       DWORD PTR [_ks_tbl+36+esi+edi], ecx           ;114.7
        mov       eax, DWORD PTR [124+esp]                      ;114.7
        cmp       DWORD PTR [52+esp], 0                         ;114.7
        je        .B15.21       ; Prob 50%                      ;114.7
                                ; LOE rax eax ebx al ah xmm0
.B15.20:                        ; Preds .B15.19
        mov       ecx, ebx                                      ;114.7
        mov       edx, eax                                      ;114.7
        shr       ecx, 2                                        ;114.7
        shl       ebx, 26                                       ;114.7
        shr       edx, 2                                        ;114.7
        or        ecx, ebx                                      ;114.7
        shl       eax, 26                                       ;114.7
        or        edx, eax                                      ;114.7
        jmp       .B15.22       ; Prob 100%                     ;114.7
                                ; LOE edx ecx xmm0
.B15.21:                        ; Preds .B15.19
        mov       ecx, ebx                                      ;114.7
        mov       edx, eax                                      ;114.7
        shr       ecx, 1                                        ;114.7
        shl       ebx, 27                                       ;114.7
        shr       edx, 1                                        ;114.7
        or        ecx, ebx                                      ;114.7
        shl       eax, 27                                       ;114.7
        or        edx, eax                                      ;114.7
                                ; LOE edx ecx xmm0
.B15.22:                        ; Preds .B15.20 .B15.21
        and       ecx, 268435455                                ;114.7
        and       edx, 268435455                                ;114.7
        mov       eax, ecx                                      ;114.7
        mov       edi, ecx                                      ;114.7
        shr       eax, 6                                        ;114.7
        mov       esi, ecx                                      ;114.7
        shr       edi, 7                                        ;114.7
        and       esi, 63                                       ;114.7
        and       eax, 3                                        ;114.7
        and       edi, 60                                       ;114.7
        or        eax, edi                                      ;114.7
        mov       edi, ecx                                      ;114.7
        shr       edi, 21                                       ;114.7
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;114.7
        mov       esi, ecx                                      ;114.7
        shr       esi, 14                                       ;114.7
        and       edi, 6                                        ;114.7
        or        ebx, DWORD PTR [_des_skb+256+eax*4]           ;114.7
        mov       eax, ecx                                      ;114.7
        shr       eax, 13                                       ;114.7
        and       esi, 48                                       ;114.7
        and       eax, 15                                       ;114.7
        or        eax, esi                                      ;114.7
        mov       esi, ecx                                      ;114.7
        shr       esi, 20                                       ;114.7
        and       esi, 1                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, edx                                      ;114.7
        or        ebx, DWORD PTR [_des_skb+512+eax*4]           ;114.7
        mov       eax, ecx                                      ;114.7
        shr       eax, 22                                       ;114.7
        and       eax, 56                                       ;114.7
        or        esi, eax                                      ;114.7
        mov       eax, edx                                      ;114.7
        shr       edi, 8                                        ;114.7
        and       eax, 63                                       ;114.7
        and       edi, 60                                       ;114.7
        mov       DWORD PTR [128+esp], edx                      ;114.7
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;114.7
        mov       esi, edx                                      ;114.7
        shr       esi, 7                                        ;114.7
        and       esi, 3                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, edx                                      ;114.7
        mov       eax, DWORD PTR [_des_skb+1024+eax*4]          ;114.7
        shr       edi, 15                                       ;114.7
        and       edi, 63                                       ;114.7
        or        eax, DWORD PTR [_des_skb+1280+esi*4]          ;114.7
        mov       esi, edx                                      ;114.7
        shr       esi, 21                                       ;114.7
        shr       edx, 22                                       ;114.7
        and       esi, 15                                       ;114.7
        and       edx, 48                                       ;114.7
        or        esi, edx                                      ;114.7
        or        eax, DWORD PTR [_des_skb+1536+edi*4]          ;114.7
        movzx     edi, bx                                       ;114.7
        shr       ebx, 16                                       ;114.7
        or        eax, DWORD PTR [_des_skb+1792+esi*4]          ;114.7
        mov       edx, eax                                      ;114.7
        and       eax, -65536                                   ;114.7
        shl       edx, 16                                       ;114.7
        or        ebx, eax                                      ;114.7
        mov       esi, DWORD PTR [88+esp]                       ;114.7
        or        edx, edi                                      ;114.7
        mov       edi, DWORD PTR [92+esp]                       ;114.7
        ror       edx, 30                                       ;114.7
        ror       ebx, 26                                       ;114.7
        mov       DWORD PTR [_ks_tbl+40+esi+edi], edx           ;114.7
        mov       DWORD PTR [_ks_tbl+44+esi+edi], ebx           ;114.7
        mov       edx, DWORD PTR [128+esp]                      ;114.7
        cmp       DWORD PTR [56+esp], 0                         ;114.7
        je        .B15.24       ; Prob 50%                      ;114.7
                                ; LOE rdx edx ecx dl dh xmm0
.B15.23:                        ; Preds .B15.22
        mov       ebx, ecx                                      ;114.7
        mov       eax, edx                                      ;114.7
        shr       ebx, 2                                        ;114.7
        shl       ecx, 26                                       ;114.7
        shr       eax, 2                                        ;114.7
        or        ebx, ecx                                      ;114.7
        shl       edx, 26                                       ;114.7
        or        eax, edx                                      ;114.7
        jmp       .B15.25       ; Prob 100%                     ;114.7
                                ; LOE eax ebx xmm0
.B15.24:                        ; Preds .B15.22
        mov       ebx, ecx                                      ;114.7
        mov       eax, edx                                      ;114.7
        shr       ebx, 1                                        ;114.7
        shl       ecx, 27                                       ;114.7
        shr       eax, 1                                        ;114.7
        or        ebx, ecx                                      ;114.7
        shl       edx, 27                                       ;114.7
        or        eax, edx                                      ;114.7
                                ; LOE eax ebx xmm0
.B15.25:                        ; Preds .B15.23 .B15.24
        and       ebx, 268435455                                ;114.7
        and       eax, 268435455                                ;114.7
        mov       edx, ebx                                      ;114.7
        mov       edi, ebx                                      ;114.7
        shr       edx, 6                                        ;114.7
        mov       esi, ebx                                      ;114.7
        shr       edi, 7                                        ;114.7
        and       esi, 63                                       ;114.7
        and       edx, 3                                        ;114.7
        and       edi, 60                                       ;114.7
        or        edx, edi                                      ;114.7
        mov       edi, ebx                                      ;114.7
        shr       edi, 21                                       ;114.7
        mov       ecx, DWORD PTR [_des_skb+esi*4]               ;114.7
        mov       esi, ebx                                      ;114.7
        shr       esi, 14                                       ;114.7
        and       edi, 6                                        ;114.7
        or        ecx, DWORD PTR [_des_skb+256+edx*4]           ;114.7
        mov       edx, ebx                                      ;114.7
        shr       edx, 13                                       ;114.7
        and       esi, 48                                       ;114.7
        and       edx, 15                                       ;114.7
        or        edx, esi                                      ;114.7
        mov       esi, ebx                                      ;114.7
        shr       esi, 20                                       ;114.7
        and       esi, 1                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, eax                                      ;114.7
        or        ecx, DWORD PTR [_des_skb+512+edx*4]           ;114.7
        mov       edx, ebx                                      ;114.7
        shr       edx, 22                                       ;114.7
        and       edx, 56                                       ;114.7
        or        esi, edx                                      ;114.7
        mov       edx, eax                                      ;114.7
        shr       edi, 8                                        ;114.7
        and       edx, 63                                       ;114.7
        and       edi, 60                                       ;114.7
        mov       DWORD PTR [132+esp], eax                      ;114.7
        or        ecx, DWORD PTR [_des_skb+768+esi*4]           ;114.7
        mov       esi, eax                                      ;114.7
        shr       esi, 7                                        ;114.7
        and       esi, 3                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, eax                                      ;114.7
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;114.7
        shr       edi, 15                                       ;114.7
        and       edi, 63                                       ;114.7
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;114.7
        mov       esi, eax                                      ;114.7
        shr       esi, 21                                       ;114.7
        shr       eax, 22                                       ;114.7
        and       esi, 15                                       ;114.7
        and       eax, 48                                       ;114.7
        or        esi, eax                                      ;114.7
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;114.7
        movzx     edi, cx                                       ;114.7
        shr       ecx, 16                                       ;114.7
        or        edx, DWORD PTR [_des_skb+1792+esi*4]          ;114.7
        mov       eax, edx                                      ;114.7
        and       edx, -65536                                   ;114.7
        shl       eax, 16                                       ;114.7
        or        ecx, edx                                      ;114.7
        mov       esi, DWORD PTR [88+esp]                       ;114.7
        or        eax, edi                                      ;114.7
        mov       edi, DWORD PTR [92+esp]                       ;114.7
        ror       eax, 30                                       ;114.7
        ror       ecx, 26                                       ;114.7
        mov       DWORD PTR [_ks_tbl+48+esi+edi], eax           ;114.7
        mov       DWORD PTR [_ks_tbl+52+esi+edi], ecx           ;114.7
        mov       eax, DWORD PTR [132+esp]                      ;114.7
        cmp       DWORD PTR [60+esp], 0                         ;114.7
        je        .B15.27       ; Prob 50%                      ;114.7
                                ; LOE rax eax ebx al ah xmm0
.B15.26:                        ; Preds .B15.25
        mov       ecx, ebx                                      ;114.7
        mov       edx, eax                                      ;114.7
        shr       ecx, 2                                        ;114.7
        shl       ebx, 26                                       ;114.7
        shr       edx, 2                                        ;114.7
        or        ecx, ebx                                      ;114.7
        shl       eax, 26                                       ;114.7
        or        edx, eax                                      ;114.7
        jmp       .B15.28       ; Prob 100%                     ;114.7
                                ; LOE edx ecx xmm0
.B15.27:                        ; Preds .B15.25
        mov       ecx, ebx                                      ;114.7
        mov       edx, eax                                      ;114.7
        shr       ecx, 1                                        ;114.7
        shl       ebx, 27                                       ;114.7
        shr       edx, 1                                        ;114.7
        or        ecx, ebx                                      ;114.7
        shl       eax, 27                                       ;114.7
        or        edx, eax                                      ;114.7
                                ; LOE edx ecx xmm0
.B15.28:                        ; Preds .B15.26 .B15.27
        and       ecx, 268435455                                ;114.7
        and       edx, 268435455                                ;114.7
        mov       eax, ecx                                      ;114.7
        mov       edi, ecx                                      ;114.7
        shr       eax, 6                                        ;114.7
        mov       esi, ecx                                      ;114.7
        shr       edi, 7                                        ;114.7
        and       esi, 63                                       ;114.7
        and       eax, 3                                        ;114.7
        and       edi, 60                                       ;114.7
        or        eax, edi                                      ;114.7
        mov       edi, ecx                                      ;114.7
        shr       edi, 21                                       ;114.7
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;114.7
        mov       esi, ecx                                      ;114.7
        shr       esi, 14                                       ;114.7
        and       edi, 6                                        ;114.7
        or        ebx, DWORD PTR [_des_skb+256+eax*4]           ;114.7
        mov       eax, ecx                                      ;114.7
        shr       eax, 13                                       ;114.7
        and       esi, 48                                       ;114.7
        and       eax, 15                                       ;114.7
        or        eax, esi                                      ;114.7
        mov       esi, ecx                                      ;114.7
        shr       esi, 20                                       ;114.7
        and       esi, 1                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, edx                                      ;114.7
        or        ebx, DWORD PTR [_des_skb+512+eax*4]           ;114.7
        mov       eax, ecx                                      ;114.7
        shr       eax, 22                                       ;114.7
        and       eax, 56                                       ;114.7
        or        esi, eax                                      ;114.7
        mov       eax, edx                                      ;114.7
        shr       edi, 8                                        ;114.7
        and       eax, 63                                       ;114.7
        and       edi, 60                                       ;114.7
        mov       DWORD PTR [136+esp], edx                      ;114.7
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;114.7
        mov       esi, edx                                      ;114.7
        shr       esi, 7                                        ;114.7
        and       esi, 3                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, edx                                      ;114.7
        mov       eax, DWORD PTR [_des_skb+1024+eax*4]          ;114.7
        shr       edi, 15                                       ;114.7
        and       edi, 63                                       ;114.7
        or        eax, DWORD PTR [_des_skb+1280+esi*4]          ;114.7
        mov       esi, edx                                      ;114.7
        shr       esi, 21                                       ;114.7
        shr       edx, 22                                       ;114.7
        and       esi, 15                                       ;114.7
        and       edx, 48                                       ;114.7
        or        esi, edx                                      ;114.7
        or        eax, DWORD PTR [_des_skb+1536+edi*4]          ;114.7
        movzx     edi, bx                                       ;114.7
        shr       ebx, 16                                       ;114.7
        or        eax, DWORD PTR [_des_skb+1792+esi*4]          ;114.7
        mov       edx, eax                                      ;114.7
        and       eax, -65536                                   ;114.7
        shl       edx, 16                                       ;114.7
        or        ebx, eax                                      ;114.7
        mov       esi, DWORD PTR [88+esp]                       ;114.7
        or        edx, edi                                      ;114.7
        mov       edi, DWORD PTR [92+esp]                       ;114.7
        ror       edx, 30                                       ;114.7
        ror       ebx, 26                                       ;114.7
        mov       DWORD PTR [_ks_tbl+56+esi+edi], edx           ;114.7
        mov       DWORD PTR [_ks_tbl+60+esi+edi], ebx           ;114.7
        mov       edx, DWORD PTR [136+esp]                      ;114.7
        cmp       DWORD PTR [64+esp], 0                         ;114.7
        je        .B15.30       ; Prob 50%                      ;114.7
                                ; LOE rdx edx ecx dl dh xmm0
.B15.29:                        ; Preds .B15.28
        mov       ebx, ecx                                      ;114.7
        mov       eax, edx                                      ;114.7
        shr       ebx, 2                                        ;114.7
        shl       ecx, 26                                       ;114.7
        shr       eax, 2                                        ;114.7
        or        ebx, ecx                                      ;114.7
        shl       edx, 26                                       ;114.7
        or        eax, edx                                      ;114.7
        jmp       .B15.31       ; Prob 100%                     ;114.7
                                ; LOE eax ebx xmm0
.B15.30:                        ; Preds .B15.28
        mov       ebx, ecx                                      ;114.7
        mov       eax, edx                                      ;114.7
        shr       ebx, 1                                        ;114.7
        shl       ecx, 27                                       ;114.7
        shr       eax, 1                                        ;114.7
        or        ebx, ecx                                      ;114.7
        shl       edx, 27                                       ;114.7
        or        eax, edx                                      ;114.7
                                ; LOE eax ebx xmm0
.B15.31:                        ; Preds .B15.29 .B15.30
        and       ebx, 268435455                                ;114.7
        and       eax, 268435455                                ;114.7
        mov       edx, ebx                                      ;114.7
        mov       edi, ebx                                      ;114.7
        shr       edx, 6                                        ;114.7
        mov       esi, ebx                                      ;114.7
        shr       edi, 7                                        ;114.7
        and       esi, 63                                       ;114.7
        and       edx, 3                                        ;114.7
        and       edi, 60                                       ;114.7
        or        edx, edi                                      ;114.7
        mov       edi, ebx                                      ;114.7
        shr       edi, 21                                       ;114.7
        mov       ecx, DWORD PTR [_des_skb+esi*4]               ;114.7
        mov       esi, ebx                                      ;114.7
        shr       esi, 14                                       ;114.7
        and       edi, 6                                        ;114.7
        or        ecx, DWORD PTR [_des_skb+256+edx*4]           ;114.7
        mov       edx, ebx                                      ;114.7
        shr       edx, 13                                       ;114.7
        and       esi, 48                                       ;114.7
        and       edx, 15                                       ;114.7
        or        edx, esi                                      ;114.7
        mov       esi, ebx                                      ;114.7
        shr       esi, 20                                       ;114.7
        and       esi, 1                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, eax                                      ;114.7
        or        ecx, DWORD PTR [_des_skb+512+edx*4]           ;114.7
        mov       edx, ebx                                      ;114.7
        shr       edx, 22                                       ;114.7
        and       edx, 56                                       ;114.7
        or        esi, edx                                      ;114.7
        mov       edx, eax                                      ;114.7
        shr       edi, 8                                        ;114.7
        and       edx, 63                                       ;114.7
        and       edi, 60                                       ;114.7
        mov       DWORD PTR [140+esp], eax                      ;114.7
        or        ecx, DWORD PTR [_des_skb+768+esi*4]           ;114.7
        mov       esi, eax                                      ;114.7
        shr       esi, 7                                        ;114.7
        and       esi, 3                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, eax                                      ;114.7
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;114.7
        shr       edi, 15                                       ;114.7
        and       edi, 63                                       ;114.7
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;114.7
        mov       esi, eax                                      ;114.7
        shr       esi, 21                                       ;114.7
        shr       eax, 22                                       ;114.7
        and       esi, 15                                       ;114.7
        and       eax, 48                                       ;114.7
        or        esi, eax                                      ;114.7
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;114.7
        movzx     edi, cx                                       ;114.7
        shr       ecx, 16                                       ;114.7
        or        edx, DWORD PTR [_des_skb+1792+esi*4]          ;114.7
        mov       eax, edx                                      ;114.7
        and       edx, -65536                                   ;114.7
        shl       eax, 16                                       ;114.7
        or        ecx, edx                                      ;114.7
        mov       esi, DWORD PTR [88+esp]                       ;114.7
        or        eax, edi                                      ;114.7
        mov       edi, DWORD PTR [92+esp]                       ;114.7
        ror       eax, 30                                       ;114.7
        ror       ecx, 26                                       ;114.7
        mov       DWORD PTR [_ks_tbl+64+esi+edi], eax           ;114.7
        mov       DWORD PTR [_ks_tbl+68+esi+edi], ecx           ;114.7
        mov       eax, DWORD PTR [140+esp]                      ;114.7
        cmp       DWORD PTR [72+esp], 0                         ;114.7
        je        .B15.33       ; Prob 50%                      ;114.7
                                ; LOE rax eax ebx al ah xmm0
.B15.32:                        ; Preds .B15.31
        mov       ecx, ebx                                      ;114.7
        mov       edx, eax                                      ;114.7
        shr       ecx, 2                                        ;114.7
        shl       ebx, 26                                       ;114.7
        shr       edx, 2                                        ;114.7
        or        ecx, ebx                                      ;114.7
        shl       eax, 26                                       ;114.7
        or        edx, eax                                      ;114.7
        jmp       .B15.34       ; Prob 100%                     ;114.7
                                ; LOE edx ecx xmm0
.B15.33:                        ; Preds .B15.31
        mov       ecx, ebx                                      ;114.7
        mov       edx, eax                                      ;114.7
        shr       ecx, 1                                        ;114.7
        shl       ebx, 27                                       ;114.7
        shr       edx, 1                                        ;114.7
        or        ecx, ebx                                      ;114.7
        shl       eax, 27                                       ;114.7
        or        edx, eax                                      ;114.7
                                ; LOE edx ecx xmm0
.B15.34:                        ; Preds .B15.32 .B15.33
        and       ecx, 268435455                                ;114.7
        and       edx, 268435455                                ;114.7
        mov       eax, ecx                                      ;114.7
        mov       edi, ecx                                      ;114.7
        shr       eax, 6                                        ;114.7
        mov       esi, ecx                                      ;114.7
        shr       edi, 7                                        ;114.7
        and       esi, 63                                       ;114.7
        and       eax, 3                                        ;114.7
        and       edi, 60                                       ;114.7
        or        eax, edi                                      ;114.7
        mov       edi, ecx                                      ;114.7
        shr       edi, 21                                       ;114.7
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;114.7
        mov       esi, ecx                                      ;114.7
        shr       esi, 14                                       ;114.7
        and       edi, 6                                        ;114.7
        or        ebx, DWORD PTR [_des_skb+256+eax*4]           ;114.7
        mov       eax, ecx                                      ;114.7
        shr       eax, 13                                       ;114.7
        and       esi, 48                                       ;114.7
        and       eax, 15                                       ;114.7
        or        eax, esi                                      ;114.7
        mov       esi, ecx                                      ;114.7
        shr       esi, 20                                       ;114.7
        and       esi, 1                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, edx                                      ;114.7
        or        ebx, DWORD PTR [_des_skb+512+eax*4]           ;114.7
        mov       eax, ecx                                      ;114.7
        shr       eax, 22                                       ;114.7
        and       eax, 56                                       ;114.7
        or        esi, eax                                      ;114.7
        mov       eax, edx                                      ;114.7
        shr       edi, 8                                        ;114.7
        and       eax, 63                                       ;114.7
        and       edi, 60                                       ;114.7
        mov       DWORD PTR [144+esp], edx                      ;114.7
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;114.7
        mov       esi, edx                                      ;114.7
        shr       esi, 7                                        ;114.7
        and       esi, 3                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, edx                                      ;114.7
        mov       eax, DWORD PTR [_des_skb+1024+eax*4]          ;114.7
        shr       edi, 15                                       ;114.7
        and       edi, 63                                       ;114.7
        or        eax, DWORD PTR [_des_skb+1280+esi*4]          ;114.7
        mov       esi, edx                                      ;114.7
        shr       esi, 21                                       ;114.7
        shr       edx, 22                                       ;114.7
        and       esi, 15                                       ;114.7
        and       edx, 48                                       ;114.7
        or        esi, edx                                      ;114.7
        or        eax, DWORD PTR [_des_skb+1536+edi*4]          ;114.7
        movzx     edi, bx                                       ;114.7
        shr       ebx, 16                                       ;114.7
        or        eax, DWORD PTR [_des_skb+1792+esi*4]          ;114.7
        mov       edx, eax                                      ;114.7
        and       eax, -65536                                   ;114.7
        shl       edx, 16                                       ;114.7
        or        ebx, eax                                      ;114.7
        mov       esi, DWORD PTR [88+esp]                       ;114.7
        or        edx, edi                                      ;114.7
        mov       edi, DWORD PTR [92+esp]                       ;114.7
        ror       edx, 30                                       ;114.7
        ror       ebx, 26                                       ;114.7
        mov       DWORD PTR [_ks_tbl+72+esi+edi], edx           ;114.7
        mov       DWORD PTR [_ks_tbl+76+esi+edi], ebx           ;114.7
        mov       edx, DWORD PTR [144+esp]                      ;114.7
        cmp       DWORD PTR [76+esp], 0                         ;114.7
        je        .B15.36       ; Prob 50%                      ;114.7
                                ; LOE rdx edx ecx dl dh xmm0
.B15.35:                        ; Preds .B15.34
        mov       ebx, ecx                                      ;114.7
        mov       eax, edx                                      ;114.7
        shr       ebx, 2                                        ;114.7
        shl       ecx, 26                                       ;114.7
        shr       eax, 2                                        ;114.7
        or        ebx, ecx                                      ;114.7
        shl       edx, 26                                       ;114.7
        or        eax, edx                                      ;114.7
        jmp       .B15.37       ; Prob 100%                     ;114.7
                                ; LOE eax ebx xmm0
.B15.36:                        ; Preds .B15.34
        mov       ebx, ecx                                      ;114.7
        mov       eax, edx                                      ;114.7
        shr       ebx, 1                                        ;114.7
        shl       ecx, 27                                       ;114.7
        shr       eax, 1                                        ;114.7
        or        ebx, ecx                                      ;114.7
        shl       edx, 27                                       ;114.7
        or        eax, edx                                      ;114.7
                                ; LOE eax ebx xmm0
.B15.37:                        ; Preds .B15.35 .B15.36
        and       ebx, 268435455                                ;114.7
        and       eax, 268435455                                ;114.7
        mov       edx, ebx                                      ;114.7
        mov       edi, ebx                                      ;114.7
        shr       edx, 6                                        ;114.7
        mov       esi, ebx                                      ;114.7
        shr       edi, 7                                        ;114.7
        and       esi, 63                                       ;114.7
        and       edx, 3                                        ;114.7
        and       edi, 60                                       ;114.7
        or        edx, edi                                      ;114.7
        mov       edi, ebx                                      ;114.7
        shr       edi, 21                                       ;114.7
        mov       ecx, DWORD PTR [_des_skb+esi*4]               ;114.7
        mov       esi, ebx                                      ;114.7
        shr       esi, 14                                       ;114.7
        and       edi, 6                                        ;114.7
        or        ecx, DWORD PTR [_des_skb+256+edx*4]           ;114.7
        mov       edx, ebx                                      ;114.7
        shr       edx, 13                                       ;114.7
        and       esi, 48                                       ;114.7
        and       edx, 15                                       ;114.7
        or        edx, esi                                      ;114.7
        mov       esi, ebx                                      ;114.7
        shr       esi, 20                                       ;114.7
        and       esi, 1                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, eax                                      ;114.7
        or        ecx, DWORD PTR [_des_skb+512+edx*4]           ;114.7
        mov       edx, ebx                                      ;114.7
        shr       edx, 22                                       ;114.7
        and       edx, 56                                       ;114.7
        or        esi, edx                                      ;114.7
        mov       edx, eax                                      ;114.7
        shr       edi, 8                                        ;114.7
        and       edx, 63                                       ;114.7
        and       edi, 60                                       ;114.7
        mov       DWORD PTR [148+esp], eax                      ;114.7
        or        ecx, DWORD PTR [_des_skb+768+esi*4]           ;114.7
        mov       esi, eax                                      ;114.7
        shr       esi, 7                                        ;114.7
        and       esi, 3                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, eax                                      ;114.7
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;114.7
        shr       edi, 15                                       ;114.7
        and       edi, 63                                       ;114.7
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;114.7
        mov       esi, eax                                      ;114.7
        shr       esi, 21                                       ;114.7
        shr       eax, 22                                       ;114.7
        and       esi, 15                                       ;114.7
        and       eax, 48                                       ;114.7
        or        esi, eax                                      ;114.7
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;114.7
        movzx     edi, cx                                       ;114.7
        shr       ecx, 16                                       ;114.7
        or        edx, DWORD PTR [_des_skb+1792+esi*4]          ;114.7
        mov       eax, edx                                      ;114.7
        and       edx, -65536                                   ;114.7
        shl       eax, 16                                       ;114.7
        or        ecx, edx                                      ;114.7
        mov       esi, DWORD PTR [88+esp]                       ;114.7
        or        eax, edi                                      ;114.7
        mov       edi, DWORD PTR [92+esp]                       ;114.7
        ror       eax, 30                                       ;114.7
        ror       ecx, 26                                       ;114.7
        mov       DWORD PTR [_ks_tbl+80+esi+edi], eax           ;114.7
        mov       DWORD PTR [_ks_tbl+84+esi+edi], ecx           ;114.7
        mov       eax, DWORD PTR [148+esp]                      ;114.7
        cmp       DWORD PTR [80+esp], 0                         ;114.7
        je        .B15.39       ; Prob 50%                      ;114.7
                                ; LOE rax eax ebx al ah xmm0
.B15.38:                        ; Preds .B15.37
        mov       ecx, ebx                                      ;114.7
        mov       edx, eax                                      ;114.7
        shr       ecx, 2                                        ;114.7
        shl       ebx, 26                                       ;114.7
        shr       edx, 2                                        ;114.7
        or        ecx, ebx                                      ;114.7
        shl       eax, 26                                       ;114.7
        or        edx, eax                                      ;114.7
        jmp       .B15.40       ; Prob 100%                     ;114.7
                                ; LOE edx ecx xmm0
.B15.39:                        ; Preds .B15.37
        mov       ecx, ebx                                      ;114.7
        mov       edx, eax                                      ;114.7
        shr       ecx, 1                                        ;114.7
        shl       ebx, 27                                       ;114.7
        shr       edx, 1                                        ;114.7
        or        ecx, ebx                                      ;114.7
        shl       eax, 27                                       ;114.7
        or        edx, eax                                      ;114.7
                                ; LOE edx ecx xmm0
.B15.40:                        ; Preds .B15.38 .B15.39
        and       ecx, 268435455                                ;114.7
        and       edx, 268435455                                ;114.7
        mov       eax, ecx                                      ;114.7
        mov       edi, ecx                                      ;114.7
        shr       eax, 6                                        ;114.7
        mov       esi, ecx                                      ;114.7
        shr       edi, 7                                        ;114.7
        and       esi, 63                                       ;114.7
        and       eax, 3                                        ;114.7
        and       edi, 60                                       ;114.7
        or        eax, edi                                      ;114.7
        mov       edi, ecx                                      ;114.7
        shr       edi, 21                                       ;114.7
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;114.7
        mov       esi, ecx                                      ;114.7
        shr       esi, 14                                       ;114.7
        and       edi, 6                                        ;114.7
        or        ebx, DWORD PTR [_des_skb+256+eax*4]           ;114.7
        mov       eax, ecx                                      ;114.7
        shr       eax, 13                                       ;114.7
        and       esi, 48                                       ;114.7
        and       eax, 15                                       ;114.7
        or        eax, esi                                      ;114.7
        mov       esi, ecx                                      ;114.7
        shr       esi, 20                                       ;114.7
        and       esi, 1                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, edx                                      ;114.7
        or        ebx, DWORD PTR [_des_skb+512+eax*4]           ;114.7
        mov       eax, ecx                                      ;114.7
        shr       eax, 22                                       ;114.7
        and       eax, 56                                       ;114.7
        or        esi, eax                                      ;114.7
        mov       eax, edx                                      ;114.7
        shr       edi, 8                                        ;114.7
        and       eax, 63                                       ;114.7
        and       edi, 60                                       ;114.7
        mov       DWORD PTR [152+esp], edx                      ;114.7
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;114.7
        mov       esi, edx                                      ;114.7
        shr       esi, 7                                        ;114.7
        and       esi, 3                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, edx                                      ;114.7
        mov       eax, DWORD PTR [_des_skb+1024+eax*4]          ;114.7
        shr       edi, 15                                       ;114.7
        and       edi, 63                                       ;114.7
        or        eax, DWORD PTR [_des_skb+1280+esi*4]          ;114.7
        mov       esi, edx                                      ;114.7
        shr       esi, 21                                       ;114.7
        shr       edx, 22                                       ;114.7
        and       esi, 15                                       ;114.7
        and       edx, 48                                       ;114.7
        or        esi, edx                                      ;114.7
        or        eax, DWORD PTR [_des_skb+1536+edi*4]          ;114.7
        movzx     edi, bx                                       ;114.7
        shr       ebx, 16                                       ;114.7
        or        eax, DWORD PTR [_des_skb+1792+esi*4]          ;114.7
        mov       edx, eax                                      ;114.7
        and       eax, -65536                                   ;114.7
        shl       edx, 16                                       ;114.7
        or        ebx, eax                                      ;114.7
        mov       esi, DWORD PTR [88+esp]                       ;114.7
        or        edx, edi                                      ;114.7
        mov       edi, DWORD PTR [92+esp]                       ;114.7
        ror       edx, 30                                       ;114.7
        ror       ebx, 26                                       ;114.7
        mov       DWORD PTR [_ks_tbl+88+esi+edi], edx           ;114.7
        mov       DWORD PTR [_ks_tbl+92+esi+edi], ebx           ;114.7
        mov       edx, DWORD PTR [152+esp]                      ;114.7
        cmp       DWORD PTR [84+esp], 0                         ;114.7
        je        .B15.42       ; Prob 50%                      ;114.7
                                ; LOE rdx edx ecx dl dh xmm0
.B15.41:                        ; Preds .B15.40
        mov       ebx, ecx                                      ;114.7
        mov       eax, edx                                      ;114.7
        shr       ebx, 2                                        ;114.7
        shl       ecx, 26                                       ;114.7
        shr       eax, 2                                        ;114.7
        or        ebx, ecx                                      ;114.7
        shl       edx, 26                                       ;114.7
        or        eax, edx                                      ;114.7
        jmp       .B15.43       ; Prob 100%                     ;114.7
                                ; LOE eax ebx xmm0
.B15.42:                        ; Preds .B15.40
        mov       ebx, ecx                                      ;114.7
        mov       eax, edx                                      ;114.7
        shr       ebx, 1                                        ;114.7
        shl       ecx, 27                                       ;114.7
        shr       eax, 1                                        ;114.7
        or        ebx, ecx                                      ;114.7
        shl       edx, 27                                       ;114.7
        or        eax, edx                                      ;114.7
                                ; LOE eax ebx xmm0
.B15.43:                        ; Preds .B15.41 .B15.42
        and       ebx, 268435455                                ;114.7
        and       eax, 268435455                                ;114.7
        mov       edx, ebx                                      ;114.7
        mov       edi, ebx                                      ;114.7
        shr       edx, 6                                        ;114.7
        mov       esi, ebx                                      ;114.7
        shr       edi, 7                                        ;114.7
        and       esi, 63                                       ;114.7
        and       edx, 3                                        ;114.7
        and       edi, 60                                       ;114.7
        or        edx, edi                                      ;114.7
        mov       edi, ebx                                      ;114.7
        shr       edi, 21                                       ;114.7
        mov       ecx, DWORD PTR [_des_skb+esi*4]               ;114.7
        mov       esi, ebx                                      ;114.7
        shr       esi, 14                                       ;114.7
        and       edi, 6                                        ;114.7
        or        ecx, DWORD PTR [_des_skb+256+edx*4]           ;114.7
        mov       edx, ebx                                      ;114.7
        shr       edx, 13                                       ;114.7
        and       esi, 48                                       ;114.7
        and       edx, 15                                       ;114.7
        or        edx, esi                                      ;114.7
        mov       esi, ebx                                      ;114.7
        shr       esi, 20                                       ;114.7
        and       esi, 1                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, eax                                      ;114.7
        or        ecx, DWORD PTR [_des_skb+512+edx*4]           ;114.7
        mov       edx, ebx                                      ;114.7
        shr       edx, 22                                       ;114.7
        and       edx, 56                                       ;114.7
        or        esi, edx                                      ;114.7
        mov       edx, eax                                      ;114.7
        shr       edi, 8                                        ;114.7
        and       edx, 63                                       ;114.7
        and       edi, 60                                       ;114.7
        mov       DWORD PTR [156+esp], eax                      ;114.7
        or        ecx, DWORD PTR [_des_skb+768+esi*4]           ;114.7
        mov       esi, eax                                      ;114.7
        shr       esi, 7                                        ;114.7
        and       esi, 3                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, eax                                      ;114.7
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;114.7
        shr       edi, 15                                       ;114.7
        and       edi, 63                                       ;114.7
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;114.7
        mov       esi, eax                                      ;114.7
        shr       esi, 21                                       ;114.7
        shr       eax, 22                                       ;114.7
        and       esi, 15                                       ;114.7
        and       eax, 48                                       ;114.7
        or        esi, eax                                      ;114.7
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;114.7
        movzx     edi, cx                                       ;114.7
        shr       ecx, 16                                       ;114.7
        or        edx, DWORD PTR [_des_skb+1792+esi*4]          ;114.7
        mov       eax, edx                                      ;114.7
        and       edx, -65536                                   ;114.7
        shl       eax, 16                                       ;114.7
        or        ecx, edx                                      ;114.7
        mov       esi, DWORD PTR [88+esp]                       ;114.7
        or        eax, edi                                      ;114.7
        mov       edi, DWORD PTR [92+esp]                       ;114.7
        ror       eax, 30                                       ;114.7
        ror       ecx, 26                                       ;114.7
        mov       DWORD PTR [_ks_tbl+96+esi+edi], eax           ;114.7
        mov       DWORD PTR [_ks_tbl+100+esi+edi], ecx          ;114.7
        mov       eax, DWORD PTR [156+esp]                      ;114.7
        cmp       DWORD PTR [68+esp], 0                         ;114.7
        je        .B15.45       ; Prob 50%                      ;114.7
                                ; LOE rax eax ebx al ah xmm0
.B15.44:                        ; Preds .B15.43
        mov       ecx, ebx                                      ;114.7
        mov       edx, eax                                      ;114.7
        shr       ecx, 2                                        ;114.7
        shl       ebx, 26                                       ;114.7
        shr       edx, 2                                        ;114.7
        or        ecx, ebx                                      ;114.7
        shl       eax, 26                                       ;114.7
        or        edx, eax                                      ;114.7
        jmp       .B15.46       ; Prob 100%                     ;114.7
                                ; LOE edx ecx xmm0
.B15.45:                        ; Preds .B15.43
        mov       ecx, ebx                                      ;114.7
        mov       edx, eax                                      ;114.7
        shr       ecx, 1                                        ;114.7
        shl       ebx, 27                                       ;114.7
        shr       edx, 1                                        ;114.7
        or        ecx, ebx                                      ;114.7
        shl       eax, 27                                       ;114.7
        or        edx, eax                                      ;114.7
                                ; LOE edx ecx xmm0
.B15.46:                        ; Preds .B15.44 .B15.45
        and       ecx, 268435455                                ;114.7
        and       edx, 268435455                                ;114.7
        mov       eax, ecx                                      ;114.7
        mov       edi, ecx                                      ;114.7
        shr       eax, 6                                        ;114.7
        mov       esi, ecx                                      ;114.7
        shr       edi, 7                                        ;114.7
        and       esi, 63                                       ;114.7
        and       eax, 3                                        ;114.7
        and       edi, 60                                       ;114.7
        or        eax, edi                                      ;114.7
        mov       edi, ecx                                      ;114.7
        shr       edi, 21                                       ;114.7
        mov       ebx, DWORD PTR [_des_skb+esi*4]               ;114.7
        mov       esi, ecx                                      ;114.7
        shr       esi, 14                                       ;114.7
        and       edi, 6                                        ;114.7
        or        ebx, DWORD PTR [_des_skb+256+eax*4]           ;114.7
        mov       eax, ecx                                      ;114.7
        shr       eax, 13                                       ;114.7
        and       esi, 48                                       ;114.7
        and       eax, 15                                       ;114.7
        or        eax, esi                                      ;114.7
        mov       esi, ecx                                      ;114.7
        shr       esi, 20                                       ;114.7
        and       esi, 1                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, edx                                      ;114.7
        or        ebx, DWORD PTR [_des_skb+512+eax*4]           ;114.7
        mov       eax, ecx                                      ;114.7
        shr       eax, 22                                       ;114.7
        and       eax, 56                                       ;114.7
        or        esi, eax                                      ;114.7
        mov       eax, edx                                      ;114.7
        shr       edi, 8                                        ;114.7
        and       eax, 63                                       ;114.7
        and       edi, 60                                       ;114.7
        mov       DWORD PTR [160+esp], edx                      ;114.7
        or        ebx, DWORD PTR [_des_skb+768+esi*4]           ;114.7
        mov       esi, edx                                      ;114.7
        shr       esi, 7                                        ;114.7
        and       esi, 3                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, edx                                      ;114.7
        mov       eax, DWORD PTR [_des_skb+1024+eax*4]          ;114.7
        shr       edi, 15                                       ;114.7
        and       edi, 63                                       ;114.7
        or        eax, DWORD PTR [_des_skb+1280+esi*4]          ;114.7
        mov       esi, edx                                      ;114.7
        shr       esi, 21                                       ;114.7
        shr       edx, 22                                       ;114.7
        and       esi, 15                                       ;114.7
        and       edx, 48                                       ;114.7
        or        esi, edx                                      ;114.7
        or        eax, DWORD PTR [_des_skb+1536+edi*4]          ;114.7
        movzx     edi, bx                                       ;114.7
        shr       ebx, 16                                       ;114.7
        or        eax, DWORD PTR [_des_skb+1792+esi*4]          ;114.7
        mov       edx, eax                                      ;114.7
        and       eax, -65536                                   ;114.7
        shl       edx, 16                                       ;114.7
        or        ebx, eax                                      ;114.7
        mov       esi, DWORD PTR [88+esp]                       ;114.7
        or        edx, edi                                      ;114.7
        mov       edi, DWORD PTR [92+esp]                       ;114.7
        ror       edx, 30                                       ;114.7
        ror       ebx, 26                                       ;114.7
        mov       DWORD PTR [_ks_tbl+104+esi+edi], edx          ;114.7
        mov       DWORD PTR [_ks_tbl+108+esi+edi], ebx          ;114.7
        mov       edx, DWORD PTR [160+esp]                      ;114.7
        cmp       DWORD PTR [28+esp], 0                         ;114.7
        je        .B15.48       ; Prob 50%                      ;114.7
                                ; LOE rdx edx ecx dl dh xmm0
.B15.47:                        ; Preds .B15.46
        mov       ebx, ecx                                      ;114.7
        mov       eax, edx                                      ;114.7
        shr       ebx, 2                                        ;114.7
        shl       ecx, 26                                       ;114.7
        shr       eax, 2                                        ;114.7
        or        ebx, ecx                                      ;114.7
        shl       edx, 26                                       ;114.7
        or        eax, edx                                      ;114.7
        jmp       .B15.49       ; Prob 100%                     ;114.7
                                ; LOE eax ebx xmm0
.B15.48:                        ; Preds .B15.46
        mov       ebx, ecx                                      ;114.7
        mov       eax, edx                                      ;114.7
        shr       ebx, 1                                        ;114.7
        shl       ecx, 27                                       ;114.7
        shr       eax, 1                                        ;114.7
        or        ebx, ecx                                      ;114.7
        shl       edx, 27                                       ;114.7
        or        eax, edx                                      ;114.7
                                ; LOE eax ebx xmm0
.B15.49:                        ; Preds .B15.47 .B15.48
        and       ebx, 268435455                                ;114.7
        and       eax, 268435455                                ;114.7
        mov       edx, ebx                                      ;114.7
        mov       edi, ebx                                      ;114.7
        shr       edx, 6                                        ;114.7
        mov       esi, ebx                                      ;114.7
        shr       edi, 7                                        ;114.7
        and       esi, 63                                       ;114.7
        and       edx, 3                                        ;114.7
        and       edi, 60                                       ;114.7
        or        edx, edi                                      ;114.7
        mov       edi, ebx                                      ;114.7
        shr       edi, 21                                       ;114.7
        mov       ecx, DWORD PTR [_des_skb+esi*4]               ;114.7
        mov       esi, ebx                                      ;114.7
        shr       esi, 14                                       ;114.7
        and       edi, 6                                        ;114.7
        or        ecx, DWORD PTR [_des_skb+256+edx*4]           ;114.7
        mov       edx, ebx                                      ;114.7
        shr       edx, 13                                       ;114.7
        and       esi, 48                                       ;114.7
        and       edx, 15                                       ;114.7
        or        edx, esi                                      ;114.7
        mov       esi, ebx                                      ;114.7
        shr       esi, 20                                       ;114.7
        and       esi, 1                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, eax                                      ;114.7
        or        ecx, DWORD PTR [_des_skb+512+edx*4]           ;114.7
        mov       edx, ebx                                      ;114.7
        shr       edx, 22                                       ;114.7
        and       edx, 56                                       ;114.7
        or        esi, edx                                      ;114.7
        mov       edx, eax                                      ;114.7
        shr       edi, 8                                        ;114.7
        and       edx, 63                                       ;114.7
        and       edi, 60                                       ;114.7
        mov       DWORD PTR [164+esp], eax                      ;114.7
        or        ecx, DWORD PTR [_des_skb+768+esi*4]           ;114.7
        mov       esi, eax                                      ;114.7
        shr       esi, 7                                        ;114.7
        and       esi, 3                                        ;114.7
        or        esi, edi                                      ;114.7
        mov       edi, eax                                      ;114.7
        mov       edx, DWORD PTR [_des_skb+1024+edx*4]          ;114.7
        shr       edi, 15                                       ;114.7
        and       edi, 63                                       ;114.7
        or        edx, DWORD PTR [_des_skb+1280+esi*4]          ;114.7
        mov       esi, eax                                      ;114.7
        shr       esi, 21                                       ;114.7
        shr       eax, 22                                       ;114.7
        and       esi, 15                                       ;114.7
        and       eax, 48                                       ;114.7
        or        esi, eax                                      ;114.7
        or        edx, DWORD PTR [_des_skb+1536+edi*4]          ;114.7
        movzx     edi, cx                                       ;114.7
        shr       ecx, 16                                       ;114.7
        or        edx, DWORD PTR [_des_skb+1792+esi*4]          ;114.7
        mov       eax, edx                                      ;114.7
        and       edx, -65536                                   ;114.7
        shl       eax, 16                                       ;114.7
        or        ecx, edx                                      ;114.7
        mov       esi, DWORD PTR [88+esp]                       ;114.7
        or        eax, edi                                      ;114.7
        mov       edi, DWORD PTR [92+esp]                       ;114.7
        ror       eax, 30                                       ;114.7
        ror       ecx, 26                                       ;114.7
        mov       DWORD PTR [_ks_tbl+112+esi+edi], eax          ;114.7
        mov       DWORD PTR [_ks_tbl+116+esi+edi], ecx          ;114.7
        mov       eax, DWORD PTR [164+esp]                      ;114.7
        cmp       DWORD PTR [12+esp], 0                         ;114.7
        je        .B15.51       ; Prob 50%                      ;114.7
                                ; LOE rax eax ebx al ah xmm0
.B15.50:                        ; Preds .B15.49
        mov       ecx, ebx                                      ;114.7
        mov       edx, eax                                      ;114.7
        shr       ecx, 2                                        ;114.7
        shl       ebx, 26                                       ;114.7
        shr       edx, 2                                        ;114.7
        or        ecx, ebx                                      ;114.7
        shl       eax, 26                                       ;114.7
        or        edx, eax                                      ;114.7
        jmp       .B15.52       ; Prob 100%                     ;114.7
                                ; LOE edx ecx xmm0
.B15.51:                        ; Preds .B15.49
        mov       ecx, ebx                                      ;114.7
        mov       edx, eax                                      ;114.7
        shr       ecx, 1                                        ;114.7
        shl       ebx, 27                                       ;114.7
        shr       edx, 1                                        ;114.7
        or        ecx, ebx                                      ;114.7
        shl       eax, 27                                       ;114.7
        or        edx, eax                                      ;114.7
                                ; LOE edx ecx xmm0
.B15.52:                        ; Preds .B15.50 .B15.51
        mov       esi, ecx                                      ;114.7
        mov       ebx, ecx                                      ;114.7
        shr       esi, 6                                        ;114.7
        mov       eax, ecx                                      ;114.7
        shr       ebx, 7                                        ;114.7
        and       eax, 63                                       ;114.7
        and       esi, 3                                        ;114.7
        and       ebx, 60                                       ;114.7
        or        esi, ebx                                      ;114.7
        mov       ebx, ecx                                      ;114.7
        shr       ebx, 21                                       ;114.7
        mov       edi, DWORD PTR [_des_skb+eax*4]               ;114.7
        mov       eax, ecx                                      ;114.7
        shr       eax, 14                                       ;114.7
        and       ebx, 6                                        ;114.7
        or        edi, DWORD PTR [_des_skb+256+esi*4]           ;114.7
        mov       esi, ecx                                      ;114.7
        shr       esi, 13                                       ;114.7
        and       eax, 48                                       ;114.7
        and       esi, 15                                       ;114.7
        or        esi, eax                                      ;114.7
        mov       eax, edx                                      ;114.7
        shr       eax, 8                                        ;114.7
        and       eax, 60                                       ;114.7
        or        edi, DWORD PTR [_des_skb+512+esi*4]           ;114.7
        mov       esi, ecx                                      ;114.7
        shr       esi, 20                                       ;114.7
        shr       ecx, 22                                       ;114.7
        and       esi, 1                                        ;114.7
        or        esi, ebx                                      ;114.7
        and       ecx, 56                                       ;114.7
        or        esi, ecx                                      ;114.7
        mov       ecx, edx                                      ;114.7
        and       ecx, 63                                       ;114.7
        mov       ebx, edx                                      ;114.7
        shr       ebx, 7                                        ;114.7
        and       ebx, 3                                        ;114.7
        or        edi, DWORD PTR [_des_skb+768+esi*4]           ;114.7
        or        ebx, eax                                      ;114.7
        mov       esi, DWORD PTR [_des_skb+1024+ecx*4]          ;114.7
        mov       eax, edx                                      ;114.7
        mov       ecx, edx                                      ;114.7
        shr       eax, 15                                       ;114.7
        shr       ecx, 21                                       ;114.7
        and       eax, 63                                       ;114.7
        shr       edx, 22                                       ;114.7
        and       ecx, 15                                       ;114.7
        and       edx, 48                                       ;114.7
        or        ecx, edx                                      ;114.7
        or        esi, DWORD PTR [_des_skb+1280+ebx*4]          ;114.7
        or        esi, DWORD PTR [_des_skb+1536+eax*4]          ;114.7
        movzx     edx, di                                       ;114.7
        or        esi, DWORD PTR [_des_skb+1792+ecx*4]          ;114.7
        mov       eax, esi                                      ;114.7
        and       esi, -65536                                   ;114.7
        shl       eax, 16                                       ;114.7
        mov       ecx, DWORD PTR [92+esp]                       ;114.7
        or        eax, edx                                      ;114.7
        mov       edx, DWORD PTR [88+esp]                       ;114.7
        shr       edi, 16                                       ;114.7
        mov       ebx, DWORD PTR [24+esp]                       ;111.5
        or        edi, esi                                      ;114.7
        inc       ebx                                           ;111.5
        ror       eax, 30                                       ;114.7
        ror       edi, 26                                       ;114.7
        mov       DWORD PTR [_ks_tbl+120+edx+ecx], eax          ;114.7
        cmp       ebx, 256                                      ;111.5
        mov       DWORD PTR [_ks_tbl+124+edx+ecx], edi          ;114.7
        mov       DWORD PTR [24+esp], ebx                       ;111.5
        jb        .B15.4        ; Prob 99%                      ;111.5
                                ; LOE xmm0
.B15.53:                        ; Preds .B15.52
        DB        102                                           ;109.3
        DB        144                                           ;109.3
        mov       eax, DWORD PTR [8+esp]                        ;109.3
        inc       eax                                           ;109.3
        mov       DWORD PTR [8+esp], eax                        ;109.3
        cmp       eax, 8                                        ;109.3
        jb        .B15.2        ; Prob 87%                      ;109.3
                                ; LOE xmm0
.B15.54:                        ; Preds .B15.53
        add       esp, 180                                      ;117.1
        pop       ebx                                           ;117.1
        pop       edi                                           ;117.1
        pop       esi                                           ;117.1
        mov       esp, ebp                                      ;117.1
        pop       ebp                                           ;117.1
        ret                                                     ;117.1
        ALIGN     16
                                ; LOE
; mark_end;
_DES_init_keys1 ENDP
;_DES_init_keys1	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _DES_init_keys1
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
shifts2.1460.0.3	DD	0
	DD	0
	DD	1
	DD	1
	DD	1
	DD	1
	DD	1
	DD	1
	DD	0
	DD	1
	DD	1
	DD	1
	DD	1
	DD	1
	DD	1
	DD	0
	PUBLIC _des_SPtrans
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
_2il0floatpacket.10	DD	000000000H,000000000H,000000000H,043f00000H
_2il0floatpacket.251	DD	0fefefefeH,0fefefefeH,0fefefefeH,0fefefefeH
_2il0floatpacket.247	DD	000000001H,000000000H
_2il0floatpacket.8	DD	0447a0000H
_2il0floatpacket.9	DD	049742400H
	PUBLIC _ptext
_ptext	DD	559105867
	DD	623125312
	DB	0
_RDATA	ENDS
;	COMDAT ??_C@_03A@?$CF2x?$AA@
_RDATA	SEGMENT  DWORD PUBLIC FLAT READ  'DATA'
;	COMDAT ??_C@_03A@?$CF2x?$AA@
??_C@_03A@?$CF2x?$AA@	DD	7877157
;??_C@_03A@?$CF2x?$AA@	ENDS
_RDATA	ENDS
;	COMDAT ??_C@_01A@?6?$AA@
_RDATA	SEGMENT  DWORD PUBLIC FLAT READ  'DATA'
;	COMDAT ??_C@_01A@?6?$AA@
??_C@_01A@?6?$AA@	DW	10
;??_C@_01A@?6?$AA@	ENDS
_RDATA	ENDS
;	COMDAT ??_C@_02A@?$CFc?$AA@
_RDATA	SEGMENT  DWORD PUBLIC FLAT READ  'DATA'
;	COMDAT ??_C@_02A@?$CFc?$AA@
??_C@_02A@?$CFc?$AA@	DW	25381
	DB	0
;??_C@_02A@?$CFc?$AA@	ENDS
_RDATA	ENDS
;	COMDAT ??_C@_0BA@A@?6Found?5password?$AA@
_RDATA	SEGMENT  DWORD PUBLIC FLAT READ  'DATA'
;	COMDAT ??_C@_0BA@A@?6Found?5password?$AA@
??_C@_0BA@A@?6Found?5password?$AA@	DD	1970226698
	DD	1881171054
	DD	2004054881
	DD	6582895
;??_C@_0BA@A@?6Found?5password?$AA@	ENDS
_RDATA	ENDS
;	COMDAT ??_C@_0CO@A@?6?5?5Usage?3?5?$CFs?5?$DMhash?$DO?5?$DMstart?$DO?5?$DMend?$DO?5?$DMalphabet?$DO?6?$AA@
_RDATA	SEGMENT  DWORD PUBLIC FLAT READ  'DATA'
;	COMDAT ??_C@_0CO@A@?6?5?5Usage?3?5?$CFs?5?$DMhash?$DO?5?$DMstart?$DO?5?$DMend?$DO?5?$DMalphabet?$DO?6?$AA@
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
;??_C@_0CO@A@?6?5?5Usage?3?5?$CFs?5?$DMhash?$DO?5?$DMstart?$DO?5?$DMend?$DO?5?$DMalphabet?$DO?6?$AA@	ENDS
_RDATA	ENDS
;	COMDAT ??_C@_0BF@A@?6?5?5Invalid?5hash?5?$DN?5?$CFs?$AA@
_RDATA	SEGMENT  DWORD PUBLIC FLAT READ  'DATA'
;	COMDAT ??_C@_0BF@A@?6?5?5Invalid?5hash?5?$DN?5?$CFs?$AA@
??_C@_0BF@A@?6?5?5Invalid?5hash?5?$DN?5?$CFs?$AA@	DD	1226842122
	DD	1818326638
	DD	1746953321
	DD	543716193
	DD	1931812925
	DB	0
;??_C@_0BF@A@?6?5?5Invalid?5hash?5?$DN?5?$CFs?$AA@	ENDS
_RDATA	ENDS
;	COMDAT ??_C@_0BM@A@?6?5Completed?3?5?$CFlld?5?$CF?42fM?5k?1s?$AA@
_RDATA	SEGMENT  DWORD PUBLIC FLAT READ  'DATA'
;	COMDAT ??_C@_0BM@A@?6?5Completed?3?5?$CFlld?5?$CF?42fM?5k?1s?$AA@
??_C@_0BM@A@?6?5Completed?3?5?$CFlld?5?$CF?42fM?5k?1s?$AA@	DD	1866670090
	DD	1701605485
	DD	979658100
	DD	1819026720
	DD	774185060
	DD	541943346
	DD	7548779
;??_C@_0BM@A@?6?5Completed?3?5?$CFlld?5?$CF?42fM?5k?1s?$AA@	ENDS
_RDATA	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
	COMM _start_pw:BYTE:256
	COMM _end_pw:BYTE:256
	COMM _alphabet:BYTE:256
	COMM _alpha_len:BYTE:4
	COMM _start_cbn:BYTE:8
	COMM _end_cbn:BYTE:8
	COMM _total_cbn:BYTE:8
	COMM _completed:BYTE:8
	COMM _hash:BYTE:32
	COMM _ks:BYTE:1024
	COMM _ks_tbl:BYTE:262144
_DATA	ENDS
EXTRN	_putchar:PROC
EXTRN	_clock:PROC
EXTRN	_isxdigit:PROC
EXTRN	_exit:PROC
EXTRN	_sscanf:PROC
EXTRN	_printf:PROC
EXTRN	___intel_new_feature_proc_init:PROC
EXTRN	___intel_sse2_strchr:PROC
EXTRN	___intel_sse2_strlen:PROC
EXTRN	___intel_sse2_strncpy:PROC
EXTRN	__allmul:PROC
EXTRN	__fltused:BYTE
	INCLUDELIB <libmmt>
	INCLUDELIB <LIBCMT>
	INCLUDELIB <libirc>
	INCLUDELIB <svml_dispmt>
	INCLUDELIB <OLDNAMES>
	INCLUDELIB <libdecimal>
	END
