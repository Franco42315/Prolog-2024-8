[Volver](../../README.md)

# Condicionales

`if`: La estructura if en Lisp toma tres argumentos: una condición, una expresión a evaluar si la condición es verdadera, y una expresión a evaluar si la condición es falsa.

``` lisp
(if (< 3 5)
    (print "Verdadero")
    (print "Falso"))
```

En este ejemplo, como 3 es menor que 5, se imprime `“Verdadero”`.

`case`: La estructura case en Lisp compara una expresión con una lista de cláusulas, cada una de las cuales consta de una lista de valores y una expresión a evaluar si la expresión coincide con uno de los valores.

``` lisp
(case 'verde
  ((rojo azul) (print "Color primario"))
  ((verde violeta naranja) (print "Color secundario"))
  (t (print "Otro color")))
```

En este ejemplo, como el valor es ‘verde’, se imprime `“Color secundario”`.

`when`: La estructura when en Lisp evalúa una condición y, si es verdadera, evalúa una serie de expresiones.

``` lisp
(when (> 5 3)
  (print "5 es mayor que 3")
  (print "Esto también se imprime"))

```

En este ejemplo, como 5 es mayor que 3, se imprimen ambas líneas.

`unless`: La estructura unless en Lisp es similar a when, pero evalúa las expresiones si la condición es falsa.

``` lisp
(unless (= 2 3)
  (print "2 no es igual a 3")
  (print "Esto también se imprime"))
```

En este ejemplo, como 2 no es igual a 3, se imprimen ambas líneas.

`cond`: La estructura cond en Lisp permite múltiples ramas de condiciones. Cada rama consta de una condición y una expresión a evaluar si la condición es verdadera. cond evalúa las condiciones en orden hasta que encuentra una que sea verdadera.

``` lisp
(cond
  ((> 3 5) (print "3 es mayor que 5"))
  ((< 3 5) (print "3 es menor que 5"))
  (t (print "3 es igual a 5")))
```

En este ejemplo, como 3 es menor que 5, se imprime “3 es menor que 5”.

---

	━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	  PRACTICAS IF, CASE, WHEN, UNLESS, COND

	Eduardo Alcaraz
	━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


Table of Contents
─────────────────

1 Ejercicios if case when unless cond
═════════════════════════════════════

  Resolver los siguientes problemas utilizando if, case, when, unless,
  cond checar pagina del libro

  1. Una tienda que vende pantalones Dickies al menudeo y al mayoreo
     tiene las siguientes tarifas, si se compran menos de 5 pantalones
     estos se cobran a su precio normal, en caso de que se copren 5 o
     mas pero menos de 12 , se les descuenta el 15% en cada pantalon, si
     se compran mas de 12 se les descuenta 30% en cada pantalon.
     Escriba un programa que pida como dato de entrada el numero de
     pantalones que se desean comprar y con ello imprima el total a
     pagar por la compra hecha.

  2. Escriba un programa para determinar si un solicitante puede lograr
     un préstamo. Deberá pedir los siguientes datos para cada
     solicitante: Nombre, historia crediticia(‘b’buena o ‘m’ mala),
     cantidad pedida, salario anual, y valor de otras propiedades.  El
     banco solo considerará a los solicitantes con un estado de crédito
     bueno.  De aquellos, solo aceptara los que tengan mas de 6 puntos.
     Los puntos se obtienen como sigue: 5 puntos si el salario es 50%
     del préstamo o más.  3 puntos si el salario es por lo menos 25%
     pero menos de 50% del préstamo.  1 punto si el salario es por lo
     menos 10% pero menos de 25% del préstamo.  5 puntos si se tiene
     otra propiedad del doble del préstamo o mas.  3 puntos si se tiene
     otra propiedad igual al préstamo pero menor del doble.

  3. Escriba un programa que pida una letra minúscula, el programa
     deberá imprimir si la letra es una vocal (a,e,i,o,u), semivocal (y)
     o una consonante.

  4. Para determinar si un año es bisiesto o no debe de cumplir las
     siguiente regla: Ser divisible entre 4 y no divisible entre 100 o
     bien divisible entre 400.  Escriba un programa que pida como
     entrada el año e imprima si el año es bisiesto o no.

  5. Escriba un programa que pida el numero de mes (del 1 al 12 ) e
     imprima el numero de dias que tiene el mes, donde:

     • El mes 2 tiene 28 dias
     • Los meses 4,6,9 y 11 tienen 30 dias
     • Los meses 1,3,5,7,8,10 y 12 tienen 31 dias

     Si da un mes diferente a los anteriores debera imprimir el mensaje
     “MES ERRONEO”.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
     [IF](./Practicas_if.lsp)
     [CASE](./Practicas_case.lsp)
     [WHEN](./Practicas_when.lsp)
     [UNLESS](./Practicas_unless.lsp)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Volver](../../README.md)