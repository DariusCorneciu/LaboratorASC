.data

	clegaturi: .space 400
	legaturi: .space 4000
	matrix: .space 4000
	scan: .asciz "%ld"
	print: .asciz "%ld"
	endl: .asciz "\n"
	n: .space 4
	m: .space 4
	element: .space 4
	index: .long 0
	jndex: .long 0
	panterior: .long 0
.text

.global main

main:
	pushl $element
	pushl $scan
	call scanf
	addl $8,%esp
						
	pushl $n
	pushl $scan
	call scanf
	addl $8,%esp


	xor %ecx,%ecx
	lea clegaturi, %edi
	
	for_clegaturi:
			cmp n,%ecx
			je fout
			
			pushl $element
			pushl $scan
			call scanf
			addl $8,%esp
			
			movl element, %ebx	
			movl %ebx,(%edi,%ecx,4)
			addl element,%edx
			incl %ecx
			jmp for_clegaturi	
	
fout:
	movl %edx, m
	xor %ecx,%ecx
	lea legaturi,%edi
	
	for_legaturi:
		cmp m,%ecx
		je fout2
		pushl $element
		pushl $scan
		call scanf
		addl $8,%esp
		
		movl element, %ebx	
		movl %ebx,(%edi,%ecx,4)
		incl %ecx
		jmp for_legaturi
		
fout2:
	for_i:
		movl index,%ebx
		cmp %ebx,n
		je afis
		
		cmp $0,%ecx
		jne cresc
		intors:
		
		lea clegaturi,%edi
		movl index, %ecx
		addl (%edi,%ecx,4),%eax
		movl %eax,panterior
		
		for_j:
			movl jndex,%ebx
			cmp %ebx,panterior
			je for_i
			movl index,%eax
			movl $0,%edx
			mull n
			lea legaturi,%edi
			mov jndex,%ecx
			addl (%edi,%ecx,4),%eax
			lea matrix,%edi
			movl $1,(%edi,%eax,4)
			
			incl jndex
			jmp for_j
	
cresc:		
	lea clegaturi,%edi
	movl index, %ecx
	sub $1,%ecx
	addl (%edi,%ecx,4),%eax
	movl %eax,panterior
	jmp intors	
	
	
afis:
	movl $0,index
	
	for_index:
		movl index,%ecx
		cmp %ecx,n
		je exit
		
	movl $0,jndex
	for_jndex:
		movl jndex,%ecx
		cmp %ecx,n
		je cont
		
		movl index,%eax
		movl $0,%edx
		mull n
		addl jndex,%eax
		
		lea matrix, %edi
		movl (%edi,%eax,4),%ebx
		
		pushl %ebx
		pushl $print
		call printf
		addl $8,%esp
		
		pushl $0
		call fflush
		pop %ebx
		
		incl jndex
		jmp for_jndex
	cont:
		movl $4,%eax
		movl $1,%ebx
		movl $endl,%ecx
		movl $2,%edx
		int $0x80
		
		incl index
		jmp for_index
		
	
	exit:
		mov $1,%eax
		xor %ebx,%ebx
		int $0x80
		
