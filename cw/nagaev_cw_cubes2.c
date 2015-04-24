#include <stdio.h>

int a, b, c;

int colored(int i, int j, int k) {
    int result = 0;
    if (i == 1) {
        result += 1;
    }
    if (i == a) {
        result += 1;
    }
    if (j == 1) {
        result += 1;
    }
    if (j == b) {
        result += 1;
    }
    // add_if(k == 1) // AxB
    if (k == c) {
        result += 1;
    }
    return result;
}

int main() {
    scanf("%d", &a);
    scanf("%d", &b);
    scanf("%d", &c);

    const int MAX_COLORED = 6;
    int cubes[MAX_COLORED + 1];
    // initialise all counts with 0
    int count;
    for (count = 0; count <= MAX_COLORED; count += 1) {
        cubes[count] = 0;
    }

    int i, j, k;
    for (i = 1; i <= a; i += 1) {
        for (j = 1; j <= b; j += 1) {
            for (k = 1; k <= c; k += 1) {
                int count = colored(i, j, k);
                cubes[count] = cubes[count] + 1;
            }
        }
    }

    for (count = 0; count <= MAX_COLORED; count += 1) {
        if (cubes[count] != 0) {
            printf("%d %d\n", count, cubes[count]);
        }
    }
    return 0;
}
