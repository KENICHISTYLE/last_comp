	.text
f:
	sub  $sp, $sp, 0
	sw   $fp, 4($sp)
	add  $fp, $fp, -4
	sw   $ra, -4($fp)
x <= Expression pas encore faite
 	lw   $ra, -4($fp)
	sub  $sp, $sp, 0
	jr   $ra
main:
	sub  $sp, $sp, 24
	sw   $fp, -20($sp)
	add  $fp, $fp, -4
	sw   $ra, -4($fp)
i <= Expression pas encore faite
 k <= 1i <= Expression pas encore faite
 1	bnez $a0, True_branch_1
i <= 1	b    False_branch_1
True_branch_1:
i <= 2False_branch_1:
loop_start_1:
Expression pas encore faite
 	beqz $a0, loop_end_1
i <= Expression pas encore faite
  
 operateur unaire pas encore gere 
 	b    loop_start_1
loop_end_1:
Expression pas encore faite
 loop_start_2:
Expression pas encore faite
 	beqz $a0, loop_end_2
 
 operateur unaire pas encore gere 
 	b    loop_start_2
loop_end_2:
Expression pas encore faite
 chaine <= " 
 
 ma chaine 
 
 "VG <= Expression pas encore faite
 	move $a0, $v0
	lw   $ra, -4($fp)
	sub  $sp, $sp, 0
	jr   $ra
	.data
i:
	.word 0

