

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
   	andi	$a0,$a0,0xf			
   	addi	$v0,$zero,0x30	
   	addi	$t0,$zero,0x9	
   	
   	ble	$a0,$t0,L1		
   	nop
   	addi	$v0,$v0,0x7		
					
   	
   L1:
   	add	$v0,$a0,$v0 	
   	jr	$ra
   	nop


delay:
	PUSH	$s0
	PUSH	$ra
	addi	$s0, $0,1000	
	addi	$t1,$0,30000   	
	move	$t0,$a0		
while:
	ble	$t0,$s0,done	
	nop
	addi	$t0,$t0,-1			
for:
	beq	$s0,$t1,L1
	nop
	addi	$s0,$s0,1
	j	for
L1:	
	
	j	while
done:	
	POP	$ra
	POP	$s0
 	jr	$ra
 	nop

	
 	
 time2string:
 	PUSH	$s0			
 	PUSH	$s1
 	PUSH	$ra			
 	
 	add	$s0,$0,$a0		
 	add	$s1,$0,$a1		
 	
 	andi	$t0,$s1,0xf000  	
 	srl	$a0,$t0,12		
 	jal	hexasc		
 	nop		
 	sb	$v0, 0($s0)		
 	
 	andi	$t1,$s1,0x0f00	
 	srl	$a0,$t1,8		
 	jal	hexasc		
 	nop
 	sb	$v0,1($s0)		
 	
 	li	$t3,0x3A		
 	sb	$t3,2($s0)
 	
 	
 	andi	$t2,$s1,0x00f0
 	srl	$a0,$t2,4
 	jal	hexasc
 	nop
 	sb	$v0,3($s0)
 	
 	
 	move	$a0,$s1
 	jal	hexasc
 	nop
 	sb	$v0, 4($s0)
 	
 	
 	li	$t4,0x00		
 	sb	$t4,5($s0)
 	
 
 	POP	$ra
 	POP	$s1	
 	POP	$s0
 	
 	jr	$ra
 	nop	
