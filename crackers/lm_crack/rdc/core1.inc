;
; this routine checks all 1 and 2 byte combinations only
; additionally, in creation of 2 byte passwords, the key schedules are saved in memory, for use later in crack_lm_core2()
;
; using this way gives a slight boost compared to just checking all in one routine..but not that much.
;
crack_des_core1 proc private uses esi edi ebx ebp
    
    local pass[8]     :byte
    local key[8]      :byte
    local ks_index    :dword

    xor esi,esi
    and [ks_index],esi

    invoke memset,addr pass,esi,8
    invoke memset,addr key,esi,8

    invoke GetTickCount
    mov [g_start_time],eax        ; save starting time for this crack

    .repeat
           xor esi,esi                      ; reset index to character string for length 1
           mov [key_index_one],esi
        .repeat
            mov esi,[key_index_one]

            mov ebx,[charset]
            mov al, byte ptr [esi+ebx]              ; get a byte from character string using esi as index
            mov byte ptr [pass+0],al                ; save in password buffer at index zero

            invoke str_to_key,addr pass,addr key                  ; create a key
            invoke des_set_key,addr key,addr key_sx_three         ; create the 16 subkeys

            add dword ptr [g_iterations_completed],1

            mov   esi, dword ptr[plaintext][hash.dwa]  ; known plaintext already initially permutated to save some cycles
            mov   edi, dword ptr[plaintext][hash.dwb]

            des_ff   esi,edi,00*04,FALSE
            des_ff   edi,esi,02*04,FALSE
            des_ff   esi,edi,04*04,FALSE
            des_ff   edi,esi,06*04,FALSE

            des_ff   esi,edi,08*04,FALSE
            des_ff   edi,esi,10*04,FALSE
            des_ff   esi,edi,12*04,FALSE
            des_ff   edi,esi,14*04,FALSE

            des_ff   esi,edi,16*04,FALSE
            des_ff   edi,esi,18*04,FALSE
            des_ff   esi,edi,20*04,FALSE
            des_ff   edi,esi,22*04,FALSE

            des_ff   esi,edi,24*04,FALSE
            des_ff   edi,esi,26*04,FALSE
            des_ff   esi,edi,28*04,FALSE

            .if edi == dword ptr[des_hash][hash.dwa]

                des_ff   edi,esi,30*04,FALSE                  ; do last round

                .if esi == dword ptr[des_hash][hash.dwb]

                    invoke GetTickCount                             ; found match, get time
                    mov [g_stop_time],eax
                    mov [bFound],TRUE                         ; indicate found
                    lea esi,[pass]
                    lea edi,[g_password]
                    movsw               ; shouldn't be anymore than 2 bytes
                    .break                                    ; end loop
                .endif
            .endif

            .if ([key_index_two] != 0)         ; on 2 byte passwords?
                pushad
                lea esi,[key_sx_three]           ; save key schedule in memory for later
                mov edi,[two_mem]              ; charset_len ^ 2 * 128
                add edi,[ks_index]
                mov ecx,128/4
                rep movsd
                add [ks_index],128               ; advance index 128 bytes
                popad
            .endif

            mov eax,[charset_len]
            inc dword ptr [key_index_one]      ; increase index
        .until ([key_index_one] == eax)        ; keep going until esi equal to character string length

        inc dword ptr [key_index_two]
        mov eax,[key_index_two]
        mov ebx,[charset]

        mov dl,byte ptr[ebx+eax-1]       ; get character
        mov byte ptr [pass+1],dl         ; save as second character

    .until (dword ptr [bFound] || eax > [charset_len])         ; continue until found or when processed charset_len ^ 2

    ret
crack_des_core1 endp