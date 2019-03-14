		.data 0x10010000
var1:	.word 1	# var1 is a word (32 bit) with the ..
					# initial value is first digit of SSN

		.text
		.globl main
main:	addu $s0, $ra, $0# save $31 in $16 
		
		lw $a0,	var1 # load initial value into $t0
		li $a1, 100 # load limit value into $t1

		move $t0,$a0	# i is in $t0

Loop:	ble $a1, $t0, Exit #exit if limit <=i
		addi $a0, $a0,1 #var1 = var1 +1;
		addi $t0,$t0,1 #i = i + 1
		j Loop

# restore now the return address in $ra and return from main
Exit:	addu $ra, $0, $s0 # return address back in $31
		jr $ra # return from main