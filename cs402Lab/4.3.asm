	.data
msg1: .asciiz "Please enter the first integer number: "
msg2: .asciiz "Please enter the second integer number: "
resultInt: .asciiz "The larger integer is: "
		.text
		.globl main

main: 	add $sp, $sp, -4 # first update the stack pointer
		sw $ra, 4($sp) # push $ra into the stack

		li $v0, 4
		la $a0, msg1
		syscall

		li $v0, 5
		syscall
		move $t0,$v0

		li $v0, 4
		la $a0, msg2
		syscall

		li $v0, 5
		syscall
		move $t1,$v0

		jal Largest 


		lw $ra, 4($sp) 			# first recover the data from the stack
		add $sp, $sp, 4 		# shrink the stack by one word
		jr $ra					#return from main



Largest:
		blt $t0,$t1,else 		#Branch to Label if $t0<$t1

		#print out text for the result
		li $v0,4
		la $a0,resultInt
		syscall

		#print out the result
		li $v0,1
		move $a0,$t0
		syscall

		j Exit


else:
		#print out text for the result
		li $v0,4
		la $a0,resultInt
		syscall

		#print out the result
		li $v0,1
		move $a0,$t1
		syscall

		j Exit

Exit:
		#addu $ra, $0, $s0 # return address back in $31
		jr $ra # return from main