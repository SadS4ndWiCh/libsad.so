.intel_syntax noprefix
.global _start

.extern slen
.extern exit

.set EXPECTED_VALUE, 11

.section .text
_start:
    lea rdi, [str_entry]
    call slen

    cmp rax, EXPECTED_VALUE
    jne .fail

    mov rdi, 0
    call exit
    
    .fail:
    mov rdi, 2
    call exit
    
.section .data
str_entry: .asciz "test string"
