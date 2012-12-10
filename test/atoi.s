	.text
main:
	jal  prog_main
	li   $v0, 10
	syscall
atoi:
	sub  $sp, $sp, 4
	sw   $fp, 0($sp)
	sub  $sp, $sp, 4
	move $fp, $sp
	sw   $ra, 0($fp)
	sub  $sp, $sp, 8
#begin block
#deb gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, -8
	sw   $a0, 0($sp)
#fin gauche
#partie2 de affect 

	sub  $sp, $sp, 4
	li   $a0, 0
	sw   $a0, 0($sp)
#null fin 

	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
#partie2 de affect fin 

	add  $sp, $sp, 4
loop_start_1:
#deb gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, -4
	sw   $a0, 0($sp)
#fin gauche
#partie2 de affect 

#deb gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, 8
	sw   $a0, 0($sp)
#fin gauche
#id deb
	sub  $sp, $sp, 4
	lw   $a0, 8($fp)
	add  $a0, $fp, 8
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
	lw   $a0, 0($sp)
	add  $a0, $a0, 4
	lw   $a1, 4($sp)
	sw   $a0, 0($a1)
	lw   $a0, 0($sp)
	sw   $a0, 4($sp)
	add  $sp, $sp, 4
	lw   $a0, 0($sp)
	lbu   $a0, 0($a0)
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
#partie2 de affect fin 

	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	beqz $a0, loop_end_1
#deb gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, -8
	sw   $a0, 0($sp)
#fin gauche
#partie2 de affect 

#deb binop
#deb binop
#deb binop
	sub  $sp, $sp, 4
	li   $a0, 10
	sw   $a0, 0($sp)
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, -8
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
	mul  $a0, $a0, 1
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	mul  $a0, $a0, $a1
	sw   $a0, 0($sp)
#fin binop
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, -4
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lbu   $a1, 0($a0)
	sb   $a1, 0($sp)
#id fin fin
	mul  $a0, $a0, 1
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, $a1
	sw   $a0, 0($sp)
#fin binop
	sub  $sp, $sp, 4
	li   $a0, 48
	sw   $a0, 0($sp)
	mul  $a0, $a0, 1
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sub  $a0, $a0, $a1
	sw   $a0, 0($sp)
#fin binop
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
#partie2 de affect fin 

	add  $sp, $sp, 4
	b    loop_start_1
loop_end_1:
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, -8
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
	lw   $t0, 0($sp)
	sw   $t0, 12($fp)
	add  $sp, $sp, 4
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 16
	jr   $ra
#fin block
test:
	sub  $sp, $sp, 4
	sw   $fp, 0($sp)
	sub  $sp, $sp, 4
	move $fp, $sp
	sw   $ra, 0($fp)
	sub  $sp, $sp, 0
#begin block
#deb binop
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, 12
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
#taille retour
	add  $sp, $sp, -4
#args 
#id deb
	sub  $sp, $sp, 4
	lw   $a0, 8($fp)
	add  $a0, $fp, 8
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
#args fin
	jal  atoi
	add  $sp, $sp, 4
	mul  $a0, $a0, 1
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	seq  $a0, $a0, $a1
	sw   $a0, 0($sp)
#fin binop
	add  $sp, $sp, 4
	bnez $a0, True_branch_1
#taille retour
	add  $sp, $sp, -4
#args 
	sub  $sp, $sp, 4
	li   $a0, 48
	sw   $a0, 0($sp)
#args fin
	jal  putchar
	add  $sp, $sp, 4
	add  $sp, $sp, 4
	b    Fin_du_branch_1
True_branch_1:
#taille retour
	add  $sp, $sp, -4
#args 
	sub  $sp, $sp, 4
	li   $a0, 49
	sw   $a0, 0($sp)
#args fin
	jal  putchar
	add  $sp, $sp, 4
	add  $sp, $sp, 4
Fin_du_branch_1:
#fin block
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
#begin block
#taille retour
	add  $sp, $sp, 0
#args 
	sub  $sp, $sp, 4
	li   $a0, 0
	sw   $a0, 0($sp)
#null fin 

	sub  $sp, $sp, 4
	la   $a0, String_const1
	sw   $a0, 0($sp)
#const str fin 

#args fin
	jal  test
	add  $sp, $sp, 4
	add  $sp, $sp, 0
#taille retour
	add  $sp, $sp, 0
#args 
	sub  $sp, $sp, 4
	li   $a0, 1
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	la   $a0, String_const2
	sw   $a0, 0($sp)
#const str fin 

#args fin
	jal  test
	add  $sp, $sp, 8
	add  $sp, $sp, 0
#taille retour
	add  $sp, $sp, 0
#args 
	sub  $sp, $sp, 4
	li   $a0, 42
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	la   $a0, String_const3
	sw   $a0, 0($sp)
#const str fin 

#args fin
	jal  test
	add  $sp, $sp, 8
	add  $sp, $sp, 0
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
	sub  $sp, $sp, 4
	li   $a0, 0
	sw   $a0, 0($sp)
#null fin 

	lw   $t0, 0($sp)
	sw   $t0, 8($fp)
	add  $sp, $sp, 4
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 8
	jr   $ra
#fin block
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
	sw   $v0, 4($sp)
	jr   $ra
	.data
String_const1:
	.asciiz "0"
String_const2:
	.asciiz "1"
String_const3:
	.asciiz "42"

