segment .data
out: db "%d ",0
newline: db "",10,0
in: db "%d",0


segment .bss
ara: resq 100
res: resq 100
taken: resq 100
n: resq 1

segment .text

global main
extern scanf 
extern printf

main:
push rbp
mov rbp,rsp

mov rdi, in
mov rsi, n
mov rax,0
call scanf

mov rcx,[n]
mov rbx,ara
mov rdx,0
Input:
	
	push rbx
	push rcx
	push rdx
	
	mov rdi,in
	mov rsi, rbx
	mov rax,0
	call scanf
	
	pop rdx
	pop rcx
	pop rbx
	
	mov r10,0
	mov [res+ rdx*8], r10		;initialized to zero
	mov [taken+ rdx*8],r10	
	
	add rbx,8
	add rdx,1
Loop Input

mov r8,0

push r8
call Permute

leave
ret


Permute:
	push rbp
	mov rbp,rsp
	
	
	mov r8, [rbp+16]
	cmp r8, [n]
	jz Basecase
	
	
		mov rcx,[n]
		mov r8,[rbp+16]  			;getting the parameter
		mov r11,0
	InternalLoop:					; r11=i in for loop
		
	
		mov r9,	[taken+r11*8]		; taken[i]==0?
		cmp r9,0
		jnz EndInternalLoop
		
		mov r10,1
		mov [taken+r11*8],r10		; taken[i]=1
		mov r10,[ara+ r11*8]
		mov [res+ r8*8], r10
		
		
		
		push rcx
		push r11
		inc r8
		push r8
		
		call Permute
		
		pop r8
		dec r8  
		pop r11
		pop rcx
									
		mov r10,0
		mov [taken+r11*8],r10		;taken[i]=0
	
		EndInternalLoop:
		add r11,1
			
	Loop InternalLoop
	
	jmp returnFromFunc
	
	
	
	Basecase:		; if(idx==n)
		
		mov r9,0
		mov rcx,[n] 
		
		PrintLoop:		; for(int i=0;i<n;i++) printf("%d ",res[i]);
		
			push r9
			push rcx
			mov rdi,out
			mov rsi,[res+r9*8]
			mov rax,0
			call printf
			
			pop rcx
			pop r9
			
			inc r9								
		Loop PrintLoop
		
			mov rdi,newline
			mov rax,0
			call printf
		
		leave
		ret
	
	
returnFromFunc:
	leave
	ret

	

















