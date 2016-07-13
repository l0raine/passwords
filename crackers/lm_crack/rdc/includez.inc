;
; i'm using latest headers from japheths win32inc files - http://www.japheth.de/
; you'll also need version of microsoft assembler which supports SSE2
; this can be found in Visual C++ 6 Processor Pack

include <windows.inc>

include <stdio.inc>
include <stdlib.inc>

includelib <kernel32.lib>
includelib <msvcrt.lib>

extern pow :proc

__getmainargs proto C :DWORD, :DWORD, :DWORD, :DWORD, :DWORD

CStr macro szText:VARARG
  local szName
.data
szName db szText, 0
.code
    exitm <offset szName>
endm

str_to_key PROTO C :DWORD,:DWORD
des_set_key PROTO C :DWORD, :DWORD

IsValidHash PROTO :DWORD
StoreAsciiHash PROTO :DWORD,:DWORD,:DWORD,:DWORD
usage PROTO :DWORD
des_ip PROTO :DWORD
display_password proto :dword
display_time_elapsed proto
get_current_password proto :dword

main proto :dword, :dword

hash struct
   dwa    dd   ?
   dwb    dd   ?
hash ends

; using MMX speeds things up too, majority have CPU that supports em
; insert a semi-colon before it to only use 32-bit code or XMM.
;USE_MMX  equ   1

; i leave the choice of using XMM with you to play with, as i had problems aligning the data
; segment properly & fecked up the code, so its initially left out.

USE_XMM   equ  1

;##################################################################

include <data.inc>
include <des_macros.inc>
include <util.inc>
include <routines.inc>
include <setup.inc>
include <stats.inc>

include <core1.inc>
include <core2.inc>