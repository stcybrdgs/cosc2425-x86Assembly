; config.inc - pin assignments for AvrTask project

;.include    "/tools/lib/atmega32u4.def"
.include     "/usr/local/include/atmega32u4.def"

.equ        STACK_START     , RAMEND
.equ        STACK_SIZE      , 64
.equ        STACK_END       , STACK_START - STACK_SIZE

.equ        LED_PORT,   PORTD
.equ        LED_DIR,    DDRD
.equ        LED_PIN,    6

.equ        BUZZ_PORT,  PORTB
.equ        BUZZ_DIR,   DDRB
.equ        BUZZ_PIN1,  4
.equ        BUZZ_PIN2,  2

.equ        PULSE_PORT, PORTD
.equ        PULSE_DIR,  DDRD
.equ        PULSE_PIN,  7