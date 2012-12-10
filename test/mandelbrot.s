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
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, 8
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
	add  $a0, $a0, $a1
	sw   $a0, 0($sp)
#fin binop
	lw   $t0, 0($sp)
	sw   $t0, 16($fp)
	add  $sp, $sp, 4
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 8
	jr   $ra
#fin block
sub:
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
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, 8
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
	sub  $a0, $a0, $a1
	sw   $a0, 0($sp)
#fin binop
	lw   $t0, 0($sp)
	sw   $t0, 16($fp)
	add  $sp, $sp, 4
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 8
	jr   $ra
#fin block
mul:
	sub  $sp, $sp, 4
	sw   $fp, 0($sp)
	sub  $sp, $sp, 4
	move $fp, $sp
	sw   $ra, 0($fp)
	sub  $sp, $sp, 4
#begin block
#deb gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, -4
	sw   $a0, 0($sp)
#fin gauche
#partie2 de affect 

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
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, 8
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
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
#partie2 de affect fin 

	add  $sp, $sp, 4
#deb binop
#deb binop
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, -4
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
#deb binop
	sub  $sp, $sp, 4
	li   $a0, 8192
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 2
	sw   $a0, 0($sp)
	mul  $a0, $a0, 1
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	div  $a0, $a0, $a1
	sw   $a0, 0($sp)
#fin binop
	mul  $a0, $a0, 1
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, $a1
	sw   $a0, 0($sp)
#fin binop
	sub  $sp, $sp, 4
	li   $a0, 8192
	sw   $a0, 0($sp)
	mul  $a0, $a0, 1
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	div  $a0, $a0, $a1
	sw   $a0, 0($sp)
#fin binop
	lw   $t0, 0($sp)
	sw   $t0, 16($fp)
	add  $sp, $sp, 4
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 12
	jr   $ra
#fin block
div:
	sub  $sp, $sp, 4
	sw   $fp, 0($sp)
	sub  $sp, $sp, 4
	move $fp, $sp
	sw   $ra, 0($fp)
	sub  $sp, $sp, 4
#begin block
#deb gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, -4
	sw   $a0, 0($sp)
#fin gauche
#partie2 de affect 

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
	sub  $sp, $sp, 4
	li   $a0, 8192
	sw   $a0, 0($sp)
	mul  $a0, $a0, 1
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	mul  $a0, $a0, $a1
	sw   $a0, 0($sp)
#fin binop
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
#partie2 de affect fin 

	add  $sp, $sp, 4
#deb binop
#deb binop
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, -4
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
#deb binop
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, 8
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
	sub  $sp, $sp, 4
	li   $a0, 2
	sw   $a0, 0($sp)
	mul  $a0, $a0, 1
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	div  $a0, $a0, $a1
	sw   $a0, 0($sp)
#fin binop
	mul  $a0, $a0, 1
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, $a1
	sw   $a0, 0($sp)
#fin binop
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, 8
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
	div  $a0, $a0, $a1
	sw   $a0, 0($sp)
#fin binop
	lw   $t0, 0($sp)
	sw   $t0, 16($fp)
	add  $sp, $sp, 4
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 12
	jr   $ra
#fin block
of_int:
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
	add  $a0, $fp, 8
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
	sub  $sp, $sp, 4
	li   $a0, 8192
	sw   $a0, 0($sp)
	mul  $a0, $a0, 1
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	mul  $a0, $a0, $a1
	sw   $a0, 0($sp)
#fin binop
	lw   $t0, 0($sp)
	sw   $t0, 12($fp)
	add  $sp, $sp, 4
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 8
	jr   $ra
#fin block
iter:
	sub  $sp, $sp, 4
	sw   $fp, 0($sp)
	sub  $sp, $sp, 4
	move $fp, $sp
	sw   $ra, 0($fp)
	sub  $sp, $sp, 8
#begin block
#deb binop
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, 24
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
	sub  $sp, $sp, 4
	li   $a0, 100
	sw   $a0, 0($sp)
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
	b    Fin_du_branch_1
True_branch_1:
	sub  $sp, $sp, 4
	li   $a0, 1
	sw   $a0, 0($sp)
	lw   $t0, 0($sp)
	sw   $t0, 28($fp)
	add  $sp, $sp, 4
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 16
	jr   $ra
Fin_du_branch_1:
#deb gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, -8
	sw   $a0, 0($sp)
#fin gauche
#partie2 de affect 

#taille retour
	add  $sp, $sp, -4
#args 
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
#args fin
	jal  mul
	add  $sp, $sp, 8
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
#partie2 de affect fin 

	add  $sp, $sp, 4
#deb gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, -4
	sw   $a0, 0($sp)
#fin gauche
#partie2 de affect 

#taille retour
	add  $sp, $sp, -4
#args 
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, 8
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, 8
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
#args fin
	jal  mul
	add  $sp, $sp, 8
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
#partie2 de affect fin 

	add  $sp, $sp, 4
#deb binop
#taille retour
	add  $sp, $sp, -4
#args 
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
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, -4
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
#args fin
	jal  add
	add  $sp, $sp, 8
#taille retour
	add  $sp, $sp, -4
#args 
	sub  $sp, $sp, 4
	li   $a0, 4
	sw   $a0, 0($sp)
#args fin
	jal  of_int
	add  $sp, $sp, 4
	mul  $a0, $a0, 1
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sgt  $a0, $a0, $a1
	sw   $a0, 0($sp)
#fin binop
	add  $sp, $sp, 4
	bnez $a0, True_branch_2
	b    Fin_du_branch_2
True_branch_2:
	sub  $sp, $sp, 4
	li   $a0, 0
	sw   $a0, 0($sp)
#null fin 

	lw   $t0, 0($sp)
	sw   $t0, 28($fp)
	add  $sp, $sp, 4
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 16
	jr   $ra
Fin_du_branch_2:
#taille retour
	add  $sp, $sp, -4
#args 
#deb binop
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, 24
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
	sub  $sp, $sp, 4
	li   $a0, 1
	sw   $a0, 0($sp)
	mul  $a0, $a0, 1
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, $a1
	sw   $a0, 0($sp)
#fin binop
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, 20
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, 16
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
#taille retour
	add  $sp, $sp, -4
#args 
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
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, -4
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
#args fin
	jal  sub
	add  $sp, $sp, 8
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, 20
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
#args fin
	jal  add
	add  $sp, $sp, 8
#taille retour
	add  $sp, $sp, -4
#args 
#taille retour
	add  $sp, $sp, -4
#args 
#taille retour
	add  $sp, $sp, -4
#args 
	sub  $sp, $sp, 4
	li   $a0, 2
	sw   $a0, 0($sp)
#args fin
	jal  of_int
	add  $sp, $sp, 4
#taille retour
	add  $sp, $sp, -4
#args 
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
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, 8
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
#args fin
	jal  mul
	add  $sp, $sp, 8
#args fin
	jal  mul
	add  $sp, $sp, 8
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, 16
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
#args fin
	jal  add
	add  $sp, $sp, 8
#args fin
	jal  iter
	add  $sp, $sp, 20
	lw   $t0, 0($sp)
	sw   $t0, 28($fp)
	add  $sp, $sp, 4
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 16
	jr   $ra
#fin block
inside:
	sub  $sp, $sp, 4
	sw   $fp, 0($sp)
	sub  $sp, $sp, 4
	move $fp, $sp
	sw   $ra, 0($fp)
	sub  $sp, $sp, 0
#begin block
#taille retour
	add  $sp, $sp, -4
#args 
	sub  $sp, $sp, 4
	li   $a0, 0
	sw   $a0, 0($sp)
#null fin 

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
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, 8
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
	sub  $sp, $sp, 4
	li   $a0, 0
	sw   $a0, 0($sp)
#null fin 

#args fin
	jal  of_int
	add  $sp, $sp, 0
#taille retour
	add  $sp, $sp, -4
#args 
	sub  $sp, $sp, 4
	li   $a0, 0
	sw   $a0, 0($sp)
#null fin 

#args fin
	jal  of_int
	add  $sp, $sp, 0
#args fin
	jal  iter
	add  $sp, $sp, 16
	lw   $t0, 0($sp)
	sw   $t0, 16($fp)
	add  $sp, $sp, 4
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 8
	jr   $ra
#fin block
run:
	sub  $sp, $sp, 4
	sw   $fp, 0($sp)
	sub  $sp, $sp, 4
	move $fp, $sp
	sw   $ra, 0($fp)
	sub  $sp, $sp, 28
#begin block
#deb gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, -28
	sw   $a0, 0($sp)
#fin gauche
#partie2 de affect 

#taille retour
	add  $sp, $sp, -4
#args 
	sub  $sp, $sp, 4
	li   $a0, 2
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	sub  $a0, $zero, $a0
	sw   $a0, 0($sp)
#args fin
	jal  of_int
	add  $sp, $sp, 4
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
#partie2 de affect fin 

	add  $sp, $sp, 4
#deb gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, -24
	sw   $a0, 0($sp)
#fin gauche
#partie2 de affect 

#taille retour
	add  $sp, $sp, -4
#args 
	sub  $sp, $sp, 4
	li   $a0, 1
	sw   $a0, 0($sp)
#args fin
	jal  of_int
	add  $sp, $sp, 4
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
#partie2 de affect fin 

	add  $sp, $sp, 4
#deb gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, -20
	sw   $a0, 0($sp)
#fin gauche
#partie2 de affect 

#taille retour
	add  $sp, $sp, -4
#args 
#taille retour
	add  $sp, $sp, -4
#args 
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, -24
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, -28
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
#args fin
	jal  sub
	add  $sp, $sp, 8
#taille retour
	add  $sp, $sp, -4
#args 
#deb binop
	sub  $sp, $sp, 4
	li   $a0, 2
	sw   $a0, 0($sp)
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, 8
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
#args fin
	jal  of_int
	add  $sp, $sp, 4
#args fin
	jal  div
	add  $sp, $sp, 8
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
#partie2 de affect fin 

	add  $sp, $sp, 4
#deb gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, -16
	sw   $a0, 0($sp)
#fin gauche
#partie2 de affect 

#taille retour
	add  $sp, $sp, -4
#args 
	sub  $sp, $sp, 4
	li   $a0, 1
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	sub  $a0, $zero, $a0
	sw   $a0, 0($sp)
#args fin
	jal  of_int
	add  $sp, $sp, 4
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
#partie2 de affect fin 

	add  $sp, $sp, 4
#deb gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, -12
	sw   $a0, 0($sp)
#fin gauche
#partie2 de affect 

#taille retour
	add  $sp, $sp, -4
#args 
	sub  $sp, $sp, 4
	li   $a0, 1
	sw   $a0, 0($sp)
#args fin
	jal  of_int
	add  $sp, $sp, 4
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
#partie2 de affect fin 

	add  $sp, $sp, 4
#deb gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, -8
	sw   $a0, 0($sp)
#fin gauche
#partie2 de affect 

#taille retour
	add  $sp, $sp, -4
#args 
#taille retour
	add  $sp, $sp, -4
#args 
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, -12
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, -16
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
#args fin
	jal  sub
	add  $sp, $sp, 8
#taille retour
	add  $sp, $sp, -4
#args 
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, 8
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
#args fin
	jal  of_int
	add  $sp, $sp, 4
#args fin
	jal  div
	add  $sp, $sp, 8
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
#partie2 de affect fin 

	add  $sp, $sp, 4
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, -4
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
	add  $sp, $sp, 4
#deb gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, -4
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
#deb binop
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, -4
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, 8
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
	slt  $a0, $a0, $a1
	sw   $a0, 0($sp)
#fin binop
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	beqz $a0, loop_end_1
#deb gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, 32
	sw   $a0, 0($sp)
#fin gauche
#partie2 de affect 

#taille retour
	add  $sp, $sp, -4
#args 
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, -16
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
#taille retour
	add  $sp, $sp, -4
#args 
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, -4
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
#args fin
	jal  of_int
	add  $sp, $sp, 4
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
#args fin
	jal  mul
	add  $sp, $sp, 8
#args fin
	jal  add
	add  $sp, $sp, 8
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
#partie2 de affect fin 

	add  $sp, $sp, 4
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, 28
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
	add  $sp, $sp, 4
#deb gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, 28
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
loop_start_2:
#deb binop
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, 28
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
#deb binop
	sub  $sp, $sp, 4
	li   $a0, 2
	sw   $a0, 0($sp)
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, 8
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
	mul  $a0, $a0, 1
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	slt  $a0, $a0, $a1
	sw   $a0, 0($sp)
#fin binop
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	beqz $a0, loop_end_2
#deb gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, 28
	sw   $a0, 0($sp)
#fin gauche
#partie2 de affect 

#taille retour
	add  $sp, $sp, -4
#args 
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, -28
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
#taille retour
	add  $sp, $sp, -4
#args 
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, 28
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
#args fin
	jal  of_int
	add  $sp, $sp, 4
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, -20
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
#args fin
	jal  mul
	add  $sp, $sp, 8
#args fin
	jal  add
	add  $sp, $sp, 8
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
#partie2 de affect fin 

	add  $sp, $sp, 4
#taille retour
	add  $sp, $sp, -4
#args 
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, 28
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, 32
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
#args fin
	jal  inside
	add  $sp, $sp, 8
	add  $sp, $sp, 4
	bnez $a0, True_branch_3
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
	b    Fin_du_branch_3
True_branch_3:
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
Fin_du_branch_3:
	add  $sp, $sp, 4
#deb gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, 28
	sw   $a0, 0($sp)
#fin gauche
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, 28
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
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
	add  $sp, $sp, 8
#deb gauche
	sub  $sp, $sp, 4
	add  $a0, $fp, -4
	sw   $a0, 0($sp)
#fin gauche
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, -4
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
#id fin fin
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
#fin block
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
#begin block
#taille retour
	add  $sp, $sp, 0
#args 
	sub  $sp, $sp, 4
	li   $a0, 30
	sw   $a0, 0($sp)
#args fin
	jal  run
	add  $sp, $sp, 4
	add  $sp, $sp, 0
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

