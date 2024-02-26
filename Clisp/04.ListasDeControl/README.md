# Condiciones

``` lisp
(if '()
  'i-am-true
  'i-am-false
)
```

`I-AM-FALSE`

``` lisp
(if '(1)
  progn 'i-am-true
  'i-am-false
)
```

`I-AM-TRUE`

``` lisp
(+ 5 5)
(if '()
  (progn
    'iamtrue
    + 3 4
    (print "Hola")
  )
  '(progn
    '(+ 5 5)
  )
)
```

``` lisp
(defun my-length (list)
  (if list
    (1+ (my-length (cdr list))) 0
  )
)

(my-length '(
  list with four symbols)
)
```

<!-- 
  (1 2 3 4)

  (recorre (cdr lista))

  1 2 3 4
    2 3 4
      3 4
        ()
-->

<!-- Validar que en esta lista ^  -->
(list 1 2 3 4)

(defun my-length(list)
  (if lista
    (progn
      (print (car lista)
      (recorrer (cdr lista))
      )
    )
  )  
)

(recorrer '((a) (b d) ((1 2))))

<!-- ---------------------- -->

(defun recorre(lista)
  (format  t "~A -> (car lista)
  (if lista
    (recorre (cdr lista))
  )
  )
)

(defun recorre2(lista)
  (print (car lista)) <!--Descabechamiento
  (if lista
    (recorre2 (cdr lista))
  )
)



(defun condtest(a b)
  (cond ((< a b)(print "a es menor que b"))
        ((> a b)(print "a es mayor que b"))
  )
)

(defun casetest(1)
  (case
    ((1) (print "Es el numero 1"))
    ((2) (print "Es el numero 2"))
  
  )
)