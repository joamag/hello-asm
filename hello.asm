section .data
    hello:      db      "Hello, world!", 10
    hello.len:  equ     $ - hello
    counter:    dd      10h

section .text
    global _start 

_start:
    mov eax, 4           ; 'write' system call = 4
    mov ebx, 1           ; file descriptor 1 = STDOUT
    mov ecx, hello       ; string to write
    mov edx, hello.len   ; length of string to write
    int 80h              ; call the kernel (syscall) using 0x80 interrupt
    mov ecx, counter     ; moves the counter to ECX
    dec ecx              ; decrements ECX by one
    mov [counter], ecx   ; re-stores the ECX back to memory
    jnz _start           ; jumps in case the counter is not yet zero

    mov eax, 1           ; 'exit' system call
    mov ebx, 0           ; exit with error code 0
    int 80h              ; call the kernel (syscall) using 0x80 interrupt
