#include <stdio.h>

int main() {
    double sides[3];
    scanf("%lf", &sides[0]);
    scanf("%lf", &sides[1]);
    scanf("%lf", &sides[2]);

    // sort
    int i, j;
    for (i = 0; i < 3; i += 1) {
        for (j = i + 1; j < 3; j += 1) {
            if (sides[i] > sides[j]) {
                double temp = sides[i];
                sides[i] = sides[j];
                sides[j] = temp;
            }
        }
    }

    double a = sides[0];
    double b = sides[1];
    double c = sides[2];

    if (c == a + b) {
        printf("degenerate\n");
    } else if (c*c > a*a + b*b) {
        printf("obtuse\n");
    } else if (c*c == a*a + b*b) {
        printf("right\n");
    } else {
        printf("acute\n");
    }

    return 0;
}
