// counting loop code, edited to use gotos rather than a while loop or for loop

// please don't write your regular c programs like this, t=this is purely to 
// understand how the logic of a loop can be rewritten, in a way that is more 
// similar to branching in mips!

#include <stdio.h>

int main(void) {

    int x = 24;
loop:
    if (x >= 42) goto end;
        printf("%d\n",x);
        x += 3;
        goto loop;
end:
    return 0;
}
