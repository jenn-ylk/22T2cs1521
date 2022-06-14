# MIPS translation of a C program that reads in numbers to an array, then print them out
# i in $t0
main:

    li      $t0, 0      # i = 0

write_start:
    # TODO: set this up to be a proper loop (condition, jump to start, iterate counter)
    li      $v0, 5
    syscall

    # TODO: add in some code that will put the read value into the array

write_end:
    # for this exercise, either insert your own loop to read this content, 
    # or use mipsy web to look at the data, and make sure it was written

    jr      $ra 

.data

numbers:
    # TODO: fill this with the necessary zeroed array (use .space if the data should be uninitialised)


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
