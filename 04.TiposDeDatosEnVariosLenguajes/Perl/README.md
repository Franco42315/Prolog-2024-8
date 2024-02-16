[Volver](../README.md)

# Perl

## Tipo de dato que maneja el lenguaje

Perl es un lenguaje de tipado dinámico y tiene tres tipos de datos básicos:

`Escalares`: Son una sola unidad de datos que puede ser un número entero, de punto flotante, un carácter, una cadena, un párrafo o incluso una página web completa.

`Arreglos`: Son variables que almacenan el valor del mismo tipo de datos en forma de lista.

`Hashes (Arreglos Asociativos)`: Es un conjunto de pares clave-valor.

## La disciplina de tipos

Perl es un lenguaje de tipado dinámico. Algunos autores pueden referirse a Perl como de tipado fuerte o débil, pero estos términos pueden tener diferentes interpretaciones y no hay un consenso claro.

## El paradigma del lenguaje utilizado

Perl es un lenguaje multiparadigma. Soporta programación procedural, orientada a objetos y también permite la programación funcional.

## La estructura que lleva las funciones o métodos

En Perl, una función o subrutina es un grupo de declaraciones que juntas realizan una tarea específica. Aquí tienes un ejemplo de cómo se ve una función en Perl:

``` Perl

sub nombre_de_la_funcion {
    # Código de la función
}

```

---

### Algoritmos

#### Factorial

Este método calcula el factorial de un número n. Comienza con fact igual a 1 y luego multiplica fact por cada número de 2 a n.

```Perl

sub factorial {
    my ($n) = @_;
    return 1 if $n == 0;
    return $n * factorial($n - 1);
}

```

#### Fibonacci

Este método calcula el número de Fibonacci en la posición n utilizando recursión. Si n es 0 o 1, devuelve n. De lo contrario, llama recursivamente al método fibonacci para n - 1 y n - 2 y devuelve la suma.

``` Perl

sub fibonacci {
    my ($n) = @_;
    return $n if $n < 2;
    return fibonacci($n - 1) + fibonacci($n - 2);
}

```

#### Palíndromos

```Perl

sub es_palindromo {
    my ($cadena) = @_;
    return $cadena eq reverse $cadena;
}

```

[Volver](../README.md)