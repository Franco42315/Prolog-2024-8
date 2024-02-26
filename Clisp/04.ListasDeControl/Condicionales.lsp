(defun suma (a b)
  (print (+ a b))
)

(defun casetest(a)
  (case a
    ((1) (print "Suma")
      (princ "Dame un numero: ")
      (setq a (read))
      (princ "Dame otro numero: ")
      (setq b (read))
      (suma a b)
    )
    ((2) (print "[Es el numero 2]"))
  )
)


(defun ortest (a b)
  (or (> a b) (< a b)
    (print "Entre")
  )
)
;C:\PrologPracticas\Clisp\04.ListasDeControl\Condicionales.lsp

; Cadenas
(print "1. Areas")
(print "2. Volumenes")
(defun menu (a)
  
  (case a
    ((1) (print "Entraste a las areas"))
    ((2) (print "Entraste a los volumenes"))
  )
)
; Caracteres