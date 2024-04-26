# 🍞 libsad.so

A respository to create a library in assembly with some utilities functions

## 🪅 Usage

```as
.intel_syntax noprefix
.global _start

.extern sprint

.section .text
_start:
    lea rdi, [hello]
    call sprint

.section .data
hello: .asciz "Hello World!"
```
