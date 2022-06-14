# a MIPS assembly implementation of finding the length of a string
main:                    # $t2 will contain the length of the string
    
loop_start:

    j loop_start

loop_end:

    jr   $ra

   .data
string:
   .asciiz  "...."