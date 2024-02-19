[Volver](../../README.md)

# Car y cdr

car y cdr son dos operaciones fundamentales en Lisp, un lenguaje de programación de la familia de los lenguajes de programación funcional.

`car`: Esta función devuelve el primer elemento de una lista. Por ejemplo, si tienes una lista (a b c), car devolverá a.

``` lisp
(car '(a b c)) ; -> A
```

`cdr`: Esta función devuelve la lista sin su primer elemento. Por ejemplo, si tienes una lista (a b c), cdr devolverá (b c).

``` lisp
(cdr '(a b c)) ; -> (B C)
```

Estas dos funciones son la base de muchas operaciones en Lisp y se utilizan para manipular listas y pares. El nombre car y cdr provienen de los términos del IBM 704, la máquina en la que se implementó Lisp por primera vez: car significa “Contents of Address Register” y cdr significa “Contents of Decrement Register”.

---

 Este código está escrito en Lisp, un lenguaje de programación de la familia de los lenguajes de programación funcional. Las funciones car y cdr son operaciones fundamentales en Lisp.

 ``` lisp
 (car '(a b c)) ; -> A
 ```

La función `car` devuelve el primer elemento de una lista. En este caso, devuelve `A` de la lista `(A B C)`.

``` lisp
(cdr '(a b c)) ; -> (B C)
```

La función `cdr` devuelve la lista sin su primer elemento. En este caso, devuelve `(B C)` de la lista `(A B C)`.

``` lisp
(cdr (car '(a b c))) ; -> A no es una lista es un elemento
```

Aquí, `car` devuelve el primer elemento de la lista, que es `A`. Pero `A` no es una lista, por lo que `cdr` no puede operar en él, lo que resulta en un error.

``` lisp
(car (cdr '(a b c))) ; -> B
```

`cdr` devuelve la lista sin su primer elemento, que es `(B C)`. Luego, `car` devuelve el primer elemento de esta lista, que es `B`.

``` lisp
(car (car '((a) b c))) ; -> a
```

Aquí, el primer `car` devuelve el primer elemento de la lista, que es `(a)`. Luego, el segundo `car` devuelve el primer elemento de esta lista, que es `a`.

``` lisp
(car '((a) b c)) ; -> (a)
```

`car` devuelve el primer elemento de la lista, que es `(a)`.

``` lisp
(caar '((a) b c)) ; -> A
```

`caar` es una combinación de dos operaciones `car`. Devuelve el primer elemento del primer elemento de la lista, que es `A`.

``` lisp
(cadr '(a b c)) ; -> B
```

`cadr` es una combinación de las operaciones `car` y `cdr`. Devuelve el primer elemento de la lista sin su primer elemento, que es `B`.

``` lisp
(cdddr '(a b c d e f g)) ; -> (D E F G)
```

`cdddr` es una combinación de tres operaciones `cdr`. Devuelve la lista sin sus tres primeros elementos, que es `(D E F G)`.

``` lisp
(cdddddr '(a b c d e f g)) ; -> (E F G)
```

`cdddddr` es una combinación de cuatro operaciones `cdr`. Devuelve la lista sin sus cuatro primeros elementos, que es `(E F G)`.

---

## Ejercicios en clase

### (a  b c d e f g h)

``` lisp

(cddddr (cdddr '(a b c d e f g h)))
; 1 h

(car (cddddr (cddr '(a b c d e f g h))))
; 2 g

(car (cddddr (cdr '(a b c d e f g h))))
; 3 f

(car (cddr '(a b c d e f g h)))
; 4 c

```

### ( (a) (b d) ((1 2) 3) )

``` lisp
(cdr (cadr '((a) (b d) ((1 2) 3))))
; 1 d

(cdr(caaddr '((a) (b d ((1 2) 3)))))
; 2 2

(caaddr '((a) (b d) ((1 2) 3)))
; (1 2)

(cdr (caddr '((a) (b d) ((1 2) 3))))
; (3)

```

### ((1 2 3) ((4 5 6)) (((7 8 9 10))))

``` lisp
; 1 4
; 2 7
; 3 3
; 4 10

```

[Volver](../../README.md)