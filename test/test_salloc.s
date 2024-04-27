.intel_syntax noprefix
.global _start

.extern salloc
.extern sfree
.extern exit

.set ALLOCATION_SIZE, 255

.section .text
_start:
    mov rdi, ALLOCATION_SIZE
    call salloc

    cmp rax, -1
    je .fail

    mov rdi, rax
    mov rsi, ALLOCATION_SIZE
    call sfree

    mov rdi, 0
    call exit
    
    .fail:
    mov rdi, 2
    call exit
