#include <assert.h>
#include <stdio.h>

int d;

int mymin(int x, int y) {
    if (x < y) {
        return x;
    } else {
        return y;
    }
}

int mymax(int x, int y) {
    if (x > y) {
        return x;
    } else {
        return y;
    }
}

int findMaxDistance(int v1, int v2, int t) {
    int v_1 = mymin(v1, v2);
    int v_2 = mymax(v1, v2);
    if (t == 2) {
        assert(v_2 - v_1 <= d);
        return v_1 + v_2;
    } else {
        return v_1 + findMaxDistance(v_1 + d, v_2, t - 1);
    }
}

int main() {
    int v1, v2;
    scanf("%d %d", &v1, &v2);
    int t;
    scanf("%d %d", &t, &d);
    int result = findMaxDistance(v1, v2, t);
    printf("%d\n", result);
    return 0;
}
