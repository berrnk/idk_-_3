.text

.macro READ_FILE %input, %buffer
    la a0, %input
    la a1, %buffer
    jal read_file
.end_macro

.macro WRITE_FILE %output, %buffer
    la a0, %output
    la a1, %buffer
    jal write_file
.end_macro

.macro PROCESS_TEXT %buffer
    la a0, %buffer
    jal process_text
.end_macro

.macro DISPLAY_TEXT %buffer
    la a0, %buffer
    jal display_text
.end_macro

.macro SAVE_RA
    addi sp, sp, -8
    sd ra, 0(sp)
.end_macro

.macro RESTORE_RA
    ld ra, 0(sp)
    addi sp, sp, 8
.end_macro

.macro NEWLINE
    li a0, 10
    li a7, 11
    ecall
.end_macro

.macro READ_STRING %buffer, %length
    li a7, 8
    mv a0, %buffer
    li a1, %length
    ecall
.end_macro

.macro PRINT_STRING %address
    li a7, 4
    mv a0, %address
    ecall
.end_macro