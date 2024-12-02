.include "macros.s"
    .globl get_filename
    .globl read
    .globl write
    .globl ask
    .globl display
.data
prompt_msg:
    .asciz "Введите имя файла:"
display_msg:
    .asciz "Вывести результат? (Y/N):"
answer:
    .space 2

.text
get_filename:
    SAVE_RA
    mv t1, a0
    la t0, prompt_msg   
    PRINT_STRING t0     
    READ_STRING t1, 256 
    mv t0, t1        
remove_newline:
    lb t1, 0(t0)
    beqz t1, finish_remove_newline
    li t2, 10
    beq t1, t2, set_zero
    addi t0, t0, 1
    j remove_newline
set_zero:
    sb zero, 0(t0)
finish_remove_newline:
    RESTORE_RA
    jr ra
read:
    SAVE_RA
    mv s1, a1           
    li a7, 1024         
    li a1, 0            
    ecall
    mv s0, a0           
    mv a0, s0
    mv a1, s1
    li a2, 16384        
    li a7, 63
    ecall
    mv s1, a0           
    li a7, 57
    mv a0, s0
    ecall
    mv a0, s1           
    RESTORE_RA
    jr ra

write:
    SAVE_RA
    mv s1, a1           
    li a7, 1024         
    li a1, 1            
    ecall
    mv s0, a0           
    mv a0, s1
    mv s2, a2       
    li a7, 64
    mv a0, s0
    mv a1, s1
    mv a2, s2
    ecall
    li a7, 57
    mv a0, s0
    ecall
    RESTORE_RA
    jr ra
ask:
    la a0, display_msg
    PRINT_STRING a0
    la a0, answer
    READ_STRING a0, 2
    lb t0, answer
    li t1, 'Y'
    beq t0, t1, return_true
    li a0, 0
    jr ra
return_true:
    li a0, 1
    jr ra
display:
    PRINT_STRING a0
    jr ra


