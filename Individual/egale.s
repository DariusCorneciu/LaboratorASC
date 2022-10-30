.data 
	x: .long 5
	y: .long 6
	adevarat: .asciz "PASS\n"
	fals: .asciz "FAIL\n"	

.text
.global main
main:
	movl $x, %eax
	movl $y, %ebx 
	cmp %eax,%ebx 
	jpe da
nu:
 	mov $4,%eax
 	mov $1, %ebx
 	mov $fals,%ecx
 	mov $6,%edx
 	int $0x80
 	jmp exit
da:
	mov $4, %eax
	mov $1, %ebx
	mov $adevarat, %ecx
	mov $6,%edx
	int $0x80

exit:
	mov $0,%eax
	mov $1, %ebx
	int $0x80
