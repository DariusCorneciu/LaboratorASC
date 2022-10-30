.data
	x: .long 4
	y: .long 5
	z: .long 3
	min: .space 4
.text
.global main
main:
	movl x,%eax
	movl y,%ebx
	cmp %eax,%ebx 
// ebx<eax 
	jl min2
min1:
	movl z, %ebx
	cmp %eax, %ebx
	jl p3
	jmp p1	
 
min2: 
	movl $z, %eax
	cmp %eax,%ebx
	jl p2
	jmp p3

	


p1: 
	movl x,%eax
	mov %eax,min
	jmp afis
p2:	

	movl y,%eax
	mov %eax,min
	jmp afis
p3:	
	movl z,%eax
	mov %eax,min	
afis:
 	mov $4,%eax
 	mov $1,%ebx
 	mov $min,%ecx
 	mov $4,%edx
 	int $0x80
	
exit:
	mov $0, %eax
	mov $1, %ebx
	int $0x80
