.include "macros.s"
.data
input: .space 256
output: .space 256
buffer: .space 16384

.globl main

.text
main:
    la a0, input
    jal get_filename
    la a0, output
    jal get_filename
    la a0, input
    la a1, buffer
    jal read
    mv s6, a0
    NEWLINE
    la a0, buffer
    jal process
    la a0, output
    la a1, buffer
    mv a2, s6
    jal write
    jal ask
    beqz a0, end
    NEWLINE
    la a0, buffer
    jal display
end:
    li a7, 10
    ecall


