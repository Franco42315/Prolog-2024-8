# Documentación del código de Eliza

Eliza es un chatbot escrito en Prolog que responde a preguntas relacionadas con enfermedades, la serie Naruto y relaciones familiares. A continuación se presenta una descripción detallada del funcionamiento del código.

## Predicado principal

```prolog
eliza :-
    writeln('Hola, mi nombre es Eliza, tu chatbot.'),
    writeln('Por favor ingresa tu consulta, usar solo minusculas sin . al final:'),
    readln(Entrada),
    eliza(Entrada), !.
```

El predicado `eliza/0` es el punto de entrada principal del chatbot. Solicita una entrada del usuario y luego llama al predicado `eliza/1` con la entrada del usuario.

## Manejo de la entrada "Adios"

```prolog
eliza(Entrada) :- 
    member('adios', Entrada),
    writeln('Adios. Espero haber podido ayudarte.'), !.
```

Este predicado maneja la entrada "adios". Si el usuario escribe "adios", Eliza responde con un mensaje de despedida y termina la conversación.

## Procesamiento de entrada principal

```prolog
eliza(Entrada) :-
    findall(Patron, plantilla(Patron, _, _), Patrones),
    encontrar_plantilla(Entrada, Patrones, Patron),
    plantilla(Patron, Respuesta, IndicesPatron),
    replace0(IndicesPatron, Entrada, 0, Respuesta, RespuestaFinal),
    writeln(RespuestaFinal),
    readln(NuevaEntrada),
    eliza(NuevaEntrada), !.
```

Este predicado procesa la entrada del usuario buscando un patrón correspondiente. Si encuentra una coincidencia, genera una respuesta utilizando el predicado `replace0/5` y luego solicita una nueva entrada del usuario.

## Encontrar la plantilla correcta

```prolog
encontrar_plantilla(Entrada, [Patron|_], Patron) :- coincide(Patron, Entrada), !.
encontrar_plantilla(Entrada, [_|RestoPatrones], Patron) :- encontrar_plantilla(Entrada, RestoPatrones, Patron).
```

Estos predicados buscan una plantilla que coincida con la entrada del usuario. Si encuentra una coincidencia, devuelve el patrón correspondiente.

## Plantillas

El código define varias plantillas para reconocer preguntas sobre enfermedades, personajes de Naruto y relaciones familiares. Cada plantilla tiene una estructura de pregunta, una respuesta asociada y una lista de índices de patrones.

```prolog
plantilla([que, es, s(N), '?'], [flagExplicacionEnfermedad], [2]).
plantilla([cuales, son, los, sintomas, de, s(N), '?'], [flagSintomasEnfermedad], [5]).
plantilla([cuales, son, las, causas, de, s(N), '?'], [flagCausasEnfermedad], [5]).
plantilla([como, se, trata, s(N), '?'], [flagTratamientosEnfermedad], [3]).
plantilla([quien, trata, s(N), '?'], [flagEspecialistasEnfermedad], [2]).
plantilla([si, tengo, s(N), podria, ser, s(N), '?'], [flagEsSintomaDeEnfermedad], [2, 5]).
```

## Reglas de reemplazo

Las reglas de reemplazo generan respuestas específicas basadas en las plantillas coincidentes y la información almacenada en la base de datos del programa.

```prolog
replace0([Indice|_], Entrada, _, [flagIntegrantesEquipo], Resultado) :-
    nth0(Indice, Entrada, Equipo),
    (integrantes_de_equipo(Equipo, Integrantes) ->
        atomic_list_concat(Integrantes, ', ', IntegrantesStr),
        format(atom(Resultado), '-- Eliza: Los integrantes del equipo ~w son: ~w.', [Equipo, IntegrantesStr])
    ;   
        format(atom(Resultado), '-- Eliza: No se encontraron integrantes para el equipo ~w.', [Equipo])
    ).
```

## Reglas específicas para enfermedades

Estas reglas proporcionan respuestas sobre explicaciones de enfermedades, síntomas, causas, tratamientos y especialistas.

```prolog
replace0([Indice|_], Entrada, _, [flagExplicacionEnfermedad], Resultado) :-
    nth0(Indice, Entrada, Atomo),
    explicacion_de_enfermedad(Atomo, Resultado), !.
```

## Reglas específicas para Naruto

Estas reglas proporcionan respuestas sobre información de personajes de Naruto como su aldea, naturaleza de chakra, poderes, etc.

```prolog
replace0([Indice|_], Entrada, _, [flagAldeaNinja], Resultado) :-
    nth0(Indice, Entrada, Ninja),
    aldea_de_ninja(Ninja, Resultado), !.
```

## Reglas específicas para árbol familiar

Estas reglas proporcionan respuestas sobre relaciones familiares, como hijos, hermanos, tíos, abuelos, etc.

```prolog
replace0([Indice|_], Entrada, _, Respuesta, Resultado) :- 
    nth0(Indice, Entrada, Atomo),
    nth0(0, Respuesta, X),
    X == flagHijos,
    hijos_de(Atomo, Resultado).
```

## Predicados auxiliares

Además de las reglas principales, hay varios predicados auxiliares que ayudan a determinar relaciones específicas y generar respuestas adecuadas.

```prolog
hijos_de(X, R) :- 
    setof(Y, padre_de(X, Y), Hijos),
    atomic_list_concat(Hijos, ', ', HijosStr),
    format(atom(R), '-- Eliza: Los hijos de ~w son: ~w.', [X, HijosStr]).
```

## Conclusión

Eliza utiliza una combinación de patrones y reglas de reemplazo para proporcionar respuestas inteligentes a las consultas del usuario. Este enfoque permite manejar una variedad de temas y generar respuestas detalladas basadas en la información almacenada en la base de datos del programa.
