section .data
    hello:      db      "Hello, world!", 0
    counter:    dd      10

section .text
    global main
    extern puts

main:
    sub rsp, 28h

loop:
    mov rcx, hello             ; sets the hello string pointer as first argument (uses 64 bit __fastcall calling convention)
                               ; for more information check https://en.wikipedia.org/wiki/X86_calling_conventions or the
                               ; original Microsoft documentation at https://docs.microsoft.com/en-us/cpp/build/x64-calling-convention
    call puts                  ; calls the 'puts' function
    mov rsi, [counter]         ; moves the counter to RSI
    dec rsi                    ; decrements RSI by one
    mov [counter], rsi         ; re-stores the RSI back to memory
    jnz loop                   ; jumps in case the counter is not yet zero

exit:
    add rsp, 28h
    ret
