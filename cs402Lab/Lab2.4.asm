		.data 0x10010000
var1:	.word 11	# var1 is a word (32 bit) with the ..
					# initial value 11
var2:	.word 22	# var1 is a word (32 bit) with the ..
					# initial value 22
.extern ext0	4
.extern ext1	4

		.text
		.globl main
main:	addu $s0, $ra, $0# save $31 in $16 
		
		lw $t0, var1	#load the value of var1 into $t0
		lw $t1, var2	#load the value of var2 into $t1

		sw $t0, ext1	
		sw $t1, ext0

# restore now the return address in $ra and return from main
		addu $ra, $0, $s0 # return address back in $31
		jr $ra # return from main