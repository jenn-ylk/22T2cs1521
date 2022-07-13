# 
main:                               # 
    
    la      $a0, array              # setup for calling the function
    li      $a1, 10

    begin
    push    $ra

    jal     max
    
    pop     $ra
    end

    move    $a0, $v0                # printf ("%d")
    li      $v0, 1
    syscall

    li      $a0, '\n'               # printf("%c", '\n');
    li      $v0, 11
    syscall

    li      $v0, 0                  # return 0
    jr      $ra



max:

    # read in the first element, from here either 
    # go to the recursive case, or end condition

recurse_max:

    # set up and do a recursive call 
    # max(&a[1], length - 1)

swap_max:

return_max:
    # end the function, make sure to pop any registers from the stack

    jr      $ra


.data
array:
    .word 1, 2, 3, 4, 5, 6, 4, 3, 2, 1