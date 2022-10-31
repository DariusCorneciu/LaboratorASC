.data
x: .space 4
y: .space 4
.text
.global main
main:

readx:
	mov $3,%eax
	mov $0,%ebx
	mov $x,%ecx
	mov $16,%edx
	int $0x80
v:
	movl x, %eax
	
exit:
	mov $1,%eax
	mov $0,%ebx
	int $0x80
	
