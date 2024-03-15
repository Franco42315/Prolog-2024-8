# Apuntes 13/03/2024

Este código en Lisp muestra una serie de operaciones utilizando funciones como `mapcar`, `lambda`, `defun`, `trace`, y `apply`. Aquí está la documentación para cada parte del código:

1. `(mapcar #' sqrt '(1 2 3 4))`:
   - Utiliza `mapcar` para aplicar la función `sqrt` a cada elemento de la lista `(1 2 3 4)`, devolviendo una lista con las raíces cuadradas de los números en la lista original.
   - Resultado: `(1.0 1.4142135 1.7320508 2.0)`

2. `(mapcar (lambda (n) (* n 2)) '(1 2 3 4))`:
   - Utiliza `mapcar` junto con una función lambda para duplicar cada elemento de la lista `(1 2 3 4)`.
   - Resultado: `(2 4 6 8)`

3. `(defun doble(n) (* n 2))`:
   - Define una función llamada `doble` que toma un argumento `n` y devuelve el doble de `n`.

4. `(doble 2)`:
   - Llama a la función `doble` con el argumento `2`.
   - Resultado: `4`

5. `(mapcar #'doble '(1 2 3 4))`:
   - Utiliza `mapcar` para aplicar la función `doble` a cada elemento de la lista `(1 2 3 4)`.
   - Resultado: `(2 4 6 8)`

6. `(trace (mapcar (lambda (n) (* n 2)) '(1 2 3 4)))`:
   - Intenta rastrear la función `mapcar` con una función lambda como argumento. Esto produce un error porque no se puede trazar directamente una función anónima.

7. `(trace doble)`:
   - Rastrea la función `doble`.

8. `(mapcar #'doble '(1 2 3 4))`:
   - Utiliza `mapcar` para aplicar la función `doble` a cada elemento de la lista `(1 2 3 4)`.
   - Muestra trazas de la función `doble` que se están llamando para cada elemento de la lista.
   - Resultado: `(2 4 6 8)`

9. `(defun lamb(n) (lambda (n)(* n 2)))`:
   - Define una función llamada `lamb` que toma un argumento `n` y devuelve una función lambda que multiplica `n` por `2`.

10. `(trace lamb)`:
    - Rastrea la función `lamb`.

11. `(mapcar #'lamb '(1 2 3 4 5))`:
    - Utiliza `mapcar` para aplicar la función `lamb` a cada elemento de la lista `(1 2 3 4 5)`.
    - Muestra trazas de la función `lamb` que se están llamando para cada elemento de la lista.
    - Resultado: `(#<FUNCTION :LAMBDA (N) (* N 2)> #<FUNCTION :LAMBDA (N) (* N 2)> #<FUNCTION :LAMBDA (N) (* N 2)> #<FUNCTION :LAMBDA (N) (* N 2)> #<FUNCTION :LAMBDA (N) (* N 2)>)`

12. `(mapcar #' append '((mary had) (a) (little lamb)))`:
    - Utiliza `mapcar` para aplicar la función `append` a cada sublista de `((mary had) (a) (little lamb))`, lo que resulta en una lista con las sublistas concatenadas.
    - Resultado: `((MARY HAD) (A) (LITTLE LAMB))`

13. `(apply #' append '((mary had) (a) (little lamb)))`:
    - Aplica la función `append` a la lista `((mary had) (a) (little lamb))`, concatenando todas las sublistas en una sola lista.
    - Resultado: `(MARY HAD A LITTLE LAMB)`

14. `(apply #'append(apply #'append(mapcar #'cdr (car(cdr (apply #'append *nodes*))))))`:
    - Usa `apply` para aplicar `append` a una lista de sublistas después de eliminar sus primeros elementos y luego aplicar `append` nuevamente a la lista resultante.
    - Se asume que `*nodes*` es una variable global que contiene una lista de sublistas.

15. `(apply #'append(apply #' append(mapcar #'cdr(apply #' append(car(mapcar #'cdr *nodes*))))))`:
    - Realiza una operación similar al punto anterior, pero esta vez utilizando `mapcar` dos veces para acceder a los elementos internos de la lista de sublistas.

16. `(ANA AZULA TOP KATARA)`:
    - Esta parte parece ser simplemente una lista de símbolos o palabras sin ninguna operación adicional o contexto proporcionado.
