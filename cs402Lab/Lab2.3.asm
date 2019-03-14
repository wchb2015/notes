		.data 0x10010000
var1:	.word 1272	# var1 is a word (32 bit) with the ..
					# initial value 1272
var2:	.word 436	# var1 is a word (32 bit) with the ..
					# initial value 436
var3:	.word 169	# var1 is a word (32 bit) with the ..
					# initial value 169
var4:	.word 4782	# var1 is a word (32 bit) with the ..
					# initial value 4782
first:	.byte 'y'

last:	.byte 'm'

		.text
		.globl main
main:	addu $s0, $ra, $0# save $31 in $16 
		
		lui $13, 4097
		lw $9, 0($13)
		lw $10, 4($13)
		lw $11, 8($13)
		lw $12, 12($13)

		sw $12, 0($13)	#Word at M[var1] = $t4
		sw $11, 4($13) 	#Word at M[var2] = $t3
		sw $10, 8($13)	#Word at M[var3] = $t2
		sw $9, 12($13) 	#Word at M[var4] = $t1

# restore now the return address in $ra and return from main
		addu $ra, $0, $s0 # return address back in $31
		jr $ra # return from main