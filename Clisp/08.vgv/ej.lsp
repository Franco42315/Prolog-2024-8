(mapcar #' sqrt '(1 2 3 4))

(mapcar (lambda (n) (* n 2)) '(1 2 3 4))

  (defun doble(n)
    (* n 2)
  )

(doble 2)

(mapcar #'doble '(1 2 3 4))
(2 4 6 8)


(trace (mapcar (lambda (n) (* n 2)) '(1 2 3 4)))
Error

(trace doble)
(mapcar #'doble '(1 2 3 4))

1. Trace: (DOBLE '1)
1. Trace: DOBLE ==> 2
1. Trace: (DOBLE '2)
1. Trace: DOBLE ==> 4
1. Trace: (DOBLE '3)
1. Trace: DOBLE ==> 6
1. Trace: (DOBLE '4)
1. Trace: DOBLE ==> 8
(2 4 6 8)

(defun lamb(n)
  (lambda (n)(* n 2))
)

(trace lamb)

(mapcar #'lamb '(1 2 3 4 5))

Break 1 [3]> (mapcar #'lamb '(1 2 3 4 5))
1. Trace: (LAMB '1)
1. Trace: LAMB ==> #<FUNCTION :LAMBDA (N) (* N 2)>
1. Trace: (LAMB '2)
1. Trace: LAMB ==> #<FUNCTION :LAMBDA (N) (* N 2)>
1. Trace: (LAMB '3)
1. Trace: LAMB ==> #<FUNCTION :LAMBDA (N) (* N 2)>
1. Trace: (LAMB '4)
1. Trace: LAMB ==> #<FUNCTION :LAMBDA (N) (* N 2)>
1. Trace: (LAMB '5)
1. Trace: LAMB ==> #<FUNCTION :LAMBDA (N) (* N 2)>
(#<FUNCTION :LAMBDA (N) (* N 2)> #<FUNCTION :LAMBDA (N) (* N 2)> #<FUNCTION :LAMBDA (N) (* N 2)>
#<FUNCTION :LAMBDA (N) (* N 2)> #<FUNCTION :LAMBDA (N) (* N 2)>)

Break 1 [3]> (mapcar #' append '((mary had) (a) (little lamb)))
((MARY HAD) (A) (LITTLE LAMB))
Break 1 [3]> (apply #' append '((mary had) (a) (little lamb)))
(MARY HAD A LITTLE LAMB)


(apply #'append(apply #'append(mapcar #'cdr (car(cdr (apply #'append *nodes*))))))

(apply #'append(apply #' append(mapcar #'cdr(apply #' append(car(mapcar #'cdr *nodes*))))))

(ANA AZULA TOP KATARA)