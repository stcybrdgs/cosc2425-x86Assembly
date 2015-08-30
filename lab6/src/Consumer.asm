;=====================================================================
;   Consumer.asm
;
;   Author: Stacy Bridges
;   Course: COSC 2425
;   Date:   12/13/2014
;=====================================================================
%include "/usr/local/include/asm_io.inc"


segment .data
spacer		db	"  ", 0
slash		db	"/", 0
colon		db	":", 0
heat_msg:	db	"Heat: ", 0
cool_msg:	db	"Cool: ", 0 


segment .bss


segment .text
        global  asm_main


asm_main:
	mov	rcx, 10			; set counter equal to number of
					;     records in intermediate file

	enter   0, 0			; setup routine


print_loop:
	cmp	rcx, 0			; see if loop is done iterating
	je	end_program		;     if so, end program	

	push	rcx			; preserve counter

	; ----- print month
        call    read_int	
        mov     rdi, rax
        call    print_int
	
	mov	rdi, slash
	call	print_string

	; ----- print day
        call    read_int	
        mov     rdi, rax
        call    print_int
	
	mov	rdi, slash
	call	print_string


	; -----	print year
        call    read_int
        mov     rdi, rax
        call    print_int

	mov	rdi, spacer
	call	print_string


	; -----	print hour
        call    read_int
        mov     rdi, rax
        call    print_int

	mov	rdi, colon
	call	print_string	


	; -----	print minutes
        call    read_int
        mov     rdi, rax
        call    print_int

	mov	rdi, spacer
	call	print_string


	; -----	print heat code
	mov	rdi, heat_msg
	call	print_string
        
	call    read_int
        mov     rdi, rax
        call    print_int
	
	mov	rdi, spacer
	call	print_string


	; -----	print cool code
	mov	rdi, cool_msg
	call	print_string

        call    read_int
        mov     rdi, rax
        call    print_int
	call	print_nl


	; ----- decrement counter and re-loop
	pop	rcx			; restore counter	
	dec	rcx
	jmp	print_loop


        ; end program --------------------------------------
end_program:       
	mov     eax, 0            	; return back to C
        leave                     
        ret
