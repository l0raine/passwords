@echo off
cl /nologo /O2 /DSSE2 /GS- clm4.c set_key.c
del *.obj