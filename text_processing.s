.include "macros.s"
    .globl process

process:
    mv t0, a0           
process_loop:
    lb t1, 0(t0)       
    beqz t1, process_end
    li t2, 'A'
    li t3, 'Z'
    blt t1, t2, not_uppercase
    bgt t1, t3, not_uppercase
    addi t1, t1, 32
    sb t1, 0(t0)
    j next_char
not_uppercase:
    li t2, 'a'
    li t3, 'z'
    blt t1, t2, next_char
    bgt t1, t3, next_char
    addi t1, t1, -32
    sb t1, 0(t0)
next_char:
    addi t0, t0, 1    
    j process_loop
process_end:
    jr ra
