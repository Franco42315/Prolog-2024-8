(defun print-menu ()
  (format t "~&1. Áreas~%2. Volúmenes~%Seleccione una opción: "))

(defun calculate-area ()
  (format t "Seleccionaste calcular áreas.~%")
  (format t "1. Área de un rectángulo~%2. Área de un cuadrado~%3. Área de un triángulo~%4. Área de un círculo~%5. Área de un trapecio~%6. Área de un rombo~%7. Área de una elipse~%8. Área de un sector de un círculo~%9. Área de un hexágono regular~%10. Área de un decágono~%"))

(defun calculate-volume ()
  (format t "Seleccionaste calcular volúmenes.~%")
  (format t "1. Volumen de un cubo~%2. Volumen de un cilindro~%3. Volumen de una esfera~%4. Volumen de un cono~%5. Volumen de un prisma rectangular~%6. Volumen de una pirámide~%7. Volumen de un tetraedro~%8. Volumen de un octaedro~%9. Volumen de un dodecaedro~%10. Volumen de un icosaedro~%"))

(defun main ()
  (print-menu)
  (let ((option (read)))
    (case option
      (1 (calculate-area))
      (2 (calculate-volume))
      (t (format t "Opción no válida. Intente de nuevo.~%")))))

(main)

; Aquí van las funciones para calcular las áreas y volúmenes...

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

; Volumenes

; Volumen de un cubo
(defun volumen-cubo ()
  (princ "Dame el lado: ")
  (setq lado (read))
  (setq resultado (* lado lado lado))
  (write resultado))

; Volumen de un cilindro
(defun volumen-cilindro ()
  (princ "Dame el radio: ")
  (setq radio (read))
  (princ "Dame la altura: ")
  (setq altura (read))
  (setq resultado (* pi radio radio altura))
  (write resultado))

; Volumen de una esfera
(defun volumen-esfera ()
  (princ "Dame el radio: ")
  (setq radio (read))
  (setq resultado (* 4/3 pi radio radio radio))
  (write resultado))

; Volumen de un cono
(defun volumen-cono ()
  (princ "Dame el radio: ")
  (setq radio (read))
  (princ "Dame la altura: ")
  (setq altura (read))
  (setq resultado (* 1/3 pi radio radio altura))
  (write resultado))

; Volumen de un prisma rectangular
(defun volumen-prisma-rectangular ()
  (princ "Dame el largo: ")
  (setq largo (read))
  (princ "Dame el ancho: ")
  (setq ancho (read))
  (princ "Dame la altura: ")
  (setq altura (read))
  (setq resultado (* largo ancho altura))
  (write resultado))

; Volumen de una pirámide
(defun volumen-piramide ()
  (princ "Dame la base: ")
  (setq base (read))
  (princ "Dame la altura: ")
  (setq altura (read))
  (setq resultado (* 1/3 base altura))
  (write resultado))

; Volumen de un tetraedro
(defun volumen-tetraedro ()
  (princ "Dame la arista: ")
  (setq arista (read))
  (setq resultado (* 1/6 (sqrt 2) arista arista arista))
  (write resultado))

; Volumen de un octaedro
(defun volumen-octaedro ()
  (princ "Dame la arista: ")
  (setq arista (read))
  (setq resultado (* 1/3 (sqrt 2) arista arista arista))
  (write resultado))

; Volumen de un dodecaedro
(defun volumen-dodecaedro ()
  (princ "Dame la arista: ")
  (setq arista (read))
  (setq resultado (* 1/4 (sqrt (75 + 10 * (sqrt 5))) arista arista arista))
  (write resultado))

; Volumen de un icosaedro
(defun volumen-icosaedro ()
  (princ "Dame la arista: ")
  (setq arista (read))
  (setq resultado (* 5/12 (3 + sqrt 5) arista arista arista))
  (write resultado))

; C:\PrologPracticas\Clisp\05.MenúÁreaVolumen\ActCase.lsp