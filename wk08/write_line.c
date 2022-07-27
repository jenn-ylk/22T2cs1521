// code that writes a line recieved on standard input to a file
// either overwrites or creates a new file

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr,  "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // TODO: open the file for write mode

    // TODO: for every character before the user hits enter, 
    // write the character to the stream

    // TODO: close the file
    return 0;
}
