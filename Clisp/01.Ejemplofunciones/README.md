[Volver](../../README.md)

# Funciones Predefinidas en Clisp

## Funciones aritméticas: Realizan operaciones matemáticas básicas

1. `(+ 1 2)` ; Suma: Resultado 3
2. `(- 3 2)` ; Resta: Resultado 1
3. `(* 2 3)` ; Multiplicación: Resultado 6
4. `(/ 10 2)` ; División: Resultado 5
5. `(mod 10 3)` ; Módulo: Resultado 1
6. `(abs -5)` ; Valor absoluto: Resultado 5

## Funciones de comparación: Comparan dos o más valores

1. `(= 2 2)` ; Igual a: Resultado T (verdadero)
2. `(/= 2 3)` ; Diferente de: Resultado T (verdadero)
3. `(< 2 3)` ; Menor que: Resultado T (verdadero)
4. `(> 3 2)` ; Mayor que: Resultado T (verdadero)
5. `(<= 2 2)` ; Menor o igual que: Resultado T (verdadero)
6. `(>= 3 2)` ; Mayor o igual que: Resultado T (verdadero)

## Funciones lógicas: Realizan operaciones lógicas

1. `(and T T)` ; Y lógico: Resultado T (verdadero)
2. `(or T NIL)` ; O lógico: Resultado T (verdadero)
3. `(not T)` ; Negación lógica: Resultado NIL (falso)

## Funciones de listas: Manipulan listas

1. `(car '(1 2 3))` ; Primer elemento: Resultado 1
2. `(cdr '(1 2 3))` ; Resto de la lista: Resultado (2 3)
3. `(cons 0 '(1 2 3))` ; Agrega al principio: Resultado (0 1 2 3)
4. `(list 1 2 3)` ; Crea una lista: Resultado (1 2 3)
5. `(append '(1 2 3) '(4 5 6))` ; Une listas: Resultado (1 2 3 4 5 6)
6. `(length '(1 2 3))` ; Longitud de la lista: Resultado 3

## Funciones de control de flujo: Controlan el flujo de ejecución

1. `(if (> 2 1) 'verdadero 'falso)` ; Si verdadero, entonces 'verdadero', sino 'falso': Resultado 'verdadero'
2. `(cond ((> 3 2) 'mayor) ((< 3 2) 'menor))` ; Si 3 > 2, entonces 'mayor', sino 'menor': Resultado 'mayor'
3. `(loop for i from 1 to 3 do (print i))` ; Bucle: Imprime 1, 2, 3

## Funciones de entrada/salida: Manejan la entrada y salida de datos

1. `(print "Hola, mundo!")` ; Imprime "Hola, mundo!"
2. `(princ "Hola, mundo!")` ; Imprime "Hola, mundo!" sin comillas
3. `(format t "Hola, ~A!" "mundo")` ; Imprime "Hola, mundo!"

## Funciones de manipulación de símbolos y cadenas: Manipulan símbolos y cadenas

1. `(symbol-name 'simbolo)` ; Nombre del símbolo: Resultado "SIMBOLO"
2. `(string= "hola" "hola")` ; Compara cadenas: Resultado T (verdadero)
3. `(string< "a" "b")` ; Compara cadenas: Resultado T (verdadero)
4. `(concatenate 'string "Hola, " "mundo!")` ; Concatena cadenas: Resultado "Hola, mundo!"

## Funciones de manipulación de funciones: Manipulan funciones

1. `(defun hola () (print "¡Hola, mundo!"))` ; Define una función
2. `(hola)` ; Llama a la función: Imprime "¡Hola, mundo!"
3. `(funcall #'hola)` ; Llama a la función: Imprime "¡Hola, mundo!"
4. `(apply #'hola NIL)` ; Llama a la función: Imprime "¡Hola, mundo!"

## Funciones de manipulación de variables: Manipulan variables

1. `(setq x 10)` ; Asigna 10 a x
2. `(let ((x 5)) x)` ; Asigna 5 a x solo dentro del let: Resultado 5
3. `(defvar y 20)` ; Define y asigna 20 a y
4. `(defparameter z 30)` ; Define y asigna 30 a z

[Volver](../../README.md)