	.file	"shell.c"
	.option nopic
	.text
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"hello    square\n"
	.text
	.align	2
	.globl	exec_ls
	.type	exec_ls, @function
exec_ls:
	lui	a5,%hi(.LC0)
	addi	a5,a5,%lo(.LC0)
	lw	a1,0(a5)
	lw	a2,4(a5)
	lw	a3,8(a5)
	lw	a4,12(a5)
	lbu	a5,16(a5)
	addi	sp,sp,-48
	addi	a0,sp,12
	sw	ra,44(sp)
	sw	a1,12(sp)
	sw	a2,16(sp)
	sw	a3,20(sp)
	sw	a4,24(sp)
	sb	a5,28(sp)
	call	puts
	lw	ra,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	exec_ls, .-exec_ls
	.section	.rodata.str1.4
	.align	2
.LC2:
	.string	"666 in hex is "
	.align	2
.LC1:
	.string	"Hello, world!\n"
	.text
	.align	2
	.globl	exec_hello
	.type	exec_hello, @function
exec_hello:
	lui	a5,%hi(.LC1)
	addi	a5,a5,%lo(.LC1)
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
	lui	a0,%hi(.LC2)
	addi	a0,a0,%lo(.LC2)
	call	puts
	li	a1,16
	li	a0,666
	call	printnum
	lw	ra,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	exec_hello, .-exec_hello
	.align	2
	.globl	exec_square
	.type	exec_square, @function
exec_square:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	ra,12(sp)
	li	s0,0
.L7:
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
	li	a5,10
	bne	s0,a5,.L7
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	exec_square, .-exec_square
	.section	.rodata.str1.4
	.align	2
.LC3:
	.string	""
	.align	2
.LC4:
	.string	"help"
	.align	2
.LC5:
	.string	"ls"
	.align	2
.LC6:
	.string	"hello"
	.align	2
.LC7:
	.string	"square"
	.align	2
.LC8:
	.string	"bad command, use [help] to get help.\n"
	.text
	.align	2
	.globl	digest_command
	.type	digest_command, @function
digest_command:
	lui	a1,%hi(.LC3)
	addi	sp,sp,-48
	addi	a1,a1,%lo(.LC3)
	sw	s0,40(sp)
	sw	ra,44(sp)
	mv	s0,a0
	call	strcmp
	bne	a0,zero,.L22
.L10:
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
.L22:
	lui	a1,%hi(.LC4)
	addi	a1,a1,%lo(.LC4)
	mv	a0,s0
	call	strcmp
	bne	a0,zero,.L13
	lui	a0,%hi(.LANCHOR0)
	addi	a0,a0,%lo(.LANCHOR0)
.L21:
	lw	s0,40(sp)
	lw	ra,44(sp)
	addi	sp,sp,48
	tail	puts
.L13:
	lui	a1,%hi(.LC5)
	addi	a1,a1,%lo(.LC5)
	mv	a0,s0
	call	strcmp
	bne	a0,zero,.L14
	lui	a5,%hi(.LC0)
	addi	a5,a5,%lo(.LC0)
	lw	a1,0(a5)
	lw	a2,4(a5)
	lw	a3,8(a5)
	lw	a4,12(a5)
	lbu	a5,16(a5)
	addi	a0,sp,12
	sw	a1,12(sp)
	sw	a2,16(sp)
	sw	a3,20(sp)
	sw	a4,24(sp)
	sb	a5,28(sp)
	call	puts
	j	.L10
.L14:
	lui	a1,%hi(.LC6)
	addi	a1,a1,%lo(.LC6)
	mv	a0,s0
	call	strcmp
	beq	a0,zero,.L23
	lui	a1,%hi(.LC7)
	mv	a0,s0
	addi	a1,a1,%lo(.LC7)
	call	strcmp
	mv	s0,a0
	beq	a0,zero,.L17
	lui	a0,%hi(.LC8)
	addi	a0,a0,%lo(.LC8)
	j	.L21
.L17:
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
	li	a5,10
	bne	s0,a5,.L17
	j	.L10
.L23:
	lui	a5,%hi(.LC1)
	addi	a5,a5,%lo(.LC1)
	lw	a1,0(a5)
	lw	a2,4(a5)
	lw	a3,8(a5)
	lhu	a4,12(a5)
	lbu	a5,14(a5)
	addi	a0,sp,12
	sw	a1,12(sp)
	sw	a2,16(sp)
	sw	a3,20(sp)
	sh	a4,24(sp)
	sb	a5,26(sp)
	call	puts
	lui	a0,%hi(.LC2)
	addi	a0,a0,%lo(.LC2)
	call	puts
	li	a1,16
	li	a0,666
	call	printnum
	j	.L10
	.size	digest_command, .-digest_command
	.section	.rodata.str1.4
	.align	2
.LC9:
	.string	"sh> "
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-112
	sw	s2,96(sp)
	sw	s4,88(sp)
	lui	s2,%hi(.LC0)
	lui	s4,%hi(.LC1)
	sw	s0,104(sp)
	sw	s1,100(sp)
	sw	s3,92(sp)
	sw	s5,84(sp)
	sw	s6,80(sp)
	sw	s7,76(sp)
	sw	s8,72(sp)
	sw	s9,68(sp)
	sw	s10,64(sp)
	sw	ra,108(sp)
	sw	s11,60(sp)
	lui	s1,%hi(.LC9)
	lui	s0,%hi(.LC3)
	lui	s3,%hi(.LC4)
	lui	s6,%hi(.LANCHOR0)
	lui	s5,%hi(.LC5)
	addi	s2,s2,%lo(.LC0)
	lui	s7,%hi(.LC6)
	addi	s4,s4,%lo(.LC1)
	lui	s9,%hi(.LC2)
	lui	s8,%hi(.LC7)
	lui	s10,%hi(.LC8)
.L26:
	addi	a0,s1,%lo(.LC9)
	call	puts
	addi	a0,sp,28
	call	getline
	addi	a1,s0,%lo(.LC3)
	addi	a0,sp,28
	call	strcmp
	beq	a0,zero,.L26
	addi	a1,s3,%lo(.LC4)
	addi	a0,sp,28
	call	strcmp
	bne	a0,zero,.L27
	addi	a0,s6,%lo(.LANCHOR0)
	call	puts
	j	.L26
.L27:
	addi	a1,s5,%lo(.LC5)
	addi	a0,sp,28
	call	strcmp
	bne	a0,zero,.L29
	lw	a1,0(s2)
	lw	a2,4(s2)
	lw	a3,8(s2)
	lw	a4,12(s2)
	lbu	a5,16(s2)
	addi	a0,sp,8
	sw	a1,8(sp)
	sw	a2,12(sp)
	sw	a3,16(sp)
	sw	a4,20(sp)
	sb	a5,24(sp)
	call	puts
	j	.L26
.L29:
	addi	a1,s7,%lo(.LC6)
	addi	a0,sp,28
	call	strcmp
	bne	a0,zero,.L30
	lw	a1,0(s4)
	lw	a2,4(s4)
	lw	a3,8(s4)
	lhu	a4,12(s4)
	lbu	a5,14(s4)
	addi	a0,sp,8
	sw	a1,8(sp)
	sw	a2,12(sp)
	sw	a3,16(sp)
	sh	a4,20(sp)
	sb	a5,22(sp)
	call	puts
	addi	a0,s9,%lo(.LC2)
	call	puts
	li	a1,16
	li	a0,666
	call	printnum
	j	.L26
.L30:
	addi	a1,s8,%lo(.LC7)
	addi	a0,sp,28
	call	strcmp
	mv	s11,a0
	beq	a0,zero,.L32
	addi	a0,s10,%lo(.LC8)
	call	puts
	j	.L26
.L32:
	li	a1,10
	mv	a0,s11
	call	printnum
	li	a0,120
	call	_putch
	li	a1,10
	mv	a0,s11
	call	printnum
	li	a0,61
	call	_putch
	mul	a0,s11,s11
	li	a1,10
	addi	s11,s11,1
	call	printnum
	li	a0,10
	call	_putch
	li	a5,10
	bne	s11,a5,.L32
	j	.L26
	.size	main, .-main
	.globl	help_msg
	.section	.rodata.help_msg,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	help_msg, @object
	.size	help_msg, 87
help_msg:
	.string	"help: \n  ls     -  list programs.\n  hello  -  hello world.\n  square -  square number.\n"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC, 64-bit) 10.1.0"
