led4:
lui $t0, $0, 0xbf22  #loading the 32bit address
ori $t0, $t0, 0x6000

andi $a0, $a0, 1	#masking out bit0 and shifting to pos4
sll $a0, $a0, 3

lw $t1, 0($t0) #load the last 16bits andcrbi 3     
andi $t1, $t1, 0xfff7 #clear the reg and bit3
or $a0, $t1, $a0 #set the led bit

sw $a0, 0($t0) #store back to memory 
jr $ra        #return function call







