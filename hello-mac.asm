section .data
    hello:      db      "Hello, world!", 10
    hello.len:  equ     $ - hello
    counter:    dq      10

section .text
    global _main
    default rel

_main:

loop:
    mov rax, 0x2000004         ; 'write' system call
    mov rdi, 1                 ; file descriptor 1 = STDOUT
    mov rsi, hello
    mov rdx, hello.len
    syscall
    mov rsi, [counter]         ; moves the counter to RSI
    dec rsi                    ; decrements RSI by one
    mov [counter], rsi         ; re-stores the RSI back to memory
    jnz loop                   ; jumps in case the counter is not yet zero

exit:
    mov rax, 0x2000001         ; 'exit' system call
    mov rdi, 0
    syscall
