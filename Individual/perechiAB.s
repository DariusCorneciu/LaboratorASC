.data
	n: .long 5
	v: .long 1,2,3,4,5
	x: .long 7
	y: .long 10
	String: .asciz "%d\n"
	rez: .long 0
.text
.global main
main:
	mov $0,%ecx
	mov $v,%edi
	movl (%edi,%ecx,4),%eax
	mov $1,%ecx
	while:
		cmp n,%ecx
			je et_afis
		mov $v,%edi
		movl (%edi,%ecx,4),%edx
		movl %edx,%ebx
		add %eax,%ebx
		mov x,%eax
		cmp %eax,%ebx
			jge ver2
		incl %ecx
		mov %edx,%eax	
		jmp while
		ver2:
		mov y,%eax
			cmp %eax,%ebx
				jle aduna
			incl %ecx
			mov %edx,%eax
			jmp while
		aduna:
			incl %ecx
			mov %edx,%eax
			incl rez
			jmp while
		
		


	et_afis:
		push rez
		push $String
		call printf
		pop %ebx
		pop %ebx

exit:
	mov $1,%eax
	mov $0,%ebx
	int $0x80
