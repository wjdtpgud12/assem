; avg.asm
; Windows x64 NASM: reads five integers and prints their average.

default rel
global main
extern scanf
extern printf

section .data
    input_fmt  db "%lld %lld %lld %lld %lld", 0
    output_fmt db "Average: %.2f", 13, 10, 0
    five       dq 5.0

section .text
main:
    ; Reserve shadow space, stack arguments for scanf, and five local values.
    ; 88 bytes also aligns RSP to 16 bytes before calls.
    sub rsp, 88

    ; scanf("%lld %lld %lld %lld %lld", &a, &b, &c, &d, &e)
    lea rcx, [rel input_fmt]
    lea rdx, [rsp + 48]
    lea r8,  [rsp + 56]
    lea r9,  [rsp + 64]
    lea rax, [rsp + 72]
    mov [rsp + 32], rax
    lea rax, [rsp + 80]
    mov [rsp + 40], rax
    call scanf

    ; Sum the five signed 64-bit integers.
    mov rax, [rsp + 48]
    add rax, [rsp + 56]
    add rax, [rsp + 64]
    add rax, [rsp + 72]
    add rax, [rsp + 80]

    ; Convert the sum to double and divide by 5.
    cvtsi2sd xmm1, rax
    divsd xmm1, [rel five]

    ; Windows x64 variadic calls pass floating arguments in both XMM and GPR.
    lea rcx, [rel output_fmt]
    movq rdx, xmm1
    call printf

    xor eax, eax
    add rsp, 88
    ret
