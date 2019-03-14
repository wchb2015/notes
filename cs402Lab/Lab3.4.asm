		.data 0x10010000
		my_array:
		.space 40 #reserve space in memory for an array of words of size

		.text
		.globl main
main:	addu $s0, $ra, $0# save $31 in $16 
		
		li $t0,	1 # load initial value j into $t0
		li $t1, 10 # load limit value into $t1
		li $t2, 0 # load the value i of a for loop
		la $t3, my_array #the address of my_array[0] is in $t3

Loop:	ble $t1, $t2, Exit #exit if limit <=i

		addi $t2,$t2,1 #i = i + 1

		sw $t0, 0($t3) #store  j into the array 
		addi $t3,$t3,4 #step to next array cell

		addi $t0,$t0,1 #j = j + 1
		j Loop

# restore now the return address in $ra and return from main
Exit:	addu $ra, $0, $s0 # return address back in $31
		jr $ra # return from main