segment .data
out: db "%d",10,0
out2: db "%d %d",10,0

segment .bss

segment .text

global main
extern scanf
extern printf

main:
push rbp
mov rbp,rsp


push 5


call fact

mov rdi,out
mov rsi,rax
mov rax,0
call printf


leave
ret


fact:
	push rbp 
	mov rbp,rsp
	
	mov rax,[rbp+16]
	mov rbx,rax
	dec rbx
	
	jz Leaving
	push rbx
	
	
	call fact
	
	mov rdx,0
	mov rax,[rbp+16]   ;multiply with the factorial result
	
	
	mul r8
	
	mov r8,rax
	
	leave  ; for normal case
	ret

	Leaving:  ;when n==0
	mov r8,1
	leave		; resets the stack
	ret
	
	
	

