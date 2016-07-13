@echo off
@set path=%PATH%;C:\mkit\bin
@ml /coff /Cp /c DES_KEY.asm
@ml /coff /Cp /c mschap.asm
@polink /DEF:mschap.def /SUBSYSTEM:WINDOWS /DLL mschap.obj DES_KEY.obj
@del *.obj mschap.exp mschap.lib
rem @upx mschap.dll
@haxor /cpp mschap.dll mschap.hpp
@pause
@move /Y mschap.hpp ..\..\
@move /Y mschap.dll ..\
