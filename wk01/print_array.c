#include <stdio.h>

void print_array(int nums[], int len) {
    if (len != 0) {
	    len--;
	    print_array(nums, len);
        printf("%d\n", nums[len]);
    }
}

int main(void)
{
    int nums[] = {3, 1, 4, 1, 5, 9, 2, 6, 5, 3};
    print_array(nums, 10);

    return 0;
}



/* 
** My solution **
#include <stdio.h>

void print_array(int nums[], int len) {
    // if there are more numbers at the back of the array to print
    if (len != 0) {
	    len--;
	    print_array(nums, len);
        printf("%d\n", nums[len]);
    }
}


** the solution from the tutes **
void print_array(int nums[], int index, int len) {
    if (index == len) return;

    printf("%d\n", nums[index]);
    print_array(nums, index + 1, len);
}
*/
