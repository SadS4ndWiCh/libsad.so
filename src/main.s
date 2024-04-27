.intel_syntax noprefix

# +-----------------------+
# |    SYS_MMAP FLAGS     |
# +-----------------------+
.set PROT_NONE,  0x0
.set PROT_READ,  0x1
.set PROT_WRITE, 0x2
.set PROT_EXEC,  0x4

.set MAP_SHARED,    0x1
.set MAP_PRIVATE,   0x2
.set MAP_FIXED,     0x10
.set MAP_ANONYMOUS, 0x20
# +-----------------------+

# +-----------------------+
# |        EXPORTS        |
# +-----------------------+
.global slen
.global sprint
.global exit
.global salloc
.global sfree
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

    ret


# +----------------+
# | void exit(int) |
# +----------------+
# | Exit from the  |
# | the program    |
# +----------------+
exit:
    mov rax, 60
    syscall

    ret


# +---------------------+
# |  void* salloc(int)  |
# +---------------------+
# | Allocate a block of |
# | memory and return   |
# | its address         |
# +---------------------+
salloc:
    # Start offset
    xor r9, r9

    # File Descriptor
    # Must be -1 because mapping is not backed by any file,
    # required to be -1 when use MAP_ANONYMOUS flag
    mov r8, -1

    # Flags
    # MAP_PRIVATE | MAP_ANONYMOUS
    mov r10, MAP_PRIVATE
    or r10, MAP_ANONYMOUS

    # Protections
    # PROT_READ | PROT_WRITE
    mov rdx, PROT_READ
    or rdx, PROT_WRITE

    # Allocation size
    # Must be greater than 0
    mov rsi, rdi

    # Allocation address
    # If 0 (NULL), the kernel chooses for you
    xor rdi, rdi

    # sys_mmap syscall
    mov rax, 9
    syscall
    
    ret
    

# +---------------------------+
# | void sfree(void*, size_t) |
# +---------------------------+
# | Deallocate a block of     |
# | memory from givin         |
# | address                   |
# +---------------------------+
sfree:
    # sys_munmap syscall
    mov rax, 11
    syscall
    
    ret
