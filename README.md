# 🍞 libsad.so

A respository to create a library in assembly with some utilities functions

## 🧸 Functions

| Name | Description |
| ---- | ----------- |
| `slen` | Return the string length |
| `sprint` | Write the string into stdin |
| `exit` | Exit from the program with given status |
| `salloc` | Allocate a block of memory and return its address |
| `sfree` | Deallocate a block of memory from given address |

## 🪅 Usage

```as
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
```

## 📦 Installation

1. Build the library
```
make
```

2. Move the library to `/usr/lib` directory
```
sudo mv libsad.so /usr/lib/
```
