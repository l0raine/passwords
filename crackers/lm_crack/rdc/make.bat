@echo off
set PATH=F:\mkit\Bin;%PATH%;F:\JWASM\bin
ml.exe /nologo /coff /Cp /c /IF:\JWASM\INCLUDE rdc.asm
ml.exe /nologo /coff /Cp /c des.asm
polink.exe /nologo /SUBSYSTEM:console /LIBPATH:F:\JWASM\lib rdc.obj des.obj
del rdc.obj des.obj
move rdc.exe ..\
pause
