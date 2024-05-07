;1.  Escribir una función recursica que devuelva la suma de los primeros X enteros

(defvar resultado 1)
(defvar incremento 1)

(defun suma(num)
	(if (> num 1)
		(progn	
			(incf resultado incremento)
			(incf incremento 1)
			(setq num (- num 1))
			(suma (num))
		)
		(print resultado)
	)
)

;2. Escribir un programa que encuentre la suma de los enteros positivos pares desde N hasta 2

(defun sumapares (num)
  (if (< num 2)
      0
      (+ num (sumapares (- n 2)))))

;3. Asignar a la variable X1 la lista (COCHE MOTO TREN) y a la variable X2 la lista (EDUARDO PEDRO ANTONIO)
 ;- Concadenar las dos listas y calcular la longitud de la lista restultante
 ;- Construir una lista cuyos elementos sean los elementos finales de X1 y X2
 ;- a PARTIR DE x1 Y x2, construir las listas
(setq X1 '(COCHE MOTO TREN))

(setq X2 '(EDUARDO PEDRO ANTONIO))

(setq X3 (append X1 X2))

(setq longitud (length X3))

(setq finales (list (car (last X1)) (car (last X2))))

(format t "Lista concatenada: ~a~%" X3)
(format t "Longitud de la lista concatenada: ~a~%" longitud)
(format t "Elementos finales de X1 y X2: ~a~%" finales)

(defparameter *lista* '(a b c d))

(cdddr *lista*)

;5. Definir una función que tenga por argumento una lista y devuelva otra lista con el primer y último elemento de la lista
(defun primer-ultimo (lista)
    (list (car lista) (car (last lista)))
)
