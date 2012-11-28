	.text
f:
	sub  $sp, $sp, 0
	sw   $fp, 4($sp)
	add  $fp, $fp, -4
	sw   $ra, -4($fp)
x <= 	lw   $ra, -4($fp)
	sub  $sp, $sp, 0
	jr   $ra
main:
	sub  $sp, $sp, 24
	sw   $fp, -20($sp)
	add  $fp, $fp, -4
	sw   $ra, -4($fp)
i <= k <= 	sub  $sp, $sp, 4
	li   $a0, 1
	sw   $a0, 0($sp)
i <= 	sub  $sp, $sp, 4
	lw   $a0, -16($fp)
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 1
	sw   $a0, 0($sp)
	sub  $sp, $sp, 4
	li   $a0, 1
	sw   $a0, 0($sp)
	bnez $a0, True_branch_1
i <= 	sub  $sp, $sp, 4
	li   $a0, 1
	sw   $a0, 0($sp)
	b    False_branch_1
True_branch_1:
i <= 	sub  $sp, $sp, 4
	li   $a0, 2
	sw   $a0, 0($sp)
False_branch_1:
loop_start_1:
	beqz $a0, loop_end_1
i <= op un 	b    loop_start_1
loop_end_1:
	sub  $sp, $sp, 4
	lw   $a0, -12($fp)
	sw   $a0, 0($sp)
loop_start_2:
	beqz $a0, loop_end_2
op un 	b    loop_start_2
loop_end_2:
Expressionchaine <=  
 
 ma chaine 
 
 VG <= 	sub  $sp, $sp, 4
	lw   $a0, -12($fp)
	sw   $a0, 0($sp)
	move $a0, $v0
	lw   $ra, -4($fp)
	sub  $sp, $sp, 0
	jr   $ra
	.data
i:
	.word 0

