
// Citesti un sir de caractere si il afisezi pe dos
.data
	sir: .space 20
	sird: .space 20
	scan: .asciz "%s\n"
	afis: .asciz "%s\n"
	
.text

.global main

main:
	push $sir
	push $scan
	call scanf
	pop %eax
	pop %ebx

	lea sir,%edi
	xor %ecx,%ecx
	while:
		movb (%edi,%ecx,1),%ah
		cmp $0,%ah
		je d_while
		incl %ecx
		jmp while
	
	d_while:
			xor %edx,%edx
			mov $sir, %edi
			mov $sird,%esi
		while_2:
			cmp $0,%ecx
			je afisa
			movb (%edi,%ecx,1),%ah
			movb %ah,(%esi,%edx,1)
			sub $1,%ecx
			incl %edx
			jmp while_2
		
	
	afisa:
		push $sird
		push $afis
		call printf
		pop %eax
		pop %eax
	
	
	
	exit:
		mov $1,%eax
		mov $0,%ebx
		int $0x80
