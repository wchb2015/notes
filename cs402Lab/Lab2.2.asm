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

		lw $t1, var1	#$t1= word at M[var1]
		lw $t2, var2	#$t2= word at M[var2]
		lw $t3, var3	#$t3= word at M[var3]
		lw $t4, var4	#$t4= word at M[var4]

		sw $t4, var1	#Word at M[var1] = $t4
		sw $t3, var2	#Word at M[var2] = $t3
		sw $t2, var3	#Word at M[var3] = $t2
		sw $t1, var4	#Word at M[var4] = $t1

# restore now the return address in $ra and return from main
		addu $ra, $0, $s0 # return address back in $31
		jr $ra # return from main