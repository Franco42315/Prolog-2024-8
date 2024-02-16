[Volver](../README.md)

# Java

## Tipo de dato que maneja el lenguaje

Java maneja varios tipos de datos. Los tipos primitivos incluyen `byte`, `short`, `int`, `long`, `float`, `double`, `boolean` y `char`. Además, Java también maneja tipos no primitivos como `String`, `Arrays` y `Clases`.

## La disciplina de tipos

Java es un lenguaje de tipado fuerte2. Esto significa que cada variable debe ser declarada con un tipo de dato y que solo se puede asignar un valor a una variable si el tipo de valor coincide con el tipo de dato declarado de la variable.

## El paradigma del lenguaje utilizado

Java es un lenguaje de programación multiparadigma que admite principalmente la programación orientada a objetos (POO), pero también admite elementos de programación funcional e imperativa.

## La estructura que lleva las funciones o métodos

En Java, los métodos se definen dentro de las clases. Un método típico en Java tiene la siguiente estructura5:

``` Java
public returnType methodName(parameters) {
    // Cuerpo del método
}
```

**Donde:**

`public` es el modificador de acceso del método.
`returnType` es el tipo de dato que devuelve el método.
`methodName` es el nombre del método.
`parameters` son los parámetros que acepta el método.

---

### Algoritmos

#### Factorial

``` Java
public long factorial(int n) {
    long fact = 1;
    for (int i = 2; i <= n; i++) {
        fact = fact * i;
    }
    return fact;
}
```

Este método calcula el factorial de un número n. Comienza con fact igual a 1 y luego multiplica fact por cada número de 2 a n.

#### Fibonacci

``` java
public int fibonacci(int n) {
    if (n <= 1) {
        return n;
    }
    return fibonacci(n - 1) + fibonacci(n - 2);
}

```

Este método calcula el número de Fibonacci en la posición n utilizando recursión. Si n es 0 o 1, devuelve n. De lo contrario, llama recursivamente al método fibonacci para n - 1 y n - 2 y devuelve la suma.

#### Palindromo

``` Java
public boolean esPalindromo(String s) {
    int longitud = s.length();
    for (int i = 0; i < longitud / 2; i++) {
        if (s.charAt(i) != s.charAt(longitud - i - 1)) {
            return false;
        }
    }
    return true;
}

```

Este método verifica si una cadena s es un palíndromo. Compara los caracteres en las posiciones opuestas en la cadena desde el principio hasta la mitad. Si encuentra un par de caracteres que no coinciden, devuelve false. Si todos los pares de caracteres coinciden, devuelve true.

[Volver](../README.md)
