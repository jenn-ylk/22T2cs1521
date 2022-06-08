# calculate and print out the square of a number
main:                        # t0, t1, are x, y
    
    la   $a0, prompt         # printf("Enter a number: ")
    li   $v0, 4
    syscall
    
    li   $v0, 5              # scanf("%d", x);
    syscall
    
    move $t0, $v0            # t0 is x
    li   $t2, 46340
    bgt  $t0, $t2, toobig    # if (x > 46340) goto toobig;
    
    mul  $t1, $t0, $t0       # y = x * x;
    
    move $a0, $t1            # printf("%d", y)
    li   $v0, 1
    syscall
    
    li   $a0, '\n'           # printf("\n")
    li   $v0, 11
    syscall
    b end
    
toobig:
    la   $a0, err        # printf("too big\n")
    li   $v0, 4
    syscall

end:
    
    li   $v0, 0          # return 0
    jr   $ra


    .data
prompt:                  # prompt string
    .asciiz "Enter a number: "
err:
    .asciiz "square too big for 32 bits\n"
