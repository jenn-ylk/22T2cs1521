# MIPS translation of a C program that prints numbers from an array

# i in $t0
# index calculations in t1, t2
# current address in t3
# array[i] in t4
main:

    li      $t0, 0      # i = 0
    la      $t1, numbers        # load numbers[i]

loop_start:
    bge     $t0, 10, loop_end   # while (i < 10) {

    mul     $t2, $t0, 4         # calculate offset (multiply by 4 for words)
    add     $t3, $t1, $t2       # t3 contains the address &numbers[0] + offset

    # change the value in the array if negative
                                # if (numbers[i] < 0)
    lw      $t4, ($t3)          # a = numbers[i]
    bgez    $t4, end_if
                                # numbers[i] += 42
    addi    $t4, $t4, 42        # a = a + 42    
    sw      $t4, ($t3)          # numbers[i] = a   

    

end_if:

    addi    $t0, $t0, 1
    j       loop_start

loop_end:

    jr      $ra 

.data

numbers:
    .word 0, 1, 2, -3, 4, -5, 6, -7, 8, 9