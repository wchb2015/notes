.data 0x10000000
word1:	.word 0x89abcdef

		.text
		.globl main

main:	lui $t8, 0x1000 #$t0 <-10000000
		lwr $t4, 3($t8)
		lwr $t5, 2($t8)
		lwr $t6, 1($t8)
		lwr $t7, 0($t8)
		
		jr $ra