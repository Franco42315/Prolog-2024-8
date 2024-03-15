# Macro `lazy` en Lisp

La macro `lazy` toma un número arbitrario de expresiones (denotadas por `&body body`) y devuelve una función lambda que evalúa estas expresiones solo cuando se llama por primera vez. Esta es una forma de evaluación perezosa.

## Desglose del código

- `(&body body)`: Esto permite que la macro tome cualquier número de argumentos, que se agrupan en una lista llamada `body`.

- `(let ((forced (gensym)) (value (gensym)))`: Aquí se crean dos símbolos únicos, `forced` y `value`. `forced` se usa para rastrear si las expresiones han sido evaluadas, y `value` se usa para almacenar el resultado de las expresiones.

- `(let ((,forced nil) (,value nil))`: Aquí se inicializan `forced` y `value` a `nil`.

- `(lambda () ...)`: Esto crea una función lambda sin argumentos.

- `(unless ,forced ...)`: Esto verifica si `forced` es `nil`. Si es así, entonces las expresiones aún no se han evaluado.

- `(setf ,value (progn ,@body))`: Esto evalúa las expresiones en `body` y almacena el resultado en `value`.

- `(setf ,forced t)`: Esto establece `forced` en `t`, indicando que las expresiones han sido evaluadas.

- `,value`: Esto devuelve el valor de las expresiones cuando se llama a la función lambda.

## Resumen

Esta macro `lazy` permite la evaluación perezosa de las expresiones, lo que significa que las expresiones solo se evalúan cuando se necesita su valor. Esto puede ser útil para mejorar la eficiencia de su código en ciertos casos.

---

``` lisp

(defmacro lazy 
    (&body body) ; Define una macro llamada 'lazy' que toma cualquier número de argumentos y los agrupa en una lista llamada 'body'.
    (let 
        (
            (forced 
                (gensym)) ; Crea un símbolo único llamado 'forced'. Se usa para rastrear si las expresiones han sido evaluadas.
            (value 
                (gensym)) ; Crea un símbolo único llamado 'value'. Se usa para almacenar el resultado de las expresiones.
        )
        (let 
            (
                (,forced nil) ; Inicializa 'forced' a 'nil'.
                (,value nil) ; Inicializa 'value' a 'nil'.
            )
            (lambda 
                () ; Crea una función lambda sin argumentos.
                (unless ,forced ; Verifica si 'forced' es 'nil'. Si es así, entonces las expresiones aún no se han evaluado.
                    (setf ,value 
                        (progn ,@body)) ; Evalúa las expresiones en 'body' y almacena el resultado en 'value'.
                    (setf ,forced t)) ; Establece 'forced' en 't', indicando que las expresiones han sido evaluadas.
                ,value ; Devuelve el valor de las expresiones cuando se llama a la función lambda.
            )
        )
    )
)

```

Ejecutando la función

``` lisp

[2]> (lazy (+ 3 4))
#<FUNCTION :LAMBDA NIL (UNLESS #:G3069 (SETF #:G3070 (PROGN (+ 3 4))) (SETF #:G3069 T)) #:G3070>

```
