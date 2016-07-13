.code
    align 16

; *****************************************************************************
;
; display usage of program
;
; *****************************************************************************
usage PROC private argv:DWORD
   mov   eax,[argv]

   invoke printf,addr usage_text,
         dword ptr[eax],
         dword ptr[eax]
   ret
usage ENDP

; *****************************************************************************
; 
; performs the DES initial permutation on d_hash
;
; *****************************************************************************
des_ip PROC private USES esi edi ebx d_hash:DWORD
   mov   edi,[d_hash]	       ; hash after ip
   mov   esi,[d_hash]        ; hash before ip

   lodsd                       ; load first part of hash
   xchg   eax,ebx
   lodsd		       ; load second..
   xchg   eax,ebx

   perm_op   eax,edx,ebx,04,0f0f0f0f0h
   perm_op   ebx,eax,edx,20,0fff0000fh
   perm_op   eax,ebx,edx,14,033333333h
   perm_op   edx,eax,ebx,22,003fc03fch
   perm_op   eax,edx,ebx,09,0aaaaaaaah

   rol   ebx,1

   mov   eax,edx   ; save part a
   stosd
   mov   eax,ebx   ; save part b
   stosd
   ret
des_ip ENDP

; *****************************************************************************
; 
; sets the plaintext password based on current indexes
; this is for resuming a previous session, or starting crack at specific position
; note that charlen_power and loop_count should also be set from previous values.
;
; returns dst_buffer in eax
;
; if you know of better way to do this, let me know.
;
; *****************************************************************************
set_current_password proc private uses esi edi ebx ecx edx dst_buffer:DWORD

   mov   eax,[charlen_power]      ; get last count of passwords tried
   sub   eax,[loop_count]
   cdq
   mov   ecx,[charset_len]
   div   ecx

   mov   [key_index_one],edx
   mov   [key_index_two],eax

   mov   ebx,[charset]           ; pointer to character set
   lea   esi,[index_pointers]
   mov   ecx,7
   mov   edi,[dst_buffer]        ; where to store password

   load_ptr:
      lodsd
      test eax,eax
      js   return_pass
      xlatb
      stosb
      loop load_ptr
   return_pass:
      mov   eax,[dst_buffer]
      ret
set_current_password ENDP
; *****************************************************************************
; 
; gets the plaintext password based on current indexes
;
; returns dst_buffer in eax
;
; if you know of better way to do this, let me know.
;
; *****************************************************************************
get_current_password proc private uses esi edi ebx ecx edx dst_buffer:DWORD

   mov   eax,[charlen_power]      ; get last count of passwords tried
   sub   eax,[loop_count]
   cdq
   mov   ecx,[charset_len]
   div   ecx

   mov   [key_index_one],edx
   mov   [key_index_two],eax

   mov   ebx,[charset]           ; pointer to character set
   lea   esi,[index_pointers]
   mov   ecx,7
   mov   edi,[dst_buffer]        ; where to store password

   load_ptr:
      lodsd
      test eax,eax
      js   return_pass
      xlatb
      stosb
      loop load_ptr
   return_pass:
      mov   eax,[dst_buffer]
      ret
get_current_password ENDP
; *****************************************************************************
;
;  CTRL+C routine to display current password + iterations per second.
;  if CTRL+C is pressed more than once in less than a second, the program terminates
;
;
;  OMG, this is worst fucking code i have ever seen
;  please somebody optimise this..or just re-write the whole useless shit!
;
; *****************************************************************************
.data
align 16

szInfo          db      10,10
                db      10,09,"Total Iterations     :%0.f"
                db      10,09,"Iterations computed  :%0.f"
                db      10,09,"=====================     "
                db      10,09,"Iterations left      :%0.f"
                db      10,09
                db      10,09,"Current Password     :%s"
                db      10,10,09,09,"*** Estimated Time Remaining ***",10
		db	10,09,"?:Day(s) ?:Hour(s) %0.f:Minute(s) %0.f:Second(s) at %0.f k/s",10,00h
.code
align 16
HandlerRoutine proc private uses ebx esi edi dwCtrlType:DWORD
   
    LOCAL   current_password   [16]   :BYTE
    local   stop_time                 :dword
    local   left           :QWORD
    local   seconds                   :DWORD
    local   minutes                   :DWORD
    local   current_total             :QWORD
    local   iterations_per_second     :QWORD
    local   iterations_left           :QWORD
    local   divisor                   :DWORD

    invoke GetTickCount
    mov [stop_time],eax
    sub eax,[g_start_time]
    mov [seconds],eax
    mov [divisor],1000
    mov [minutes],59

    lea edi,[current_password]
    mov ecx,16/4
    xor eax,eax
    rep stosd
get_pass:
    invoke get_current_password,addr current_password

    ; get iterations per second

    fild  qword ptr [g_iterations_completed]
    fidiv dword ptr [seconds]
    fimul dword ptr [divisor]               ; get iterations per second
    fst qword ptr [iterations_per_second]   ; save them for later

    fild qword ptr [g_iterations_completed]
    fld  qword ptr [g_total_iterations]
    fsub st(0),st(1)                       ; get number of iterations left
    fst qword ptr [iterations_left]        ; save for later

    fdiv st(0),st(2)                       ; get number of seconds left
    fst  qword ptr [left]                  ; store total seconds left
    fild dword ptr [minutes]
    fxch
    fprem                                  ; get remaining seconds
    
    ;int 3

    sub esp,7*8
    fld qword ptr [iterations_per_second]
    fstp qword ptr [esp+6*8]                ; store k/s

    fst qword ptr [esp+5*8]                 ; store remaining seconds

    fld qword ptr [left]                    ; reload total remaining seconds
    fsub st(0),st(1)                        ; subtract seconds from total seconds
    fxch
    fstp st(0)                              ; pop fpu stack
    fdiv st(0),st(1)                        ; get remaining minutes
    fstp qword ptr [esp+4*8]                ; store remaining minutes
    fstp st(0)                              ; pop fpu stack

    lea eax,[current_password]
    mov dword ptr [esp+3*8+4],eax

    fld qword ptr [iterations_left]
    fstp qword ptr [esp+2*8+4]
    
    fild qword ptr [g_iterations_completed]
    fstp qword ptr [esp+1*8+4]
    
    fld qword ptr [g_total_iterations]
    fstp qword ptr [esp+0*8+4]

    lea eax,[szInfo]
    mov dword ptr [esp],eax
    call printf
    add esp,(7*8)

    mov   eax,[stop_time]
    mov   ebx,eax
    sub   eax,[g_last_time]
    mov   [g_last_time],ebx

    .if eax < 1000
       mov   eax,FALSE
    .else
       mov   eax,TRUE
    .endif
    ret
HandlerRoutine ENDP