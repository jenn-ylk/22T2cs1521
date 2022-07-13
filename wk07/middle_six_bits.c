// a program that takes in an integer and returns just the middle six bits

#include <stdio.h>
#include <stdint.h>

uint32_t six_middle_bits(uint32_t num);
void print_bits(uint32_t num, uint8_t bits);

int main(void) {
    uint32_t num;
    scanf("%d", &num);
    printf("all bits of num: ");
    print_bits(num, 32);
    
    printf("middle six bits of num: ");
    print_bits(six_middle_bits(num), 6);
    return 0;
}

// return just the middle six bits of the number 
// (shifted all the way to the least significant bits)
uint32_t six_middle_bits(uint32_t num) {
    // between the least significant of the middle 6 bits, 
    // and the first bit (least significant), there are 13 bits
    return 0x3F & (num >> 13);
}

// prints out a number bit by bit
void print_bits(uint32_t num, uint8_t bits) {
    for (int i = bits - 1; i >= 0; i--) {
        printf("%d", 1 & (num >> i));
    }
    printf("\n");
}
