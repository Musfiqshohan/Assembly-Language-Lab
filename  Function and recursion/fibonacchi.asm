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



push 6			f[1]=1   f[2]=1

mov rax,0

call fibo

mov rdi,out
mov rsi,rax
mov rax,0
call printf




leave
ret


fibo:
	push rbp 
	mov rbp,rsp
	
	mov r8,[rbp+16]

	
	dec r8
	jz Leaving
	cmp r8,1
	jz Leaving
	
	push r8
	call fibo
	
	mov r8,[rbp+16]
	sub r8,2
	
	jz Leaving
	cmp r8,1
	jz Leaving
	
	push r8
	
	call fibo
	
	
	
	leave
	ret
	
	Leaving:
		add rax,1
	leave		
	ret
	
	



