#for loop
#int sum = 0;
#int i = 0;
#while (i != 10) {
#sum = sum + i;
#i = i + 1;
#}


add $s1, $0, $0	
addi $s0, $0, 0 
addi $t0, $0, 10

for:
beq $s0, $t0, done
add $s1, $s1,$s0
addi $s0,$s0, 1
j for

done:   