		.data
msg1: .asciiz "Please enter the non-negative integer number: "
msg2: .asciiz "Please enter another non-negative integer number: "
msg3: .asciiz "The result is: "
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

		li $v0, 4
		la $a0, msg2
		syscall

		li $v0, 5
		syscall
		move $t1,$v0

Check:
		move $a0,$t0 	#move the value to $a0 for factorial
		bltz $t0 Input
		bltz $t1 Input

		####Exit part####
		li $v0,4
		la $a0,msg3
		syscall
		jal Ackermann

		move $t0,$v0
		li $v0,1			#print the return value
		move $a0,$t0		#$a=$t0
		syscall
		
		nop
		lw $ra, 4($sp)		# first recover the data from the stack
		addu $sp, $sp, 4	# shrink the stack by one word
		jr $ra				# return from main

Ackermann:
		subu $sp, $sp, 4
		sw $ra, 4($sp) # save the return address on stack

		beqz $t0, exit #if x = 0 then y + 1
		beqz $t1, elseif #else if y = 0 then A(x-1,1)
		subu $sp, $sp, 4 #update the stack pointer, increase

		sw $t0, 4($sp) # save x into the stack
		sub $t1, $t1, 1 #y=y-1
		jal Ackermann #jump to Ackermann A(x,y-1)

		lw $t0, 4($sp) #load x from stack
		subu $sp, $sp, -4 
		sub $t0, $t0, 1 #x-1
		move $t1, $v0
		jal Ackermann

		lw $ra, 4($sp) #get the $ra
		subu $sp, $sp, -4 #update stack pointer
		jr $ra
		#if x=0 then y = y + 1
		#else if y=0 then Ackermann(x-1,1)

elseif:
		sub $t0, $t0, 1		# x-1		
		li $t1, 1			# y = 1
		jal Ackermann		# jump to Ackermann
		lw $ra, 4($sp)		# load return address from stack
		addu $sp, $sp, 4	# update the stack
		jr $ra
exit:
		addi $v0, $t1, 1 	# if x = 0, return y + 1
		lw $ra, 4($sp)		# load return address from stack
		addu $sp, $sp, 4	# update the stack	
		jr $ra