; 1. Una tienda que vende pantalones Dickies al menudeo y al mayoreo
; tiene las siguientes tarifas, si se compran menos de 5 pantalones
; estos se cobran a su precio normal, en caso de que se copren 5 o
; mas pero menos de 12 , se les descuenta el 15% en cada pantalon, si
; se compran mas de 12 se les descuenta 30% en cada pantalon.
; Escriba un programa que pida como dato de entrada el numero de
; pantalones que se desean comprar y con ello imprima el total a
; pagar por la compra hecha.

;x<5=PrecioNormal
;x>=5&&x<12=Descuentode30%

(defun calcular-total 
    (num-pantalones precio)
    (if 
        (< num-pantalones 5)
        (* num-pantalones precio)
        (if 
            (< num-pantalones 12)
            (* num-pantalones precio 0.85)
            (* num-pantalones precio 0.7))))

(defun main 
  ()
  (format t "Introduce el número de pantalones que deseas comprar: ")
  (let 
    (
      (num-pantalones 
        (read)
      )
    )
    (format t "Introduce el precio de un pantalón: ")
    (let 
      (
        (precio 
          (read)
        )
      )
      (format t "El total a pagar es: ~a" 
        (calcular-total num-pantalones precio)
      )
    )
  )
)

;C:\PrologPracticas\Clisp\06.PracticasLogFun\PRACTICAS_IF_CASE_WHEN_UNLESS_COND.lsp

;2. Escriba un programa para determinar si un solicitante puede lograr
;un préstamo. Deberá pedir los siguientes datos para cada
;solicitante: Nombre, historia crediticia(‘b’buena o ‘m’ mala),
;cantidad pedida, salario anual, y valor de otras propiedades.  El
;banco solo considerará a los solicitantes con un estado de crédito
;bueno.  De aquellos, solo aceptara los que tengan mas de 6 puntos.
;Los puntos se obtienen como sigue: 5 puntos si el salario es 50%
;del préstamo o más.  3 puntos si el salario es por lo menos 25%
;pero menos de 50% del préstamo.  1 punto si el salario es por lo
;menos 10% pero menos de 25% del préstamo.  5 puntos si se tiene
;otra propiedad del doble del préstamo o mas.  3 puntos si se tiene
;otra propiedad igual al préstamo pero menor del doble.

; Datos: Nombre, Historia crediticia('b', 'm'), cant prestamo, salario anual, valor de otras propiedades
; Puntos > 6
; 5 puntos si el salario es 50% del préstamo o más
; 3 puntos si el salario es por lo menos 25% pero menos de 50% del préstamo
; 1 punto si el salario es por lo menos 10% pero menos de 25% del préstamo.
; 5 puntos si se tiene otra propiedad del doble del préstamo o mas.
; 3 puntos si se tiene otra propiedad igual al préstamo pero menor del doble.

(defun prestamo()
  ;; (princ "Ingrese su nombre: ")
  ;; (setq nombre(read))
  ;; (princ "Ingrese historia crediticia b/m: ")
  ;; (setq histCre(read))
  (princ "Ingrese cantidad del prestamo solicitado: ")
  (setq cantPrestamo(read))
  (princ "Ingrese salario anual: ")
  (setq salario(read))
  ;; (princ "Ingrese valor de otras propiedades: ")
  ;; (setq valorPropiedaes(read))
  (calcularPuntosSalario salario cantPrestamo)
)

(defvar puntos 0)

(defun calcularPuntosSalario (salario cantPrestamo)
  (if (>= salario (/ cantPrestamo 2))
      (setq puntos 5)
      (if (>= salario (* cantPrestamo 0.25))
          (setq puntos 3)
          (if (>= salario (* cantPrestamo 0.10))
              (setq puntos 1)
              (setq puntos 0))))
  (print puntos)
)


