(car '(a b c))
; -> A

(cdr '(a b c))
; -> (B C)

(cdr (car '(a b c)))
; -> A no es una lista es un elemento

(car (cdr '(a b c)))
; (cdr '(a b c))       -> B C
; (car (cdr '(a b c))) -> B

(car (car '((a) b c)))
; -> a

(car '((a) b c))
; -> (a)

(caar '((a) b c))
; -> A

(cadr '(a b c)) ; -> (car (cdr '(a b c)))
; -> B

(cdddr '(a b c d e f g))
; -> (D E F G)

(cdddddr '(a b c d e f g))
; -> Error

(cdddddr '(a b c d e f g))
; -> (E F G)