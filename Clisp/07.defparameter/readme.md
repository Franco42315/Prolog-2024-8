[Volver](../../README.md)

# Nodos

``` lisp
  (defparameter *nodes* '((living-room (you are in the living-room.
  a wizard is snoring loudly on the couch.))
(garden (you are in a beautiful garden.
there is a well in front of you.))
(attic (you are in the attic.
there is a giant welding torch in the corner.))))

```

Este fragmento de código está escrito en Lisp, un lenguaje de programación de la familia de los lenguajes de programación funcional.

El comando defparameter se utiliza para definir una variable global llamada *nodes*. Esta variable contiene una lista de listas, donde cada sublista representa un “nodo” o una ubicación en un juego o simulación.

Cada sublista consta de dos elementos:

El nombre del nodo (por ejemplo, living-room, garden, attic).
Una descripción del nodo, que es otra lista que contiene una cadena de texto.
Por ejemplo, el nodo living-room tiene la descripción “you are in the living-room. a wizard is snoring loudly on the couch.”

Este tipo de estructura de datos se podría utilizar en un juego de texto o una simulación donde el usuario puede moverse entre diferentes ubicaciones (nodos), y cada ubicación tiene una descripción única.

(defparameter *food*)  *Indica que es una varaible global*

(let )

(assoc 'garden *nodes*)
(GAR)

REGRESA LA DESCRIPCION A PARTIR DEL PRIMER ELEMENTO QUE ESTA EN LOS PARAMETROS

## Ejercicio en clase

De este arbol imprimir la lista de todas las hojas de los personajes femeninos

```lisp
 (defparameter *nodes*  '((femenino (
                                    (aire (ana))       
                                    (fuego(azula))       
                                    (tierra(top))       
                                    (agua (katara))))
                         (masculino(
                                    (aire (Hola rayo))       
                                    (fuego(Hola fuego))       
                                    (tierra(Hola Tierra))       
                                    (agua (poder de agua))))
                         (ovni(
                               (aire (Hola rayo))       
                               (fuego(Hola fuego))       
                               (tierra(Hola Tierra))       
                               (agua (poder de agua)))
                          )
                         (aleatorio(
                                    (aire (Hola rayo))       
                                    (fuego(Hola fuego))       
                                    (tierra(Hola Tierra))       
                                    (agua (poder de agua)))
                          )
                         ))
```

---

```lisp
;; Definición de la función obtenerFemenino
(defun obtenerFemenino(lista)
    ;; Se obtiene la rama femenina del árbol
    (setq rama (car (cdr (car lista))))
    ;; Se aplica la función append a la lista de personajes femeninos
    (apply #'append (mapcar #'cadr rama))
)

;; Ejecución de la función obtenerFemenino
(obtenerFemenino *nodes*)

;; Resultado
(ANA AZULA TOP KATARA)
```

[Volver](../../README.md)
