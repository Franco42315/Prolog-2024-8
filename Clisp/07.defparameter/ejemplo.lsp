(defun recorre(lista)
  (format t " ¿Tu personaje es ~a ?->% \n" (car lista))
  (format t "~%")
  (princ "Si / No: ")
  (setq resp(read))
  (print resp)
  ;(print (car lista))
  ;; (if lista
  ;;   (recorre (car lista))
  ;; )
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


; dada una estructura listar femenino, masculino, ovni, aleatorio

;car cdr assoc mapcar

; C:\PrologPracticas\Clisp\07.defparameter\ejemplo.lsp

; (recorre (mapcar #'car *nodes*)) 






















































































































