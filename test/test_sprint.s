.intel_syntax noprefix
.global _start

.extern sprint
.extern exit

.section .text
_start:
    lea rdi, [str_entry]
    call sprint

    cmp rax, -1
    je .fail

    mov rdi, 0
    call exit
    
    .fail:
    mov rdi, 2
    call exit
    
.section .data
str_entry: .asciz "test string"
