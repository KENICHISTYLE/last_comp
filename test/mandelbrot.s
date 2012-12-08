	.text
main:
	jal  prog_main
	li   $v0, 10
	syscall
add:
	sub  $sp, $sp, 4
	sw   $fp, 0($sp)
	sub  $sp, $sp, 4
	move $fp, $sp
	sw   $ra, 0($fp)
	sub  $sp, $sp, 0
	sub  $sp, $sp, 4
	lw   $a0, 12($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, 8($fp)
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, $a1
	sw   $a0, 0($sp)
	lw   $v0, 0($sp)
	add  $sp, $sp, 4
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 8
	jr   $ra
sub:
	sub  $sp, $sp, 4
	sw   $fp, 0($sp)
	sub  $sp, $sp, 4
	move $fp, $sp
	sw   $ra, 0($fp)
	sub  $sp, $sp, 0
	sub  $sp, $sp, 4
	lw   $a0, 12($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, 8($fp)
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sub  $a0, $a0, $a1
	sw   $a0, 0($sp)
	lw   $v0, 0($sp)
	add  $sp, $sp, 4
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 8
	jr   $ra
mul:
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
	lw   $a0, 12($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, 8($fp)
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	mul  $a0, $a0, $a1
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
	sub  $sp, $sp, 4
	li   $a0, 8192
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 2
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	div  $a0, $a0, $a1
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, $a1
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 8192
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	div  $a0, $a0, $a1
	sw   $a0, 0($sp)
	lw   $v0, 0($sp)
	add  $sp, $sp, 4
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 12
	jr   $ra
div:
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
	lw   $a0, 12($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 8192
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	mul  $a0, $a0, $a1
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
	sub  $sp, $sp, 4
	lw   $a0, 8($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 2
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	div  $a0, $a0, $a1
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, $a1
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, 8($fp)
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	div  $a0, $a0, $a1
	sw   $a0, 0($sp)
	lw   $v0, 0($sp)
	add  $sp, $sp, 4
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 12
	jr   $ra
of_int:
	sub  $sp, $sp, 4
	sw   $fp, 0($sp)
	sub  $sp, $sp, 4
	move $fp, $sp
	sw   $ra, 0($fp)
	sub  $sp, $sp, 0
	sub  $sp, $sp, 4
	lw   $a0, 8($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 8192
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	mul  $a0, $a0, $a1
	sw   $a0, 0($sp)
	lw   $v0, 0($sp)
	add  $sp, $sp, 4
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 8
	jr   $ra
iter:
	sub  $sp, $sp, 4
	sw   $fp, 0($sp)
	sub  $sp, $sp, 4
	move $fp, $sp
	sw   $ra, 0($fp)
	sub  $sp, $sp, 8
	sub  $sp, $sp, 4
	lw   $a0, 24($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 100
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	seq  $a0, $a0, $a1
	sw   $a0, 0($sp)
	add  $sp, $sp, 4
	bnez $a0, True_branch_1
	b    Fin_du_branch_1
True_branch_1:
	sub  $sp, $sp, 4
	li   $a0, 1
	sw   $a0, 0($sp)
	lw   $v0, 0($sp)
	add  $sp, $sp, 4
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 16
	jr   $ra
Fin_du_branch_1:
	sub  $sp, $sp, 4
	add  $a0, $fp, -8
	sw   $a0, 0($sp)
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	lw   $a0, 12($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, 12($fp)
	sw   $a0, 0($sp)
	jal  mul
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
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	lw   $a0, 8($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, 8($fp)
	sw   $a0, 0($sp)
	jal  mul
	add  $sp, $sp, 8
	sw   $v0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	lw   $a0, -8($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, -4($fp)
	sw   $a0, 0($sp)
	jal  add
	add  $sp, $sp, 8
	sw   $v0, 0($sp)
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	li   $a0, 4
	sw   $a0, 0($sp)
	jal  of_int
	add  $sp, $sp, 4
	sw   $v0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sgt  $a0, $a0, $a1
	sw   $a0, 0($sp)
	add  $sp, $sp, 4
	bnez $a0, True_branch_2
	b    Fin_du_branch_2
True_branch_2:
	sub  $sp, $sp, 4
	li   $a0, 0
	sw   $a0, 0($sp)
	lw   $v0, 0($sp)
	add  $sp, $sp, 4
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 16
	jr   $ra
Fin_du_branch_2:
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	lw   $a0, 24($fp)
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
	lw   $a0, 20($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, 16($fp)
	sw   $a0, 0($sp)
	add  $sp, $sp, -4
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	lw   $a0, -8($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, -4($fp)
	sw   $a0, 0($sp)
	jal  sub
	add  $sp, $sp, 8
	sw   $v0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, 20($fp)
	sw   $a0, 0($sp)
	jal  add
	add  $sp, $sp, 8
	sw   $v0, 0($sp)
	add  $sp, $sp, -4
	add  $sp, $sp, -4
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	li   $a0, 2
	sw   $a0, 0($sp)
	jal  of_int
	add  $sp, $sp, 4
	sw   $v0, 0($sp)
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	lw   $a0, 12($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, 8($fp)
	sw   $a0, 0($sp)
	jal  mul
	add  $sp, $sp, 8
	sw   $v0, 0($sp)
	jal  mul
	add  $sp, $sp, 8
	sw   $v0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, 16($fp)
	sw   $a0, 0($sp)
	jal  add
	add  $sp, $sp, 8
	sw   $v0, 0($sp)
	jal  iter
	add  $sp, $sp, 20
	sw   $v0, 0($sp)
	lw   $v0, 0($sp)
	add  $sp, $sp, 4
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 16
	jr   $ra
inside:
	sub  $sp, $sp, 4
	sw   $fp, 0($sp)
	sub  $sp, $sp, 4
	move $fp, $sp
	sw   $ra, 0($fp)
	sub  $sp, $sp, 0
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	li   $a0, 0
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, 12($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, 8($fp)
	sw   $a0, 0($sp)
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	li   $a0, 0
	sw   $a0, 0($sp)
	jal  of_int
	add  $sp, $sp, 0
	sw   $v0, 0($sp)
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	li   $a0, 0
	sw   $a0, 0($sp)
	jal  of_int
	add  $sp, $sp, 0
	sw   $v0, 0($sp)
	jal  iter
	add  $sp, $sp, 16
	sw   $v0, 0($sp)
	lw   $v0, 0($sp)
	add  $sp, $sp, 4
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 8
	jr   $ra
run:
	sub  $sp, $sp, 4
	sw   $fp, 0($sp)
	sub  $sp, $sp, 4
	move $fp, $sp
	sw   $ra, 0($fp)
	sub  $sp, $sp, 28
	sub  $sp, $sp, 4
	add  $a0, $fp, -28
	sw   $a0, 0($sp)
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	li   $a0, 2
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	sub  $a0, $zero, $a0
	sw   $a0, 0($sp)
	jal  of_int
	add  $sp, $sp, 4
	sw   $v0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	add  $a0, $fp, -24
	sw   $a0, 0($sp)
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	li   $a0, 1
	sw   $a0, 0($sp)
	jal  of_int
	add  $sp, $sp, 4
	sw   $v0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	add  $a0, $fp, -20
	sw   $a0, 0($sp)
	add  $sp, $sp, -4
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	lw   $a0, -24($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, -28($fp)
	sw   $a0, 0($sp)
	jal  sub
	add  $sp, $sp, 8
	sw   $v0, 0($sp)
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	li   $a0, 2
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, 8($fp)
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	mul  $a0, $a0, $a1
	sw   $a0, 0($sp)
	jal  of_int
	add  $sp, $sp, 4
	sw   $v0, 0($sp)
	jal  div
	add  $sp, $sp, 8
	sw   $v0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	add  $a0, $fp, -16
	sw   $a0, 0($sp)
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	li   $a0, 1
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	sub  $a0, $zero, $a0
	sw   $a0, 0($sp)
	jal  of_int
	add  $sp, $sp, 4
	sw   $v0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	add  $a0, $fp, -12
	sw   $a0, 0($sp)
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	li   $a0, 1
	sw   $a0, 0($sp)
	jal  of_int
	add  $sp, $sp, 4
	sw   $v0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	add  $a0, $fp, -8
	sw   $a0, 0($sp)
	add  $sp, $sp, -4
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	lw   $a0, -12($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, -16($fp)
	sw   $a0, 0($sp)
	jal  sub
	add  $sp, $sp, 8
	sw   $v0, 0($sp)
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	lw   $a0, 8($fp)
	sw   $a0, 0($sp)
	jal  of_int
	add  $sp, $sp, 4
	sw   $v0, 0($sp)
	jal  div
	add  $sp, $sp, 8
	sw   $v0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a0, -4($fp)
	sw   $a0, 0($sp)
	add  $sp, $sp, 4
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
	slt  $a0, $a0, $a1
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	beqz $a0, loop_end_1
	sub  $sp, $sp, 4
	add  $a0, $fp, 4
	sw   $a0, 0($sp)
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	lw   $a0, -16($fp)
	sw   $a0, 0($sp)
	add  $sp, $sp, -4
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	lw   $a0, -4($fp)
	sw   $a0, 0($sp)
	jal  of_int
	add  $sp, $sp, 4
	sw   $v0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, -8($fp)
	sw   $a0, 0($sp)
	jal  mul
	add  $sp, $sp, 8
	sw   $v0, 0($sp)
	jal  add
	add  $sp, $sp, 8
	sw   $v0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a0, 0($fp)
	sw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	add  $a0, $fp, 0
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
loop_start_2:
	sub  $sp, $sp, 4
	lw   $a0, 0($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 2
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, 8($fp)
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	mul  $a0, $a0, $a1
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	slt  $a0, $a0, $a1
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	beqz $a0, loop_end_2
	sub  $sp, $sp, 4
	add  $a0, $fp, 0
	sw   $a0, 0($sp)
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	lw   $a0, -28($fp)
	sw   $a0, 0($sp)
	add  $sp, $sp, -4
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	lw   $a0, 0($fp)
	sw   $a0, 0($sp)
	jal  of_int
	add  $sp, $sp, 4
	sw   $v0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, -20($fp)
	sw   $a0, 0($sp)
	jal  mul
	add  $sp, $sp, 8
	sw   $v0, 0($sp)
	jal  add
	add  $sp, $sp, 8
	sw   $v0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	lw   $a0, 0($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, 4($fp)
	sw   $a0, 0($sp)
	jal  inside
	add  $sp, $sp, 8
	sw   $v0, 0($sp)
	add  $sp, $sp, 4
	bnez $a0, True_branch_3
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	li   $a0, 49
	sw   $a0, 0($sp)
	jal  putchar
	add  $sp, $sp, 4
	sw   $v0, 0($sp)
	add  $sp, $sp, 4
	b    Fin_du_branch_3
True_branch_3:
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	li   $a0, 48
	sw   $a0, 0($sp)
	jal  putchar
	add  $sp, $sp, 4
	sw   $v0, 0($sp)
	add  $sp, $sp, 4
Fin_du_branch_3:
	sub  $sp, $sp, 4
	add  $a0, $fp, 0
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	lw   $a0, 0($fp)
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $a0, $a0, 1
	lw   $a1, 4($sp)
	sw   $a0, 0($a1)
	lw   $a0, 0($sp)
	sw   $a0, 4($sp)
	add  $sp, $sp, 4
	add  $sp, $sp, 4
	b    loop_start_2
loop_end_2:
	add  $sp, $sp, -4
	sub  $sp, $sp, 4
	li   $a0, 10
	sw   $a0, 0($sp)
	jal  putchar
	add  $sp, $sp, 4
	sw   $v0, 0($sp)
	add  $sp, $sp, 4
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
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 36
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
	li   $a0, 30
	sw   $a0, 0($sp)
	jal  run
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

