;temaagusto
(defparameter *nodes* '
    (
        (femenido
            (
                (poderes  
                    (aire 
                        (Hola rayo))
                    (fuego 
                        (Hola fuego))
                    (tierra 
                        (Hola tierra))
                    (agua 
                        (poder de agua)))))
        (masculino
            (
                (aire 
                    (Hola rayo))
                (fuego 
                    (Hola fuego))
                (tierra 
                    (Hola tierra))
                (agua 
                    (poder de agua))
))))

; --------------------------------------------------


; APLICAR EL TRACE AL ARBOL

(assoc 'ovni *nodes*)

(car (assoc 'ovni *nodes*))
; ovni

(cdr (assoc 'ovni *nodes*))

(mapcar #'car ())


(cdr (assoc 'tierra (car (cdr (assoc 'ovni *nodes*)))))