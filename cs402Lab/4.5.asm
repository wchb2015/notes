		.data
msg1: .asciiz "Please enter the integer number: "
msg2: .asciiz "The result is: "
		.text
		.globl main
main: 	add $sp, $sp, -4 # first update the stack pointer
		sw $ra, 4($sp) # push $ra into the stack


		j Input
Input:
		li $v0, 4
		la $a0, msg1
		syscall

		li $v0, 5
		syscall
		move $t0,$v0

Check:
		move $a0,$t0 #move the value to $a0 for factorial
		bltz $t0 Input
		jal Factorial

		li $v0,4			# execute this after terminate returns
		la $a0,msg2
		syscall

		li $v0,1	
		move $a0,$t0
		syscall
		
		nop
		lw $ra, 4($sp)		# first recover the data from the stack
		addu $sp, $sp, 4	# shrink the stack by one word
		jr $ra				# return from main

Factorial:
		subu $sp, $sp, 4
		sw $ra, 4($sp) # save the return address on stack

		beqz $a0, terminate # test for termination
		subu $sp, $sp, 4 # do not terminate yet
		sw $a0, 4($sp) # save the parameter
		sub $a0, $a0, 1 # will call with a smaller argument
		jal Factorial

# after the termination condition is reached these lines
# will be executed

		lw $t0, 4($sp) # the argument I have saved on stack
		mul $v0, $v0, $t0 # do the multiplication
		move $t0,$v0
		lw $ra, 8($sp) # prepare to return
		addu $sp, $sp, 8 # I’ve popped 2 words (an address and
		jr $ra # .. an argument)

terminate:
		li $v0, 1 # 0! = 1 is the return value
		lw $ra, 4($sp) # get the return address
		addu $sp, $sp, 4 # adjust the stack pointer
		jr $ra # return