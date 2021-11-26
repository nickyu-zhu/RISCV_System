// [x20] -> [tty write]
// [x21] -> [kbd read]
// [x22] -> [kbd avail]
.globl main
main:
	li x20, 0xffff0000
	li x21, 0xffff00f0
	li x22, 0xffff00f4
loop:	
	lb x1, 4(x21)
	addi x2, x0, 1
	beq x1, x2, found
	j loop
found:
	lw x1, 0(x21)
	sw x1, 0(x20)
	j loop
	

	
