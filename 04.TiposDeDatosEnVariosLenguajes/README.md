[Volver](../README.md)

# Practica 2

## Tipos de datos y Disciplina de tipos

Eduardo Alcaraz
February 12, 2024

La disciplina de tipos se refiere al conjunto de reglas que definen cómolos tipos de datos se utilizan y se gestionan en un lenguaje de programación.

Esta disciplina es crucial para entender cómo los lenguajes de programaciónclasifican y operan con los datos, y cómo esto afecta la seguridad, la cor-rección y la eficiencia del código.

Hay varios aspectos clave que definen ladisciplina de tipos en los lenguajes de programación:

### Tipado Fuerte vs. Tipado Débil

- **Tipado Fuerte**: En un lenguaje de tipado fuerte, las conver-siones de tipo son más controladas y restringidas. Esto significaque el lenguaje no permitirá operaciones que intenten mezclartipos incompatibles sin una conversión explícita.  Este enfoquepuede ayudar a prevenir errores en tiempo de ejecución, ya quetodos los tipos son verificados de manera estricta.

- **Tipado Débil** Los lenguajes de tipado débil permiten más flex-ibilidad en las conversiones de tipos, a menudo realizando conver-siones implícitas entre tipos incompatibles.

Esto puede hacer queel código sea más fácil de escribir, pero también puede introducirerrores sutiles y difíciles de detectar.

### Tipado Estático vs. Tipado Dinámico

- **Tipado Estático**: En un lenguaje de tipado estático, el tipo decada variable y expresión debe ser conocido en tiempo de com-pilación. Esto permite que el compilador detecte errores de tipoantes de la ejecución del programa, lo cual puede mejorar la se-guridad y eficiencia del código.
- **Tipado Dinámico**: Los lenguajes de tipado dinámico determi-nan los tipos de las variables en tiempo de ejecución. Esto ofreceuna mayor flexibilidad y puede hacer que el código sea más fá-cil de escribir y leer, pero a costa de una posible reducción en elrendimiento y aumentando el riesgo de errores de tipo en tiempode ejecución.

### Inferencia de Tipos

Algunos lenguajes de programación pueden inferir el tipo de una variableautomáticamente basándose en el contexto en el que se usa.

Esto puede re-ducir la necesidad de declaraciones de tipo explícitas, simplificando el códigosin sacrificar la seguridad del tipado estático.

### Sistemas de Tipos

El sistema de tipos de un lenguaje de programación es el conjunto de reglasque define cómo se pueden combinar y operar los tipos.

Esto incluye:

- **Compatibilidad de Tipos**: Cómo los tipos se relacionan entre sí ybajo qué condiciones se consideran compatibles.
- **Polimorfismo**: La capacidad de abstraer operaciones en diferentes tipos de manera que puedan trabajar con datos de variostipos.
- **Tipos Genéricos (o Paramétricos)**: Permiten la definiciónde estructuras de datos o funciones que pueden operar sobrecualquier tipo, definido en el momento de la utilización.

#### Dado los siguientes lenguajes

- Python
- C
- Java
- Perl
- Go
- Rust

Se requiere resolver los siguientes programas

- Calcular el factorial de un numero

- Calcular el fibonacci de un numero

- Validar si una palabra es capicúa o no

Para cada código se debe de identificar los siguientes puntos.

- Tipo de dato que maneja el lenguaje

- La disciplina de tipos

- El paradigma del lenguaje utilizado

- La estructura que lleva las funciones o métodos.

---
#### [Python](./Python/README.md)

#### [Java](./Java/README.md)

#### [C](./C/README.md)

#### [Perl](./Perl/README.md)

#### [Go](./Go/README.md)

#### [Rust](./Rust/README.md)
---
[Volver](../README.md)