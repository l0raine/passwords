
; memory used for attack

.686
.model flat, c

include des.inc

public ks_tbl
public ks12

.data?

align 16
ks1 des_ks 256 dup (<>)
align 16
ks2 des_ks 256 dup (<>)
align 16
ks3 des_ks 256 dup (<>)
align 16
ks4 des_ks 256 dup (<>)
align 16
ks5 des_ks 256 dup (<>)
align 16
ks6 des_ks 256 dup (<>)
align 16
ks7 des_ks 256 dup (<>)
align 16
ks8 des_ks 256 dup (<>)

.data

ks_tbl dd offset ks1
       dd offset ks2
       dd offset ks3
       dd offset ks4
       dd offset ks5
       dd offset ks6
       dd offset ks7
       
  end