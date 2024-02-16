[Volver](../README.md)

# Rust

## Tipo de dato que maneja el lenguaje

Rust maneja varios tipos de datos, incluyendo `enteros (u32, i32)`, `números de punto flotante (f32, f64)`, `booleanos (bool)`, `caracteres (char) y texto (String)`. También permite la creación de tipos de datos compuestos como `tuplas`, `arrays` y `structs`.

## La disciplina de tipos

Rust es un lenguaje de programación de tipado estático, lo que significa que los tipos de todas las variables deben conocerse en tiempo de compilación. Sin embargo, Rust permite una cantidad arbitraria de tipado dinámico, lo que significa que puedes escribir código que sea totalmente dinámico y obtenga todos los errores de tipo en tiempo de ejecución.

## El paradigma del lenguaje utilizado

Rust es un lenguaje de programación multiparadigma que enfatiza el rendimiento, la seguridad de tipos y la concurrencia5. Rust fue influenciado por ideas de la programación funcional, incluyendo la inmutabilidad, funciones de orden superior y tipos de datos algebraicos.

## La estructura que lleva las funciones o métodos

En Rust, las funciones se definen con la palabra clave fn, seguida del nombre de la función y un conjunto de paréntesis que contienen los parámetros. El cuerpo de la función se encuentra dentro de llaves. Aquí tienes un ejemplo de cómo se ve la estructura de una función en Rust:

``` Rust
fn nombre_funcion(parametro: Tipo) -> TipoRetorno {
    // Cuerpo de la función
}
```

---

### Algoritmos

#### Factorial

El factorial de un número se puede calcular en Rust utilizando una función recursiva. Aquí tienes un ejemplo:

``` Rust
fn factorial(n: u32) -> u32 {
    match n {
        0 => 1,
        1 => 1,
        _ => factorial(n - 1) * n,
    }
}
```

#### Fibonacci

La secuencia de Fibonacci se puede generar en Rust con una función recursiva. Aquí tienes un ejemplo:
Rust

``` Rust
fn fibonacci(n: u32) -> u32 {
    match n {
        0 => 1,
        1 => 1,
        _ => fibonacci(n - 1) + fibonacci(n - 2),
    }
}

```

Este código genera el n-ésimo número de la secuencia de Fibonacci.

#### Palíndromo

Para verificar si una cadena es un palíndromo en Rust, puedes revertir la cadena y compararla con la original. Aquí tienes un ejemplo:

``` Rust
fn es_palindromo(s: &str) -> bool {
    let s = s.chars().collect::<String>();
    let rev = s.chars().rev().collect::<String>();
    s == rev
}

```

[Volver](../README.md)