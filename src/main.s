.intel_syntax noprefix

# +-----------------------+
# |        EXPORTS        |
# +-----------------------+
.global slen
.global sprint
.global exit
# +-----------------------+

# +-----------------+
# | int slen(char*) |
# +-----------------+
# | Return the size |
# | of the string   |
# +-----------------+
slen:
    xor rax, rax

    .loop:
    cmp byte ptr [rdi + rax], 0
    je .end

    inc rax

    jmp .loop
    .end:

    ret


# +-------------------+
# | void sprint(char*) |
# +-------------------+
# | Write to console  |
# | the string        |
# +-------------------+
sprint:
    call slen

    mov rdx, rax
    mov rsi, rdi
    mov rdi, 1
    mov rax, 1
    syscall


# +----------------+
# | void exit(int) |
# +----------------+
# | Exit from the  |
# | the program    |
# +----------------+
exit:
    mov rax, 60
    syscall
