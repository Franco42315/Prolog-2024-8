(defun sumaNumero()
  (princ "Dame un numero: ")
  (setq num1 (read))
  (princ "Dame un segundo numero: ")
  (setq num2 (read))
  (setq resultado(+ num1 num2))
  (write resultado)
)
; ---------------------------------------------
; 10 areas y 10 volumenes (pedir lados)

; area 1
(defun areaRectangulo()
  (princ "Dame la base: ")
  (setq num1(read))
  (princ "Dame la altura: ")
  (setq num2(read))
  (setq resultado(* num1 num2))
  (write resultado)
)

; area 2
(defun areaCuadrado()
  (princ "Dame la base: ")
  (setq base(read))
  (setq resultado(* base base))
  (write resultado)
)

; area 3
(defun areaTriangulo()
  (princ "Dame la base: ")
  (setq base(read))
  (princ "Dame la altura: ")
  (setq altura(read))
  ;(setq resultado(* base altura (/ 2)))
  (setq resultado (* base altura (/ 2)))

  (write resultado)
)

; area 4
(defun areaCirculo()
  (princ "Dame el radio: ")
  (setq radio(read))
  (setq resultado(* 3.1416 radio (/ 2)))
  (write resultado) 
)

; area 5
(defun trapecio()
  (princ "Dame la primera base: ")
  (setq base1(read))
  (princ "Dame la segunda base: ")
  (setq base2(read))
  (princ "Dame la altura: ")
  (setq altura(read))
  (setq area (* (/ 1 2) (* (+ base1 base2) altura)))
  (write area)
)

; area 6
(defun rombo()
  (princ "Dame la primera diagonal: ")
  (setq D1 (read))
  (princ "Dame la segunda diagonal: ")
  (setq D2 (read))
  (setq area (* 0.5 D1 D2))
  (write area)
)


; area 7
(defun elipse()
  (princ "Dame la longitud del semieje mayor: ")
  (setq a (read))
  (princ "Dame la longitud del semieje menor: ")
  (setq b (read))
  (setq area (* pi a b))
  (write area)
)


; area 8
(defun sectorDeUnCirculo()
  (princ "Dame el ángulo del sector en radianes: ")
  (setq theta (read))
  (princ "Dame el radio: ")
  (setq r (read))
  (setq area (/ (* theta (expt r 2)) 2))
  (write area)
)


; area 9
(defun hexagonoRegular()
  (princ "Dame la longitud del lado: ")
  (setq s (read))
  (setq area (/ (* 3 (sqrt 3) (expt s 2)) 2))
  (write area)
)


; area 10
(defun decagono()
  (princ "Dame la longitud del lado: ")
  (setq s (read))
  (setq area (* 2.5 (expt s 2) (sqrt (+ 5 (* 2 (sqrt 5))))))
  (write area)
)


