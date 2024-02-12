#include <stdio.h>

int fibonacci(int n) {
    if (n <= 1)
        return n;
    else
        return fibonacci(n - 1) + fibonacci(n - 2);
}

int main() {
    int num = 10;
    printf("El número Fibonacci en la posición %d es %d\n", num, fibonacci(num));
    return 0;
}
