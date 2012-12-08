	.text
main:
	jal  prog_main
	li   $v0, 10
	syscall
createu:
	sub  $sp, $sp, 4
	sw   $fp, 0($sp)
	sub  $sp, $sp, 4
	move $fp, $sp
	sw   $ra, 0($fp)
	sub  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a0, 9($fp)
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 1
	sub  $sp, $sp, 4
	lw   $a0, 8($fp)
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 1
	sub  $sp, $sp, 4
	lw   $a0, -4($fp)
	sw   $a0, 0($sp)
	lw   $v0, 0($sp)
	add  $sp, $sp, 4
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 12
	jr   $ra
creates:
	sub  $sp, $sp, 4
	sw   $fp, 0($sp)
	sub  $sp, $sp, 4
	move $fp, $sp
	sw   $ra, 0($fp)
	sub  $sp, $sp, 8
	sub  $sp, $sp, 4
	lw   $a0, 16($fp)
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a0, 12($fp)
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a0, 8($fp)
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a0, -4($fp)
	sw   $a0, 0($sp)
	lw   $v0, 0($sp)
	add  $sp, $sp, 4
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 16
	jr   $ra
prog_main:
	sub  $sp, $sp, 4
	sw   $fp, 0($sp)
	sub  $sp, $sp, 4
	move $fp, $sp
	sw   $ra, 0($fp)
	sub  $sp, $sp, 12
	sub  $sp, $sp, 4
	add  $a0, $fp, -12
	sw   $a0, 0($sp)
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	li   $a0, 120
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 121
	sw   $a0, 0($sp)
	jal  createu
	add  $sp, $sp, 8
	sw   $v0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	add  $a0, $fp, -4
	sw   $a0, 0($sp)
	add  $sp, $sp, -8
	sub  $sp, $sp, 4
	li   $a0, 65
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, -12($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 66
	sw   $a0, 0($sp)
	jal  creates
	add  $sp, $sp, 12
	sw   $v0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 8
	add  $sp, $sp, -4
	jal  putchar
	add  $sp, $sp, 4
	sw   $v0, 0($sp)
	add  $sp, $sp, 4
	add  $sp, $sp, -4
	jal  putchar
	add  $sp, $sp, 1
	sw   $v0, 0($sp)
	add  $sp, $sp, 4
	add  $sp, $sp, -4
	jal  putchar
	add  $sp, $sp, 1
	sw   $v0, 0($sp)
	add  $sp, $sp, 4
	add  $sp, $sp, -4
	jal  putchar
	add  $sp, $sp, 4
	sw   $v0, 0($sp)
	add  $sp, $sp, 4
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	li   $a0, 10
	sw   $a0, 0($sp)
	jal  putchar
	add  $sp, $sp, 4
	sw   $v0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	li   $a0, 88
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 1
	sub  $sp, $sp, 4
	li   $a0, 89
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 1
	add  $sp, $sp, -4
	jal  putchar
	add  $sp, $sp, 4
	sw   $v0, 0($sp)
	add  $sp, $sp, 4
	add  $sp, $sp, -4
	jal  putchar
	add  $sp, $sp, 1
	sw   $v0, 0($sp)
	add  $sp, $sp, 4
	add  $sp, $sp, -4
	jal  putchar
	add  $sp, $sp, 1
	sw   $v0, 0($sp)
	add  $sp, $sp, 4
	add  $sp, $sp, -4
	jal  putchar
	add  $sp, $sp, 4
	sw   $v0, 0($sp)
	add  $sp, $sp, 4
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	li   $a0, 10
	sw   $a0, 0($sp)
	jal  putchar
	add  $sp, $sp, 4
	sw   $v0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a0, -12($fp)
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
	add  $sp, $sp, -4
	jal  putchar
	add  $sp, $sp, 4
	sw   $v0, 0($sp)
	add  $sp, $sp, 4
	add  $sp, $sp, -4
	jal  putchar
	add  $sp, $sp, 1
	sw   $v0, 0($sp)
	add  $sp, $sp, 4
	add  $sp, $sp, -4
	jal  putchar
	add  $sp, $sp, 1
	sw   $v0, 0($sp)
	add  $sp, $sp, 4
	add  $sp, $sp, -4
	jal  putchar
	add  $sp, $sp, 4
	sw   $v0, 0($sp)
	add  $sp, $sp, 4
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	li   $a0, 10
	sw   $a0, 0($sp)
	jal  putchar
	add  $sp, $sp, 4
	sw   $v0, 0($sp)
	add  $sp, $sp, 4
putchar:
	lbu   $a0, 0($sp)
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

