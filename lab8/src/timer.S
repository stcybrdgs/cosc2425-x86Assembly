.include "/usr/local/include/atmega328p.def"

.equ    PRESET      ,   128

        .section    .text

        .global     timer_delay
        .global     timer_init

timer_init:
        ldi     r16, (1 << CS01) | (1<<CS00)    ; divide by 64
        out     TCCR0B, r16                     ; set timer clock 
        ldi     r16, 1 << TOV0                  ; clear interrupt flag
        out     TIFR0, r16
        ldi     r16, PRESET                     ; initial value for timer
        out     TCNT0, r16
        ret

timer_delay:
        in      r16, TIFR0                      ; check the flag 
        sbrs    r16, TOV0                       ; skip if overflow set
        rjmp    timer_delay                     ; wait for it
        ldi     r16, 1 << TOV0                  ; clear the interrupt flag
        out     TIFR0, r16                      ; clear the interrupt flag
        ldi     r16, PRESET                     ; reload the counter
        out     TCNT0, r16                      ; set preset in
        ret       