; 1. Una tienda que vende pantalones Dickies al menudeo y al mayoreo
; tiene las siguientes tarifas:
; - Si se compran menos de 5 pantalones, estos se cobran a su precio normal.
; - Si se compran 5 o más pero menos de 12, se les descuenta el 15% en cada pantalón.
; - Si se compran más de 12, se les descuenta 30% en cada pantalón.
; Escriba un programa que pida como dato de entrada el número de
; pantalones que se desean comprar e imprima el total a pagar por la compra hecha.

(defun calcular-total (num-pantalones precio)
  (let ((descuento 0))
    (when (>= num-pantalones 5)
      (setf descuento 0.15))
    (when (>= num-pantalones 12)
      (setf descuento 0.30))
    (* num-pantalones (- precio (* precio descuento)))
  )
)

(defun main ()
  (format t "Ingrese el número de pantalones que desea comprar: ")
  (let ((num-pantalones (read)))
    (format t "Ingrese el precio de un pantalón: ")
    (let ((precio (read)))
      (format t "El total a pagar es: ~A" (calcular-total num-pantalones precio)))))


; 2. Escriba un programa para determinar si un solicitante puede lograr un préstamo.
; Deberá pedir los siguientes datos para cada solicitante: Nombre, historia crediticia ('b' buena o 'm' mala),
; cantidad pedida, salario anual, y valor de otras propiedades.
; El banco solo considerará a los solicitantes con un estado de crédito bueno.
; De aquellos, solo aceptará los que tengan más de 6 puntos.
; Los puntos se obtienen como sigue: 
; 5 puntos si el salario es 50% del préstamo o más.
; 3 puntos si el salario es por lo menos 25% pero menos de 50% del préstamo.
; 1 punto si el salario es por lo menos 10% pero menos de 25% del préstamo.
; 5 puntos si se tiene otra propiedad del doble del préstamo o más.
; 3 puntos si se tiene otra propiedad igual al préstamo pero menor del doble.

(defun calcular-puntos (salario cantidad-prestamo valor-propiedades)
  (let ((puntos 0))
    (when (>= salario (* 0.5 cantidad-prestamo))
      (setf puntos (+ puntos 5)))
    (when (and (>= salario (* 0.25 cantidad-prestamo)) (< salario (* 0.5 cantidad-prestamo)))
      (setf puntos (+ puntos 3)))
    (when (and (>= salario (* 0.1 cantidad-prestamo)) (< salario (* 0.25 cantidad-prestamo)))
      (setf puntos (+ puntos 1)))
    (when (>= valor-propiedades (* 2 cantidad-prestamo))
      (setf puntos (+ puntos 5)))
    (when (and (>= valor-propiedades cantidad-prestamo) (< valor-propiedades (* 2 cantidad-prestamo)))
      (setf puntos (+ puntos 3)))
    puntos))

(defun main ()
  (format t "Ingrese su nombre: ")
  (let ((nombre (read-line)))
    (format t "Ingrese su historia crediticia ('b' buena o 'm' mala): ")
    (let ((historia-crediticia (read-line)))
      (when (string= historia-crediticia "b")
        (format t "Ingrese la cantidad que desea pedir prestada: ")
        (let ((cantidad-prestamo (read)))
          (format t "Ingrese su salario anual: ")
          (let ((salario (read)))
            (format t "Ingrese el valor de sus otras propiedades: ")
            (let ((valor-propiedades (read)))
              (let ((puntos (calcular-puntos salario cantidad-prestamo valor-propiedades)))
                (if (> puntos 6)
                    (format t "Felicidades ~A, su préstamo ha sido aprobado." nombre)
                    (format t "Lo siento ~A, su préstamo no ha sido aprobado." nombre)))))))))))


; 3. Escriba un programa que pida una letra minúscula.
; El programa deberá imprimir si la letra es una vocal (a,e,i,o,u), 
; semivocal (y) o una consonante.

(defun tipo-de-letra (letra)
  (when (member letra '("a" "e" "i" "o" "u"))
    (format t "La letra ~A es una vocal." letra))
  (when (string= letra "y")
    (format t "La letra ~A es una semivocal." letra))
  (when (and (>= (char-code letra) (char-code 'a)) (<= (char-code letra) (char-code 'z)) (not (member letra '("a" "e" "i" "o" "u" "y"))))
    (format t "La letra ~A es una consonante." letra)))

(defun main ()
  (format t "Ingrese una letra minúscula: ")
  (let ((letra (read-line)))
    (tipo-de-letra letra)))


; Para determinar si un año es bisiesto o no debe de cumplir las
; siguiente regla: Ser divisible entre 4 y no divisible entre 100 o
; bien divisible entre 400.  Escriba un programa que pida como
; entrada el año e imprima si el año es bisiesto o no.

(defun es-bisiesto (ano)
  (when (or (and (= (mod ano 4) 0) (/= (mod ano 100) 0)) (= (mod ano 400) 0))
    (format t "El año ~A es bisiesto." ano))
  (unless (or (and (= (mod ano 4) 0) (/= (mod ano 100) 0)) (= (mod ano 400) 0))
    (format t "El año ~A no es bisiesto." ano)))

(defun main ()
  (format t "Ingrese un año: ")
  (let ((ano (read)))
    (es-bisiesto ano)))


; 5 Escriba un programa que pida el número de mes (del 1 al 12) 
; e imprima el número de días que tiene el mes, donde
; El mes 2 tiene 28 días. Los meses 4, 6, 9 y 11 tienen 30 días. 
; Los meses 1, 3, 5, 7, 8, 10 y 12 tienen 31 días. 
; Si da un mes diferente a los anteriores deberá imprimir el mensaje 
; MES ERRONEO.

(defun dias-del-mes (mes)
  (when (= mes 2)
    (format t "El mes ~A tiene 28 días." mes))
  (when (member mes '(4 6 9 11))
    (format t "El mes ~A tiene 30 días." mes))
  (when (member mes '(1 3 5 7 8 10 12))
    (format t "El mes ~A tiene 31 días." mes))
  (unless (member mes '(1 2 3 4 5 6 7 8 9 10 11 12))
    (format t "MES ERRONEO.")))

(defun main ()
  (format t "Ingrese el número de mes (del 1 al 12): ")
  (let ((mes (read)))
    (dias-del-mes mes)))



