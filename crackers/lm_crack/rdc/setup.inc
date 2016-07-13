.data?
align 16
big_buffer db 128*255*7 dup (?)

.code
align 16
;
; setup the memory required for core2 and key schedules
;
; this should be re-written properly at some stage, confusing even for me that wrote it..
;
setup_cmd_args PROC USES esi edi ebx cmd_argv:DWORD,pt_hash:DWORD,ct_hash:DWORD

   LOCAL   password[8]         :BYTE
   LOCAL   des_key[8]          :BYTE
   LOCAL   des_schedule[128]   :BYTE
   LOCAL   temp_mem            :DWORD
   LOCAL   ptct_info[2]        :DWORD

   lea   edi,[ptct_info]
   mov   eax,[ct_hash]
   stosd
   mov  eax,[pt_hash]
   stosd

   mov   ebx,[cmd_argv]
   ;int 3
   invoke strlen,dword ptr[ebx+12]  ; get length of character set
   mov    [charset_len],eax

   ; calculate power of 2
   pushad
   mul eax
   mov [charlen_power],eax        ; 676 for 26*26
   shl eax,7               ; * 128 for 2 ^ charlen memory size
   invoke _aligned_malloc, eax, 32
   mov [two_mem],eax       ; save pointer
   popad

   do_char_alloc:
   invoke _aligned_malloc, eax, 32
   mov    [charset],eax
                                       ; save in memory
   invoke strncpy,dword ptr[charset],dword ptr[ebx+12],dword ptr[charset_len]

   add   ebx,4                         ; skip module name
   lea   edi,[ptct_info]
   xor   esi,esi                       ; get ciphertext + plaintext bits

   .while (esi < 2)
      invoke strlen,dword ptr[ebx+4*esi]
      .if eax == DES_BLOCK_LEN
         invoke StoreAsciiHash,dword ptr[ebx+4*esi],dword ptr[edi+4*esi],DES_BLOCK_LEN,1
         .if eax != TRUE
            invoke printf,CStr(<10,'Invalid hash:<%s>.'>),dword ptr[ebx+4*esi]
            xor    eax,eax
            .break
         .else
            invoke des_ip,dword ptr[edi+4*esi]
            push   TRUE
            pop    eax
         .endif
      .else
         invoke printf,CStr(<10,'Invalid block length:<%s> = %d bytes instead of 16'>),dword ptr[ebx+4*esi],eax
         xor    eax,eax
         .break
      .endif
      inc   esi
   .endw

   .if eax == TRUE

      mov   eax,[charset_len]
      shl   eax,7          ; * 128 (sizeof (des_schedule))
      imul  eax,eax,7      ; 7 indexes
      
      invoke _aligned_malloc, eax, 32          ; allocate memory for key schedules
      
      .if eax != NULL
         mov   [ks_mem],eax
         mov   [temp_mem],eax

         xor   ebx,ebx              ; init index to buffer

         .while ebx < 7             ; create 7 key schedules for each character
            xor   ecx,ecx

            mov   eax,[temp_mem]
            mov   dword ptr[ks_pointers+4*ebx],eax    ; save pointer to mem

            .while ecx < [charset_len]
              push  ecx
              mov   esi,[charset]

              lea   edi,[password]      ; password buffer
              xor   eax,eax
              mov   edx,edi
              stosd
              stosd

              lea   edi,[des_key]
              stosd
              stosd

              mov   al,byte ptr[esi+ecx]  ; get character
              mov   byte ptr[edx+ebx],al  ; store in buffer at index

              invoke str_to_key,edx,addr des_key          ; create des key

              invoke des_set_key,addr des_key,dword ptr[temp_mem]   ; create the schedule in memory

              add   dword ptr[temp_mem],128                       ; advance 128 bytes
              pop   ecx
              inc   ecx                                           ; increase index to character set
           .endw
           inc  ebx
        .endw
           invoke calc_total_iterations,1,7,[charset_len]
           invoke SetConsoleCtrlHandler,addr HandlerRoutine,TRUE        ; install CTRL+C handler
      .endif
   .endif
   ret
setup_cmd_args ENDP