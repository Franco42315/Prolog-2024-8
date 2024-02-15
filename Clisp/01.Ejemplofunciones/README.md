[Volver](../../README.md)

# Funciones Predefinidas en Clisp

## Funciones aritméticas: Realizan operaciones matemáticas básicas.

`(+ 1 2)` ; Suma: Resultado 3
`(- 3 2)` ; Resta: Resultado 1
`(* 2 3)` ; Multiplicación: Resultado 6
`(/ 10 2)` ; División: Resultado 5
`(mod 10 3)` ; Módulo: Resultado 1
`(abs -5)` ; Valor absoluto: Resultado 5

## Funciones de comparación: Comparan dos o más valores.

`(= 2 2)` ; Igual a: Resultado T (verdadero)
`(/= 2 3)` ; Diferente de: Resultado T (verdadero)
`(< 2 3)` ; Menor que: Resultado T (verdadero)
`(> 3 2)` ; Mayor que: Resultado T (verdadero)
`(<= 2 2)` ; Menor o igual que: Resultado T (verdadero)
`(>= 3 2)` ; Mayor o igual que: Resultado T (verdadero)

## Funciones lógicas: Realizan operaciones lógicas.

`(and T T)` ; Y lógico: Resultado T (verdadero)
`(or T NIL)` ; O lógico: Resultado T (verdadero)
`(not T)` ; Negación lógica: Resultado NIL (falso)

## Funciones de listas: Manipulan listas.

`(car '(1 2 3)) ; Primer elemento: Resultado 1
`(cdr '(1 2 3)) ; Resto de la lista: Resultado (2 3)
`(cons 0 '(1 2 3)) ; Agrega al principio: Resultado (0 1 2 3)
`(list 1 2 3) ; Crea una lista: Resultado (1 2 3)
`(append '(1 2 3) '(4 5 6))` ; Une listas: Resultado (1 2 3 4 5 6)
`(length '(1 2 3))` ; Longitud de la lista: Resultado 3

## Funciones de control de flujo: Controlan el flujo de ejecución.

`(if (> 2 1) 'verdadero 'falso)` ; Si verdadero, entonces 'verdadero', sino 'falso': Resultado 'verdadero'
`(cond ((> 3 2) 'mayor) ((< 3 2) 'menor))` ; Si 3 > 2, entonces 'mayor', sino 'menor': Resultado 'mayor'
`(loop for i from 1 to 3 do (print i))` ; Bucle: Imprime 1, 2, 3

## Funciones de entrada/salida: Manejan la entrada y salida de datos.

`(print "Hola, mundo!")` ; Imprime "Hola, mundo!"
`(princ "Hola, mundo!")` ; Imprime "Hola, mundo!" sin comillas
`(format t "Hola, ~A!" "mundo")` ; Imprime "Hola, mundo!"

## Funciones de manipulación de símbolos y cadenas: Manipulan símbolos y cadenas.

`(symbol-name 'simbolo)` ; Nombre del símbolo: Resultado "SIMBOLO"
`(string= "hola" "hola")` ; Compara cadenas: Resultado T (verdadero)
`(string< "a" "b")` ; Compara cadenas: Resultado T (verdadero)
`(concatenate 'string "Hola, " "mundo!")` ; Concatena cadenas: Resultado "Hola, mundo!"

## Funciones de manipulación de funciones: Manipulan funciones.

`(defun hola () (print "¡Hola, mundo!"))` ; Define una función
`(hola)` ; Llama a la función: Imprime "¡Hola, mundo!"
`(funcall #'hola)` ; Llama a la función: Imprime "¡Hola, mundo!"
`(apply #'hola NIL)` ; Llama a la función: Imprime "¡Hola, mundo!"

## Funciones de manipulación de variables: Manipulan variables.

`(setq x 10)` ; Asigna 10 a x
`(let ((x 5)) x)` ; Asigna 5 a x solo dentro del let: Resultado 5
`(defvar y 20)` ; Define y asigna 20 a y
`(defparameter z 30)` ; Define y asigna 30 a z

[Volver](../../README.md)