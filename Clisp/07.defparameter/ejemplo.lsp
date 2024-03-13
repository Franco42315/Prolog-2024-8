
(defun recorre
    (lista)
    (if lista
        (
          progn
            (setq ramaActual 
                (car lista))

            (format t "Tu personaje es -> ~a " 
                (car ramaActual))
            (princ " No[0] Si[1]: ")
            (setq respuesta 
                (read))

            (if 
                (= respuesta 1)
                (recorre 
                    (cdr 
                        (car lista)))
                (recorre 
                    (cdr lista))
)
)
        (print "Final")
)
)

(defun mostrar 
    (lista)
    (when lista
        (print 
            (car lista))
        (mostrar 
            (cdr lista))
)
)

(defparameter *nodes*  '
    (
        (sayayin 
            (
                (goku 
                    (gohan)
                    (goten)
)
                (vegeta
                    (trunks)
                    (bra)
)
                (broly)
                (bardock)
)
)
        (humano
            (
                (krillin)
                (yamcha)
                (tenshinhan)
                (milk)
                (bulma)
                (androide
                    (c-17)
                    (c-18)
                    (c-16)
)
)
)
        (namek
            (
                (piccolo)
                (kami)
                (dende)
                (nail)
)
)
        (deidad 
            (
                (beerus)
                (whis)
                (zeno)
                (supreme-kai)
)
)
)
)


;dadaunaestructuralistarfemenino,masculino,ovni,aleatorio

;carcdrassocmapcar

;C:\PrologPracticas\Clisp\07.defparameter\ejemplo.lsp

;(recorre 
;    (mapcar #'car *nodes*)) 






















































































































