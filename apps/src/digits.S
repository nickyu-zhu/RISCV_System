.globl main
main:	
	addi x1, x0, 48
	addi x3, x0, 58
	li x2,0xffff0000
lab:	
	sw x1, 0(x2)
	addi x1, x1, 1
	beq x1, x3, space
	j lab
space:
	addi x4, x0, 32
	sw x4, 0(x2)
	addi x1, x0, 48
	j lab

	
