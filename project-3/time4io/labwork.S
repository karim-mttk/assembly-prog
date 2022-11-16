.global delay
.global time2string

.macro	PUSH reg
	addi	$sp,$sp,-4
	sw	\reg,0($sp)
.endm

.macro	POP reg
	lw	\reg,0($sp)
	addi	$sp,$sp,4
.endm

 .data
.align 2

 .text
main:



hexasc: 
  andi $a0, 0xf   # separera ut 4 minsta bitarna
  li $v0, 0x30    # ladda in 0x30 på v0
  add $v0, $v0, $a0 # addera värdet av a0 till v0
  
  ble $a0, 9, skip  # branch om siffran är 9 eller mindre
  nop
        
  addi $v0, $v0, 0x10 
  sub $v0, $v0, 9  
skip:
  jr $ra
  nop


delay: 
  
  move $t0, $a0   
  li $t1, 0
  ble $t0, 0, lessthan
while:
  sub  $t0, $t0, 1
  li $t1, 0
for:
  addi $t1, $t1, 1
  nop
  bne $t1, 3000, for    
  nop                 
  
  bne $t0, 0, while     
        nop 
  
lessthan:
      
  jr $ra
  nop

time2string:
  
  
  
  PUSH $ra
  
  PUSH $s0
  PUSH $s1
  
  add $s0, $a0, $zero
  li $t2, 0
  
  add $a0, $a1, $zero # sekundsiffra 1
  jal hexasc
  nop
  add $s1, $0, $v0
  sb $s1, 4($s0)
  
  bne $s1, 0x30, jump1  
  nop
  addi $t2, $t2, 1
jump1:
  
  srl $a1, $a1, 4   # sekundsiffra 2
  add $a0, $a1, $zero
  jal hexasc
  nop
  add $s1, $0, $v0
  sb $s1, 3($s0)
  
  bne $s1, 0x30, jump2  
  nop
  addi $t2, $t2, 1
jump2:

  bne $t2, 2, notzero 
  nop
  
  li $s1, 0x44    # D
  sb $s1, 0($s0)
  li $s1, 0x49    # I
  sb $s1, 1($s0)
  li $s1, 0x4e    # N
  sb $s1, 2($s0)
  li $s1, 0x47    # G
  sb $s1, 3($s0)
  li $s1, 0x00    # NULL
  sb $s1, 4($s0)
  
  POP $s1
  POP $s0
  # hämta returadressen
  POP $ra
  jr $ra
  nop
  
notzero:  
  
  li $s1, 0x3a    # kolon
  sb $s1, 2($s0)
  
  srl $a1, $a1, 4   # minutsiffra 1
  add $a0, $a1, $0
  jal hexasc
  nop
  add $s1, $0, $v0
  sb $s1, 1($s0)
  
  srl $a1, $a1, 4   # minutsiffra 2
  add $a0, $a1, $0
  jal hexasc
  nop
  add $s1, $0, $v0
  sb $s1, 0($s0)
  
  li $s1, 0x00    # null pointer
  sb $s1, 5($s0)
  
  
  POP $s1
  POP $s0
  # hämta returadressen
  POP $ra
  jr $ra
  nop
