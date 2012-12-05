	.text
f:
	sub  $sp, $sp, 8
	sw   $fp, 4($sp)
	add  $fp, $sp, 0
	sw   $ra, 0($fp)
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	li   $a0, 12
	sw   $a0, 0($sp)
	jal  putchar
	add  $sp, $sp, 4
	jr   $ra
main:
	sub  $sp, $sp, 8
	sw   $fp, 4($sp)
	add  $fp, $sp, 0
	sw   $ra, 0($fp)
	move $t1, $v0
	li   $v0, 10
	syscall
putchar:
	sub  $sp, $sp, 8
	sw   $fp, -4($sp)
	add  $fp, $sp, 0
	sw   $ra, 0($fp)
	li   $v0, 11
	lbu   $a0, 8($fp)
	syscall
	lw   $ra, 0($fp)
	sub  $sp, $sp, 8
	jr   $ra
sbrk:
	.data

