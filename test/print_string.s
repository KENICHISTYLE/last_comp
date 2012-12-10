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
	sub  $sp, $sp, 4
#begin block
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
	add  $a0, $a0, 1
	lw   $a1, 4($sp)
	sw   $a0, 0($a1)
	lw   $a0, 0($sp)
	sw   $a0, 4($sp)
	add  $sp, $sp, 4
	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	move $a1, $sp
	lbu   $t0, 0($a0)
	sb   $t0, 0($a1)
	lw   $a0, 4($sp)
	lw   $a1, 0($sp)
	add  $sp, $sp, 4
	sw   $a1, 0($a0)
	sw   $a1, 0($sp)
#partie2 de affect fin 

	lw   $a0, 0($sp)
	add  $sp, $sp, 4
	beqz $a0, loop_end_1
#taille retour
	add  $sp, $sp, -4
#args 
#id deb
	sub  $sp, $sp, 4
	add  $a0, $fp, -4
	sw   $a0, 0($sp)
	lbu   $a0, 0($sp)
	add  $sp, $sp, 4
	sub  $sp, $sp, 4
	lbu   $a1, 0($a0)
	sb   $a1, 0($sp)
#id fin fin
#args fin
	jal  putchar
	add  $sp, $sp, 4
	add  $sp, $sp, 4
	b    loop_start_1
loop_end_1:
#fin block
	lw   $ra, 0($fp)
	lw   $fp, 4($fp)
	add  $sp, $sp, 12
	jr   $ra
print_endline:
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
	jal  print_string
	add  $sp, $sp, 4
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
	la   $a0, String_const1
	sw   $a0, 0($sp)
#const str fin 

#args fin
	jal  print_endline
	add  $sp, $sp, 4
	add  $sp, $sp, 0
#taille retour
	add  $sp, $sp, 0
#args 
	sub  $sp, $sp, 4
	la   $a0, String_const2
	sw   $a0, 0($sp)
#const str fin 

#args fin
	jal  print_string
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
String_const1:
	.asciiz "foo"
String_const2:
	.asciiz "hello world\n"

