; 1. Una tienda que vende pantalones Dickies al menudeo y al mayoreo
; tiene las siguientes tarifas:
; - Si se compran menos de 5 pantalones, estos se cobran a su precio normal.
; - Si se compran 5 o más pero menos de 12, se les descuenta el 15% en cada pantalón.
; - Si se compran más de 12, se les descuenta 30% en cada pantalón.
; Escriba un programa que pida como dato de entrada el número de
; pantalones que se desean comprar e imprima el total a pagar por la compra hecha.

(defun pantalones()
  (princ "Ingrese el precio de la unidad de pantalon: ")
  (setq precio(read))
  (princ "Ingrese la cantidad de pantalones a comprar: ")
  (setq cantidad(read))
  (case cantidad 
    ((1 2 3 4) 
      (setq total (* cantidad precio))
      (format t "El total a pagar no aplica descuento: total ~a" total)
    )
    ((5 6 7 8 9 10 11 )
      (setq total (* cantidad (* precio 0.85 )))
      (format t "El total a pagar con descuento del 15%: total ~a" total)
    )
    (otherwise 
      (setq total (* cantidad (* precio 0.70 )))
      (format t "El total a pagar con descuento del 30%: total ~a" total)
    )
  )
)

; otherwise se usa para manejar todos los casos que no coinciden con los 
; valores exactos en las listas. Si la cantidad ingresada no está en 
; ninguna de las listas, se imprimirá el mensaje 
; “La cantidad ingresada no tiene un descuento asociado.”.

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

(defun solicitar-prestamo ()
  (princ "Ingrese su nombre: ")
  (setq nombre (read))
  (princ "Ingrese su historia crediticia ('b' buena o 'm' mala): ")
  (setq historia-crediticia (read))
  (princ "Ingrese la cantidad pedida: ")
  (setq cantidad-pedida (read))
  (princ "Ingrese su salario anual: ")
  (setq salario-anual (read))
  (princ "Ingrese el valor de otras propiedades: ")
  (setq valor-otras-propiedades (read))

  (if (equal historia-crediticia 'b)
    (let ((puntos 0))
      (setq puntos (+ puntos 
        (case t
          ((>= salario-anual (* 0.50 cantidad-pedida)) 5)
          ((and (>= salario-anual (* 0.25 cantidad-pedida)) (< salario-anual (* 0.50 cantidad-pedida))) 3)
          ((and (>= salario-anual (* 0.10 cantidad-pedida)) (< salario-anual (* 0.25 cantidad-pedida))) 1)
          (otherwise 0)
        )
      ))
      (setq puntos (+ puntos
        (case t
          ((>= valor-otras-propiedades (* 2 cantidad-pedida)) 5)
            ((and (>= valor-otras-propiedades cantidad-pedida) (< valor-otras-propiedades (* 2 cantidad-pedida))) 3)
          (otherwise 0)
        )
      ))
      (if (> puntos 6)
        (format t "Felicidades ~a, tu préstamo ha sido aprobado." nombre)
        (format t "Lo siento ~a, tu préstamo no ha sido aprobado." nombre)))
    (format t "Lo siento ~a, tu préstamo no ha sido aprobado debido a tu historia crediticia." nombre)))


; 3. Escriba un programa que pida una letra minúscula.
; El programa deberá imprimir si la letra es una vocal (a,e,i,o,u), 
; semivocal (y) o una consonante.

(defun letras()
  (princ "Ingrese una letra: ")
  (setq letra (read-char))
  (case letra
    ((#\a)
      (format t "La letra \"a\" es una vocal")
    )
    ((#\e)
      (format t "La letra \"e\" es una vocal")
    )
    ((#\i)
      (format t "La letra \"i\" es una vocal")
    )
    ((#\o)
      (format t "La letra \"o\" es una vocal")
    )
    ((#\u)
      (format t "La letra \"u\" es una vocal")
    )
    ((#\y)
      (format t "La letra \"y\" es una semivocal")
    )
    (otherwise
      (print "Se ha ingresado una consonante")
    )
  )
)



; Para determinar si un año es bisiesto o no debe de cumplir las
; siguiente regla: Ser divisible entre 4 y no divisible entre 100 o
; bien divisible entre 400.  Escriba un programa que pida como
; entrada el año e imprima si el año es bisiesto o no.

;En Lisp, case no es la herramienta adecuada para este tipo de comparaciones, ya que case se utiliza para comparar con valores exactos, no para comparaciones booleanas como divisibilidad. Para este tipo de comparaciones, if o cond son más apropiados.



; 5 Escriba un programa que pida el número de mes (del 1 al 12) 
; e imprima el número de días que tiene el mes, donde
; El mes 2 tiene 28 días. Los meses 4, 6, 9 y 11 tienen 30 días. 
; Los meses 1, 3, 5, 7, 8, 10 y 12 tienen 31 días. 
; Si da un mes diferente a los anteriores deberá imprimir el mensaje 
; MES ERRONEO.

(defun meses ()
  (princ "Ingresa un número de mes: ")
  (setq mes (read))
  (case mes
    ((2) (format t "El mes ~a tiene 28 días" mes))
    ((4 6 9 11) (format t "El mes ~a tiene 30 días" mes))
    ((1 3 5 7 8 10 12) (format t "El mes ~a tiene 31 días" mes))
    (otherwise (print "MES ERRONEO"))
  )
)


