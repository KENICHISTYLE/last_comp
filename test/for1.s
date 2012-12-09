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
	sub  $sp, $sp, 8
#begin block
#deb gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, -4
	sw   $a0, 0($sp)
#fin gauche
	sub  $sp, $sp, 4
	li   $a0, 0
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
#deb gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, -8
	sw   $a0, 0($sp)
#fin gauche
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
	add  $a0, $fp, -8
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 10
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	slt  $a0, $a0, $a1
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	beqz $a0, loop_end_1
#deb gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, 12
	sw   $a0, 0($sp)
#fin gauche
	sub  $sp, $sp, 4
	li   $a0, 10
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
	add  $sp, $sp, 4
loop_start_2:
	sub  $sp, $sp, 4
	add  $a0, $fp, 12
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
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
#deb gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, -4
	sw   $a0, 0($sp)
#fin gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, -4
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
	lw   $a0, 0($sp)
	add  $a0, $a0, 1
	lw   $a1, 4($sp)
	sw   $a0, 0($a1)
	sw   $a0, 4($sp)
	add  $sp, $sp, 4
	add  $sp, $sp, 4
#deb gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, 12
	sw   $a0, 0($sp)
#fin gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, 12
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
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
#deb gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, -8
	sw   $a0, 0($sp)
#fin gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, -8
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
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
	sub  $sp, $sp, 4
	add  $a0, $fp, -4
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
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
#taille retour
	add  $sp, $sp, -4
#args 
	sub  $sp, $sp, 4
	li   $a0, 33
	sw   $a0, 0($sp)
#args fin
	jal  putchar
	add  $sp, $sp, 4
	add  $sp, $sp, 4
Fin_du_branch_1:
#taille retour
	add  $sp, $sp, -4
#args 
	sub  $sp, $sp, 4
	li   $a0, 10
	sw   $a0, 0($sp)
#args fin
	jal  putchar
	add  $sp, $sp, 4
	add  $sp, $sp, 4
#fin block
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 16
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
	jr   $ra
	.data

