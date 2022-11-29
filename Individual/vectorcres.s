.data
n: .long 5
v: .long 1,2,3,4,5
str: .asciz "Vectorul este strict crescator!\n"
str2: .asciz "Vectorul nu este strict crescator, ruptura s-a produs pe pozitia %d.\n"

.text
.global main
main:
	xor %ecx,%ecx
	lea v,%edi
	movl (%edi,%ecx,4),%eax
	incl %ecx
	
	while:
		cmp %ecx,n
		je da
		movl (%edi,%ecx,4),%ebx
		// cmp a,b b<a
		cmp %ebx,%eax
		jge nu
		movl (%edi,%ecx,4),%eax
		incl %ecx
		jmp while
	
	da:
		push $str
		call printf
		pop %eax
		jmp exit
	
	nu:
		push %ecx
		push $str2
		call printf
		pop %eax
		pop %eax
		

	exit:
		mov $1,%eax
		mov $0,%ebx
		int $0x80
