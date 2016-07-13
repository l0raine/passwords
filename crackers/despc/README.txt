
                
                        Crack LM
                        --------
[ intro

  This is just a proof of concept where you can significantly improve
  attacks on DES derived hashes like Lanman by precomputing key
  schedules.

  I wrote a tool around 2005 but never updated it. The original was 
  written in x86 assembly due to poor support for SSE2 at the time.

  Now, compilers are decent at generating SSE2 code and this is probably
  better than what could be written in assembly. It's just as fast as
  SAMInside but obviously not many people will be interested in this kind
  of attack now with GPU crackers like hashcat.
  

[ usage

  [ clm - crack lanman hash

  [ usage: clm [options] <hash>

       -a <index>     can be combination of 3
                      0=numeric
                      1=uppercase alpha
                      2=symbols

       -c <alphabet>  custom alphabet to use
       -s <start>     start password
       -e <end>       end password


C:\gh\despc>clm4 -c0123456789ABCDEF 13D855FC4841C7B1

  [ clm - crack lanman hash

  [ starting on : Thu Nov 19 07:21:51 2015
  [ start pwd   : "0"
  [ end pwd     : "FFFFFFF"
  [ alphabet    : "0123456789ABCDEF"
  [ total pwd   : 286331152

  [ processed 17821131 keys out of 286331152 at 4.46M k/s : 6% complete. ETA: 0 days 00 hours 00 minutes 60 seconds
  [ password    : "ABCDEF"

  [ ending on   : Thu Nov 19 07:21:55 2015
  
[ compiling

  * Visual Studio
  
    cl /O2 /GS- /Zp16 /DSSE2 clm4.c set_key.c
  
  * Intel
    
    icl /O3 /fast /DSSE2 /Zp16 clm4.c set_key.c
    
  * GNU C (no SSE2 support)
    
    gcc -O3 -fomit-frame-pointer clm4.c set_key.c
    
    
Odzhan
November 2015