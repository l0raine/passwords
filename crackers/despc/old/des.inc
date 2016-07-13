

ifndef DES_H
DES_H equ <>

des_ks struct
  x db 128 dup (?)
des_ks ends

attack_t struct
  alpha     db 256 dup (?)
  alpha_len dd ?
  sqrlen    dd ?
  
  plain     db 16 dup (?)
  pt        db 16 dup (?)
  cipher    db 16 dup (?)
  ct        db 16 dup (?)
  
  iter      dq ?   ; iterations completed for attack
  pwd_found dd ?
  
  pwd       db 16 dup (?)
  pwd_idx   dd 16 dup (?)
  pwd_start dd 16 dup (?)   ; current password as indexes
  pwd_end   dd 16 dup (?)
  
  ks_sqr    dd ?           ; memory for sqr_len key schedules
attack_t ends

endif