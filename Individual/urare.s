.data
urare: .asciz "Sarbatori fericite!\n"
.text
.global main
main:
	mov $4,%eax
	mov $1, %ebx
	mov $urare,%ecx
	mov $21,%edx
	int $0x80
exit: 
	 mov $1, %eax
 	mov $0, %ebx
 	int $0x80
