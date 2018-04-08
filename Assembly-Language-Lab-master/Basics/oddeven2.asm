;Print odd even
segment .data
input: db "%lld",0
output: db "%s",10,0
res1: db "even",10,0
res2: db "odd",10,0 


segment .bss
a resq 1
b resq 1

segment .text

global main
extern scanf
extern printf

main:
push rbp
mov rdi, input
mov rsi, a

call scanf
mov rdi, output

mov rdx,0
mov rax,[a]
mov rbx, 2
div rbx

cmp rdx,0
mov rsi,res1
jz print
mov rsi,res2

print:
call printf


pop rbp
ret
