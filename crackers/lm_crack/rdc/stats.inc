
; *****************************************************************************
;
; display time elapsed since beginning of crack
; assumes g_start_time already initialized by time(0)
;
; *****************************************************************************
get_time_elapsed proc private uses esi edi ebx

    local seconds    :dword
    local minutes    :dword
    local hours      :dword

    xor    eax,eax
    and    [seconds],eax
    and    [minutes],eax
    and    [hours],eax

    mov    eax,[g_stop_time]
    sub    eax,[g_start_time]
    mov ecx,1000
    cdq
    div ecx

    mov    [seconds],eax

    .if eax
        xchg  eax,ecx
        mov   eax,dword ptr[g_iterations_completed+0]
        mov   edx,dword ptr[g_iterations_completed+4]

        div   ecx                                 ; get iterations per second
        mov   dword ptr[g_iterations_completed+0],eax

        mov   eax,[seconds]

        .if eax >= 60
            mov   ecx,60
            cdq
            div   ecx
            mov   [seconds],edx
            mov   [minutes],eax

            .if eax >= 60
                cdq
                div   ecx
                mov   [minutes],edx
                mov   [hours],eax
            .endif
        .endif
    .endif

    invoke printf,
           CStr(<10,"%d hours %d minutes %d seconds elapsed. Average k/s:%d",10,10>),
           dword ptr[hours],
           dword ptr[minutes],
           dword ptr[seconds],
           dword ptr[g_iterations_completed+0]
    ret
get_time_elapsed endp