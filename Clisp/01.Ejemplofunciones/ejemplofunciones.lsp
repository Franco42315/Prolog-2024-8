(defun holamundo()
  (print "Hola mundo")
)

(defun suma(a b)
  (holamundo)
  (+ a b)
)

(defun factorial(a)
  (if (= a 0)
    1
    (* a (factorial(- a 1)))
  )
)

; buscar 20 funciones ya definidas de lisp y documentarlas
; md en el repositorio
