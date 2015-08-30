; For Mac OS-X maintain 16 byte alignment on all calls

        bits 64
        global  main
        extern  printf

        section .text
main:
        ; function setup
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        ;
        lea     rdi, [rel message1]
	mov	al, 0
	call	printf

	lea	rdi, [rel message2]
	mov	al, 0
	call	printf	

	lea	rdi, [rel message3]
        mov     al, 0
        call    printf

        ; function return
        mov     eax, 0
        add     rsp, 32
        pop     rbp
        ret

        section .data
message1 db      "Course: COSC2425 Lab2", 10, 0
message2 db      "Student: Stacy Bridges", 10, 0
message3 db      "Project: Nasm Hello World", 10, 0
