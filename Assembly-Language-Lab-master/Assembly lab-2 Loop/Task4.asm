; string matching
segment .data
in: db "%d %s %s",0
out: db "%s",0
test: db "%c %c",10,0
out1: db "Equal",10,0
out2: db "Not Equal",10,0
segment .bss
len: resq 1
s1: resb 20
s2: resb 20
segment .text

global main
extern scanf
extern printf

main:
push rbp

mov  rdi, in
mov rsi, len
mov rdx, s1
mov rcx, s2
mov rax,0
call scanf




mov r8,s1
mov r9,s2
mov rcx,[len]


Check:
	mov al, [r8]
	mov bl, [r9]
	
	cmp al,bl
	jne Exit1
	
	add r8,1
	add r9,1

Loop Check



mov rsi,out1
jmp Print

Exit1:
mov rsi, out2

Print:
mov rdi, out
mov rax,0
call printf



mov rax,0
pop rbp
ret
