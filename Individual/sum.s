.data
	x: .long 5
	y: .long 10
.text
.global main
main:
	movl x,%eax
	add y,%eax
exit:
	mov $1,%eax 
	mov $0,%ebx 
	int $0x80
	
