	.text
main:
	jal  prog_main
	li   $v0, 10
	syscall
f:
	sub  $sp, $sp, 4
	sw   $fp, 0($sp)
	sub  $sp, $sp, 4
	move $fp, $sp
	sw   $ra, 0($fp)
	sub  $sp, $sp, 0
	sub  $sp, $sp, 4
	lw   $a0, 20($fp)
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	seq  $a0, $zero, $a0
	sw   $a0, 0($sp)
	bnez $a0, True_branch_1
	b    False_branch_1
True_branch_1:
False_branch_1:
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	lw   $a0, 20($fp)
	sw   $a0, 0($sp)
	jal  putchar
	add  $sp, $sp, 4
	sw   $v0, 0($sp)
	add  $sp, $sp, 4
	add  $sp, $sp, 0
	sub  $sp, $sp, 4
	lw   $a0, 16($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, 12($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, 8($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, 20($fp)
	sw   $a0, 0($sp)
	jal  f
	add  $sp, $sp, 16
	add  $sp, $sp, 0
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 8
	jr   $ra
prog_main:
	sub  $sp, $sp, 4
	sw   $fp, 0($sp)
	sub  $sp, $sp, 4
	move $fp, $sp
	sw   $ra, 0($fp)
	sub  $sp, $sp, 0
	add  $sp, $sp, 0
	sub  $sp, $sp, 4
	li   $a0, 65
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 66
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 67
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 0
	sw   $a0, 0($sp)
	jal  f
	add  $sp, $sp, 12
	add  $sp, $sp, 0
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	li   $a0, 10
	sw   $a0, 0($sp)
	jal  putchar
	add  $sp, $sp, 4
	sw   $v0, 0($sp)
	add  $sp, $sp, 4
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 8
	jr   $ra
putchar:
	lbu   $a0, 0($sp)
	li   $v0, 11
	syscall
	move $v0, $a0
	jr   $ra
sbrk:
	.data

