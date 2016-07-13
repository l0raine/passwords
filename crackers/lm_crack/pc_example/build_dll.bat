@set path=%PATH%;C:\mkit\bin;C:\dev-cpp\bin
ml /coff /Cp /c /IC:\mkit\include pc_set_key.asm
gcc -c -O2 -fomit-frame-pointer des.c

polink /subsystem:windows /dll /def:pc_set_key.def /libpath:C:\mkit\lib pc_set_key.obj des.o
pause
del *.lib *.exp *.o *.obj