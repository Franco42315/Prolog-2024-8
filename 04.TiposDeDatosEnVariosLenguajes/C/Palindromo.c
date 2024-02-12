#include <stdio.h>
#include <string.h>

int es_palindromo(char *palabra) {
    int longitud = strlen(palabra);
    for (int i = 0; i < longitud / 2; i++) {
        if (palabra[i] != palabra[longitud - i - 1])
            return 0;
    }
    return 1;
}

int main() {
    char palabra[] = "anilina";
    if (es_palindromo(palabra))
        printf("'%s' es un palíndromo\n", palabra);
    else
        printf("'%s' no es un palíndromo\n", palabra);
    return 0;
}
