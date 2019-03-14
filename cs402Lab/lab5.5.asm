# this is a program used to test memory alignment for data
.data 0x10000000

char1: .byte 'a' # reserve space for a byte

double1: .double 1.1 # reserve space for a double

char2: .byte 'b' # b is 0x62 in ASCII

half1: .half 0x8001 # reserve space for a half-word (2 bytes)

char3: .byte 'c' # c is 0x63 in ASCII

word1: .word 0x56789abc # reserve space for a word

word2: .word 0

char4: .byte 'd' # d is 0x64 in ASCII

.text
.globl main
main: 
		la $a0, word1 #load address to $a0
		la $a1, word2 #load address to $a1

		lb $t0, 3($a0) # $t0 <- M[$a0+3] load byte and sign extend it
		lb $t1, 2($a0) # $t0 <- M[$a0+2] load byte and sign extend it
		lb $t2, 1($a0) # $t0 <- M[$a0+1] load byte and sign extend it
		lb $t3, 0($a0) # $t0 <- M[$a0+0] load byte and sign extend it

		lbu $t4 3($a0)
		lbu $t5 2($a0)
		lbu $t6 1($a0)
		lbu $t7 0($a0)

		lh $t8, half1
		lhu $t9, half1

		sb $t7, 3($a1)
		sb $t6, 2($a1)
		sb $t5, 1($a1)
		sb $t4, 0($a1)


		jr $ra # return from main