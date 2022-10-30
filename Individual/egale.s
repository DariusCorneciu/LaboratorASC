.data
	x: .long 3
	y: .long 3
	adev: .asciz "PASS\n"
	fals: .asciz "FAIL\n"
.text
.global main
main:
	movl x,%eax
	movl y,%ebx
	cmp %eax,%ebx
	je afis1

afis2:
	mov $4,%eax
	mov $1,%ebx
	mov $fals,%ecx
	mov $6,%edx
	int $0x80
	
afis1:
	mov $4,%eax
	mov $1,%ebx
	mov $adev,%ecx
	mov $6,%edx
	int $0x80
exit:
	mov $0,%eax
	mov $1,%ebx
	int $0x80
	
