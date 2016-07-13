
.686
.xmm
.model flat,C

           A_CONSTANT equ 067452301h
           B_CONSTANT equ 0EFCDAB89h
           C_CONSTANT equ 098BADCFEh
           D_CONSTANT equ 010325476h

; ++++++++++++++++++++++++++++++++++++

ff         macro dwa,dwb,dwc,dwd,x,s,t

           mov edi,dwc
           mov ebp,[esi+4*x]
        
           xor edi,dwd
           and edi,dwb

           lea dwa,[dwa+ebp+t]
           xor edi,dwd

           add dwa,edi
           rol dwa,s

           add dwa,dwb
endm

; ++++++++++++++++++++++++++++++++++++

gg         macro dwa,dwb,dwc,dwd,x,s,t

           mov edi,dwc
           mov ebp,[esi+4*x]
        
           xor edi,dwb
           and edi,dwd
           
           lea dwa,[dwa+ebp+t]
           xor edi,dwc

           add dwa,edi
           rol dwa,s

           add dwa,dwb
endm

; ++++++++++++++++++++++++++++++++++++

hh         macro dwa,dwb,dwc,dwd,x,s,t

           mov edi,dwc
           mov ebp,[esi+4*x]
        
           xor edi,dwd
           xor edi,dwb

           lea dwa,[dwa+ebp+t]
           add dwa,edi

           rol dwa,s
           add dwa,dwb
endm

; ++++++++++++++++++++++++++++++++++++

ii         macro dwa,dwb,dwc,dwd,x,s,t

           mov edi,-1
           mov ebp,[esi+4*x]

           xor edi,dwd
           or edi,dwb

           lea dwa,[dwa+ebp+t]
           xor edi,dwc

           add dwa,edi
           rol dwa,s

           add dwa,dwb
endm

_esi textequ <esp-4>
_ebx textequ <esp-8>
_edi textequ <esp-12>
_ebp textequ <esp-16>

i_pad equ 16+128
o_pad equ i_pad+128
ctx   equ o_pad+16

input_text equ esp+4
input_len  equ esp+8
key		   equ esp+12
key_len	   equ esp+16
digest	   equ esp+20

rep_stosd macro
		local store_data
store_data:
		mov [edi],eax
		add edi,4
		dec ecx
		jnz store_data
endm

rep_movsb macro
		local store_data
store_data:
		mov al,byte ptr[esi]
		inc esi
		
		mov byte ptr[edi],al
		inc edi
		
		dec ecx
		jnz store_data
endm

.code

             public hmac_md5

hmac_md5:               ;int 3

			mov [_esi],esi
			mov [_ebp],ebp
			mov [_ebx],ebx
			mov [_edi],edi
			
			xor eax,eax
			
			mov	ecx,128/4
			lea edi,[esp-i_pad]
			rep_stosd
			
			mov ecx,128/4
			lea edi,[esp-o_pad]
			rep_stosd
			
			mov eax,36363636h
			mov	ecx,64/4
			lea edi,[esp-i_pad]
			rep_stosd
			
			mov eax,5c5c5c5ch
			mov ecx,64/4
			lea edi,[esp-o_pad]
			rep_stosd

			mov byte ptr [edi+16],80h
			mov dword ptr[edi+56], 80*8
			
			mov ebx,[key]
			lea esi,[esp-i_pad]
			lea edi,[esp-o_pad]
			xor ecx,ecx
			
xor_key:
			mov al,byte ptr [ebx+ecx]
			xor byte ptr [esi+ecx],al
			xor byte ptr [edi+ecx],al
			inc ecx
			cmp ecx,[key_len]
			jne xor_key
store_text:
			lea edi,[esp-i_pad+64]
			mov ecx,[input_len]
			lea edx,[ecx*8+(64*8)]
			mov dword ptr[edi+56],edx         ; number of bits
                        mov esi,[input_text]
			rep_movsb
                        mov byte ptr [edi],80h            ; end bit
                        


                        lea esi,[esp-i_pad]
             ; #######################################

             mov   eax,A_CONSTANT                         ; process the key mixed with 0x36 first
             mov   ebx,B_CONSTANT
             mov   ecx,C_CONSTANT
             mov   edx,D_CONSTANT
  
             ; =======================================
  
             ff   eax, ebx, ecx, edx, 00, 07, 0d76aa478h
             ff   edx, eax, ebx, ecx, 01, 12, 0e8c7b756h
             ff   ecx, edx, eax, ebx, 02, 17, 0242070dbh
             ff   ebx, ecx, edx, eax, 03, 22, 0c1bdceeeh
  
             ff   eax, ebx, ecx, edx, 04, 07, 0f57c0fafh
             ff   edx, eax, ebx, ecx, 05, 12, 04787c62ah
             ff   ecx, edx, eax, ebx, 06, 17, 0a8304613h
             ff   ebx, ecx, edx, eax, 07, 22, 0fd469501h

             ff   eax, ebx, ecx, edx, 08, 07, 0698098d8h
             ff   edx, eax, ebx, ecx, 09, 12, 08b44f7afh
             ff   ecx, edx, eax, ebx, 10, 17, 0ffff5bb1h
             ff   ebx, ecx, edx, eax, 11, 22, 0895cd7beh
  
             ff   eax, ebx, ecx, edx, 12, 07, 06b901122h
             ff   edx, eax, ebx, ecx, 13, 12, 0fd987193h
             ff   ecx, edx, eax, ebx, 14, 17, 0a679438eh
             ff   ebx, ecx, edx, eax, 15, 22, 049b40821h

             ; =======================================
          
             gg   eax, ebx, ecx, edx, 01, 05, 0f61e2562h
             gg   edx, eax, ebx, ecx, 06, 09, 0c040b340h
             gg   ecx, edx, eax, ebx, 11, 14, 0265e5a51h
             gg   ebx, ecx, edx, eax, 00, 20, 0e9b6c7aah
  
             gg   eax, ebx, ecx, edx, 05, 05, 0d62f105dh
             gg   edx, eax, ebx, ecx, 10, 09, 002441453h
             gg   ecx, edx, eax, ebx, 15, 14, 0d8a1e681h
             gg   ebx, ecx, edx, eax, 04, 20, 0e7d3fbc8h
  
             gg   eax, ebx, ecx, edx, 09, 05, 021e1cde6h
             gg   edx, eax, ebx, ecx, 14, 09, 0c33707d6h
             gg   ecx, edx, eax, ebx, 03, 14, 0f4d50d87h
             gg   ebx, ecx, edx, eax, 08, 20, 0455a14edh

             gg   eax, ebx, ecx, edx, 13, 05, 0a9e3e905h
             gg   edx, eax, ebx, ecx, 02, 09, 0fcefa3f8h
             gg   ecx, edx, eax, ebx, 07, 14, 0676f02d9h
             gg   ebx, ecx, edx, eax, 12, 20, 08d2a4c8ah
  
             ; =======================================
  
             hh   eax, ebx, ecx, edx, 05, 04, 0fffa3942h
             hh   edx, eax, ebx, ecx, 08, 11, 08771f681h
             hh   ecx, edx, eax, ebx, 11, 16, 06d9d6122h
             hh   ebx, ecx, edx, eax, 14, 23, 0fde5380ch
  
             hh   eax, ebx, ecx, edx, 01, 04, 0a4beea44h
             hh   edx, eax, ebx, ecx, 04, 11, 04bdecfa9h
             hh   ecx, edx, eax, ebx, 07, 16, 0f6bb4b60h
             hh   ebx, ecx, edx, eax, 10, 23, 0bebfbc70h
  
             hh   eax, ebx, ecx, edx, 13, 04, 0289b7ec6h
             hh   edx, eax, ebx, ecx, 00, 11, 0eaa127fah
             hh   ecx, edx, eax, ebx, 03, 16, 0d4ef3085h
             hh   ebx, ecx, edx, eax, 06, 23, 004881d05h
          
             hh   eax, ebx, ecx, edx, 09, 04, 0d9d4d039h
             hh   edx, eax, ebx, ecx, 12, 11, 0e6db99e5h
             hh   ecx, edx, eax, ebx, 15, 16, 01fa27cf8h
             hh   ebx, ecx, edx, eax, 02, 23, 0c4ac5665h
          
             ; =======================================
          
             ii   eax, ebx, ecx, edx, 00, 06, 0f4292244h
             ii   edx, eax, ebx, ecx, 07, 10, 0432aff97h
             ii   ecx, edx, eax, ebx, 14, 15, 0ab9423a7h
             ii   ebx, ecx, edx, eax, 05, 21, 0fc93a039h
          
             ii   eax, ebx, ecx, edx, 12, 06, 0655b59c3h
             ii   edx, eax, ebx, ecx, 03, 10, 08f0ccc92h
             ii   ecx, edx, eax, ebx, 10, 15, 0ffeff47dh
             ii   ebx, ecx, edx, eax, 01, 21, 085845dd1h
          
             ii   eax, ebx, ecx, edx, 08, 06, 06fa87e4fh
             ii   edx, eax, ebx, ecx, 15, 10, 0fe2ce6e0h
             ii   ecx, edx, eax, ebx, 06, 15, 0a3014314h
             ii   ebx, ecx, edx, eax, 13, 21, 04e0811a1h
          
             ii   eax, ebx, ecx, edx, 04, 06, 0f7537e82h
             ii   edx, eax, ebx, ecx, 11, 10, 0bd3af235h
             ii   ecx, edx, eax, ebx, 02, 15, 02ad7d2bbh
             ii   ebx, ecx, edx, eax, 09, 21, 0eb86d391h
          
             add   eax,A_CONSTANT
             add   ebx,B_CONSTANT
             add   ecx,C_CONSTANT
             add   edx,D_CONSTANT
          
             lea   edi,[esp-ctx]
             mov   dword ptr[edi+0],eax        ; save context
             mov   dword ptr[edi+4],ebx
             mov   dword ptr[edi+8],ecx
             mov   dword ptr[edi+12],edx
          
             ; #######################################
             
             add   esi,64                                 ; do text input
          
             ; =======================================
  
             ff   eax, ebx, ecx, edx, 00, 07, 0d76aa478h
             ff   edx, eax, ebx, ecx, 01, 12, 0e8c7b756h
             ff   ecx, edx, eax, ebx, 02, 17, 0242070dbh
             ff   ebx, ecx, edx, eax, 03, 22, 0c1bdceeeh
  
             ff   eax, ebx, ecx, edx, 04, 07, 0f57c0fafh
             ff   edx, eax, ebx, ecx, 05, 12, 04787c62ah
             ff   ecx, edx, eax, ebx, 06, 17, 0a8304613h
             ff   ebx, ecx, edx, eax, 07, 22, 0fd469501h
  
             ff   eax, ebx, ecx, edx, 08, 07, 0698098d8h
             ff   edx, eax, ebx, ecx, 09, 12, 08b44f7afh
             ff   ecx, edx, eax, ebx, 10, 17, 0ffff5bb1h
             ff   ebx, ecx, edx, eax, 11, 22, 0895cd7beh
  
             ff   eax, ebx, ecx, edx, 12, 07, 06b901122h
             ff   edx, eax, ebx, ecx, 13, 12, 0fd987193h
             ff   ecx, edx, eax, ebx, 14, 17, 0a679438eh
             ff   ebx, ecx, edx, eax, 15, 22, 049b40821h

             ; =======================================
          
             gg   eax, ebx, ecx, edx, 01, 05, 0f61e2562h
             gg   edx, eax, ebx, ecx, 06, 09, 0c040b340h
             gg   ecx, edx, eax, ebx, 11, 14, 0265e5a51h
             gg   ebx, ecx, edx, eax, 00, 20, 0e9b6c7aah
  
             gg   eax, ebx, ecx, edx, 05, 05, 0d62f105dh
             gg   edx, eax, ebx, ecx, 10, 09, 002441453h
             gg   ecx, edx, eax, ebx, 15, 14, 0d8a1e681h
             gg   ebx, ecx, edx, eax, 04, 20, 0e7d3fbc8h
  
             gg   eax, ebx, ecx, edx, 09, 05, 021e1cde6h
             gg   edx, eax, ebx, ecx, 14, 09, 0c33707d6h
             gg   ecx, edx, eax, ebx, 03, 14, 0f4d50d87h
             gg   ebx, ecx, edx, eax, 08, 20, 0455a14edh
  
             gg   eax, ebx, ecx, edx, 13, 05, 0a9e3e905h
             gg   edx, eax, ebx, ecx, 02, 09, 0fcefa3f8h
             gg   ecx, edx, eax, ebx, 07, 14, 0676f02d9h
             gg   ebx, ecx, edx, eax, 12, 20, 08d2a4c8ah
  
             ; =======================================

             hh   eax, ebx, ecx, edx, 05, 04, 0fffa3942h
             hh   edx, eax, ebx, ecx, 08, 11, 08771f681h
             hh   ecx, edx, eax, ebx, 11, 16, 06d9d6122h
             hh   ebx, ecx, edx, eax, 14, 23, 0fde5380ch
  
             hh   eax, ebx, ecx, edx, 01, 04, 0a4beea44h
             hh   edx, eax, ebx, ecx, 04, 11, 04bdecfa9h
             hh   ecx, edx, eax, ebx, 07, 16, 0f6bb4b60h
             hh   ebx, ecx, edx, eax, 10, 23, 0bebfbc70h
  
             hh   eax, ebx, ecx, edx, 13, 04, 0289b7ec6h
             hh   edx, eax, ebx, ecx, 00, 11, 0eaa127fah
             hh   ecx, edx, eax, ebx, 03, 16, 0d4ef3085h
             hh   ebx, ecx, edx, eax, 06, 23, 004881d05h
          
             hh   eax, ebx, ecx, edx, 09, 04, 0d9d4d039h
             hh   edx, eax, ebx, ecx, 12, 11, 0e6db99e5h
             hh   ecx, edx, eax, ebx, 15, 16, 01fa27cf8h
             hh   ebx, ecx, edx, eax, 02, 23, 0c4ac5665h
          
             ; =======================================
          
             ii   eax, ebx, ecx, edx, 00, 06, 0f4292244h
             ii   edx, eax, ebx, ecx, 07, 10, 0432aff97h
             ii   ecx, edx, eax, ebx, 14, 15, 0ab9423a7h
             ii   ebx, ecx, edx, eax, 05, 21, 0fc93a039h

             ii   eax, ebx, ecx, edx, 12, 06, 0655b59c3h
             ii   edx, eax, ebx, ecx, 03, 10, 08f0ccc92h
             ii   ecx, edx, eax, ebx, 10, 15, 0ffeff47dh
             ii   ebx, ecx, edx, eax, 01, 21, 085845dd1h
          
             ii   eax, ebx, ecx, edx, 08, 06, 06fa87e4fh
             ii   edx, eax, ebx, ecx, 15, 10, 0fe2ce6e0h
             ii   ecx, edx, eax, ebx, 06, 15, 0a3014314h
             ii   ebx, ecx, edx, eax, 13, 21, 04e0811a1h
          
             ii   eax, ebx, ecx, edx, 04, 06, 0f7537e82h
             ii   edx, eax, ebx, ecx, 11, 10, 0bd3af235h
             ii   ecx, edx, eax, ebx, 02, 15, 02ad7d2bbh
             ii   ebx, ecx, edx, eax, 09, 21, 0eb86d391h

			 lea   edi,[esp-ctx]
             lea   ebp,[esp-o_pad+64]
             
             add   eax,dword ptr[edi+0]
             add   ebx,dword ptr[edi+4]
             add   ecx,dword ptr[edi+8]
             add   edx,dword ptr[edi+12]
          
             mov   dword ptr [ebp],eax                 ; save hash of text+key
             mov   dword ptr [ebp+4],ebx
             mov   dword ptr [ebp+8],ecx
             mov   dword ptr [ebp+12],edx

             ; #######################################
             ; #######################################
             
             lea esi,[esp-o_pad]

             ; #######################################
             ; #######################################

             mov   eax,A_CONSTANT
             mov   ebx,B_CONSTANT
             mov   ecx,C_CONSTANT
             mov   edx,D_CONSTANT

             ; =======================================
  
             ff   eax, ebx, ecx, edx, 00, 07, 0d76aa478h
             ff   edx, eax, ebx, ecx, 01, 12, 0e8c7b756h
             ff   ecx, edx, eax, ebx, 02, 17, 0242070dbh
             ff   ebx, ecx, edx, eax, 03, 22, 0c1bdceeeh
  
             ff   eax, ebx, ecx, edx, 04, 07, 0f57c0fafh
             ff   edx, eax, ebx, ecx, 05, 12, 04787c62ah
             ff   ecx, edx, eax, ebx, 06, 17, 0a8304613h
             ff   ebx, ecx, edx, eax, 07, 22, 0fd469501h
  
             ff   eax, ebx, ecx, edx, 08, 07, 0698098d8h
             ff   edx, eax, ebx, ecx, 09, 12, 08b44f7afh
             ff   ecx, edx, eax, ebx, 10, 17, 0ffff5bb1h
             ff   ebx, ecx, edx, eax, 11, 22, 0895cd7beh
  
             ff   eax, ebx, ecx, edx, 12, 07, 06b901122h
             ff   edx, eax, ebx, ecx, 13, 12, 0fd987193h
             ff   ecx, edx, eax, ebx, 14, 17, 0a679438eh
             ff   ebx, ecx, edx, eax, 15, 22, 049b40821h
          
             ; =======================================
          
             gg   eax, ebx, ecx, edx, 01, 05, 0f61e2562h
             gg   edx, eax, ebx, ecx, 06, 09, 0c040b340h
             gg   ecx, edx, eax, ebx, 11, 14, 0265e5a51h
             gg   ebx, ecx, edx, eax, 00, 20, 0e9b6c7aah
  
             gg   eax, ebx, ecx, edx, 05, 05, 0d62f105dh
             gg   edx, eax, ebx, ecx, 10, 09, 002441453h
             gg   ecx, edx, eax, ebx, 15, 14, 0d8a1e681h
             gg   ebx, ecx, edx, eax, 04, 20, 0e7d3fbc8h
  
             gg   eax, ebx, ecx, edx, 09, 05, 021e1cde6h
             gg   edx, eax, ebx, ecx, 14, 09, 0c33707d6h
             gg   ecx, edx, eax, ebx, 03, 14, 0f4d50d87h
             gg   ebx, ecx, edx, eax, 08, 20, 0455a14edh
  
             gg   eax, ebx, ecx, edx, 13, 05, 0a9e3e905h
             gg   edx, eax, ebx, ecx, 02, 09, 0fcefa3f8h
             gg   ecx, edx, eax, ebx, 07, 14, 0676f02d9h
             gg   ebx, ecx, edx, eax, 12, 20, 08d2a4c8ah
  
             ; =======================================
  
             hh   eax, ebx, ecx, edx, 05, 04, 0fffa3942h
             hh   edx, eax, ebx, ecx, 08, 11, 08771f681h
             hh   ecx, edx, eax, ebx, 11, 16, 06d9d6122h
             hh   ebx, ecx, edx, eax, 14, 23, 0fde5380ch
  
             hh   eax, ebx, ecx, edx, 01, 04, 0a4beea44h
             hh   edx, eax, ebx, ecx, 04, 11, 04bdecfa9h
             hh   ecx, edx, eax, ebx, 07, 16, 0f6bb4b60h
             hh   ebx, ecx, edx, eax, 10, 23, 0bebfbc70h
  
             hh   eax, ebx, ecx, edx, 13, 04, 0289b7ec6h
             hh   edx, eax, ebx, ecx, 00, 11, 0eaa127fah
             hh   ecx, edx, eax, ebx, 03, 16, 0d4ef3085h
             hh   ebx, ecx, edx, eax, 06, 23, 004881d05h
          
             hh   eax, ebx, ecx, edx, 09, 04, 0d9d4d039h
             hh   edx, eax, ebx, ecx, 12, 11, 0e6db99e5h
             hh   ecx, edx, eax, ebx, 15, 16, 01fa27cf8h
             hh   ebx, ecx, edx, eax, 02, 23, 0c4ac5665h
          
             ; =======================================
          
             ii   eax, ebx, ecx, edx, 00, 06, 0f4292244h
             ii   edx, eax, ebx, ecx, 07, 10, 0432aff97h
             ii   ecx, edx, eax, ebx, 14, 15, 0ab9423a7h
             ii   ebx, ecx, edx, eax, 05, 21, 0fc93a039h
          
             ii   eax, ebx, ecx, edx, 12, 06, 0655b59c3h
             ii   edx, eax, ebx, ecx, 03, 10, 08f0ccc92h
             ii   ecx, edx, eax, ebx, 10, 15, 0ffeff47dh
             ii   ebx, ecx, edx, eax, 01, 21, 085845dd1h

             ii   eax, ebx, ecx, edx, 08, 06, 06fa87e4fh
             ii   edx, eax, ebx, ecx, 15, 10, 0fe2ce6e0h
             ii   ecx, edx, eax, ebx, 06, 15, 0a3014314h
             ii   ebx, ecx, edx, eax, 13, 21, 04e0811a1h
          
             ii   eax, ebx, ecx, edx, 04, 06, 0f7537e82h
             ii   edx, eax, ebx, ecx, 11, 10, 0bd3af235h
             ii   ecx, edx, eax, ebx, 02, 15, 02ad7d2bbh
             ii   ebx, ecx, edx, eax, 09, 21, 0eb86d391h
          
             add   eax,A_CONSTANT
             add   ebx,B_CONSTANT
             add   ecx,C_CONSTANT
             add   edx,D_CONSTANT
          
             lea edi,[esp-ctx]
             
             mov   dword ptr[edi+0],eax        ; save context
             mov   dword ptr[edi+4],ebx
             mov   dword ptr[edi+8],ecx
             mov   dword ptr[edi+12],edx
          
             ; #######################################
             
             add esi,64

             ; =======================================
  
             ff   eax, ebx, ecx, edx, 00, 07, 0d76aa478h
             ff   edx, eax, ebx, ecx, 01, 12, 0e8c7b756h
             ff   ecx, edx, eax, ebx, 02, 17, 0242070dbh
             ff   ebx, ecx, edx, eax, 03, 22, 0c1bdceeeh
  
             ff   eax, ebx, ecx, edx, 04, 07, 0f57c0fafh
             ff   edx, eax, ebx, ecx, 05, 12, 04787c62ah
             ff   ecx, edx, eax, ebx, 06, 17, 0a8304613h
             ff   ebx, ecx, edx, eax, 07, 22, 0fd469501h
  
             ff   eax, ebx, ecx, edx, 08, 07, 0698098d8h
             ff   edx, eax, ebx, ecx, 09, 12, 08b44f7afh
             ff   ecx, edx, eax, ebx, 10, 17, 0ffff5bb1h
             ff   ebx, ecx, edx, eax, 11, 22, 0895cd7beh
  
             ff   eax, ebx, ecx, edx, 12, 07, 06b901122h
             ff   edx, eax, ebx, ecx, 13, 12, 0fd987193h
             ff   ecx, edx, eax, ebx, 14, 17, 0a679438eh
             ff   ebx, ecx, edx, eax, 15, 22, 049b40821h
          
             ; =======================================

             gg   eax, ebx, ecx, edx, 01, 05, 0f61e2562h
             gg   edx, eax, ebx, ecx, 06, 09, 0c040b340h
             gg   ecx, edx, eax, ebx, 11, 14, 0265e5a51h
             gg   ebx, ecx, edx, eax, 00, 20, 0e9b6c7aah
  
             gg   eax, ebx, ecx, edx, 05, 05, 0d62f105dh
             gg   edx, eax, ebx, ecx, 10, 09, 002441453h
             gg   ecx, edx, eax, ebx, 15, 14, 0d8a1e681h
             gg   ebx, ecx, edx, eax, 04, 20, 0e7d3fbc8h
  
             gg   eax, ebx, ecx, edx, 09, 05, 021e1cde6h
             gg   edx, eax, ebx, ecx, 14, 09, 0c33707d6h
             gg   ecx, edx, eax, ebx, 03, 14, 0f4d50d87h
             gg   ebx, ecx, edx, eax, 08, 20, 0455a14edh
  
             gg   eax, ebx, ecx, edx, 13, 05, 0a9e3e905h
             gg   edx, eax, ebx, ecx, 02, 09, 0fcefa3f8h
             gg   ecx, edx, eax, ebx, 07, 14, 0676f02d9h
             gg   ebx, ecx, edx, eax, 12, 20, 08d2a4c8ah
  
             ; =======================================
  
             hh   eax, ebx, ecx, edx, 05, 04, 0fffa3942h
             hh   edx, eax, ebx, ecx, 08, 11, 08771f681h
             hh   ecx, edx, eax, ebx, 11, 16, 06d9d6122h
             hh   ebx, ecx, edx, eax, 14, 23, 0fde5380ch
  
             hh   eax, ebx, ecx, edx, 01, 04, 0a4beea44h
             hh   edx, eax, ebx, ecx, 04, 11, 04bdecfa9h
             hh   ecx, edx, eax, ebx, 07, 16, 0f6bb4b60h
             hh   ebx, ecx, edx, eax, 10, 23, 0bebfbc70h
  
             hh   eax, ebx, ecx, edx, 13, 04, 0289b7ec6h
             hh   edx, eax, ebx, ecx, 00, 11, 0eaa127fah
             hh   ecx, edx, eax, ebx, 03, 16, 0d4ef3085h
             hh   ebx, ecx, edx, eax, 06, 23, 004881d05h

             hh   eax, ebx, ecx, edx, 09, 04, 0d9d4d039h
             hh   edx, eax, ebx, ecx, 12, 11, 0e6db99e5h
             hh   ecx, edx, eax, ebx, 15, 16, 01fa27cf8h
             hh   ebx, ecx, edx, eax, 02, 23, 0c4ac5665h

             ; =======================================
          
             ii   eax, ebx, ecx, edx, 00, 06, 0f4292244h
             ii   edx, eax, ebx, ecx, 07, 10, 0432aff97h
             ii   ecx, edx, eax, ebx, 14, 15, 0ab9423a7h
             ii   ebx, ecx, edx, eax, 05, 21, 0fc93a039h
          
             ii   eax, ebx, ecx, edx, 12, 06, 0655b59c3h
             ii   edx, eax, ebx, ecx, 03, 10, 08f0ccc92h
             ii   ecx, edx, eax, ebx, 10, 15, 0ffeff47dh
             ii   ebx, ecx, edx, eax, 01, 21, 085845dd1h
          
             ii   eax, ebx, ecx, edx, 08, 06, 06fa87e4fh
             ii   edx, eax, ebx, ecx, 15, 10, 0fe2ce6e0h
             ii   ecx, edx, eax, ebx, 06, 15, 0a3014314h
             ii   ebx, ecx, edx, eax, 13, 21, 04e0811a1h
          
             ii   eax, ebx, ecx, edx, 04, 06, 0f7537e82h
             ii   edx, eax, ebx, ecx, 11, 10, 0bd3af235h
             ii   ecx, edx, eax, ebx, 02, 15, 02ad7d2bbh
             ii   ebx, ecx, edx, eax, 09, 21, 0eb86d391h
          
             lea   edi,[esp-ctx]
             add   eax,dword ptr[edi+0]
             add   ebx,dword ptr[edi+4]
             add   ecx,dword ptr[edi+8]
             add   edx,dword ptr[edi+12]
          
             mov   edi,[digest]
             
             mov   [edi],eax
             mov   [edi+4],ebx
             mov   [edi+8],ecx
             mov   [edi+12],edx

			mov esi,[_esi]
			mov ebp,[_ebp]
			mov ebx,[_ebx]
			mov edi,[_edi]
			
             ret

             end