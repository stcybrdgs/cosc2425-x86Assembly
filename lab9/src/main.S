; main.S - avr-gcc assembly language

.include    "config.inc"

	.extern     Timer1_Init
	.extern     Timer1_ISR
	.extern     trigger
	.extern     Task1_Init
	.extern     Task1
	.extern     Task2_init
	.extern     Task2
	.extern     Task3_Init
	.extern     Task3

	.section    .text
	.global     Start

	.org        0x00
Start:  
	jmp     Reset

	.org    OC1Aaddr*2
	jmp     Timer1_ISR

Reset:
	; set up r1 with a zero
	eor     r1, r1
	out     SREG, r1        ; clear flag register

	; set up system stack
	ldi     r28, (RAMEND & 0x00ff)
	ldi     r29, (RAMEND >> 8)
	out     SPH, r29
	out     SPL, r28

	; set up system clock
	ldi     r16, 0x80       ; set up prescalar
	ldi	    r17, 0x03
	sts     CLKPR, r16
	sts     CLKPR, r17       ; divide by 8

	call    Timer1_Init
	call	Task3_Init
	call	Task2_init
	call    Task1_Init

1:
	lds     r16, trigger
	cpi     r16, 1          ; interrupt gone off yet?
	brne    1b              ; wait for it
	call	Task1
	call    Task2
	call	Task3
	sts     trigger, 1      ; turn off trigger
	rjmp    1b
