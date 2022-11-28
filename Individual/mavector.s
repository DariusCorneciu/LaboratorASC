.data
	n: .long 5
	v: .long 5,10,5,10,5
	egale: .long 0
	str : .asciz "Media artmitecia este %d, iar in v sunt %d egale cu aceasta\n"
.text
.global main
main:
	xor %edx,%edx
	mov $v,%edi
	xor %ecx,%ecx
	mov $0,%eax
	
	while:
		cmp %ecx,n
		je calcul_ma 
		movl (%edi,%ecx,4),%ebx
		add %ebx,%eax
		incl %ecx
		jmp while
		
	calcul_ma:
		mov n,%ebx
		div %ebx
		xor %ecx, %ecx
		movl (%edi,%ecx,4),%ebx
		
	egalitate:
		cmp %ecx,n
		je afis
		cmp %ebx,%eax
		je adun
		incl %ecx
		movl (%edi,%ecx,4),%ebx
		jmp egalitate
		adun:
			incl egale	
			incl %ecx
			movl (%edi,%ecx,4),%ebx
			jmp egalitate
			
	afis:
		push egale
		push %eax
		push $str
		call printf
		pop %eax
		pop %ebx
		pop %ebx
		
	exit:
		mov $1,%eax
		mov $0,%ebx
		int $0x80
