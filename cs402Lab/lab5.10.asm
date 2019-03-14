.data 0x10000000                    # the program can be run under both simple and bare mode
.align 0

char1: .byte 'a' 					# reserve space for a byte (0x61)
word1: .word 0x89abcdef 			# reserve space for a word (0x89abcdef)
char2: .byte 'b' 					# b is 0x62 in ASCII
word2: .word 0x0					# reserve space for a word (0x0)

.text
.globl main
main: 
lui $a0,4096            
lwr $t0, 1 ($a0)			# get abcdef
add $0, $0, 0               # wait until last instruction done
lwl $t1, 4 ($a0)			# get 89000000
add $0, $0, 0               # wait until last instruction done
add $t0, $t0, $t1           # Update $t0 = $t0 + $t1

swr $t0, 6 ($a0)            
add $0, $0, 0               # wait until last instruction done
swl $t0, 9 ($a0)
add $0, $0, 0               # wait until last instruction done

#----------------Below this line is for checking the value of word2------------------
add $a0, $a0, 6             # change address of word1 into word2 
lwl $t2, 3($a0)             
add $0, $0, 0               # wait until last instruction done
lwr $t3, 0($a0)             
add $0, $0, 0               # wait until last instruction done
add $t2, $t2, $t3           # Update $t2 = $t2 + $t3

jr $ra 						# return from main
	
