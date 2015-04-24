#include <stdio.h>

int main() {
    int n;
    scanf("%d", &n);
    if (n <= 2) {
        printf("%d\n", 1);
        printf("%d\n", 1);
    } else if (n == 3) {
        printf("%d\n", 2);
        printf("%d %d\n", 1, 3);
    } else if (n == 4) {
        printf("%d\n", 4);
        printf("%d %d %d %d\n", 2, 4, 1, 3);
    } else if (n >= 5) {
        printf("%d\n", n);
        int i;
        for (i = 1; i <= n; i += 2) {
            printf("%d\n", i);
        }
        for (i = 2; i <= n; i += 2) {
            printf("%d\n", i);
        }
    }
    return 0;
}
