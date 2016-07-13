comment ~

        This program is capable of cracking DES ciphertext, given a custom character set, which is considerably
        fast for an x86 MMX enabled CPU without using bitslice code.

        only str_to_key() and des_set_key() are called during testing of 1-2 byte length passwords.
        rather than call these 2 routines everytime a new password string is created(which is slow)
        the key schedules are pre-calculated at setup time, based on a character at an index up to 7 in length,
        and stored in memory.
        
        Then during computation of all possible ciphertexts based on given character set, the key schedules 
        are bit-OR'd and XOR'd against each other to generate new ones.

        this allows faster attack, but obviously not as fast as Biham bitslice :-)
        
        20/03/07 - made few minor changes, code is slower than before..fucked if i know why :-(
                 - possibly alignment..issue,don't know for sure.

        19/10/06 - long time passed, no update til now.speed increased by average of 10%
                 - this is acheived by pre-attack of 1-2 byte password combinations.
                 - 2 ^ strlen(characters) * des_key_schedule are stored in memory
                 - these key schedules are XOR'd in the main F round for all combinations of 1 - 7 in length

        03/03/06 - fixed problem with key schedule setup (thanks to solar@openwall.com) for pointing this out.
        02/03/06 - added CTRL+C routine
        01/03/06 - added XMM/MMX code,unrolled loops.

        15/06/05 - created
        *************************************************************************
        Usage:dcrack <CIPHERTEXT> <PLAINTEXT> <CHARSET>

        parameters must be in right order!

        Example for finding NT LM HASH:

        dcrack DCF9CAA6DBC2F2DF 4B47532140232425 ABCDEFGHIJKLM

        Should display "AAAA"
        **************************************************************************
        
        if you reading this happen to find any errors, make corrections or improvements, 
        let me know please.
~
.686
.xmm
.model flat,stdcall

WIN32_LEAN_AND_MEAN equ 1

_aligned_malloc proto C :dword, :dword

include <includez.inc>

start proc
    local stinfo    :STARTUPINFO
    local bWildCard :dword
    local pEnv      :dword
    local pArgv     :dword
    local nArgc     :dword

    mov   bWildCard,FALSE
    invoke __getmainargs,addr nArgc,addr pArgv,addr pEnv,[bWildCard],addr stinfo
    invoke main,nArgc,pArgv
    invoke exit,0
start endp

main proc private uses esi ebx edi argc:dword, argv:dword

   local current_total :qword
   local seconds:dword
   local stop_time :Dword
   local iterations_left :qword
   local iterations_per_second :qword

   .if [argc] == 4
      invoke setup_cmd_args,[argv],addr plaintext,addr des_hash
      .if eax == TRUE
         call crack_des_core1

         .if [bFound] == FALSE
             call crack_des_core2
         .endif

         .if [bFound] == TRUE
             invoke printf,CStr(<10,"Found password:%s">),addr g_password
         .else
             invoke printf,CStr(<10,"Password not found">)
         .endif
         
         invoke get_time_elapsed

         invoke free,[charset]
         invoke free,[ks_mem]
      .else
         invoke printf,CStr(<10,'setup failed.'>)
      .endif
   .else
      invoke usage,dword ptr[argv]
   .endif
   ret
main endp

end start