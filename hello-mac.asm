section .data
    hello:      db      "Hello, world!", 10
    hello.len:  equ     $ - hello
    counter:    dd      10h

section .text
    global _start

_start:
    mov rax, 0x2000004   ; 'write' system call
    mov rdi, 1           ; file descriptor 1 = STDOUT
    mov rsi, hello
    mov rdx, hello.len
    syscall
    mov ecx, [counter]   ; moves the counter to ECX
    dec ecx              ; decrements ECX by one
    mov [counter], ecx   ; re-stores the ECX back to memory
    jnz _start           ; jumps in case the counter is not yet zero

    mov rax, 0x2000001   ; 'exit' system call
    mov rdi, 0
    syscall
