; For MAC OS-X maintain 16-byte alignment on all calls
    bits 64
    global main
    extern printf

main:
    ; function setup
    push    RBP
    mov     RBP, RSP
    sub     RSP, 32

    mov     EAX, primRead   ; priming read is an int = 1
    mov     EDX, sentinel   ; sentinel for test is int = 0
    
loop:
    cmp     EAX, EDX        ; compare priming read to sentinel
                            ; to see if they are equal
                            ; run loop while test condition false
    je      exit_script     ; if test condition true, exit program

    lea     RDI, [rel message1]
    mov     al, 0
    call    printf

    lea     RDI, [rel message2]
    mov     al, 0
    call printf

exit_script:
    ; function return
    mov     EAX, 0
    add     RSP, 32
    pop     RBP

    ret

    section.data
    primRead    db  1
    sentinel    db  0
    message1    db "And a One", 10, 0
    message2    db "And a Two", 10, 0
