.data
	x: .space 12
.text
.global main
main:
read:
	mov $3,%eax
	mov $1,%ebx
	mov $x,%ecx
	mov $12,%edx
	int $0x80
afis:
	mov $4,%eax
	mov $0,%ebx
	mov $x,%ecx
	mov $12,%edx
	int $0x80
exit:
	mov $0,%eax
	mov $1,%ebx
	int $0x80
