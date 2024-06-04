% Predicado principal de Eliza
eliza :-
writeln('Hola, mi nombre es Eliza, tu chatbot.'),
    writeln('Por favor ingresa tu consulta, usar solo minusculas sin . al final:'),
    readln(Entrada),
    eliza(Entrada), !.

% Predicado para manejar la entrada de "Adios"
eliza(Entrada) :- member('adios', Entrada),
    writeln('Adios. Espero haber podido ayudarte.'), !.

% Predicado principal de procesamiento de entrada
eliza(Entrada) :-
    findall(Patron, plantilla(Patron, _, _), Patrones),
    encontrar_plantilla(Entrada, Patrones, Patron),
    plantilla(Patron, Respuesta, IndicesPatron),
    % Si se ha encontrado la plantilla correcta:
    replace0(IndicesPatron, Entrada, 0, Respuesta, RespuestaFinal),
    writeln(RespuestaFinal),
    readln(NuevaEntrada),
    eliza(NuevaEntrada), !.

% Predicado para encontrar la plantilla correcta
encontrar_plantilla(Entrada, [Patron|_], Patron) :- coincide(Patron, Entrada), !.
encontrar_plantilla(Entrada, [_|RestoPatrones], Patron) :- encontrar_plantilla(Entrada, RestoPatrones, Patron).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plantillas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plantilla([que, es, s(N), '?'], [flagExplicacionEnfermedad], [2]).
plantilla([cuales, son, los, sintomas, de, s(N), '?'], [flagSintomasEnfermedad], [5]).
plantilla([cuales, son, las, causas, de, s(N), '?'], [flagCausasEnfermedad], [5]).
plantilla([como, se, trata, s(N), '?'], [flagTratamientosEnfermedad], [3]).
plantilla([quien, trata, s(N), '?'], [flagEspecialistasEnfermedad], [2]).
plantilla([si, tengo, s(N), podria, ser, s(N), '?'], [flagEsSintomaDeEnfermedad], [2, 5]).

% Plantillas para respuestas sobre Naruto
plantilla([a, que, aldea, pertenece, s(N), '?'], [flagAldeaNinja], [4]).
plantilla([cual, es, la, naturaleza, del, chakra, de, s(N), '?'], [flagNaturalezaChakra], [7]).
plantilla([cual, es, el, poder, de, s(N), '?'], [flagPoderNinja], [5]).
plantilla([cual, es, la, especialidad, de, s(N), '?'], [flagEspecialidadNinja], [5]).
plantilla([que, poder, visual, tiene, s(N), '?'], [flagPoderVisual], [4]).
plantilla([s(N), tiene, poderes, visuales, '?'],[flagTieneVisuales],[0]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Plantilla para preguntar por los integrantes de un equipo especifico
plantilla([quienes, son, los, integrantes, del, equipo, s(N), '?'], [flagIntegrantesEquipo], [6]).

% Plantilla para preguntar por el lider de un equipo especifico
plantilla([quien, es, el, lider, del, equipo, s(N), '?'], [flagLiderEquipo], [6]).

% Plantilla para preguntar por el sensei de un equipo especifico
plantilla([quien, es, el, sensei, del, equipo, s(N), '?'], [flagSenseiEquipo], [6]).

% Plantilla para preguntar por los integrantes de dos equipos especificos
plantilla([que, integrantes, hay, en, los, equipos, s(N), y, s(M), '?'], [flagIntegrantesEquipos], [6, 8]).

% Plantilla para preguntar por los sensei de dos equipos especificos
plantilla([quienes, son, los, sensei, de, los, equipos, s(N), y, s(M), '?'], [flagSenseiEquipos], [7, 9]).

% Regla para encontrar los integrantes de un equipo especifico
integrantes_de_equipo(Equipo, Integrantes) :-
    findall(Integrante, integrante_equipo(Integrante, Equipo), Integrantes).

% Regla para encontrar el lider de un equipo especifico
lider_de_equipo(Equipo, Lider) :-
    lider_equipo(Lider, Equipo).

% Regla para encontrar el sensei de un equipo especifico
sensei_de_equipo(Equipo, Sensei) :-
    sensei_equipo(Sensei, Equipo).

% Regla para encontrar los integrantes de dos equipos especificos
integrantes_de_equipos(Equipo1, Equipo2, Integrantes1, Integrantes2) :-
    integrantes_de_equipo(Equipo1, Integrantes1),
    integrantes_de_equipo(Equipo2, Integrantes2).

% Regla para encontrar los sensei de dos equipos especificos
sensei_de_equipos(Equipo1, Equipo2, Sensei1, Sensei2) :-
    sensei_de_equipo(Equipo1, Sensei1),
    sensei_de_equipo(Equipo2, Sensei2).

% Reglas de reemplazo
replace0([Indice|_], Entrada, _, [flagIntegrantesEquipo], Resultado) :-
    nth0(Indice, Entrada, Equipo),
    (integrantes_de_equipo(Equipo, Integrantes) ->
        atomic_list_concat(Integrantes, ', ', IntegrantesStr),
        format(atom(Resultado), '-- Eliza: Los integrantes del equipo ~w son: ~w.', [Equipo, IntegrantesStr])
    ;   
        format(atom(Resultado), '-- Eliza: No se encontraron integrantes para el equipo ~w.', [Equipo])
    ).

replace0([Indice|_], Entrada, _, [flagLiderEquipo], Resultado) :-
    nth0(Indice, Entrada, Equipo),
    (lider_de_equipo(Equipo, Lider) ->
        format(atom(Resultado), '-- Eliza: El líder del equipo ~w es: ~w.', [Equipo, Lider])
    ;   
        format(atom(Resultado), '-- Eliza: No se encontró líder para el equipo ~w.', [Equipo])
    ).

replace0([Indice|_], Entrada, _, [flagSenseiEquipo], Resultado) :-
    nth0(Indice, Entrada, Equipo),
    (sensei_de_equipo(Equipo, Sensei) ->
        format(atom(Resultado), '-- Eliza: El sensei del equipo ~w es: ~w.', [Equipo, Sensei])
    ;   
        format(atom(Resultado), '-- Eliza: No se encontró sensei para el equipo ~w.', [Equipo])
    ).

replace0([Indice1, Indice2|_], Entrada, _, [flagIntegrantesEquipos], Resultado) :-
    nth0(Indice1, Entrada, Equipo1),
    nth0(Indice2, Entrada, Equipo2),
    (integrantes_de_equipos(Equipo1, Equipo2, Integrantes1, Integrantes2) ->
        atomic_list_concat(Integrantes1, ', ', IntegrantesStr1),
        atomic_list_concat(Integrantes2, ', ', IntegrantesStr2),
        format(atom(Resultado), '-- Eliza: Los integrantes del equipo ~w son: ~w. Los integrantes del equipo ~w son: ~w.', [Equipo1, IntegrantesStr1, Equipo2, IntegrantesStr2])
    ;   
        format(atom(Resultado), '-- Eliza: No se encontraron integrantes para los equipos ~w y ~w.', [Equipo1, Equipo2])
    ).

replace0([Indice1, Indice2|_], Entrada, _, [flagSenseiEquipos], Resultado) :-
    nth0(Indice1, Entrada, Equipo1),
    nth0(Indice2, Entrada, Equipo2),
    (sensei_de_equipos(Equipo1, Equipo2, Sensei1, Sensei2) ->
        format(atom(Resultado), '-- Eliza: El sensei del equipo ~w es: ~w. El sensei del equipo ~w es: ~w.', [Equipo1, Sensei1, Equipo2, Sensei2])
    ;   
        format(atom(Resultado), '-- Eliza: No se encontraron sensei para los equipos ~w y ~w.', [Equipo1, Equipo2])
    ).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Plantillas para respuestas sobre arbol familiar
plantilla([quienes, son, los, hijos, de, s(N), '?'], [flagHijos], [5]).
plantilla([quienes, son, los, hermanos, de, s(N), '?'], [flagHermanos], [5]).
plantilla([quienes, son, los, tios, de, s(N),'?'], [flagTios],[5]).
plantilla([quienes, son, los, abuelos, de, s(N),'?'],[flagAbuelos], [5]).
plantilla([quienes, son, los, sobrinos, de, s(N), '?'], [flagSobrinos], [5]).
plantilla([quienes, son, los, primos, de, s(N),'?'],[flagPrimos],[5]).
plantilla([quienes, son, los, nietos, de, s(N), '?'],[flagNietos],[5]).

plantilla(_, ['Por favor explica un poco mas'], []).

% Predicado para coincidencia de patrones
coincide([], []).
coincide([S|RestoPatron], [I|RestoEntrada]) :-
    atom(S), % si S es un s(_) devuelve falso
    S == I,
    coincide(RestoPatron, RestoEntrada), !.
coincide([s(_)|RestoPatron], [_|RestoEntrada]) :-
    coincide(RestoPatron, RestoEntrada), !.

replace0([], _, _, Respuesta, Respuesta) :- !.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Enfermedades
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

replace0([Indice|_], Entrada, _, [flagExplicacionEnfermedad], Resultado) :-
    nth0(Indice, Entrada, Atomo),
    explicacion_de_enfermedad(Atomo, Resultado), !.

replace0([Indice|_], Entrada, _, [flagSintomasEnfermedad], Resultado) :-
    nth0(Indice, Entrada, Atomo),
    sintomas_de_enfermedad(Atomo, Resultado), !.

replace0([Indice|_], Entrada, _, [flagCausasEnfermedad], Resultado) :-
    nth0(Indice, Entrada, Atomo),
    causas_de_enfermedad(Atomo, Resultado), !.

replace0([Indice|_], Entrada, _, [flagTratamientosEnfermedad], Resultado) :-
    nth0(Indice, Entrada, Atomo),
    tratamientos_para_enfermedad(Atomo, Resultado), !.

replace0([Indice|_], Entrada, _, [flagEspecialistasEnfermedad], Resultado) :-
    nth0(Indice, Entrada, Atomo),
    especialistas_para_enfermedad(Atomo, Resultado), !.

replace0([Indice, Indice2|_], Entrada, _, [flagEsSintomaDeEnfermedad], Resultado) :-
    nth0(Indice, Entrada, Sintoma),
    nth0(Indice2, Entrada, Enfermedad),
    es_sintoma_de(Enfermedad, Sintoma, Resultado), !.

es_sintoma_de(Enfermedad, Sintoma, Respuesta) :-
    sintoma_de(Enfermedad, Sintoma),
    format(atom(Respuesta), '-- Eliza: ~w es un sintoma de ~w. Es probable que lo tenga, consulte a su medico.', [Sintoma, Enfermedad]).
es_sintoma_de(Enfermedad, Sintoma, Respuesta) :-
    \+ sintoma_de(Enfermedad, Sintoma),
    format(atom(Respuesta), '-- Eliza: ~w no es un sintoma de ~w.', [Sintoma, Enfermedad]).

% Regla para explicar una enfermedad
explicacion_de_enfermedad(Enfermedad, Respuesta) :-
    enfermedad(Enfermedad),
    explicacion(Enfermedad, EXPLICACION),
    format(atom(Respuesta), '-- Eliza: Explicacion de la enfermedad ~w: ~w', [Enfermedad, EXPLICACION]).

sintomas_de_enfermedad(Enfermedad, Respuesta) :-
    enfermedad(Enfermedad),
    findall(Sintoma, sintoma_de(Enfermedad, Sintoma), Sintomas),
    atomic_list_concat(Sintomas, ', ', SintomasStr),
    format(atom(Respuesta), '-- Eliza: Los sintomas de ~w son: ~w.', [Enfermedad, SintomasStr]).
sintomas_de_enfermedad(_, '-- Eliza: No se encontraron sintomas para la enfermedad.').

% Regla para encontrar las causas de una enfermedad
causas_de_enfermedad(Enfermedad, Respuesta) :-
    enfermedad(Enfermedad),
    findall(Causa, causa(Enfermedad, Causa), Lista),
    atomic_list_concat(Lista, ', ', ListaStr),
    format(atom(Respuesta), '-- Eliza: Las causas de ~w son: ~w.', [Enfermedad, ListaStr]).

% Regla para encontrar los tratamientos de una enfermedad
tratamientos_para_enfermedad(Enfermedad, Respuesta) :-
    enfermedad(Enfermedad),
    findall(Tratamiento, medicina_para(Enfermedad, Tratamiento), Lista),
    atomic_list_concat(Lista, ', ', ListaStr),
    format(atom(Respuesta), '-- Eliza: Los tratamientos para ~w incluyen: ~w.', [Enfermedad, ListaStr]).

% Regla para encontrar los especialistas que tratan una enfermedad
especialistas_para_enfermedad(Enfermedad, Respuesta) :-
    enfermedad(Enfermedad),
    findall(Especialista, especialista_para(Enfermedad, Especialista), Lista),
    atomic_list_concat(Lista, ', ', ListaStr),
    format(atom(Respuesta), '-- Eliza: Los especialistas que tratan ~w son: ~w.', [Enfermedad, ListaStr]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Naruto
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

replace0([Indice|_], Entrada, _, [flagAldeaNinja], Resultado) :-
    nth0(Indice, Entrada, Ninja),
    aldea_de_ninja(Ninja, Resultado), !.

replace0([Indice|_], Entrada, _, [flagNaturalezaChakra], Resultado) :-
    nth0(Indice, Entrada, Ninja),
    naturaleza_chakra_de(Ninja, Resultado), !.

replace0([Indice|_], Entrada, _, [flagPoderNinja], Resultado) :-
    nth0(Indice, Entrada, Ninja),
    poder_de_ninja(Ninja, Resultado), !.

replace0([Indice|_], Entrada, _, [flagEspecialidadNinja], Resultado) :-
    nth0(Indice, Entrada, Ninja),
    especialidad_de_ninja(Ninja, Resultado), !.

replace0([Indice|_], Entrada, _, [flagPoderVisual], Resultado) :-
    nth0(Indice, Entrada, Ninja),
    poder_visual_de(Ninja, Resultado), !.

replace0([Indice|_], Entrada, _, [flagTieneVisuales], Resultado) :-
    nth0(Indice, Entrada, Ninja),
    tiene_poder_visual(Ninja, Resultado), !.

tiene_poder_visual(Ninja, R) :- 
    poder_visual(Ninja, Poder),
    format(atom(R), '-- Eliza: ~w tiene el poder visual ~w.', [Ninja, Poder]).
tiene_poder_visual(Ninja, R) :- 
    \+poder_visual(Ninja, _),
    format(atom(R), '-- Eliza: ~w no tiene poderes visuales.', [Ninja]).

aldea_de_ninja(Ninja, Respuesta) :-
    ninja_de(Ninja, Aldea),
    format(atom(Respuesta), '-- Eliza: ~w pertenece a la aldea de ~w.', [Ninja, Aldea]).

naturaleza_chakra_de(Ninja, Respuesta) :-
    naturaleza_chakra(Ninja, Naturaleza),
    format(atom(Respuesta), '-- Eliza: La naturaleza del chakra de ~w es ~w.', [Ninja, Naturaleza]).

poder_de_ninja(Ninja, Respuesta) :-
    poder(Ninja, Poder),
    format(atom(Respuesta), '-- Eliza: El poder de ~w es ~w.', [Ninja, Poder]).

especialidad_de_ninja(Ninja, Respuesta) :-
    especialidad(Ninja, Especialidad),
    format(atom(Respuesta), '-- Eliza: La especialidad de ~w es ~w.', [Ninja, Especialidad]).

poder_visual_de(Ninja, Respuesta) :-
    poder_visual(Ninja, PoderVisual),
    format(atom(Respuesta), '-- Eliza: ~w tiene el poder visual ~w.', [Ninja, PoderVisual]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Arbol familair
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hijo_de(Y, X) :- padrede(X, Y).

hijos_de(X, R) :- 
    setof(Y, padre_de(X, Y), Hijos),
    atomic_list_concat(Hijos, ', ', HijosStr),
    format(atom(R), '-- Eliza: Los  hijos de ~w es/son: ~w.', [X, HijosStr]).
hijos_de(X, R) :- 
    \+padre_de(X, _),
   R=['-- Eliza: No se encontraron coincidencias'].

replace0([Indice|_], Entrada, _, Respuesta, Resultado) :- 
    nth0(Indice, Entrada, Atomo),
    nth0(0, Respuesta, X),
    X == flagHijos,
    hijos_de(Atomo, Resultado).

es_hijo_de(X, Y, R):- hijode(X, Y), R = ['Si', X, es, hijo, de, Y].
es_hijo_de(X, Y, R):- \+hijode(X, Y), R = ['No', X, no, es, hijo, de, Y].

hermanode(X, Y) :- padre_de(Z, X), padre_de(Z, Y), X \= Y.

hermanos_de(X, R) :- 
    setof(Y, hermanode(X, Y), Hermanos),
    atomic_list_concat(Hermanos, ', ', HermanosStr),
    format(atom(R), '-- Eliza: Los hermanos de ~w son: ~w.', [X, HermanosStr]).
hermanos_de(X, R) :- 
    \+hermanode(X, _),
   R=['-- Eliza: No se encontraron coincidencias'].

replace0([Indice|_], Entrada, _, Respuesta, Resultado) :- 
    nth0(Indice, Entrada, Atomo),
    nth0(0, Respuesta, X),
    X == flagHermanos,
    hermanos_de(Atomo, Resultado).

hermano_de(X, Y, R):- hermanode(X, Y), R = ['Si', X, es, hermano, de, Y].
hermano_de(X, Y, R):- \+hermanode(X, Y), R = ['No', X, no, es, hermano, de, Y].

tio_de(X, Y) :- padre_de(Z, Y), hermano_de(X, Z).

tios_de(X, R) :- 
    setof(Y, tio_de(Y, X), Tios),
    atomic_list_concat(Tios, ', ', TiosStr),
    format(atom(R), '-- Eliza: Los tios de ~w son: ~w.', [X, TiosStr]).
tios_de(X, R) :- 
    \+tio_de(_, X),
   R=['-- Eliza: No se encontraron coincidencias'].

% %tios
replace0([Indice|_], Entrada, _, Respuesta, Resultado) :- 
    nth0(Indice, Entrada, Atomo),
    nth0(0, Respuesta, X),
    X == flagTios,
    tios_de(Atomo, Resultado).

es_tio_de(X, Y, R):- tiode(X, Y), R = ['Si', X, es, tio, de, Y].
es_tio_de(X, Y, R):- \+tiode(X, Y), R = ['No', X, no, es, tio, de, Y].

abuelo_de(Abuelo, Nieto) :- 
    padre_de(Padre, Nieto), 
    padre_de(Abuelo, Padre).

abuelos_de(X, R) :- 
    setof(Y, abuelo_de(Y, X), Abuelos),
    atomic_list_concat(Abuelos, ', ', AbuelosStr),
    format(atom(R), '-- Eliza: Los abuelos de ~w son: ~w.', [X, AbuelosStr]).
abuelos_de(X, R) :- 
    \+abuelo_de(_, X),
   R=['-- Eliza: Ninguno cumple con la propiedad'].

replace0([Indice|_], Entrada, _, Respuesta, Resultado) :- 
    nth0(Indice, Entrada, Atomo),
    nth0(0, Respuesta, X),
    X == flagAbuelos,
    abuelos_de(Atomo, Resultado).

sobrino_de(Y, X) :- padre_de(Z, Y), hermano_de(X, Z).

sobrinos_de(X, R) :- 
    setof(Y, sobrino_de(Y, X), Sobrinos),
    atomic_list_concat(Sobrinos, ', ', SobrinosStr),
    format(atom(R), '-- Eliza: Los sobrinos de ~w son: ~w.', [X, SobrinosStr]).
sobrinos_de(X, R) :- 
    \+sobrino_de(_, X),
   R=['-- Eliza: No se encontraron coincidencias'].

es_sobrino_de(X, Y, R):- sobrino_de(X, Y), R = ['Si', X, es, sobrino, de, Y].
es_sobrino_de(X, Y, R):- \+sobrino_de(X, Y), R = ['No', X, no, es, sobrino, de, Y].

replace0([Indice|_], Entrada, _, Respuesta, Resultado) :- 
    nth0(Indice, Entrada, Atomo),
    nth0(0, Respuesta, X),
    X == flagSobrinos,
    sobrinos_de(Atomo, Resultado).

primo_de(X, Y) :- padre_de(A, X), padre_de(B, Y), hermano_de(A, B).

primos_de(X, R) :- 
    setof(Y, primo_de(Y, X), Primos),
    atomic_list_concat(Primos, ', ', PrimosStr),
    format(atom(R), '-- Eliza: Los primos de ~w son: ~w.', [X, PrimosStr]).
primos_de(X, R) :- 
    \+primo_de(_, X),
   R=['-- Eliza: No se encontraron coincidencias'].

es_primo_de(X, Y, R):- primo_de(X, Y), R = ['Si', X, es, primo, de, Y].
es_primo_de(X, Y, R):- \+primo_de(X, Y), R = ['No', X, no, es, primo, de, Y].

replace0([Indice|_], Entrada, _, Respuesta, Resultado) :- 
    nth0(Indice, Entrada, Atomo),
    nth0(0, Respuesta, X),
    X == flagPrimos,
    primos_de(Atomo, Resultado).

replace0([Indice|_], Entrada, _, Respuesta, Resultado) :- 
    nth0(Indice, Entrada, Atomo),
    nth0(0, Respuesta, X),
    X == flagNietos,
    nietos_de(Atomo, Resultado).

nieto_de(Nieto, Abuelo) :- 
    padre_de(Padre, Nieto), 
    padre_de(Abuelo, Padre).

nietos_de(X, R) :- 
    setof(Y, nieto_de(Y, X), Nietos),
    atomic_list_concat(Nietos, ', ', NietosStr),
    format(atom(R), '-- Eliza: Los nietos de ~w son: ~w.', [X, NietosStr]).
nietos_de(X, R) :- 
    \+nieto_de(_, X),
   R=['-- Eliza: No se encontraron coincidencias'].


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Base de conocimiento del arbol familiar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
padre_de(juvenal, leonardo).
padre_de(juvenal, mauricio).
padre_de(juvenal, paola).
esposo_de(juvenal, maria).
esposa_de(maria, juvenal).
padre_de(maria, leonardo).
padre_de(maria, mauricio).
padre_de(maria, paola).
hermano_de(leonardo, mauricio).
hermano_de(leonardo, paola).
hermano_de(mauricio, leonardo).
hermano_de(mauricio, paola).
hermano_de(paola, leonardo).
hermano_de(paola, mauricio).
hijo_de(leonardo, juvenal).
hijo_de(mauricio, juvenal).
hijo_de(paola, juvenal).
hijo_de(leonardo,maria).
hijo_de(mauricio, maria).
hijo_de(paola,maria).
padre_de(domitila, juvenal).
padre_de(domitila,elizabeth).
padre_de(domitila,atzimba).
padre_de(domitila,sandra).
padre_de(ulices_camacho,elizabeth).
padre_de(ulices_camacho, juvenal).
padre_de(ulices_camacho,atzimba).
padre_de(ulices_camacho,sandra).
padre_de(sabina,serafin).
padre_de(sabina,irma).
padre_de(sabina, maria).
padre_de(sabina,herminia).
padre_de(serafin_perez,serafin).
padre_de(serafin_perez, maria).
padre_de(serafin_perez,irma).
padre_de(serafin_perez,herminia).
hijo_de(elizabeth,domitila).
hijo_de(atzimba,domitila).
hijo_de(sandra,domitila).
hijo_de(juvenal,domitila).
hijo_de(elizabeth,ulices_camacho).
hijo_de(juvenal, ulices_camacho).
hijo_de(atzimba,ulices_camacho).
hijo_de(sandra,ulices_camacho).
hijo_de(serafin,sabina).
hijo_de(irma,sabina).
hijo_de(herminia,sabina).
hijo_de(maria,sabina).
hijo_de(serafin,serafin_perez).
hijo_de(maria, serafin_perez).
hijo_de(atzimba,serafin_perez).
hijo_de(herminia,serafin_perez).
hermano_de(maria, serafin).
hermano_de(maria, irma).
hermano_de(maria, herminia).
hermano_de(serafin, maria).
hermano_de(serafin, irma).
hermano_de(serafin, herminia).
hermano_de(irma, maria).
hermano_de(irma, serafin).
hermano_de(irma, herminia).
hermano_de(herminia, maria).
hermano_de(herminia, irma).
hermano_de(herminia, serafin).
hermano_de(elizabeth, juvenal).
hermano_de(elizabeth,atzimba).
hermano_de(elizabeth,sandra).
hermano_de(juvenal, elizabeth).
hermano_de(juvenal, atzimba).
hermano_de(juvenal, sandra).
hermano_de(atzimba, juvenal).
hermano_de(atzimba, elizabeth).
hermano_de(atzimba, sandra).
hermano_de(sandra,elizabeth).
hermano_de(sandra,atzimba).
hermano_de(sandra, juvenal).
tio_de(serafin,leonardo).
tio_de(serafin,mauricio).
tio_de(serafin,paola).
tio_de(serafin,brianda).
tio_de(serafin,omar).
tio_de(serafin,citlali).
tio_de(serafin,carina).
sobrino_de(leonardo,serafin).
sobrino_de(mauricio,serafin).
sobrino_de(paola,serafin).
sobrino_de(brianda,serafin).
sobrino_de(omar,serafin).
sobrino_de(citlali,serafin).
sobrino_de(carina,serafin).
esposo_de(serafin,aurora).
esposa_de(aurora,serafin).
tio_de(aurora,leonardo).
tio_de(aurora,mauricio).
tio_de(aurora,paola).
tio_de(aurora,brianda).
tio_de(aurora,omar).
tio_de(aurora,citlali).
tio_de(aurora,carina).
sobrino_de(leonardo,aurora).
sobrino_de(mauricio,aurora).
sobrino_de(paola,aurora).
sobrino_de(brianda,aurora).
sobrino_de(omar,aurora).
sobrino_de(citlali,aurora).
sobrino_de(carina,aurora).
tio_de(irma,ximena).
tio_de(irma,josue).
tio_de(irma,brianda).
tio_de(irma,leonardo).
tio_de(irma,mauricio).
tio_de(irma,paola).
tio_de(carlos,ximena).
tio_de(carlos,josue).
tio_de(carlos,brianda).
tio_de(carlos,leonardo).
tio_de(carlos,mauricio).
tio_de(carlos,paola).
sobrino_de(ximena,irma).
sobrino_de(josue,irma).
sobrino_de(brianda,irma).
sobrino_de(leonardo,irma).
sobrino_de(mauricio,irma).
sobrino_de(paola,irma).
sobrino_de(ximena,carlos).
sobrino_de(josue,carlos).
sobrino_de(brianda,carlos).
sobrino_de(leonardo,carlos).
sobrino_de(mauricio,carlos).
sobrino_de(paola,carlos).
esposa_de(irma,carlos).
esposo_de(carlos,irma).
tio_de(herminia,leonardo).
tio_de(herminia,mauricio).
tio_de(herminia,paola).
tio_de(herminia,omar).
tio_de(herminia,carina).
tio_de(herminia,citlali).
tio_de(herminia,ximena).
tio_de(herminia,josue).
sobrino_de(leonardo,herminia).
sobrino_de(mauricio,herminia).
sobrino_de(paola,herminia).
sobrino_de(omar,herminia).
sobrino_de(carina,herminia).
sobrino_de(citlali,herminia).
sobrino_de(ximena,herminia).
sobrino_de(josue,herminia).
tio_de(elizabeth,leonardo).
tio_de(elizabeth,mauricio).
tio_de(elizabeth,paola).
tio_de(elizabeth,pedro).
tio_de(elizabeth,alicia).
tio_de(elizabeth,jorge_jr).
tio_de(elizabeth,andres).
tio_de(elizabeth,fernanda).
tio_de(elizabeth,jorge_sanchez).
tio_de(jorge_mendez,leonardo).
tio_de(jorge_mendez,mauricio).
tio_de(jorge_mendez,paola).
tio_de(jorge_mendez,pedro).
tio_de(jorge_mendez,alicia).
tio_de(jorge_mendez,jorge_jr).
tio_de(jorge_mendez,andres).
tio_de(jorge_mendez,fernanda).
tio_de(jorge_mendez,jorge_sanchez).
sobrino_de(leonardo,elizabeth).
sobrino_de(mauricio,elizabeth).
sobrino_de(paola,elizabeth).
sobrino_de(pedro,elizabeth).
sobrino_de(alicia,elizabeth).
sobrino_de(jorge_jr,elizabeth).
sobrino_de(andres,elizabeth).
sobrino_de(fernanda,elizabeth).
sobrino_de(jorge_sanchez,elizabeth).
sobrino_de(leonardo,jorge_mendez).
sobrino_de(mauricio,jorge_mendez).
sobrino_de(paola,jorge_mendez).
sobrino_de(pedro,jorge_mendez).
sobrino_de(alicia,jorge_mendez).
sobrino_de(jorge_jr,jorge_mendez).
sobrino_de(andres,jorge_mendez).
sobrino_de(fernanda,jorge_mendez).
sobrino_de(jorge_sanchez ,jorge_mendez).
esposa_de(elizabeth,jorge_mendez).
esposo_de(jorge_mendez,elizabeth).
tio_de(atzimba,leonardo).
tio_de(atzimba,mauricio).
tio_de(atzimba,paola).
tio_de(atzimba,rodrigo).
tio_de(atzimba,eduardo).
tio_de(atzimba,jorge_mendez_jr).
tio_de(atzimba,andres).
tio_de(atzimba,fernanda).
tio_de(oscar,leonardo).
tio_de(oscar,mauricio).
tio_de(oscar,paola).
tio_de(oscar,rodrigo).
tio_de(oscar,eduardo).
tio_de(oscar,jorge_mendez_jr).
tio_de(oscar,andres).
tio_de(oscar,fernanda).
sobrino_de(leonardo,atzimba).
sobrino_de(mauricio,atzimba).
sobrino_de(paola,atzimba).
sobrino_de(rodrigo,atzimba).
sobrino_de(eduardo,atzimba).
sobrino_de(jorge_mendez_jr,atzimba).
sobrino_de(andres,atzimba).
sobrino_de(fernanda,atzimba).
sobrino_de(leonardo,oscar).
sobrino_de(mauricio,oscar).
sobrino_de(paola,oscar).
sobrino_de(rodrigo,oscar).
sobrino_de(eduardo,oscar).
sobrino_de(jorge_mendez_jr,oscar).
sobrino_de(andres,oscar).
sobrino_de(fernanda,oscar).
esposa_de(atzimba,oscar).
esposo_de(oscar,atzimba).
tio_de(sandra,leonardo).
tio_de(sandra,mauricio).
tio_de(sandra,paola).
tio_de(sandra,rodrigo).
tio_de(sandra,eduardo).
tio_de(sandra,jorge_mendez_jr).
tio_de(sandra,pedro).
tio_de(sandra,alicia).
tio_de(sandra,jorge_sanchez).
tio_de(gil,leonardo).
tio_de(gil,mauricio).
tio_de(gil,paola).
tio_de(gil,rodrigo).
tio_de(gil,eduardo).
tio_de(gil,jorge_mendez_jr).
tio_de(gil,pedro).
tio_de(gil,alicia).
tio_de(gil,jorge_sanchez).
sobrino_de(leonardo,sandra).
sobrino_de(mauricio,sandra).
sobrino_de(paola,sandra).
sobrino_de(rodrigo,sandra).
sobrino_de(eduardo,sandra).
sobrino_de(jorge_mendez_jr,sandra).
sobrino_de(pedro,sandra).
sobrino_de(alicia,sandra).
sobrino_de(jorge_sanchez,sandra).
sobrino_de(leonardo,gil).
sobrino_de(mauricio,gil).
sobrino_de(paola,gil).
sobrino_de(rodrigo,gil).
sobrino_de(eduardo,gil).
sobrino_de(jorge_mendez_jr,gil).
sobrino_de(pedro,gil).
sobrino_de(alicia,gil).
sobrino_de(jorge_sanchez,gil).
esposa_de(sandra,gil).
esposo_de(gil,sandra).
tio_de(juvenal,rodrigo).
tio_de(juvenal,eduardo).
tio_de(juvenal,jorge_mendez_jr).
tio_de(juvenal,pedro).
tio_de(juvenal,alicia).
tio_de(juvenal,jorge_sanchez).
tio_de(juvenal,andres).
tio_de(juvenal,fernanda).
tio_de(juvenal,brianda).
tio_de(juvenal,omar).
tio_de(juvenal,citlali).
tio_de(juvenal,carina).
tio_de(juvenal,ximena).
tio_de(juvenal,josue).
tio_de(maria,rodrigo).
tio_de(maria,eduardo).
tio_de(maria,jorge_mendez_jr).
tio_de(maria,pedro).
tio_de(maria,alicia).
tio_de(maria,jorge_sanchez).
tio_de(maria,andres).
tio_de(maria,fernanda).
tio_de(maria,brianda).
tio_de(maria,omar).
tio_de(maria,citlali).
tio_de(maria,carina).
tio_de(maria,ximena).
tio_de(maria,josue).
sobrino_de(rodrigo,juvenal).
sobrino_de(eduardo,juvenal).
sobrino_de(jorge_mendez_jr,juvenal).
sobrino_de(pedro,juvenal).
sobrino_de(alicia,juvenal).
sobrino_de(jorge_sanchez,juvenal).
sobrino_de(andres,juvenal).
sobrino_de(fernanda,juvenal).
sobrino_de(brianda,juvenal).
sobrino_de(omar,juvenal).
sobrino_de(citlali,juvenal).
sobrino_de(carina,juvenal).
sobrino_de(ximena,juvenal).
sobrino_de(josue,juvenal).
sobrino_de(rodrigo,maria).
sobrino_de(eduardo,maria).
sobrino_de(jorge_mendez_jr,maria).
sobrino_de(pedro,maria).
sobrino_de(alicia,maria).
sobrino_de(jorge_sanchez,maria).
sobrino_de(andres,maria).
sobrino_de(fernanda,maria).
sobrino_de(brianda,maria).
sobrino_de(omar,maria).
sobrino_de(citlali,maria).
sobrino_de(carina,maria).
sobrino_de(ximena,maria).
sobrino_de(josue,maria).
padre_de(serafin, ximena).
padre_de(serafin, josue).
padre_de(aurora, ximena).
padre_de(aurora, josue).
padre_de(carlos, omar).
padre_de(carlos, citlali).
padre_de(carlos, carina).
padre_de(irma, omar).
padre_de(irma, citlali).
padre_de(irma, carina).
padre_de(herminia, brianda).
padre_de(jorge_mendez, jorge_mendez_jr).
padre_de(jorge, eduardo).
padre_de(jorge, rodrigo).
padre_de(elizabeth, jorge_f).
padre_de(elizabeth, eduardo).
padre_de(elizabeth, rodrigo).
padre_de(atzimba, alicia).
padre_de(atzimba, jorge_g).
padre_de(atzimba, pedro).
padre_de(oscar, alicia).
padre_de(oscar, jorge_sanchez).
padre_de(oscar, pedro).
padre_de(gil, andres).
padre_de(gil, fernanda).
padre_de(sandra, andres).
padre_de(sandra, fernanda).
hijo_de(ximena,serafin).
hijo_de(josue,serafin).
hijo_de(ximena,aurora).
hijo_de(josue,aurora).
hijo_de(omar,carlos).
hijo_de(citlali,carlos).
hijo_de(carina,carlos).
hijo_de(omar,irma).
hijo_de(citlali,irma).
hijo_de(carina,irma).
hijo_de(brianda,herminia).
hijo_de(jorge_mendez_jr,jorge_mendez).
hijo_de(eduardo,jorge).
hijo_de(rodrigo,jorge).
hijo_de(jorge_f,elizabeth).
hijo_de(eduardo,elizabeth).
hijo_de(rodrigo,elizabeth).
hijo_de(alicia,atzimba).
hijo_de(jorge_g,atzimba).
hijo_de(pedro,atzimba).
hijo_de(alicia,oscar).
hijo_de(jorge_sanchez,oscar).
hijo_de(pedro,oscar).
hijo_de(andres,gil).
hijo_de(fernanda,gil).
hijo_de(andres,sandra).
hijo_de(fernanda,sandra).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Enfermedades
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
enfermedad(tosferina).
enfermedad(tuberculosis).
enfermedad(sifilis).

% Declaraciones de sintomas, segun enfermedad
sintoma_de(tosferina, tos_persistente).
sintoma_de(tosferina, tos_severa).
sintoma_de(tosferina, vomitos_despues_de_toser).
sintoma_de(tosferina, fatiga).
sintoma_de(tosferina, fiebre_baja).
sintoma_de(tosferina, congestion_nasal).
sintoma_de(tosferina, estornudos).

sintoma_de(tuberculosis, tos_persistente).
sintoma_de(tuberculosis, tos_con_esputo).
sintoma_de(tuberculosis, dolor_en_el_pecho).
sintoma_de(tuberculosis, debilidad).
sintoma_de(tuberculosis, perdida_de_peso).
sintoma_de(tuberculosis, perdida_de_apetito).
sintoma_de(tuberculosis, fiebre).
sintoma_de(tuberculosis, escalofrios).
sintoma_de(tuberculosis, sudores_nocturnos).

sintoma_de(sifilis, ulcera_indolora).
sintoma_de(sifilis, erupcion_cutanea).
sintoma_de(sifilis, lesiones_mucocutaneas).
sintoma_de(sifilis, fiebre).
sintoma_de(sifilis, ganglios_inflamados).
sintoma_de(sifilis, afectacion_de_organos_internos).
sintoma_de(sifilis, neurosifilis).
sintoma_de(sifilis, gomas).

% Declaraciones de medicamentos segun enfermedad
medicina_para(tosferina, azitromicina).
medicina_para(tosferina, claritromicina).
medicina_para(tosferina, eritromicina).
medicina_para(tosferina, vacuna_dTPa).
medicina_para(tosferina, vacuna_dTPw).

medicina_para(tuberculosis, isoniazida).
medicina_para(tuberculosis, rifampicina).
medicina_para(tuberculosis, pirazinamida).
medicina_para(tuberculosis, etambutol).
medicina_para(tuberculosis, estreptomicina).

medicina_para(sifilis, penicilina_G).
medicina_para(sifilis, doxiciclina).
medicina_para(sifilis, azitromicina).
medicina_para(sifilis, ceftriaxona).

% Declaraciones de especialistas segun enfermedad
especialista_para(tosferina, pediatra).
especialista_para(tosferina, medico_de_familia).
especialista_para(tosferina, infectologo).

especialista_para(tuberculosis, neumologo).
especialista_para(tuberculosis, infectologo).
especialista_para(tuberculosis, medico_de_familia).

especialista_para(sifilis, dermatologo).
especialista_para(sifilis, urologo).
especialista_para(sifilis, ginecologo).
especialista_para(sifilis, infectologo).

% Causas 
causa(tosferina, 'La tosferina es causada por una bacteria llamada Bordetella pertussis.').
causa(tosferina, 'La tosferina se propaga a traves de gotitas que se liberan al toser o estornudar.').

causa(tuberculosis, 'La tuberculosis es causada por la bacteria Mycobacterium tuberculosis.').
causa(tuberculosis, 'La tuberculosis se propaga de persona a persona a traves del aire cuando alguien con la enfermedad tose, estornuda o habla.').

causa(sifilis, 'La sifilis es causada por la bacteria Treponema pallidum.').
causa(sifilis, 'La sifilis se transmite principalmente a traves del contacto sexual.').
causa(sifilis, 'La sifilis tambien puede transmitirse de una padre a su hijo durante el embarazo.').

% Explicacion
explicacion(tosferina, 'La tosferina, tambien conocida como pertusis, es una infeccion bacteriana altamente contagiosa. Afecta principalmente a los pulmones y puede causar tos severa.').
explicacion(tuberculosis, 'La tuberculosis es una enfermedad infecciosa que afecta principalmente a los pulmones. Es causada por una bacteria y se propaga de persona a persona a traves del aire.').
explicacion(sifilis, 'La sifilis es una enfermedad de transmision sexual causada por una bacteria. Puede causar complicaciones a largo plazo o la muerte si no se trata adecuadamente.').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Base de conocimientos de Naruto
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Aldeas
aldea(konoha).
aldea(suna).
aldea(kiri).
aldea(iwa).
aldea(kumo).
aldea(takigakure).
aldea(amgakure).

% Ninjas y sus aldeas
ninja_de(naruto, konoha).
ninja_de(sasuke, konoha).
ninja_de(sakura, konoha).
ninja_de(kakashi, konoha).
ninja_de(gaara, suna).
ninja_de(kankuro, suna).
ninja_de(temari, suna).
ninja_de(kisame, kiri).
ninja_de(zabuza, kiri).
ninja_de(deidara, iwa).
ninja_de(bee, kumo).
ninja_de(a, kumo).
ninja_de(fu, takigakure).
ninja_de(konan, amegakure).
ninja_de(pain, amegakure).

% Naturalezas de chakra
naturaleza_chakra(naruto, viento).
naturaleza_chakra(sasuke, fuego).
naturaleza_chakra(sasuke, rayo).
naturaleza_chakra(sasuke, cielo).
naturaleza_chakra(sakura, tierra).
naturaleza_chakra(gaara, tierra).
naturaleza_chakra(temari, viento).
naturaleza_chakra(kisame, agua).
naturaleza_chakra(zabuza, agua).
naturaleza_chakra(deidara, tierra).
naturaleza_chakra(bee, rayo).
naturaleza_chakra(a, rayo).
naturaleza_chakra(fu, agua).
naturaleza_chakra(konan, papel).

% Poderes
poder(naruto, kyuubi).
poder(naruto, modo_sabio).
poder(sasuke, sharingan).
poder(sasuke, rinnegan).
poder(sakura, super_fuerza).
poder(sakura, sello_byaoku).
poder(gaara, control_arena).
poder(temari, control_viento).
poder(kisame, fusion_con_samehada).
poder(kisame, absorcion_de_chakra).
poder(deidara, explosiones).
poder(bee, hachibi).
poder(a, armadura_de_rayo).
poder(fu, bijuu_7).
poder(konan, jutsu_papel).
poder(pain, rinnegan).

% Especialidades
especialidad(naruto, ninjutsu).
especialidad(naruto, senjutsu).
especialidad(sasuke, ninjutsu).
especialidad(sasuke, taijutsu).
especialidad(sakura, taijutsu).
especialidad(sakura, ninjutsu_medico).
especialidad(kakashi, ninjutsu).
especialidad(kakashi, taijutsu).
especialidad(gaara, ninjutsu).
especialidad(kankuro, marionetista).
especialidad(temari, fuinjutsu).
especialidad(kisame, ninjutsu).
especialidad(zabuza, kenjutsu).
especialidad(deidara, ninjutsu).
especialidad(bee, ninjutsu).
especialidad(bee, taijutsu).
especialidad(a, taijutsu).
especialidad(fu, ninjutsu).
especialidad(konan, ninjutsu).
especialidad(pain, ninjutsu).

% Poderes visuales
poder_visual(sasuke, sharingan).
poder_visual(sasuke, rinnegan).
poder_visual(kakashi, sharingan).
poder_visual(neji, byakugan).
poder_visual(hinata, byakugan).
poder_visual(pain, rinnegan).

% Integrantes del Equipo 7
integrante_equipo(naruto, 7).
integrante_equipo(sasuke, 7).
integrante_equipo(sakura, 7).
lider_equipo(naruto, 7).
sensei_equipo(kakashi, 7).

% Integrantes del Equipo 8
integrante_equipo(shino, 8).
integrante_equipo(kiba, 8).
integrante_equipo(hinata, 8).
lider_equipo(kurenai, 8).
sensei_equipo(kurenai, 8).

% Integrantes del Equipo 9
integrante_equipo(choji, 9).
integrante_equipo(shikamaru, 9).
integrante_equipo(ino, 9).
lider_equipo(amon, 9).
sensei_equipo(amono, 9).
