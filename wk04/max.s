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

    lw      $s0, ($a0)              # first_element = a[0] - note, this is an s register, not temp

    bne     $a1, 1, recurse_max
    move    $v0, $s0
    j       return_max

recurse_max:

    begin
    push    $ra
    push    $s0

    addi    $a0, $a0, 4             # reduce length, move to next number
    addi    $a1, $a1, -1

    jal     max                     # do recursive call here
    move    $t0, $v0

    ble     $s0, $t0, swap_max      # if (first_element > max_so_far)
    move    $t0, $s0                # keeps first element if it's greater

swap_max:
    move    $v0, $t0

return_max:
    pop     $s0
    pop     $ra
    end
    jr      $ra


.data
array:
    .word 1, 2, 3, 4, 5, 6, 4, 3, 2, 1
