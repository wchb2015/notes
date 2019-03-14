		.data 0x10010000
var1:	.word 1	# var1 is a word (32 bit) with the ..
					# initial value 1
var2:	.word 4	# var1 is a word (32 bit) with the ..
					# initial value 4
var3:	.word -2018	# var1 is a word (32 bit) with the ..
					# initial value -2018


		.text
		.globl main
main:	addu $s0, $ra, $0# save $31 in $16 
		
		lw $t0,	var1
		lw $t1, var2
		lw $t2, var3

		slt $t3, $t0,$t1 #if ($t0<$t1) $t3 = 1; else $t3 = 0;
		bgtz $t3, label #jump at label if $t3 is greater than zero

		label:
		sw $t1, var1
		sw $t0, var2		

# restore now the return address in $ra and return from main
		addu $ra, $0, $s0 # return address back in $31
		jr $ra # return from main