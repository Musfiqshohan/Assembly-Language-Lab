segment .data
out: db "%d",10,0
out2: db "%d %d",10,0
in: db "%d %d",0

segment .bss
n: resq 1
r: resq 1

segment .text

global main
extern scanf
extern printf

main:
push rbp
mov rbp,rsp

mov rdi,in
mov rsi,n
mov rdx,r
mov rax,0
call scanf

mov r8,[n] mov r9,[r] push r8 push r9 mov rax,0

call nCr

mov rdi,out
mov rsi,rax
mov rax,0
call printf

leave
ret



nCr:

push rbp    ; 8 byte for ip 8 byte for rbp so before call func , all is 16 byte before
mov rbp,rsp

mov r8,[rbp+24]   ; n
mov r9,[rbp+16]	  ; r


cmp r8,r9
jz BaseCase
cmp r9,0
jz BaseCase

dec r8
push r8
push r9

call nCr  ; nCr(n-1,r)

mov r8,[rbp+24]
mov r9,[rbp+16]

dec r8
dec r9
push r8
push r9

call nCr   ; nCr(n-1,r-1)

leave
ret


BaseCase:
	add rax,1
leave
ret	



