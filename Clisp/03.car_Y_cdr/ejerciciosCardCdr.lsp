;(a  b c d e f g h)

(cddddr (cdddr '(a b c d e f g h)))
; 1 h

(car (cddddr (cddr '(a b c d e f g h))))
; 2 g

(car (cddddr (cdr '(a b c d e f g h))))
; 3 f

(car (cddr '(a b c d e f g h)))
; 4 c


; ( (a) (b d) ((1 2) 3) )

(cdr (cadr '((a) (b d) ((1 2) 3))))
; 1 d

(cdr(caaddr '((a) (b d ((1 2) 3)))))
; 2 2

(caaddr '((a) (b d) ((1 2) 3)))
; (1 2)

(cdr (caddr '((a) (b d) ((1 2) 3))))
; (3)

; ((1 2 3) ((4 5 6)) (((7 8 9 10))))

; 1 4
; 2 7
; 3 3
; 4 10