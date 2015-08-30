; For MAC OS-X maintain 16-byte alignment on all calls
    bits 64 
    global main 
    extern printf

    section .text
main:
    ; function setup
    push        RBP
    mov         RBP, RSP
    sub         RSP, 16

loop:
    cmp         byte [primRead], 5  ; compare sentinel to priming read
                                    ; to see if they are equal
                                    ; run loop while test condition is false
    je          exit_script         ; if test condtion is true, exit program

    lea         RDI, [rel print_it] ; print the count stored in primRead
    mov         AL, 0
    call        printf
    inc         byte [primRead]     ; increment primRead counter
    jmp         loop                ; run the loop again

exit_script:
    ; function return
    mov         RAX, 0
    add         RSP, 16
    pop         RBP

    ret

    section .data
primRead    dw  0
print_it    dw  "Counting", 10, 0
