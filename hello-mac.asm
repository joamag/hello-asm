section .data
    hello:      db      "Hello, world!", 10
    hello.len:  equ     $ - hello

section .text
    global _start

_start:
    mov rax, 0x2000004 ; write
    mov rdi, 1         ; stdout
    mov rsi, hello
    mov rdx, hello.len
    syscall

    mov rax, 0x2000001 ; exit
    mov rdi, 0
    syscall
