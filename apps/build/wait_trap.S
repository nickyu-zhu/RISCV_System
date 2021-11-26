	.file	"wait_trap.c"
	.option nopic
	.text
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
 #APP
# 4 "wait_trap.c" 1
	csrsi mie, 4
# 0 "" 2
 #NO_APP
.L2:
	j	.L2
	.size	main, .-main
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC, 64-bit) 10.1.0"
