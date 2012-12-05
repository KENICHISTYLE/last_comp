	.text
main:
	sub  $sp, $sp, 9
	sw   $fp, 3($sp)
	add  $fp, $sp, 1
	sw   $ra, 0($fp)
	sub  $sp, $sp, 4
	add  $a0, $fp, 0
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 65
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 0
	sub  $sp, $sp, 4
	lw   $a0, 0($fp)
	sw   $a0, 0($sp)
	jal  putchar
	add  $sp, $sp, 1
	add  $sp, $sp, 0
	sub  $sp, $sp, 4
	li   $a0, 10
	sw   $a0, 0($sp)
	jal  putchar
	add  $sp, $sp, 4
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

