
; code originally by WiteG

.686
.model flat,C

option casemap:none
option prologue:none
option epilogue:none

.code

public rc4_crypt

rc4_crypt:
	mov [esp-4],ebp
	mov [esp-8],esi
	mov [esp-12],edi
	mov [esp-16],ebx
	
	lea ebp,[esp-256*4 + 20]
	mov ecx,256/4
	mov eax,0FFFEFDFCh
set_kbox:
    mov dword ptr[ebp+4*ecx-4],eax
    sub eax,04040404h
    dec ecx
    jnz set_kbox

	xor	eax, eax
	mov	edi, dword ptr [esp+4]		;ptrPass

@setKey:
	xor	ebx, ebx
	mov	esi, dword ptr [esp+4+4]	; key length
	jmp	@new_key

@@:
	inc	ebx
	dec	esi
	jz	@setKey

@new_key:
	mov	edx, [ebp+4*ecx]
	add	eax, [edi+4*ebx]
	add	eax, edx
	mov	ebx, [ebp+4*eax]
	mov	[ebp+4*ecx], edx
	mov [ebp+4*eax], edx
	inc	cl
	jnz	@B

	mov	edi, dword ptr [esp+4+4+4+4]		;lData
	mov	esi, dword ptr [esp+4+4+4]		;ptrData

	xor	eax, eax
	xor	ebx, ebx
	xor	ecx, ecx
	xor	edx, edx

encrypt:
    inc ebx
    mov edx,[ebp+4*ebx]
    add eax,edx
	mov ecx,[ebp+4*eax]
	mov	[ebp+4*ebx], ecx
	mov	[ebp+4*eax], edx
	add	ecx, edx
	mov	ecx, [ebp+4*ecx]          
	xor	byte ptr [esi], cl				; xor by ciphertext
	inc	esi								; source data
	dec edi								; decrease length
	jnz	encrypt
	
@rc4_enc_exit:
	mov ebp,[esp-4]
	mov esi,[esp-8]
	mov edi,[esp-12]
	mov ebx,[esp-16]
	ret

        end