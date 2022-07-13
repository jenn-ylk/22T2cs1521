# 
main:                       # 
    
    li      $a0, 3          # nrows
    li      $a1, 4          # ncols
    la      $a2, M          # array addr
    li      $a3, 3          # factor

    # setup and call the function
    begin
    push    $ra

    jal     change

    pop     $ra
    end

    li      $s0, 3          # nrows
    li      $s1, 4          # ncols

    li      $t0, 0
p_loop1:
    bge     $t0, $s0, p_end1
    
    li      $t1, 0
p_loop2:
    bge     $t1, $s1, p_end2

    # calculate offset
    mul     $t2, $t0, $s1  # offset for rows
    add     $t3, $t1, $t2  # total index (1d array equivalent)
    mul     $t4, $t3, 4    # 4 bytes

    la      $t5, M
    add     $t5, $t5, $t4
    lw      $a0, ($t5)
    li      $v0, 1
    syscall
    la   $a0, ' '       # printf("%c", ' ')
    li   $v0, 11
    syscall

    addi    $t1, $t1, 1
    b p_loop2
p_end2:

    la   $a0, '\n'       # printf("%c", '\n')
    li   $v0, 11
    syscall

    addi    $t0, $t0, 1
    b p_loop1
p_end1:

    li      $v0, 0          # return 0
    jr      $ra


# function!
change:

    # loop through 2d array
    li      $t0, 0
loop1:
    bge     $t0, $a0, end1

    li      $t1, 0
loop2:
    bge     $t1, $a1, end2

    mul     $t2, $t0, $a1 # calculate offset
    add     $t2, $t1, $t2 # index
    mul     $t3, $t2, 4

    la      $t4, M
    add     $t4, $t3, $t4

    lw      $t5, ($t4) # load value
    mul     $t5, $t5, $a3 # change value
    sw      $t5, ($t4) # load value# store value

    addi    $t1, $t1, 1
    b       loop2
end2:

    addi   $t0, $t0, 1
    b      loop1
end1:
    jr      $ra

.data
M:  .word 1, 2, 3, 4
    .word 3, 4, 5, 6
    .word 5, 6, 7, 8
