
.code
     align 16
crack_des_core2 proc private uses esi edi ebx ebp

    movd mm3,[charlen_power]       ; me thought that using MMX might speed things up, didn't appear to, but not timed properly
    movd mm4,[two_mem]
    movd mm5,esp            ; free up esp to use as loop counter
    movd mm6,[charset_len]

    invoke GetTickCount
    mov [g_start_time],eax

    jmp   do_three
do_seven:
    move_ks  key_index_seven,key_sx_index_seven, FALSE,        key_sx_seven,FALSE
do_six:
    move_ks  key_index_six,  key_sx_index_six,   key_sx_seven, key_sx_six,  TRUE
do_five:
    move_ks  key_index_five, key_sx_index_five,  key_sx_six,   key_sx_five, TRUE
do_four:
    move_ks  key_index_four, key_sx_index_four,  key_sx_five,  key_sx_four, TRUE
do_three:
    move_ks  key_index_three,key_sx_index_three, key_sx_four,  key_sx_three,TRUE

    mov eax,[charlen_power]
    mov ebp,[two_mem]
    mov [loop_count],eax
    ;movd ebp,mm4
    ;movd esp,mm3

des_loop:
    mov   esi, dword ptr[plaintext][hash.dwa]  ; known plaintext already initially permutated to save time.
    mov   edi, dword ptr[plaintext][hash.dwb]

    des_ff   esi,edi,00*04,TRUE
    des_ff   edi,esi,02*04,TRUE
    des_ff   esi,edi,04*04,TRUE
    des_ff   edi,esi,06*04,TRUE

    des_ff   esi,edi,08*04,TRUE
    des_ff   edi,esi,10*04,TRUE
    des_ff   esi,edi,12*04,TRUE
    des_ff   edi,esi,14*04,TRUE

    des_ff   esi,edi,16*04,TRUE
    des_ff   edi,esi,18*04,TRUE
    des_ff   esi,edi,20*04,TRUE
    des_ff   edi,esi,22*04,TRUE

    des_ff   esi,edi,24*04,TRUE
    des_ff   edi,esi,26*04,TRUE
    des_ff   esi,edi,28*04,TRUE

    cmp   edi,dword ptr[des_hash][hash.dwa]
    jne   continue_on

    des_ff   edi,esi,30*04,TRUE                  ; do last round

    cmp   esi,dword ptr[des_hash][hash.dwb]
    jne   continue_on

    ;movd esp,mm5
    invoke GetTickCount
    mov [g_stop_time],eax
    mov [bFound],TRUE
    invoke get_current_password,addr g_password
    jmp end_core2

continue_on:
    ;sub esp,1
    sub dword ptr [loop_count],1
    lea ebp,[ebp+128]                   ; advance a key schedule forward
    jne des_loop

    ;movd ebx,mm3 ;[charset_len]
    ;movd eax,mm6 ;[charlen_power]

    mov ebx,[charlen_power]
    mov eax,[charset_len]

    add   dword ptr[g_iterations_completed+0],ebx
    adc   dword ptr[g_iterations_completed+4],0

    update_and_test key_index_three, do_three

    update_and_test key_index_four,  do_four

    update_and_test key_index_five,  do_five

    update_and_test key_index_six,   do_six

    update_and_test key_index_seven, do_seven

    ;movd esp,mm5
    invoke GetTickCount
    mov [g_stop_time],eax

end_core2:
    ret
crack_des_core2 endp