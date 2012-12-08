	.text
main:
	sub  $sp, $sp, 8
	sw   $fp, 4($sp)
	add  $fp, $sp, 8
	sw   $ra, 0($fp)
	sub  $sp, $sp, 4
	li   $a0, 98
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 1
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
c:
	.byte 1

