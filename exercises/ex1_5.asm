.data
.data
.align 2
#buffers test
sc:	.ascii "copy test"
	.space 16
dest1: .space 32
dest2: .space 32

.text 
main:
#copy form one position to another, both aligned
#aligned number of bytes (14 bytes)
	la $a0,sc
	la $a1,dest1
	li $a2,14
	jal memcopy
stop:
	j stop 
memcopy:
loop:	beq $a2,$zero, done #while (dest2 !== 0)
	lb, $t0,0($a0)
	sb, $t0,0($a1)
	addi $a0,$a0,1 #sc++
	addi $a1,$a1,1 #dest1++
	addi $a2,$a2,-1 #dest2--
	j loop
done:
	jr $ra		
		

		