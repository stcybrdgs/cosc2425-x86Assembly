; For MAC OS-X maintain 16 byte alingnment on all calls
	bits 64
	global main
	extern printf

main:
	; function setup
	push	rbp		; set up the stack frame
	mov	rbp, rsp	; point to the stack
	sub	rsp, 32		; compute pointer (RSP = RSP - 16)
	
	; load and print messages
	lea 	rdi, [rel message1]
	mov	al, 0           ; remove contents of floating-point registers
	call	printf
	
	lea	rdi, [rel message2]
	mov	al, 0
	call 	printf

	lea	rdi, [rel message3]
	mov	al, 0
	call 	printf

	; print literal value 12345
	mov	rax, 12345		
	mov 	rdi, fmt	; put %d code in rdi for printing integer
	mov	rsi, rax	; load integer from rax into rsi as string
	push 	rax		; push 12345 onto stack so that 
				; printf won't wipe it out
	mov	al, 0
	call 	printf
	
	pop 	rbx		; take 12345 off stack and put it in rbx

	inc	rbx		; increment value in rbx
	inc	rbx		; increment value in rbx
	mov	rax, rbx	; put the incremented value back in rax

	mov 	rdi, fmt	; put %d code in rdi for printing integer
	mov 	rsi, rax	; load integer from rax into rsi as string
	mov 	al, 0
	call 	printf

	; function return
	mov	rax, 0
	add	rsp, 32
	pop 	rbp

	ret			; return

	section.data
message1 	db "Lab 4 - Modified hello program", 10, 0
message2 	db "COSC2425 - Pentium assembly language", 10, 0
message3	db "Processed with Nasm and GNU gcc", 10, 0
fmt		db "%d", 10, 0
