.data 0x10000000
word1:	.word 0x89abcdef

		.text
		.globl main

main:	lui $t4, 0x1000 #$t0 <-10000000
		lwl $t0, 3($t4)
		lwl $t1, 2($t4)
		lwl $t2, 1($t4)
		lwl $t3, 0($t4)
		
		jr $ra