	.file	"matrix.c"
	.option nopic
	.text
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	li	a3,-61440
	li	a5,-16711680
	addi	a4,a3,-256
	addi	a5,a5,-256
	addi	a3,a3,-128
.L2:
	sw	a5,0(a4)
	slli	a5,a5,1
	addi	a4,a4,4
	ori	a5,a5,1
	bne	a4,a3,.L2
	li	a0,0
	ret
	.size	main, .-main
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC, 64-bit) 10.1.0"
