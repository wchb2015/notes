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

		bne $t0,$t1, Else
		sw $t2, var1
		sw $t2, var2
		beq $0, $0, Exit

Else:
		sw $t1, var1
		sw $t0, var2

				

# restore now the return address in $ra and return from main
Exit:
		addu $ra, $0, $s0 # return address back in $31
		jr $ra # return from main