#include <stdio.h>

int main (void) {
    int nums[5] = {0, 1, 2, 3, 4};

    char string[64] = "Hello!";

    printf("The address for nums[0] is %p, containing %d\n", &nums[0], nums[0]);
    printf("The address for nums[1] is %p, containing %d\n", &nums[1], nums[1]);
    printf("The address for nums[2] is %p, containing %d\n", (nums + 2), *(nums + 2));

    printf("\nstring containts\"%s\"\n\n", string);
    printf("The address for string[0] is %p, containing %c\n", &string[0], string[0]);
    printf("The address for string[1] is %p, containing %c\n", (string + 1), *(&string[0] + 1));

    return 0;
}