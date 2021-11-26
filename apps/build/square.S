	.file	"square.c"
	.option nopic
	.text
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	li	s0,0
	li	s1,100
.L2:
	li	a1,10
	mv	a0,s0
	call	printnum
	li	a0,120
	call	_putch
	li	a1,10
	mv	a0,s0
	call	printnum
	li	a0,61
	call	_putch
	mul	a0,s0,s0
	li	a1,10
	addi	s0,s0,1
	call	printnum
	li	a0,10
	call	_putch
	bne	s0,s1,.L2
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC, 64-bit) 10.1.0"
