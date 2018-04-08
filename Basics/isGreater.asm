;Print the largest
segment .data
input: db "%d %d",0
output: db "%d",10,0

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
mov rdx, b

call scanf

mov rax,[a]
mov rbx,[b]

sub rax,rbx
jg output1

mov rdi,output
mov rsi,[b]
call printf
jmp exit


output1:
mov rdi,output

mov rsi,[a]
call printf

exit:
pop rbp
ret
