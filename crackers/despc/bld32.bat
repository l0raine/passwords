@echo off
cl /nologo /DSSE2 /O2 /GS- clm5.c set_key.c
del *.obj