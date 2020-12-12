section .data
    hello:      db      "Hello, world!", 10
    hello.len:  equ     $ - hello

section .text
    global _start

_start:
    mov rax, 0x2000004   ; 'write' system call
    mov rdi, 1           ; file descriptor 1 = STDOUT
    mov rsi, hello
    mov rdx, hello.len
    syscall

    mov rax, 0x2000001   ; 'exit' system call
    mov rdi, 0
    syscall
