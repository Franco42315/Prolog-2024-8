
(defmacro lazy 
    (&body body)
    (let 
        (
            (forced 
                (gensym))
            (value 
                (gensym)))
`
        (let 
            (
                (,forced nil)
                (,value nil))
            (lambda 
                ()

                (unless ,forced

                    (setf ,value 
                        (progn ,@body))

                    (setf ,forced t))

,value))))

(defun force (lazy-object)
  (funcall lazy-object))

(defun opera()
  (format t "El resultado de la suma es ~a ~%" (suma 4 5))
  (format t "El resultado de la suma es ~a ~%" (suma 3 4))
  (force (lazy (hola)))
  (format t "El resultado de la suma es ~a ~%" (suma 5 5))
  (force (lazy (hola)))
)

(defun suma(a b)
  (+ a b)
)

(defun hola()
  "Hola mundo"
)

