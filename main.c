#include <stdio.h>
#include <stdlib.h>
int main(int narg, char* argv[]) {
    int a = 0;
    if (narg > 1) {
        a = atoi(argv[1]);
    }
    if (a) {
        printf("hello world\n");
    } else {
        printf("hello world\n");
    }
    return 0;
}
