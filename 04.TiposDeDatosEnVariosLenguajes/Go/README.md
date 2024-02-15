[Volver](../README.md)

# Go

## Tipos de datos que maneja el lenguaje:

Go es un lenguaje de programación estáticamente tipado.

Tiene varios tipos de datos fundamentales, incluyendo:
``bool``: representa un valor booleano que puede ser verdadero o falso.
``Numeric``: representa tipos enteros, valores de punto flotante y tipos complejos.
``string``: representa una cadena de caracteres.
``Array``: una estructura de datos que puede contener elementos del mismo tipo.
``Slice``: similar a un array pero con tamaño dinámico.
``Struct``: una colección de campos con su propio tipo de datos.
``Pointer``: almacena la dirección de memoria de otro tipo.

## Disciplina de tipos

Go es un lenguaje de programación de tipado estático, fuerte, estructural y nominal. Esto significa que el tipo de cada variable se conoce en tiempo de compilación, los tipos no son intercambiables sin una conversión explícita, y los tipos pueden ser definidos por el programador.

## Paradigma del lenguaje utilizado

Go es un lenguaje de programación multi-paradigma16. Soporta programación concurrente, imperativa, y tiene características de la programación funcional y orientada a objetos.

## Estructura de las funciones o métodos

En Go, una función se define con la palabra clave func, seguida del nombre de la función, una lista de parámetros entre paréntesis, una lista opcional de tipos de retorno, y un cuerpo de función. Aquí tienes un ejemplo de cómo se ve una función en Go:

``` go
func nombreFuncion(parametro tipoParametro) tipoRetorno {
    // Cuerpo de la función
}

```
---
### Algoritmos

#### Factorial

Este algoritmo calcula el factorial de un número n. El factorial de un número es el producto de todos los números enteros positivos desde 1 hasta n. En este código, se utiliza la recursividad para calcular el factorial. Si n es 0, se devuelve 1 (ya que el factorial de 0 es 1). Si n no es 0, se devuelve n multiplicado por el factorial de n-1.

``` go
package main

import "fmt"

func factorial(n int) int {
    if n == 0 {
        return 1
    } else {
        return n * factorial(n - 1)
    }
}

func main() {
    num := 5
    fmt.Printf("El factorial de %d es %d\n", num, factorial(num))
}

```

#### Fibonacci

Fibonacci: Este algoritmo calcula el número de Fibonacci en la posición n. La secuencia de Fibonacci es una serie de números en la que cada número es la suma de los dos anteriores. Al igual que en el algoritmo factorial, se utiliza la recursividad. Si n es 0 o 1, se devuelve n. Si n es mayor que 1, se devuelve la suma de los números de Fibonacci en las posiciones n-1 y n-2.

``` go
package main

import "fmt"

func fibonacci(n int) int {
    if n <= 1 {
        return n
    } else {
        return fibonacci(n - 1) + fibonacci(n - 2)
    }
}

func main() {
    num := 10
    fmt.Printf("El número Fibonacci en la posición %d es %d\n", num, fibonacci(num))
}

```

#### Palindromo

Este algoritmo verifica si una palabra es un palíndromo. Un palíndromo es una palabra que se lee igual de izquierda a derecha que de derecha a izquierda. El código recorre la palabra desde ambos extremos hacia el centro, comparando los caracteres correspondientes. Si encuentra dos caracteres que no son iguales, devuelve 0 (lo que significa que la palabra no es un palíndromo). Si todos los caracteres coinciden, devuelve 1 (lo que significa que la palabra es un palíndromo).

``` go
package main

import (
    "fmt"
    "strings"
)

func es_palindromo(palabra string) bool {
    longitud := len(palabra)
    for i := 0; i < longitud / 2; i++ {
        if palabra[i] != palabra[longitud - i - 1] {
            return false
        }
    }
    return true
}

func main() {
    palabra := "anilina"
    if es_palindromo(strings.ToLower(palabra)) {
        fmt.Printf("'%s' es un palíndromo\n", palabra)
    } else {
        fmt.Printf("'%s' no es un palíndromo\n", palabra)
    }
}

```

[Volver](../README.md)