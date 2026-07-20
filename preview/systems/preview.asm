; comprehensive_asm_example.asm
; Exemplo abrangente em Assembly x86-64 (NASM) - Linux
; Exercita registradores, instruções, chamadas, macros, etc.

section .data
    ; Strings e constantes
    msg_hello:     db "Olá, Assembly!", 10, 0
    msg_positive:  db "Número positivo", 10, 0
    msg_negative:  db "Número negativo", 10, 0
    msg_zero:      db "Zero", 10, 0
    msg_result:    db "Resultado: %lld", 10, 0
    msg_factorial: db "Fatorial de 5: %lld", 10, 0
    fmt_int:       db "%lld", 10, 0

    ; Variáveis
    number1:       dq 42
    number2:       dq 100
    array:         dq 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    array_len:     equ ($ - array) / 8

section .bss
    buffer:        resb 128
    temp:          resq 1

section .text
    global main
    extern printf
    extern exit

; Macro
%macro print_str 1
    mov rax, 1          ; syscall write
    mov rdi, 1          ; stdout
    mov rsi, %1
    mov rdx, %1_len
    syscall
%endmacro

%macro print_int 1
    mov rdi, fmt_int
    mov rsi, %1
    xor rax, rax
    call printf
%endmacro

; Função para calcular fatorial (recursiva)
factorial:
    push rbp
    mov rbp, rsp
    push rbx
    
    cmp rdi, 1
    jbe .base_case
    
    mov rbx, rdi
    dec rdi
    call factorial
    imul rax, rbx
    jmp .end
    
.base_case:
    mov rax, 1
    
.end:
    pop rbx
    pop rbp
    ret

; Main
main:
    push rbp
    mov rbp, rsp

    ; Chamada de função simples
    print_str msg_hello

    ; Operações aritméticas e bitwise
    mov rax, [number1]
    add rax, 58
    mov rbx, 0xFF
    and rax, rbx
    or  rax, 0xAA
    xor rax, 0x55
    shl rax, 2
    shr rax, 1
    mov [temp], rax

    ; Condicionais
    mov rax, [number1]
    cmp rax, 0
    jg .positive
    jl .negative
    print_str msg_zero
    jmp .end_if

.positive:
    print_str msg_positive
    jmp .end_if

.negative:
    print_str msg_negative

.end_if:

    ; Loop (for-like)
    mov rcx, 0
.loop:
    cmp rcx, 5
    jge .end_loop
    print_int rcx
    inc rcx
    jmp .loop
.end_loop:

    ; Loop com array
    mov rcx, 0
.array_loop:
    cmp rcx, array_len
    jge .end_array
    mov rax, [array + rcx*8]
    print_int rax
    inc rcx
    jmp .array_loop
.end_array:

    ; Chamada de função recursiva
    mov rdi, 5
    call factorial
    mov rbx, rax
    mov rdi, msg_factorial
    mov rsi, rbx
    xor rax, rax
    call printf

    ; Operações com pilha
    push 10
    push 20
    push 30
    pop rax
    pop rbx
    pop rcx
    add rax, rbx
    add rax, rcx

    ; Syscall exit
    mov rax, 60         ; syscall exit
    xor rdi, rdi        ; código 0
    syscall

; Fim
section .note.GNU-stack noalloc noexec nowrite progbits