[Volver](../README.md)

# C

## Tipos de dato que se utilizan en C

C maneja varios tipos de datos, incluyendo:

- Tipos enteros: `char`, `short`, `int`, `long`, `long long` y `enum`

- Tipos reales: `float`, `double`, y `long double`

### La disciplina de tipos

C es un lenguaje de tipado fuerte y estático. Esto significa que el tipo de dato de una variable se determina en tiempo de compilación (tipado estático), y no permite operaciones entre tipos de datos incompatibles a menos que se realice una conversión explícita (tipado fuerte).

### El paradigma del lenguaje utilizado

C es un lenguaje de programación que soporta principalmente el paradigma de programación imperativo. Sin embargo, también permite ciertos elementos de la programación orientada a objetos y la programación funcional.

### La estructura que lleva las funciones o métodos

Un programa en C consta de una o más funciones, la función principal se llama main. Cada función debe contener: cabecera, argumentos y sentencias.

``` C
tipo_retorno nombre_funcion(tipo_parametro1 nombre_parametro1, tipo_parametro2 nombre_parametro2, ...) {
    // Cuerpo de la función
}
```

#### Factorial

Este algoritmo calcula el factorial de un número n. El factorial de un número es el producto de todos los números enteros positivos desde 1 hasta n. En este código, se utiliza la recursividad para calcular el factorial. Si n es 0, se devuelve 1 (ya que el factorial de 0 es 1). Si n no es 0, se devuelve n multiplicado por el factorial de n-1.

``` C

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

```

#### Fibonacci

Fibonacci: Este algoritmo calcula el número de Fibonacci en la posición n. La secuencia de Fibonacci es una serie de números en la que cada número es la suma de los dos anteriores. Al igual que en el algoritmo factorial, se utiliza la recursividad. Si n es 0 o 1, se devuelve n. Si n es mayor que 1, se devuelve la suma de los números de Fibonacci en las posiciones n-1 y n-2.

``` C
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

```

#### Palindromo

Este algoritmo verifica si una palabra es un palíndromo. Un palíndromo es una palabra que se lee igual de izquierda a derecha que de derecha a izquierda. El código recorre la palabra desde ambos extremos hacia el centro, comparando los caracteres correspondientes. Si encuentra dos caracteres que no son iguales, devuelve 0 (lo que significa que la palabra no es un palíndromo). Si todos los caracteres coinciden, devuelve 1 (lo que significa que la palabra es un palíndromo).

``` C
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

```

[Volver](../README.md)
