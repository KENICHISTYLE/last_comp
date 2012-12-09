	.text
main:
	jal  prog_main
	li   $v0, 10
	syscall
prog_main:
	sub  $sp, $sp, 4
	sw   $fp, 0($sp)
	sub  $sp, $sp, 4
	move $fp, $sp
	sw   $ra, 0($fp)
	sub  $sp, $sp, 4
	sub  $sp, $sp, 4
	add  $a0, $fp, -4
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 65
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	lw   $a0, -4($fp)
	sw   $a0, 0($sp)
	jal  putchar
	add  $sp, $sp, 4
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	li   $a0, 0
	sw   $a0, 0($sp)
	add  $sp, $sp, 4
	bnez $a0, True_branch_1
	sub  $sp, $sp, 4
	add  $a0, $fp, 8
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 67
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	add  $a0, $fp, 4
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 68
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	lw   $a0, 8($fp)
	sw   $a0, 0($sp)
	jal  putchar
	add  $sp, $sp, 4
	add  $sp, $sp, 4
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	lw   $a0, 4($fp)
	sw   $a0, 0($sp)
	jal  putchar
	add  $sp, $sp, 4
	add  $sp, $sp, 4
	b    Fin_du_branch_1
True_branch_1:
	sub  $sp, $sp, 4
	add  $a0, $fp, 4
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 66
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	lw   $a0, 4($fp)
	sw   $a0, 0($sp)
	jal  putchar
	add  $sp, $sp, 4
	add  $sp, $sp, 4
Fin_du_branch_1:
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	lw   $a0, -4($fp)
	sw   $a0, 0($sp)
	jal  putchar
	add  $sp, $sp, 4
	add  $sp, $sp, 4
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	li   $a0, 10
	sw   $a0, 0($sp)
	jal  putchar
	add  $sp, $sp, 4
	add  $sp, $sp, 4
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 12
	jr   $ra
putchar:
	lw   $a0, 0($sp)
	sw   $a0, 4($sp)
	li   $v0, 11
	syscall
	move $v0, $a0
	jr   $ra
sbrk:
	li   $v0, 9
	lw   $a0, 0($sp)
	syscall
	move $v0, $a0
	jr   $ra
	.data

