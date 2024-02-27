; 1. Este programa calcula el total a pagar por la compra de pantalones en una tienda,
;    aplicando tarifas según la cantidad de pantalones comprados.

(defun calcular-total (num-pantalones precio)
  ; Si se compran menos de 5 pantalones, se cobran al precio normal.
  (if (< num-pantalones 5)
      (* num-pantalones precio)
      ; Si se compran 5 o más pero menos de 12, se aplica un descuento del 15% en cada pantalón.
      (if (< num-pantalones 12)
          (* num-pantalones precio 0.85)
          ; Si se compran más de 12, se aplica un descuento del 30% en cada pantalón.
          (* num-pantalones precio 0.7))))

(defun main ()
  ; Solicita al usuario el número de pantalones y su precio.
  (format t "Introduce el número de pantalones que deseas comprar: ")
  (let ((num-pantalones (read)))
    (format t "Introduce el precio de un pantalón: ")
    (let ((precio (read)))
      ; Imprime el total a pagar.
      (format t "El total a pagar es: ~a" 
              (calcular-total num-pantalones precio)))))

; 2. Este programa determina si un solicitante puede obtener un préstamo basado en su historial crediticio,
;    cantidad solicitada, salario anual y valor de otras propiedades.

(defvar puntos 0)

(defun prestamo ()
  ; Solicita datos del solicitante.
  (princ "Ingrese su nombre: ")
  (setq nombre (read))
  (princ "Ingrese historia crediticia b/m: ")
  (setq histCre (read))
  (princ "Ingrese cantidad del préstamo solicitado: ")
  (setq cantPrestamo (read))
  (princ "Ingrese salario anual: ")
  (setq salario (read))
  (princ "Ingrese valor de otras propiedades: ")
  (setq valorPropiedades (read))
  
  ; Evalúa si el solicitante cumple con los requisitos para obtener el préstamo.
  (if (string-equal histCre "b")
      (progn
        (calcularPuntosSalario salario cantPrestamo)
        (calcularPuntosOProp valorPropiedades cantPrestamo)
        ; Si tiene más de 6 puntos, se aprueba el préstamo.
        (if (> puntos 6)
            (print "Su préstamo ha sido aprobado")
            (print "Lo sentimos, no tiene suficientes puntos para un préstamo")))
      (print "Su estado es malo, por lo tanto no se le puede dar un crédito"))
  (print puntos))

(defun calcularPuntosSalario (salario cantPrestamo)
  ; Calcula los puntos según el salario en relación con la cantidad solicitada.
  (if (>= salario (/ cantPrestamo 2))
      (setq puntos 5)
      (if (>= salario (* cantPrestamo 0.25))
          (setq puntos 3)
          (if (>= salario (* cantPrestamo 0.10))
              (setq puntos 1)
              (setq puntos 0))))
  (print puntos))

(defun calcularPuntosOProp (valorPropiedades cantPrestamo)
  ; Calcula los puntos según el valor de otras propiedades en relación con la cantidad solicitada.
  (if (>= valorPropiedades (* cantPrestamo 2))
      (incf puntos 5)
      (if (>= valorPropiedades cantPrestamo)  
          (incf puntos 3))))

; 3. Este programa identifica si una letra minúscula ingresada por el usuario es una vocal, semivocal o consonante.

(defun tipo-de-letra()
  ; Solicita al usuario ingresar una letra minúscula.
  (princ "Ingrese una letra minuscula: ")
  (setq letra (read-char))
  ; Evalúa la letra ingresada y la clasifica como vocal, semivocal o consonante.
  (if (char= letra #\a)
      (format t "La letra \"a\" es una vocal")
      (if (char= letra #\e)
          (format t "La letra \"e\" es una vocal")
          (if (char= letra #\i)
              (format t "La letra \"i\" es una vocal")
              (if (char= letra #\o)
                  (format t "La letra \"o\" es una vocal")
                  (if (char= letra #\u)
                      (format t "La letra \"u\" es una vocal")
                      (if (char= letra #\y)
                          (format t "La letra \"y\" es una semivocal")
                          (format t "La letra ingresada es una consonante")
                      )
                  )
              )
          )
      )
  )
)

; 4. Este programa determina si un año ingresado por el usuario es bisiesto o no.

(defun bisiesto()
  ; Solicita al usuario ingresar un año.
  (princ "Ingrese un año: ")
  (setq año (read))
  ; Evalúa si el año ingresado es bisiesto o no.
  (if (or (and (= (mod año 4) 0) (/= (mod año 100) 0)) (= (mod año 400) 0))
      (print "Si es año bisiesto")
      (print "No es año bisiesto")
  )
)

; 5. Este programa solicita al usuario el número de un mes y luego imprime la cantidad de días en ese mes.

(defun meses()
  ; Solicita al usuario ingresar un número de mes.
  (princ "Ingresa un número de mes: ")
  (setq mes (read))
  (if (= mes 2)
      (format t "El mes ~a tiene 28 días" mes)
      (if (or (= mes 4) (= mes 6) (= mes 9) (= mes 11))
          (format t "El mes ~a tiene 30 días" mes)
          (if (or (= mes 1) (= mes 3) (= mes 5) (= mes 7) (= mes 8) (= mes 10) (= mes 12))
              (format t "El mes ~a tiene 31 días" mes)
              (print "MES ERRONEO")
          )
      )
  )
)
