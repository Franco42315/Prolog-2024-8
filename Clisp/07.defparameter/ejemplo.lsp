(defun recorre(lista)
  (format t " ¿Tu personaje es ~a ?->% \n" (car lista))
  (format t "~%")
  (princ "Si / No: ")
  (setq personaje(read))
  (print personaje)
  ;(print (car lista))
  ;; (if lista
  ;;   (recorre (car lista))
  ;; )
)


(defparameter *nodes*  '
    (
        (femenino 
            (
                (poderes 
                    (aire 
                        (Hola rayo))		
                    (fuego
                        (Hola fuego))		
                    (tierra
                        (Hola Tierra))		
                    (agua 
                        (poder de agua)))))
        (masculino
            (
                (aire 
                    (Hola rayo))		
                (fuego
                    (Hola fuego))		
                (tierra
                    (Hola Tierra))		
                (agua 
                    (poder de agua))))
        (ovni
            (
                (aire 
                    (Hola rayo))		
                (fuego
                    (Hola fuego))		
                (tierra
                    (Hola Tierra))		
                (agua 
                    (poder de agua)))
)
        (aleatorio
            (
                (aire 
                    (Hola rayo))		
                (fuego
                    (Hola fuego))		
                (tierra
                    (Hola Tierra))		
                (agua 
                    (poder de agua)))
)


)

)

; dada una estructura listar femenino, masculino, ovni, aleatorio

;car cdr assoc mapcar

; C:\PrologPracticas\Clisp\07.defparameter\ejemplo.lsp

; (recorre (mapcar #'car *nodes*)) 






















































































































