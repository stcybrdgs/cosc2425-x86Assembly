; For MAC OS-X maintain 16 byte alingnment on all calls
	bits 64
	global main
	extern printf

	section.text

main:
	; function setup
	push	RBP			; set up the stack frame
	mov	RBP, RSP		; point to the stack
	sub	RSP, 32			; compute pointer (RSP = RSP - 16)
	
	; load and print message
	lea 	RDI, [rel message]
	mov	al, 0           
	call	printf
	
	; function return
	mov	EAX, 0
	add	RSP, 32
	pop 	RBP

	ret				; return

	section.data
message db "Hello, World!", 10, 0
