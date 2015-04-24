#include <stdio.h>

#define MAX_N 200000

int x[MAX_N];
int w[MAX_N];
int numbers[MAX_N];

int right(int index) {
    return x[index] + w[index];
}

int left(int index) {
    return x[index] - w[index];
}

int compar(const void* p1, const void* p2) {
    int i1 = *(int*)p1;
    int i2 = *(int*)p2;
    int r1 = right(i1);
    int r2 = right(i2);
    return r1 - r2;
}

int solveClique(int n) {
    int i;
    for (i = 0; i < n; i++) {
        numbers[i] = i;
    }
    // sort indices of points by right boundary
    qsort(numbers, n, sizeof(int), compar);
    // greedy algorithm
    int ans = 1;
    int index = 0;
    for (i = 1; i < n; i++) {
        if (left(numbers[i]) >= right(numbers[index])) {
            index = i;
            ans += 1;
        }
    }
    return ans;
}

int main() {
    int n;
    scanf("%d", &n);
    int i;
    for (i = 0; i < n; i += 1) {
        int xi, wi;
        scanf("%d %d", &xi, &wi);
        x[i] = xi;
        w[i] = wi;
    }
    int result = solveClique(n);
    printf("%d\n", result);
    return 0;
}
