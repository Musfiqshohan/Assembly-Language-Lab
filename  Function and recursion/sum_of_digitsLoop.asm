;Super digit, Sum of the digits of a number till single digit is found
segment .data
out: db "%d",10,0
out2: db "%d %d",10,0
in: db "%d",0

segment .bss
n: resq 1

segment .text

global main
extern scanf
extern printf

main:
push rbp
mov rbp,rsp

mov rdi,in
mov rsi, n
mov rax,0
call scanf
mov rax,[n]
push rax
mov r9,0
mov r13,r9


OuterLoop:	
	
	mov rdx,0
	mov r11,rax
	mov r9,10
	div r9
	cmp rax,0
	jz End
	
	mov r9,0
	mov r13,r9
	mov rax,r11
	push rax
	
	
	InnerLoop:
		
		cmp rax,0
		jz ExitInnerLoop
		
		
		mov rdx,0
		mov r9,10
		div r9
		add r13,rdx	
	
	
	jmp InnerLoop
	
	ExitInnerLoop:

	pop rax
	mov rax,r13

jmp OuterLoop	


End:
mov rdi,out
mov rsi,r13
mov rax,0
call printf
leave
ret

