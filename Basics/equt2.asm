;a^2+b^2+c^2
segment .data
input: db "%d %d %d",0
output: db "%d",10,0

segment .bss
a resq 1
b resq 1
c resq 1

segment .text

global main
extern scanf
extern printf

main:
push rbp
mov rdi, input
mov rsi, a
mov rdx, b
mov rcx, c

call scanf

mov rax,[a]
mov rbx,[a]
mul rbx

mov rdi,rax


mov rax, [b]
mov rbx, [b]
mul rbx
mov rsi,rax

mov rax, [c]
mov rbx, [c]
mul rbx

add rax,rdi
add rax,rsi

mov rdi, output
mov rsi, rax
mov rax,0
call printf

pop rbp
ret



