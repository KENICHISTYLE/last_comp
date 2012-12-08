	.text
main:
	jal  prog_main
	li   $v0, 10
	syscall
print_string:
	sub  $sp, $sp, 4
	sw   $fp, 0($sp)
	sub  $sp, $sp, 4
	move $fp, $sp
	sw   $ra, 0($fp)
	sub  $sp, $sp, 1
loop_start_1:
	sub  $sp, $sp, 4
	add  $a0, $fp, -4
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	add  $a0, $fp, 8
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, 8($fp)
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $a0, $a0, 4
	lw   $a1, 4($sp)
	sw   $a0, 0($a1)
	lw   $a0, 0($sp)
	sw   $a0, 4($sp)
	add  $sp, $sp, 4
	lw   $a0, 0($sp)
	lw   $a0, 0($a0)
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	beqz $a0, loop_end_1
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	lw   $a0, -4($fp)
	sw   $a0, 0($sp)
	jal  putchar
	add  $sp, $sp, 1
	sw   $v0, 0($sp)
	add  $sp, $sp, 4
	b    loop_start_1
loop_end_1:
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 9
	jr   $ra
print_endline:
	sub  $sp, $sp, 4
	sw   $fp, 0($sp)
	sub  $sp, $sp, 4
	move $fp, $sp
	sw   $ra, 0($fp)
	sub  $sp, $sp, 0
	add  $sp, $sp, 0
	sub  $sp, $sp, 4
	lw   $a0, 8($fp)
	sw   $a0, 0($sp)
	jal  print_string
	add  $sp, $sp, 4
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
prog_main:
	sub  $sp, $sp, 4
	sw   $fp, 0($sp)
	sub  $sp, $sp, 4
	move $fp, $sp
	sw   $ra, 0($fp)
	sub  $sp, $sp, 0
	add  $sp, $sp, 0
	sub  $sp, $sp, 4
	la   $a0, foo
	sw   $a0, 0($sp)
	jal  print_endline
	add  $sp, $sp, 4
	add  $sp, $sp, 0
	add  $sp, $sp, 0
	sub  $sp, $sp, 4
	la   $a0, hello world

	sw   $a0, 0($sp)
	jal  print_string
	add  $sp, $sp, 4
	add  $sp, $sp, 0
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

