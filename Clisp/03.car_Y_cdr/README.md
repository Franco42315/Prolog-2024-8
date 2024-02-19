# Car y cdr

 Este código está escrito en Lisp, un lenguaje de programación de la familia de los lenguajes de programación funcional. Las funciones car y cdr son operaciones fundamentales en Lisp.

 ``` lisp
 (car '(a b c)) ; -> A
; La función 'car' devuelve el primer elemento de una lista. En este caso, devuelve 'A' de la lista '(A B C)'.

(cdr '(a b c)) ; -> (B C)
; La función 'cdr' devuelve la lista sin su primer elemento. En este caso, devuelve '(B C)' de la lista '(A B C)'.

(cdr (car '(a b c))) ; -> A no es una lista es un elemento
; Aquí, 'car' devuelve el primer elemento de la lista, que es 'A'. Pero 'A' no es una lista, por lo que 'cdr' no puede operar en él, lo que resulta en un error.

(car (cdr '(a b c))) ; -> B
; 'cdr' devuelve la lista sin su primer elemento, que es '(B C)'. Luego, 'car' devuelve el primer elemento de esta lista, que es 'B'.

(car (car '((a) b c))) ; -> a
; Aquí, el primer 'car' devuelve el primer elemento de la lista, que es '(a)'. Luego, el segundo 'car' devuelve el primer elemento de esta lista, que es 'a'.

(car '((a) b c)) ; -> (a)
; 'car' devuelve el primer elemento de la lista, que es '(a)'.

(caar '((a) b c)) ; -> A
; 'caar' es una combinación de dos operaciones 'car'. Devuelve el primer elemento del primer elemento de la lista, que es 'A'.

(cadr '(a b c)) ; -> B
; 'cadr' es una combinación de las operaciones 'car' y 'cdr'. Devuelve el primer elemento de la lista sin su primer elemento, que es 'B'.

(cdddr '(a b c d e f g)) ; -> (D E F G)
; 'cdddr' es una combinación de tres operaciones 'cdr'. Devuelve la lista sin sus tres primeros elementos, que es '(D E F G)'.

(cdddddr '(a b c d e f g)) ; -> (E F G)
; 'cdddddr' es una combinación de cuatro operaciones 'cdr'. Devuelve la lista sin sus cuatro primeros elementos, que es '(E F G)'.
 ```
 