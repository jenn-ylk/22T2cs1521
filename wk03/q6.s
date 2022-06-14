# MIPS translation of a C program that prints numbers from an array
# i in $t0
main:

    li      $t0, 0      # i = 0

read_start:
    bge     $t0, 10, read_end   # while (i < 10) {}

    la      $t1, numbers         # load numbers[i]
    mul     $t2, $t0, 4         # calculate offset (multiply by 4 for words)
    add     $t3, $t1, $t2       # t3 contains the address &numbers[0] + offset

    lw      $a0, ($t3)
    li      $v0, 1
    syscall

    li      $a0, '\n'      #   printf("%c", '\n');
    li      $v0, 11
    syscall

    addi    $t0, $t0, 1
    j       read_start

read_end:

    jr   $ra 

.data

numbers:
    .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9  # int numbers[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};