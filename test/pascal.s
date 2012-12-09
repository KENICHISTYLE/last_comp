	.text
main:
	jal  prog_main
	li   $v0, 10
	syscall
print_row:
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
	li   $a0, 0
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
loop_start_1:
	sub  $sp, $sp, 4
	lw   $a0, -4($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, 8($fp)
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sle  $a0, $a0, $a1
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	beqz $a0, loop_end_1
	sub  $sp, $sp, 4
	lw   $a0, 12($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, -4($fp)
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, $a1
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	lw   $a0, 0($a0)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 0
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sne  $a0, $a0, $a1
	sw   $a0, 0($sp)
	add  $sp, $sp, 4
	bnez $a0, True_branch_1
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	li   $a0, 46
	sw   $a0, 0($sp)
	jal  putchar
	add  $sp, $sp, 4
	add  $sp, $sp, 4
	b    Fin_du_branch_1
True_branch_1:
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	li   $a0, 42
	sw   $a0, 0($sp)
	jal  putchar
	add  $sp, $sp, 4
	add  $sp, $sp, 4
Fin_du_branch_1:
	sub  $sp, $sp, 4
	add  $a0, $fp, -4
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, -4($fp)
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $a0, $a0, 1
	lw   $a1, 4($sp)
	sw   $a0, 0($a1)
	lw   $a0, 0($sp)
	sw   $a0, 4($sp)
	add  $sp, $sp, 4
	add  $sp, $sp, 4
	b    loop_start_1
loop_end_1:
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
compute_row:
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
	lw   $a0, 8($fp)
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
loop_start_2:
	sub  $sp, $sp, 4
	lw   $a0, -4($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 0
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sgt  $a0, $a0, $a1
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	beqz $a0, loop_end_2
	sub  $sp, $sp, 4
	lw   $a0, 12($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, -4($fp)
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, $a1
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, 12($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, -4($fp)
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, $a1
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	lw   $a0, 0($a0)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, 12($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, -4($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 1
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sub  $a0, $a0, $a1
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, $a1
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	lw   $a0, 0($a0)
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, $a1
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 7
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	rem  $a0, $a0, $a1
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	add  $a0, $fp, -4
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, -4($fp)
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	sub  $a0, $a0, 1
	lw   $a1, 4($sp)
	sw   $a0, 0($a1)
	lw   $a0, 0($sp)
	sw   $a0, 4($sp)
	add  $sp, $sp, 4
	add  $sp, $sp, 4
	b    loop_start_2
loop_end_2:
	sub  $sp, $sp, 4
	lw   $a0, 12($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 0
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, $a1
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 1
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 12
	jr   $ra
pascal:
	sub  $sp, $sp, 4
	sw   $fp, 0($sp)
	sub  $sp, $sp, 4
	move $fp, $sp
	sw   $ra, 0($fp)
	sub  $sp, $sp, 8
	sub  $sp, $sp, 4
	add  $a0, $fp, -4
	sw   $a0, 0($sp)
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	lw   $a0, 8($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 1
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, $a1
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 4
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	mul  $a0, $a0, $a1
	sw   $a0, 0($sp)
	jal  sbrk
	add  $sp, $sp, 4
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	add  $a0, $fp, -8
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 0
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
loop_start_3:
	sub  $sp, $sp, 4
	lw   $a0, -8($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, 8($fp)
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	slt  $a0, $a0, $a1
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	beqz $a0, loop_end_3
	sub  $sp, $sp, 4
	lw   $a0, -4($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, -8($fp)
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, $a1
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 0
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
	add  $sp, $sp, 0
	sub  $sp, $sp, 4
	lw   $a0, -4($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, -8($fp)
	sw   $a0, 0($sp)
	jal  compute_row
	add  $sp, $sp, 8
	add  $sp, $sp, 0
	add  $sp, $sp, 0
	sub  $sp, $sp, 4
	lw   $a0, -4($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, -8($fp)
	sw   $a0, 0($sp)
	jal  print_row
	add  $sp, $sp, 8
	add  $sp, $sp, 0
	sub  $sp, $sp, 4
	add  $a0, $fp, -8
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, -8($fp)
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $a0, $a0, 1
	lw   $a1, 4($sp)
	sw   $a0, 0($a1)
	lw   $a0, 0($sp)
	sw   $a0, 4($sp)
	add  $sp, $sp, 4
	add  $sp, $sp, 4
	b    loop_start_3
loop_end_3:
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
	sub  $sp, $sp, 0
	add  $sp, $sp, 0
	sub  $sp, $sp, 4
	li   $a0, 42
	sw   $a0, 0($sp)
	jal  pascal
	add  $sp, $sp, 4
	add  $sp, $sp, 0
	sub  $sp, $sp, 4
	li   $a0, 0
	sw   $a0, 0($sp)
	lw   $t0, 0($sp)
	sw   $t0, 8($fp)
	add  $sp, $sp, 4
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 8
	jr   $ra
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 8
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

