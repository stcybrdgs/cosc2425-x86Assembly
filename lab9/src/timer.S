; timer.S - Timer1 setup and interrupt routines

.include "config.inc"

        .global     Timer1_Init
        .global     Timer1_ISR
        .global     trigger

.equ    COUNT,      250				; counts per trigger

        .section    .data

trigger:
        .byte       0

        .section    .text
;---------------------------------------------------------------
; Initialize Timer1 for interrupts

Timer1_Init:
        ldi     r16, TCCR1B
        ori     r16, (1<<WGM12);|(1<<CS11)      ; divide by 8
        sts     TCCR1B, r16                     ; set timer clock
        ldi     r16, (COUNT & 0xff)             ; set compare count
        sts     OCR1AL, r16
        ldi     r16, (COUNT >> 8)
        sts     OCR1AH, r16                     ; 16 bit compare
        lds     r16, TIMSK1                     ; get interrupt mask reg
        ori     r16, (1<<OCIE1A)                ; enable interrupt
        sts     TIMSK1, r16                     ; write it back
        sei                                     ; interrupts are on, let the fun begin
        ret

Timer1_ISR:
        ; save callers registers
        push    r16
        push    r0
        in      r0, SREG            ; get flags
        push    r0
        ;
        ldi     r16, 1
        sts     trigger, r16
        ;
        pop     r0
        out     SREG, r0            ; recover flags
        pop     r0
        pop     r16
        reti