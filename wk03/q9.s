# a MIPS assembly implementation of finding the length of a string
main:                    # t2 contains the length
    
    la      $t0, string
    li      $t2, 0
    
loop_start:
    lb      $t1, ($t0)
    beqz    $t1, loop_end
    
    addi    $t0, $t0, 1
    addi    $t2, $t2, 1
    j loop_start

loop_end:

    jr  $ra

   .data
string:
   .asciiz  "...."