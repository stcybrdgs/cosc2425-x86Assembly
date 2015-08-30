.include "/usr/local/include/atmega328p.def"

.section .text

initialize:
ldi	r16, 0x80	; 128
ldi	r17, 0x00	; 0
sts	0x0061, r16
sts	0x0061, r17
cbi	0x05, 4	; 5
rcall	timer_init	;.+10     	; 0x1c <timer_init>

main_loop:
sbi	PORTB, 4	;0x05, 4	; 5
cbi	PORTB, 6
rcall	timer_delay	;.+20     	; 0x2a <timer_delay>
cbi	0x05, 4	; 5

rjmp	main_loop	;.-10     	; 0x12 <main_loop+0x2>

timer_init:
ldi	r16, 0x03	; 3
ldi	r16, 0x01	; 1
out	0x15, r16	; 21
ldi	r16, 0x01	; 1
out	0x26, r16	; 38
ret

timer_delay:
in	r16, 0x15	; 21

