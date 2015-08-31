; For MAC OS-X maintain 16 byte alignment on all calls
    bits 64
    global main
    extern printf

main:
    ; function setup
   	push    RBP                     ; set up the stack frame
	mov     RBP, RSP                ; point to the stack
	sub     RSP, 32                 ; compute pointer

	mov	EAX, intA
	mov     EDX, intB
	cmp 	EAX, EDX
	jl	    ifFalse

ifTrue:
	lea     RDI,[rel boolagb]       ; load true message
	mov     al, 0                   ; print true message
        call    printf
        jmp     exit_script

ifFalse:    
	lea     RDI, [rel boolalb]      ; load false message
	mov     al, 0                   ; print false message
	call    printf

exit_script:
    ; function return
        mov EAX, 0
   	add RSP, 32
   	pop RBP                         ; return
    
    ret                     
    
    section.data
    intA    db  5
    intB    db  10
    boolagb db  "true", 10, 0
    boolalb db  "false", 10, 0
