lui $t0 0x9500
lw  $t1, 0x3f00($t0) #load  mem led

andi $t2, $t1, 0xfc07 #mask needed bits
ori $t2, $t2, 0x0278    #the leds 3 
sw $t2 0($t1)	#write to mem
