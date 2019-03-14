		.text
		.globl main
main: 	move $s0, $ra # must save $ra since I’ll have a call
		jal test # call ‘test’ with no parameters
		nop # execute this after ‘test’ returns
		move $ra, $s0 # restore the return address in $ra
		jr $ra # return from main

# The procedure ‘test’ does not call any other procedure. Therefore $ra
# does not need to be saved. Since ‘test’ uses no registers there is
# no need to save any registers.

test: 	nop # this is the procedure named ‘test’
		jr $ra # return from this procedure