.intel_syntax noprefix
.global _start

.extern slen
.extern sprint
.extern exit

.section .text
_start:
    lea rdi, [hello]
    call sprint

    lea rdi, [hello]
    call slen

    mov rdi, rax
    call exit
    
.section .data
hello: .asciz "Hello World"
