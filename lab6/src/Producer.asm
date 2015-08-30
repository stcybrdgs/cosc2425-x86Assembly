;=====================================================================
;   Producer.asm
;
;   Author: Stacy Bridges
;   Course: COSC 2425
;   Date:   12/13/2014
;=====================================================================
%include "/usr/local/include/asm_io.inc"
            global      asm_main

   
DayMask     equ     0000000000011111b
MonthMask   equ     0000000111100000b
YearMask    equ     1111111000000000b
    
    
segment     .data
CR		equ     0Dh
LF      	equ     0ah

   
            segment .bss
Day	resw	1
Month   resw    1
Year    resw    1

Hour	resw	1
Minute	resw	1        


segment     .text
        global  asm_main
    

asm_main:

	mov	rcx, 10			; set counter equal to number of
					;     records in intermediate file

print_loop:
	cmp	rcx, 0			; see if loop is done iterating
	je	end_program		;     if so, end program

	push	rcx			; preserve counter
		
	; -----	print month -----
	;
	call	read_int		; read date from intermediate file
	mov     bx, ax    		
        ;
        mov     ax, bx
        and     ax, MonthMask
        ror     ax, 5                   
        mov     [Month], ax
        ;
        xor     rax, rax                
        xor     rdi, rdi
        mov     ax, [Month]
        mov     rdi, rax
        call    print_int
	call	print_nl


	; -----	print day -----
        ;
	mov     ax, bx
        and     ax, DayMask             
        mov     [Day],ax
        ;
        mov     ax, [Day]
        mov     rdi, rax
        call    print_int
	call	print_nl

	; -----	print year -----
        ;
        mov	ax, bx
        and     ax, YearMask
        rol     ax, 7                   
        add     ax, 1900
        mov     [Year],ax               
        ;           
        mov     ax, [Year]
        mov     rdi, rax
 	call    print_int
        call    print_nl  


	; -----	print hour -----
	call	read_int		; read time from intermediate file
	push	rax

	mov	rbx, 60
	mov	rdx, 0
	div	rbx
	push	rdx
	mov	rdi, rax
	call	print_int
        call    print_nl  

	; -----	print minutes
	pop	rdx
        mov     rdi, rdx
 	call    print_int
	call	print_nl


	; -----	print heat code
	call	read_int		; read heat code from intermediate file
        mov     rdi, rax
 	call    print_int
	call	print_nl


	; -----	print cool code
	call	read_int		; read cool code from intermediate file
        mov     rdi, rax
 	call    print_int
	call	print_nl


	; ----- decrement counter and re-loop
	pop	rcx			; restore counter
	dec	rcx
	jmp	print_loop


        ; ----- end program
end_program:
        mov     eax, 0            	; return back to C
        leave                     
        ret
