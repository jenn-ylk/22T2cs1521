// code that will change file permissions to not be publically writeable 
// if it is publically writeable
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>

int main(int argc, char *argv[]) {
    struct stat s;
    for (int i = 1; i < argc; i++) {
        // stat the file, and check the permissions
        if (stat(argv[i], &s) == -1) {
            perror(argv[i]);
            return 1;
        }
        
        mode_t mode = s.st_mode;
        if (mode & S_IWOTH) {
            printf("removing public write from %s\n", argv[i]);
            // change the permissions with chmod
            if (chmod(argv[i], mode & (~S_IWOTH)) == -1) {
                perror(argv[i]);
                return 1;
            }
        } else {
            printf("%s is not publically writable\n", argv[i]);
        }
        
    }
    
    return 0;
}
