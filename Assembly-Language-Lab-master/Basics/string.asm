segment .data
fmt: db "%d %d %s",0
fmt2: db "%d %d %s",10,0

segment .bss
Hello:resq 1
H2: resq 1
st: resb 20

segment .text

global main
extern scanf
extern printf

main:
push rbp

mov  rdi, fmt
mov rsi, Hello
mov rdx, H2
mov rcx, st
mov rax,0
call scanf

mov rdi, fmt2
mov rsi, [Hello]
mov rdx, [H2]
mov rcx, st
mov rax,0
call printf

mov rax,0
pop rbp
ret
