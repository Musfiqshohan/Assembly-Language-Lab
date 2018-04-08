segment .data
in: db "%d",0
out: db "%d",10,0
test: db "%d %d",10,0
outex: db "Number Already Exists",10,0
outmore: db "Give %d more numbers",10,0
;outmore: db "%d %d",10,0



segment .bss
n: resq 1
ara: resq 100


segment .text

global main
extern scanf
extern printf

main:
push rbp

mov r10,ara
mov rcx,100

L1:
	mov r9,0
	mov [r10],r9
	add r10,8
Loop L1



mov rcx,5
L2:
	push rcx
	mov rdi,in
	mov rsi,n
	mov rax,0
	call scanf
	
	mov rax,[n]
	imul rax,8
	mov r10, ara
	add r10,rax
	
	mov r8,0
	cmp [r10],r8
	jnz Exist
	mov r8,1
	mov [r10],r8
	pop rcx
	dec rcx
	push rcx
	jmp Last
	
	Exist:
	mov rdi,outex
	mov rax,0
	call printf
	
	
	
	Last:
	pop rcx
	push rcx
	cmp rcx,0
	jz End
	
	mov rdi,outmore
	mov rsi,rcx
	mov rax,0
	call printf
		
	pop rcx
	

jmp L2

End:

mov r10,ara
mov rcx,0

L3:
	cmp rcx,100
	jz Exit

	mov r8,1
	cmp [r10],r8
	jnz Last2
	
	push r10
	push rcx
	mov rdi,out
	mov rsi,rcx
	mov rax,0
	call printf
	
	pop rcx
	pop r10	
	
	Last2:
	add r10,8
	inc rcx
	
jmp L3


Exit:
pop rbp
ret
