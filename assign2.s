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
	sub  $sp, $sp, 0
#begin block
#deb gauche
	sub  $sp, $sp, 4
	la   $a0, s1_1
	sw   $a0, 0($sp)
#fin gauche
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, 0
	sub  $sp, $sp, 4
	sw   $a0, 0($sp)
#partie2 de affect 

	sub  $sp, $sp, 4
	li   $a0, 65
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
#partie2 de affect fin 

	add  $sp, $sp, 4
#deb gauche
	sub  $sp, $sp, 4
	la   $a0, s1_1
	sw   $a0, 0($sp)
#fin gauche
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, 4
	sub  $sp, $sp, 4
	sw   $a0, 0($sp)
#partie2 de affect 

	sub  $sp, $sp, 4
	li   $a0, 66
	sw   $a0, 0($sp)
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
#deb gauche
	sub  $sp, $sp, 4
	la   $a0, s1_1
	sw   $a0, 0($sp)
#fin gauche
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, 0
	sub  $sp, $sp, 4
	move $a1, $sp
	lw   $t0, 0($a0)
	sw   $t0, 0($a1)
#args fin
	jal  putchar
	add  $sp, $sp, 4
	add  $sp, $sp, 4
#taille retour
	add  $sp, $sp, -4
#args 
#deb gauche
	sub  $sp, $sp, 4
	la   $a0, s1_1
	sw   $a0, 0($sp)
#fin gauche
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, 4
	sub  $sp, $sp, 4
	move $a1, $sp
	lw   $t0, 0($a0)
	sw   $t0, 0($a1)
#args fin
	jal  putchar
	add  $sp, $sp, 4
	add  $sp, $sp, 4
#deb gauche
	sub  $sp, $sp, 4
	la   $a0, s2_2
	sw   $a0, 0($sp)
#fin gauche
#partie2 de affect 

#id deb
	sub  $sp, $sp, 4
	la   $a0, s1_1
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 8
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
	lw   $a1, 4($a0)
	sw   $a1, 4($sp)
#id fin fin
	add  $sp, $sp, 8
#taille retour
	add  $sp, $sp, -4
#args 
#deb gauche
	sub  $sp, $sp, 4
	la   $a0, s2_2
	sw   $a0, 0($sp)
#fin gauche
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, 0
	sub  $sp, $sp, 4
	move $a1, $sp
	lw   $t0, 0($a0)
	sw   $t0, 0($a1)
#args fin
	jal  putchar
	add  $sp, $sp, 4
	add  $sp, $sp, 4
#taille retour
	add  $sp, $sp, -4
#args 
#deb gauche
	sub  $sp, $sp, 4
	la   $a0, s2_2
	sw   $a0, 0($sp)
#fin gauche
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, 4
	sub  $sp, $sp, 4
	move $a1, $sp
	lw   $t0, 0($a0)
	sw   $t0, 0($a1)
#args fin
	jal  putchar
	add  $sp, $sp, 4
	add  $sp, $sp, 4
#deb gauche
	sub  $sp, $sp, 4
	la   $a0, s1_1
	sw   $a0, 0($sp)
#fin gauche
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, 0
	sub  $sp, $sp, 4
	sw   $a0, 0($sp)
#partie2 de affect 

	sub  $sp, $sp, 4
	li   $a0, 67
	sw   $a0, 0($sp)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
#partie2 de affect fin 

	add  $sp, $sp, 4
#deb gauche
	sub  $sp, $sp, 4
	la   $a0, s1_1
	sw   $a0, 0($sp)
#fin gauche
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, 4
	sub  $sp, $sp, 4
	sw   $a0, 0($sp)
#partie2 de affect 

	sub  $sp, $sp, 4
	li   $a0, 68
	sw   $a0, 0($sp)
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
#deb gauche
	sub  $sp, $sp, 4
	la   $a0, s1_1
	sw   $a0, 0($sp)
#fin gauche
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, 0
	sub  $sp, $sp, 4
	move $a1, $sp
	lw   $t0, 0($a0)
	sw   $t0, 0($a1)
#args fin
	jal  putchar
	add  $sp, $sp, 4
	add  $sp, $sp, 4
#taille retour
	add  $sp, $sp, -4
#args 
#deb gauche
	sub  $sp, $sp, 4
	la   $a0, s1_1
	sw   $a0, 0($sp)
#fin gauche
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, 4
	sub  $sp, $sp, 4
	move $a1, $sp
	lw   $t0, 0($a0)
	sw   $t0, 0($a1)
#args fin
	jal  putchar
	add  $sp, $sp, 4
	add  $sp, $sp, 4
#taille retour
	add  $sp, $sp, -4
#args 
#deb gauche
	sub  $sp, $sp, 4
	la   $a0, s2_2
	sw   $a0, 0($sp)
#fin gauche
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, 0
	sub  $sp, $sp, 4
	move $a1, $sp
	lw   $t0, 0($a0)
	sw   $t0, 0($a1)
#args fin
	jal  putchar
	add  $sp, $sp, 4
	add  $sp, $sp, 4
#taille retour
	add  $sp, $sp, -4
#args 
#deb gauche
	sub  $sp, $sp, 4
	la   $a0, s2_2
	sw   $a0, 0($sp)
#fin gauche
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, 4
	sub  $sp, $sp, 4
	move $a1, $sp
	lw   $t0, 0($a0)
	sw   $t0, 0($a1)
#args fin
	jal  putchar
	add  $sp, $sp, 4
	add  $sp, $sp, 4
#deb gauche
	sub  $sp, $sp, 4
	la   $a0, s1_1
	sw   $a0, 0($sp)
#fin gauche
#partie2 de affect 

#id deb
	sub  $sp, $sp, 4
	la   $a0, s2_2
	sw   $a0, 0($sp)
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 8
	lw   $a1, 0($a0)
	sw   $a1, 0($sp)
	lw   $a1, 4($a0)
	sw   $a1, 4($sp)
#id fin fin
	add  $sp, $sp, 8
#taille retour
	add  $sp, $sp, -4
#args 
#deb gauche
	sub  $sp, $sp, 4
	la   $a0, s1_1
	sw   $a0, 0($sp)
#fin gauche
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, 0
	sub  $sp, $sp, 4
	move $a1, $sp
	lw   $t0, 0($a0)
	sw   $t0, 0($a1)
#args fin
	jal  putchar
	add  $sp, $sp, 4
	add  $sp, $sp, 4
#taille retour
	add  $sp, $sp, -4
#args 
#deb gauche
	sub  $sp, $sp, 4
	la   $a0, s1_1
	sw   $a0, 0($sp)
#fin gauche
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, 4
	sub  $sp, $sp, 4
	move $a1, $sp
	lw   $t0, 0($a0)
	sw   $t0, 0($a1)
#args fin
	jal  putchar
	add  $sp, $sp, 4
	add  $sp, $sp, 4
#taille retour
	add  $sp, $sp, -4
#args 
#deb gauche
	sub  $sp, $sp, 4
	la   $a0, s2_2
	sw   $a0, 0($sp)
#fin gauche
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, 0
	sub  $sp, $sp, 4
	move $a1, $sp
	lw   $t0, 0($a0)
	sw   $t0, 0($a1)
#args fin
	jal  putchar
	add  $sp, $sp, 4
	add  $sp, $sp, 4
#taille retour
	add  $sp, $sp, -4
#args 
#deb gauche
	sub  $sp, $sp, 4
	la   $a0, s2_2
	sw   $a0, 0($sp)
#fin gauche
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	add  $a0, $a0, 4
	sub  $sp, $sp, 4
	move $a1, $sp
	lw   $t0, 0($a0)
	sw   $t0, 0($a1)
#args fin
	jal  putchar
	add  $sp, $sp, 4
	add  $sp, $sp, 4
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
	.align 4
s1_1:
	.space 8
	.align 4
s2_2:
	.space 8

