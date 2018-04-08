segment .data
fmt: db "%d %d %d %d",0
fmt2: db "%d",10,0

segment .bss
Hello:resq 1
H2: resq 1
v1: resq 1
v2: resq 1


segment .text

global main
extern scanf
extern printf

main:
push rbp

mov  rdi, fmt
mov rsi, Hello
mov rdx, H2
mov rcx, v1
mov r8, v2


call scanf


mov rax, [H2]
imul rax, [v1]
mov rdx,0
div qword [v2]
add rax, [Hello]

mov rdi, fmt2
mov rsi,rax

call printf


pop rbp
ret
