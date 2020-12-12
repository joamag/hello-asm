section .data
    hello:      db      "Hello, world!", 10, 0
    counter:    dd      10

section .text
    global main
    extern printf

main:
    sub rsp, 40 

loop:
    mov rcx, hello             ; sets the hello string pointer as first argument (uses 64 bit calling convetion)
    call printf                ; calls the 'printf' function
    mov ecx, [counter]         ; moves the counter to ECX
    dec ecx                    ; decrements ECX by one
    mov [counter], ecx         ; re-stores the ECX back to memory
    jnz loop                   ; jumps in case the counter is not yet zero

exit:
    add rsp, 40
    ret
