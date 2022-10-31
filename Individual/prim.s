.data
n: .long 13
fals: .asciz "Nu e prim\n"
adevar: .asciz "E prim\n"
.text
.global main

main:

mov $2,%ecx
movl n,%eax

for:
	cmp %eax,%ecx     
	jge prim
	mov $0,%edx
	idiv %ecx
		cmp $0,%edx
		je nu_prim
	    incl %ecx
	    movl n,%eax
	   jmp for
	
	
	
nu_prim:
	mov $4,%eax
	mov $0,%ebx
	mov $fals,%ecx
	mov $11,%edx
	int $0x80
	jmp exit
		
prim:
	mov $4,%eax
	mov $0,%ebx
	mov $adevar,%ecx
	mov $8,%edx
	int $0x80
exit:
	mov $0,%eax
	mov $1,%ebx
	int $0x80
