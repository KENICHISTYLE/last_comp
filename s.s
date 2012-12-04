	.text
f:
	sub  $sp, $sp, 8
	sw   $fp, 4($sp)
	add  $fp, $sp, 8
	sw   $ra, 0($fp)
	lw   $ra, 0($fp)
	sub  $sp, $sp, 0
	jr   $ra
main:
	sub  $sp, $sp, 32
	sw   $fp, -20($sp)
	add  $fp, $sp, -16
	sw   $ra, 0($fp)
	sub  $sp, $sp, 4
	li   $a0, 1
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, -4($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 1
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 1
	sw   $a0, 0($sp)
	bnez $a0, True_branch_1
	sub  $sp, $sp, 4
	li   $a0, 1
	sw   $a0, 0($sp)
	b    False_branch_1
True_branch_1:
	sub  $sp, $sp, 4
	li   $a0, 2
	sw   $a0, 0($sp)
False_branch_1:
loop_start_1:
	beqz $a0, loop_end_1
	b    loop_start_1
loop_end_1:
	sub  $sp, $sp, 4
	lw   $a0, -8($fp)
	sw   $a0, 0($sp)
loop_start_2:
	beqz $a0, loop_end_2
	b    loop_start_2
loop_end_2:
	sub  $sp, $sp, 4
	lw   $a0, -8($fp)
	sw   $a0, 0($sp)
	move $v0, $a0
	lw   $ra, 0($fp)
	sub  $sp, $sp, 0
	move $t1, $v0
	li   $v0, 10
	syscall
putchar:
	sub  $sp, $sp, 8
	sw   $fp, -4($sp)
	add  $fp, $sp, -8
	sw   $ra, 0($fp)
	li   $v0, 11
	lbu   $a0, 8($fp)
	syscall
	lw   $ra, 0($fp)
	sub  $sp, $sp, 8
	jr   $ra
sbrk:
	.data
i_1:
	.word 0
m_2:
	.word 0
l_3:
	.word 0

