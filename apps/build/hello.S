	.file	"hello.c"
	.option nopic
	.text
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"666 in hex is "
	.align	2
.LC0:
	.string	"Hello, world!\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	lui	a5,%hi(.LC0)
	addi	a5,a5,%lo(.LC0)
	lw	a1,0(a5)
	lw	a2,4(a5)
	lw	a3,8(a5)
	lhu	a4,12(a5)
	lbu	a5,14(a5)
	addi	sp,sp,-32
	mv	a0,sp
	sw	ra,28(sp)
	sw	a1,0(sp)
	sw	a2,4(sp)
	sw	a3,8(sp)
	sh	a4,12(sp)
	sb	a5,14(sp)
	call	puts
	lui	a0,%hi(.LC1)
	addi	a0,a0,%lo(.LC1)
	call	puts
	li	a0,666
	li	a1,16
	call	printnum
	lw	ra,28(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC, 64-bit) 10.1.0"
