.data
v: .long 5,13,27,11,19,32,4
n: .long 6
String: .asciz "%d\n"
max: .long -1
.text
.global main
main:
	movl $0, %ecx
	movl v(,%ecx,4),%eax 
	mov $1,%ecx
	   
et_loop:
	cmp n,%ecx
	je exit
	movl v(,%ecx,4),%ebx
	cmp %eax,%ebx
	//ebx >eax
	jg mare	
		mov max,%edx
		cmp %edx,%eax
		    jg f
		       jmp final_loop
		    f: 
		       mov %eax,max
		       jmp final_loop

	mare:
	     mov max,%edx
	     cmp %edx,%ebx
	     jg g
	        jmp final_loop
		g: 
	        mov %ebx,max
	final_loop:
		movl v(,%ecx,4),%eax 
		incl %ecx
		jmp et_loop
	


exit:
push max
push $String
call printf
pop %ebx
pop %ebx
	mov $0,%eax
	mov $1, %ebx
	int $0x80
