# count by threes from 24 to 42
main:                    # 
    li   $t0, 24         # x = 24
    
    li   $t1, 42         # ending condition
loop:
    bge  $t0, $t1, end   # if (x >= 42) goto end;
    
    
    move $a0, $t0        #     printf("%d\n",x);
    li   $v0, 1
    syscall
    li   $a0, '\n'
    li   $v0, 11
    syscall
    
    addi $t0, $t0, 3     #     x += 3;
    
    b loop               #     goto loop
                         #     branches unconditionally to start (then condition is checked)
    
    
end:  
    li   $v0, 0          # return 0
    jr   $ra

    .data
