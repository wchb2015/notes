# this is a program used to test memory alignment for data
.data 0x10000000
char1: .byte 'a' # reserve space for a byte
double1: .double 1.1 # reserve space for a double
char2: .byte 'b' # b is 0x62 in ASCII
half1: .half 0x8001 # reserve space for a half-word (2 bytes)
char3: .byte 'c' # c is 0x63 in ASCII
word1: .word 0x56789abc # reserve space for a word
char4: .byte 'd' # d is 0x64 in ASCII
.text 0x400001
.globl main
main: jr $ra # return from main