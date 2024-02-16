[Volver](../README.md)

# Python

## Tipos de dato que se utilizan en python

Python maneja varios tipos de datos como:

- Tipo texto: `str`
- Tipos numéricos: `int`, `float`, `complex`
- Tipos de secuencia: `list`, `tuple`, `range`
- Tipo de mapeo: `dict`
- Tipos set: `set`, `frozenset`
- Tipo Booleano: `bool`
- Tipos binarios: `bytes`, `bytearray`, `memoryview`
- Tipo None: `NoneType`

### Tipado

Python es un lenguaje de tipado fuerte y dinámico. Esto significa que el tipo de dato de una variable se determina en tiempo de ejecución (`tipado dinámico`), y no permite operaciones entre tipos de datos incompatibles a menos que se realice una conversión explícita (`tipado fuerte`).

### Estructura del código

Python utiliza una estructura de código basada en la indentación para definir bloques de código. Las funciones, bucles, y condicionales se definen con palabras clave seguidas de dos puntos y el código dentro de estos bloques se indentan. Python también permite la definición de módulos y paquetes para organizar el código de manera modular.

### Paradigma

Python es un lenguaje de programación multiparadigma. Soporta varios paradigmas de programación, incluyendo la programación orientada a objetos, programación imperativa, y en menor medida, programación funcional.

---

#### Algoritmos

##### Factorial

Factorial: Este algoritmo calcula el factorial de un número n. El factorial de un número es el producto de todos los números enteros positivos desde 1 hasta n. En Python, puedes usar la biblioteca math que tiene una función incorporada para calcular el factorial.

``` Python
def factorial(n):
    if n == 0:
        return 1
    else:
        return n * factorial(n - 1)
```

##### Fibonacci

ibonacci: Este algoritmo calcula el número de Fibonacci en la posición n. La secuencia de Fibonacci es una serie de números en la que cada número es la suma de los dos anteriores.

``` Python
def fibonacci(n):
    if n <= 0:
        return "El número debe ser mayor que 0"
    elif n == 1:
        return 0
    elif n == 2:
        return 1
    else:
        return fibonacci(n-1) + fibonacci(n-2)

print(fibonacci(10))
```

##### Palindromo

Palíndromos: Este algoritmo verifica si una cadena es un palíndromo. Un palíndromo es una palabra que se lee igual de izquierda a derecha que de derecha a izquierda.

``` Python
def es_palindromo(palabra):
    palabra = palabra.lower()  # Convertir a minúsculas
    palabra = palabra.replace(' ', '')  # Eliminar espacios
    return palabra == palabra[::-1]  # Comprobar si la palabra es igual a su reverso

print(es_palindromo("peep"))
```

[Volver](../README.md)