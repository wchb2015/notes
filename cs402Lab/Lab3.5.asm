.data 0x10000000

msg1: .asciiz "Please enter the first integer number: "
msg2: .asciiz "Please enter the second integer number: "
msg3: .asciiz "I'm far away"
msg4: .asciiz "I'm nearby"

.text
.globl main

# Inside main there are some calls (syscall) which will change the
# value in $31 ($ra) which initially contains the return address
# from main. This needs to be saved.

main: 	addu $s0, $ra, $0 # save $31 in $16

		la $a0, msg1 # address of string to print
		li $v0, 4 # system call for print_str
		syscall

		li $v0, 5 # system call for read_int
		syscall # the integer placed in $v0
		move $t0,$v0
		

		li $v0, 4 # system call for print_str
		la $a0, msg2 # address of string to print
		syscall

		li $v0, 5 # system call for read_int
		syscall # the integer placed in $v0
		addu $t1, $v0, $0                   # move $t1,$v0

		bne $t0, $t1, Nearby #if those two integer are not equal, Branch to Label Nearby
		j Far # jump to label Far
		#the current address is 00400060

Nearby:
		li $v0, 4 # system call for print_str
		la $a0, msg4 # address of string to print
		syscall
		j Exit

.text 0x00420000 #farther than 16bit offset which is 2bytes and it means last 4 digit of hex
		#it also should can be divided by 4

Far:
		li $v0, 4 # system call for print_str
		la $a0, msg3 # address of string to print
		syscall
		j Exit

# restore now the return address in $ra and return from main
Exit:
		addu $ra, $0, $s0 # return address back in $31
		jr $ra # return from main