# MIPS translation of a C program that reads in numbers to an array, then print them out
# i in $t0
main:

    li      $t0, 0          # i = 0
    la      $t1, numbers    # address or numbers[0]

write_start:
    # set this up to be a proper loop (condition, jump to start, iterate counter)
    bge     $t0, 10, write_end
    
    li      $v0, 5
    syscall

    # add in some code that will put the read value into the array
    mul     $t2, $t0, 4
    add     $t3, $t2, $t1

    sw      $v0, ($t3)

    addi    $t0, $t0, 1
    j       write_start

write_end:
    # for this exercise, either insert your own loop to read this content, 
    # or use mipsy web to look at the data, and make sure it was written

    jr      $ra 

.data

numbers:
    # fill this with the necessary zeroed array (use .space if the data should be uninitialised)
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

# #include <stdio.h>

# int main(void) {
#     int i;
#     int numbers[10] = {0};

#     i = 0;
#     while (i < 10) {
#         scanf("%d", &numbers[i]);
#         i++;
#     }
# }
