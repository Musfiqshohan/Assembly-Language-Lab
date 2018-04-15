segment .data
out: db "%d ",0
newline: db "",10,0
in: db "%d",0
in2: db "%d %d",0


segment .bss
ara: resq 100
res: resq 100
n: resq 1
r: resq 1

segment .text

global main
extern scanf 
extern printf

main:
push rbp
mov rbp,rsp

mov rdi, in2
mov rsi, n
mov rdx, r
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
	
	add rbx,8
	add rdx,1
Loop Input

mov r8,0
mov r13,0

push r13
push r8

call Combinate

leave
ret


Combinate:
	push rbp
	mov rbp,rsp
	
	mov r13,[rbp+24]
	mov r8, [rbp+16]
	cmp r8, [r]
	jz Basecase
	
	
	
	
		;mov rcx,[n]
		;sub rcx, r13
		mov r8,[rbp+16]  			;getting the parameter
		mov r11,r13
	InternalLoop:					; r11=i in for loop
	
		cmp r11,[n]
		jge returnFromFunc
		
		
		mov r10,[ara+ r11*8]
		mov [res+ r8*8], r10
		
		
	
		push r11
		inc r11
		push r11
		inc r8
		push r8
		
		call Combinate
		
		pop r8
		dec r8
		pop r11  
		pop r11
									
		
		EndInternalLoop:
		add r11,1
			
	jmp InternalLoop
	
	jmp returnFromFunc
	
	
	
	dummyBase:
		leave
		ret
	
	
	
	
	Basecase:		; if(idx==n)
		
		mov r9,0
		mov rcx,[r] 
		
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

	
















