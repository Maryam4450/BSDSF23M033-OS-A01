#include <stdio.h>
#include "../include/mystrfunctions.h"
#include "../include/myfilefunctions.h"

int main() {
    printf("--- Testing String Functions ---\n");
    char a[100] = "Hello";
    char b[100] = " World";
    mystrcat(a, b);
    printf("Concat: %s\n", a);
    printf("Length: %d\n", mystrlen(a));

    printf("\n--- Testing File Functions ---\n");
    FILE* f = fopen("test.txt", "r");
    if (f) {
        int l, w, c;
        wordCount(f, &l, &w, &c);
        printf("Lines: %d, Words: %d, Chars: %d\n", l, w, c);
        fclose(f);
    } else {
        printf("No test.txt found.\n");
    }
    return 0;
}

