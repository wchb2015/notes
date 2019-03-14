# this is a program used to test memory alignment for data
.data 0x10000000
.align 0
char1: .byte 'a' 					# reserve space for a byte (0x61)
double1: .double 1.1 				# reserve space for a double (0x9999999a  0x3ff19999)
char2: .byte 'b' 					# b is 0x62 in ASCII
half1: .half 0x8001 				# reserve space for a half-word (2 bytes)  (0x8001)
char3: .byte 'c' 					# c is 0x63 in ASCII
word1: .word 0x56789abc 			# reserve space for a word (0x56789abc)
char4: .byte 'd' 					# d is 0x64 in ASCII
.text
.globl main
main: 
la $a0, word1               # load address of word1 (1000000d)      789abc63 00006456 00000000
lwl $t0, 3($a0)             # get 0x560000
lwr $t1, 0($a0)             # get 0x789abc
add $t0, $t0, $t1           # Update $t0 = 0x560000+0x789abc = 0x56789abc
jr $ra 						# return from main
	