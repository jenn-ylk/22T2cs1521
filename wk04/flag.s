# print out all the values inside a 2D array, containing a flag pattern
main:                    # row in $, col in $
    
    li   $t0, 0          # row

loop1:
    bge  $t0, 6, end1

    li   $t1, 0          # column
loop2:
    bge  $t1, 12, end2

    mul  $t3, $t0, 12    # calculate index in $t3
    add  $t3, $t3, $t1
    la   $t4, flag
    add  $t5, $t4, $t3

    lb   $a0, ($t5)      # printf("%c", flag[row][col])
    li   $v0, 11
    syscall

    addi $t1, $t1, 1
    b loop2
end2:

    la   $a0, '\n'       # printf("%c", '\n')
    li   $v0, 11
    syscall

    addi $t0, $t0, 1
    b loop1
end1:

    li   $v0, 0          # return 0
    jr   $ra

    .data


.data
flag:
    .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
    .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
    .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
    .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
    .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
    .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'