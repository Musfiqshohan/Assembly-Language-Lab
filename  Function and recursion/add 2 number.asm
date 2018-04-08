segment .data
out: db "%d",10,0

segment .bss

segment .text

global main
extern scanf
extern printf

main:
push rbp
mov rbp,rsp


push 50

push 40

call ADD



ADD:
	push rbp 
	mov rbp,rsp
	
	mov rax,[rbp+16]
	mov rbx,[rbp+24]
	
	add rax,rbx
	
	mov rdi,out
	mov rsi,rax
	mov rax,0
	
	call printf
	leave

leave
ret
