#int array[5]
#array[0] = array[0] * 8
#array[1] = array[1] * 8

lui $s0, 0x1000
ori $s0, $s0, 0x7000

lw $t1, 0($s0)
sll $t1, $t1, 3
sw $t1, 0($s0)

lw $t1, 4($s0)
sll $t1, $t1, 3
sw $t1, 4($s0)


  