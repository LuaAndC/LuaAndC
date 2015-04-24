#include <stdio.h>
#include <stdlib.h>

int mymin(int x, int y) {
    if (x < y) {
        return x;
    } else {
        return y;
    }
}

int solveStaircase(int n, int* price) {
    int* ans = malloc(n * sizeof(int));
    if (n >= 1) {
        ans[0] = price[0];
    }
    if (n >= 2) {
        ans[1] = price[1];
    }
    int i;
    for (i = 2; i < n; i += 1) {
        ans[i] = mymin(ans[i-1], ans[i-2]) + price[i];
    }
    int result =  ans[n - 1];
    free(ans);
    return result;
}

int main() {
    int n;
    scanf("%d", &n);
    int* price = malloc(n * sizeof(int));
    int i;
    for (i = 0; i < n; i += 1) {
        scanf("%d", &price[i]);
    }
    int result = solveStaircase(n, price);
    free(price);
    printf("%d\n", result);
    return 0;
}
