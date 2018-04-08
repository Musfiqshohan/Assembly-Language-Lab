segment .data
in: db "%d %d",0
out: db "%d",10,0
out2: db "%d %d",10,0

segment .bss
x: resq 1
y: resq 1

segment .text

global main
extern scanf
extern printf

main:
push rbp
mov rbp,rsp


mov rdi,in
mov rsi,x
mov rdx,y
mov rax,0
call scanf

mov r8,[x]
mov r9,[y]
push r8
push r9



call GCD

mov rdi,out
mov rsi,r8
mov rax,0
call printf


leave
ret


GCD:
	push rbp 
	mov rbp,rsp
	
	mov r8,[rbp+16]
	mov rax,[rbp+24]
	
	push r8
	push rax
	mov rdi,out2
	mov rsi,rax
	mov rdx,r8
	call printf
	pop rax
	pop r8
	
	
	mov rdx,0
	
	div r8
	cmp rdx,0
	jz Leaving
	
	mov r9,rdx
	push r8
	push r9
	
	
	call GCD
	

	
	Leaving:  ;when n==0
	leave		; resets the stack
	ret
	
	
	


