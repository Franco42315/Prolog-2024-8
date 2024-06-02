% Punto de entrada principal del programa
eliza :- 
    writeln('Hola, mi nombre es Eliza, tu chatbot. Por favor, ingresa tu consulta usando solo minúsculas y sin punto al final:'),
    readln(Input), % Lee la entrada del usuario
    eliza(Input),  % Llama al predicado eliza con la entrada del usuario
    !.

% Caso base: si la entrada es "adios"
eliza(Input) :- 
    Input == ['adios'],
    writeln('Adios. Espero haberte podido ayudar.'), 
    !.

% Otro caso base: si la entrada es "adios."
eliza(Input) :- 
    Input == ['adios', '.'],
    writeln('Adios. Espero haberte podido ayudar.'), 
    !.

% Caso general: buscar y aplicar un template
eliza(Input) :- 
    template(Stim, Resp, IndStim), % Encuentra un template que coincida
    match(Stim, Input),  % Verifica si el template coincide con la entrada
    % Si se ha encontrado el template correcto:
    replace0(IndStim, Input, 0, Resp, R), % Reemplaza partes del template con la entrada del usuario
    writeln(R), % Escribe la respuesta generada
    readln(Input1), % Lee la siguiente entrada del usuario
    eliza(Input1),  % Llama recursivamente al predicado eliza con la nueva entrada
    !.

% Definición de templates
template([quien, es, el, padre, de, X, ?], [R], [5]) :- es_padre_de(X, _, R).
template([quien, es, la, madre, de, X, ?], [R], [5]) :- es_madre_de(X, _, R).
template([quien, es, el, esposo, de, X, ?], [R], [5]) :- esposo_de(X, _, R).
template([quien, es, la, esposa, de, X, ?], [R], [5]) :- esposa_de(X, _, R).
template([quien, es, el, hermano, de, X, ?], [R], [5]) :- es_hermano_de(X, _, R).
template([quien, es, la, hermana, de, X, ?], [R], [5]) :- es_hermana_de(X, _, R).
template([quien, es, el, abuelo, de, X, ?], [R], [5]) :- es_abuelo_de(X, _, R).
template([quien, es, la, abuela, de, X, ?], [R], [5]) :- es_abuela_de(X, _, R).
template([quien, es, el, tio, de, X, ?], [R], [5]) :- es_tio_de(X, _, R).
template([quien, es, la, tia, de, X, ?], [R], [5]) :- es_tia_de(X, _, R).
template([quien, es, el, primo, de, X, ?], [R], [5]) :- es_primo_de(X, _, R).
template([quien, es, la, prima, de, X, ?], [R], [5]) :- es_prima_de(X, _, R).
template([quien, es, el, sobrino, de, X, ?], [R], [5]) :- es_sobrino_de(X, _, R).
template([quien, es, la, sobrina, de, X, ?], [R], [5]) :- es_sobrina_de(X, _, R).
template([quien, es, el, cunado, de, X, ?], [R], [5]) :- es_cunado_de(X, _, R).
template([quien, es, la, cunada, de, X, ?], [R], [5]) :- es_cunada_de(X, _, R).
template([quien, es, el, yerno, de, X, ?], [R], [5]) :- es_yerno_de(X, _, R).
template([quien, es, la, nuera, de, X, ?], [R], [5]) :- es_nuera_de(X, _, R).
template([quien, es, el, hijo, de, X, ?], [R], [5]) :- es_hijo_de(X, _, R).
template([quien, es, la, hija, de, X, ?], [R], [5]) :- es_hija_de(X, _, R).
template([quienes, son, los, hijos, de, X, ?], [R], [5]) :- familia(X, R).

% Templates para preguntas con múltiples respuestas
template([quienes, son, los, hermanos, de, X, ?], [R], [5]) :- lista_hermanos_de(X, R).
template([quienes, son, las, hermanas, de, X, ?], [R], [5]) :- lista_hermanas_de(X, R).
template([quienes, son, los, abuelos, de, X, ?], [R], [5]) :- lista_abuelos_de(X, R).
template([quienes, son, las, abuelas, de, X, ?], [R], [5]) :- lista_abuelas_de(X, R).
template([quienes, son, los, tios, de, X, ?], [R], [5]) :- lista_tios_de(X, R).
template([quienes, son, las, tias, de, X, ?], [R], [5]) :- lista_tias_de(X, R).
template([quienes, son, los, primos, de, X, ?], [R], [5]) :- lista_primos_de(X, R).
template([quienes, son, las, primas, de, X, ?], [R], [5]) :- lista_primas_de(X, R).
template([quienes, son, los, sobrinos, de, X, ?], [R], [5]) :- lista_sobrinos_de(X, R).
template([quienes, son, las, sobrinas, de, X, ?], [R], [5]) :- lista_sobrinas_de(X, R).
template([quienes, son, los, cunados, de, X, ?], [R], [5]) :- lista_cunados_de(X, R).
template([quienes, son, las, cunadas, de, X, ?], [R], [5]) :- lista_cunadas_de(X, R).

% Reglas para obtener listas de familiares
lista_hermanos_de(X, R) :-
    findall(Y, hermano_de(Y, X), Hermanos),
    atomic_list_concat(Hermanos, ', ', HermanosStr),
    format(atom(R), 'Los hermanos de ~w son: ~w.', [X, HermanosStr]).

lista_hermanas_de(X, R) :-
    findall(Y, hermana_de(Y, X), Hermanas),
    atomic_list_concat(Hermanas, ', ', HermanasStr),
    format(atom(R), 'Las hermanas de ~w son: ~w.', [X, HermanasStr]).

lista_abuelos_de(X, R) :-
    findall(Y, es_abuelo_de(Y, X, _), Abuelos),
    atomic_list_concat(Abuelos, ', ', AbuelosStr),
    format(atom(R), 'Los abuelos de ~w son: ~w.', [X, AbuelosStr]).

lista_abuelas_de(X, R) :-
    findall(Y, es_abuela_de(Y, X, _), Abuelas),
    atomic_list_concat(Abuelas, ', ', AbuelasStr),
    format(atom(R), 'Las abuelas de ~w son: ~w.', [X, AbuelasStr]).

lista_tios_de(X, R) :-
    findall(Y, es_tio_de(Y, X, _), Tios),
    atomic_list_concat(Tios, ', ', TiosStr),
    format(atom(R), 'Los tíos de ~w son: ~w.', [X, TiosStr]).

lista_tias_de(X, R) :-
    findall(Y, es_tia_de(Y, X, _), Tias),
    atomic_list_concat(Tias, ', ', TiasStr),
    format(atom(R), 'Las tías de ~w son: ~w.', [X, TiasStr]).

lista_primos_de(X, R) :-
    findall(Y, es_primo_de(Y, X, _), Primos),
    atomic_list_concat(Primos, ', ', PrimosStr),
    format(atom(R), 'Los primos de ~w son: ~w.', [X, PrimosStr]).

lista_primas_de(X, R) :-
    findall(Y, es_prima_de(Y, X, _), Primas),
    atomic_list_concat(Primas, ', ', PrimasStr),
    format(atom(R), 'Las primas de ~w son: ~w.', [X, PrimasStr]).

lista_sobrinos_de(X, R) :-
    findall(Y, es_sobrino_de(Y, X, _), Sobrinos),
    atomic_list_concat(Sobrinos, ', ', SobrinosStr),
    format(atom(R), 'Los sobrinos de ~w son: ~w.', [X, SobrinosStr]).

lista_sobrinas_de(X, R) :-
    findall(Y, es_sobrina_de(Y, X, _), Sobrinas),
    atomic_list_concat(Sobrinas, ', ', SobrinasStr),
    format(atom(R), 'Las sobrinas de ~w son: ~w.', [X, SobrinasStr]).

lista_cunados_de(X, R) :-
    findall(Y, es_cunado_de(Y, X, _), Cunados),
    atomic_list_concat(Cunados, ', ', CunadosStr),
    format(atom(R), 'Los cuñados de ~w son: ~w.', [X, CunadosStr]).

lista_cunadas_de(X, R) :-
    findall(Y, es_cunada_de(Y, X, _), Cunadas),
    atomic_list_concat(Cunadas, ', ', CunadasStr),
    format(atom(R), 'Las cuñadas de ~w son: ~w.', [X, CunadasStr]).


% Template por defecto si no se encuentra una coincidencia específica
template(_, ['Por favor, explica un poco más.'], []). 

% Base de datos de relaciones familiares
padre_de(juvenal, leonardo).
padre_de(juvenal, mauricio).
padre_de(juvenal, paola).
padre_de(ulices, juvenal).
padre_de(serafin, maria).
esposo_de(juvenal, maria).
esposa_de(maria, juvenal).

madre_de(maria, leonardo).
madre_de(maria, mauricio).
madre_de(maria, paola).
madre_de(sabina, maria).
madre_de(domitila, juvenal).

padre_de(serafin, ximena).
padre_de(serafin, josue).
madre_de(aurora, ximena).
madre_de(aurora, josue).
hermana_de(maria, serafin).
hermano_de(serafin, maria).
esposo_de(serafin, aurora).
esposa_de(aurora, serafin).

padre_de(carlos, omar).
padre_de(carlos, citlali).
padre_de(carlos, carina).
madre_de(irma, omar).
madre_de(irma, citlali).
madre_de(irma, carina).
hermana_de(maria, irma).
hermana_de(irma, maria).
esposo_de(carlos, irma).
esposa_de(irma, carlos).

padre_de(jose, brianda).
madre_de(herminia, brianda).
hermana_de(maria, herminia).
hermana_de(herminia, maria).
esposo_de(jose, herminia).
esposa_de(herminia, jose).

padre_de(jorge, jorge_f).
padre_de(jorge, eduardo).
padre_de(jorge, rodrigo).
madre_de(elizabeth, jorge_f).
madre_de(elizabeth, eduardo).
madre_de(elizabeth, rodrigo).
hermana_de(elizabeth, juvenal).
hermano_de(juvenal, elizabeth).
esposo_de(jorge, elizabeth).
esposa_de(elizabeth, jorge).

madre_de(atzimba, alicia).
madre_de(atzimba, jorge_g).
madre_de(atzimba, pedro).
padre_de(ulices_d, alicia).
padre_de(ulices_d, jorge_g).
padre_de(ulices_d, pedro).
hermana_de(atzimba, juvenal).
hermano_de(juvenal, atzimba).
esposo_de(ulices_d, atzimba).
esposa_de(atzimba, ulices_d).

padre_de(gil, andres).
padre_de(gil, fernanda).
madre_de(sandra, andres).
madre_de(sandra, fernanda).
hermana_de(sandra, juvenal).
hermano_de(juvenal, sandra).
esposo_de(gil, sandra).
esposa_de(sandra, gil).

hijo_de(leonardo, juvenal).
hijo_de(mauricio, juvenal).
hijo_de(paola, juvenal).
hijo_de(juvenal, ulices).
hijo_de(maria, sabina).
hijo_de(maria, domitila).
hijo_de(ximena, serafin).
hijo_de(josue, serafin).
hijo_de(ximena, aurora).
hijo_de(josue, aurora).
hijo_de(omar, carlos).
hijo_de(citlali, carlos).
hijo_de(carina, carlos).
hijo_de(brianda, jose).
hijo_de(jorge_f, jorge).
hijo_de(eduardo, jorge).
hijo_de(rodrigo, jorge).
hijo_de(alicia, ulices_d).
hijo_de(jorge_g, ulices_d).
hijo_de(pedro, ulices_d).
hijo_de(andres, gil).
hijo_de(fernanda, gil).

cunado_de(serafin, carlos).
cunado_de(carlos, serafin).
cunado_de(serafin, jose).
cunado_de(jose, serafin).
cunado_de(serafin, jorge).
cunado_de(jorge, serafin).
cunado_de(carlos, jorge).
cunado_de(jorge, carlos).
cunado_de(serafin, gil).
cunado_de(gil, serafin).
cunado_de(carlos, gil).
cunado_de(gil, carlos).
cunado_de(jose, gil).
cunado_de(gil, jose).

% Definición de relaciones familiares (ejemplos)
es_padre_de('juan', 'maria').
es_madre_de('ana', 'maria').
hijo_de('luis', 'juan').
hija_de('laura', 'ana').
hermano_de('pedro', 'maria').
hermana_de('clara', 'maria').
esposo_de('carlos', 'maria').
esposa_de('maria', 'carlos').
es_abuelo_de('jose', 'luis', _).
es_abuela_de('maria', 'luis', _).
es_tio_de('raul', 'laura', _).
es_tia_de('sofia', 'laura', _).
es_primo_de('oscar', 'pedro', _).
es_prima_de('ana', 'pedro', _).
es_sobrino_de('alvaro', 'pedro', _).
es_sobrina_de('carla', 'pedro', _).
es_cunado_de('david', 'carlos', _).
es_cunada_de('luisa', 'carlos', _).
es_yerno_de('pablo', 'maria', _).
es_nuera_de('sandra', 'juan', _).

% Relaciones de padres
es_padre_de(X, Y, [X, es, el, padre, de, Y]) :- padre_de(X, Y).
es_madre_de(X, Y, [X, es, la, madre, de, Y]) :- madre_de(X, Y).

% Relación de esposos
esposo_de(X, Y, [X, es, el, esposo, de, Y]) :- esposo_de(X, Y).
esposa_de(X, Y, [X, es, la, esposa, de, Y]) :- esposa_de(X, Y).

% Relación de hermanos
es_hermano_de(X, Y, [X, es, el, hermano, de, Y]) :- hermano_de(X, Y).
es_hermana_de(X, Y, [X, es, la, hermana, de, Y]) :- hermana_de(X, Y).

% Relación de abuelos
es_abuelo_de(X, Y, [X, es, el, abuelo, de, Y]) :- padre_de(X, P), padre_de(P, Y).
es_abuela_de(X, Y, [X, es, la, abuela, de, Y]) :- madre_de(X, P), padre_de(P, Y).

% Relación de tíos
es_tio_de(X, Y, [X, es, el, tio, de, Y]) :- hermano_de(X, P), padre_de(P, Y).
es_tia_de(X, Y, [X, es, la, tia, de, Y]) :- hermana_de(X, P), padre_de(P, Y).

% Relación de primos
es_primo_de(X, Y, [X, es, el, primo, de, Y]) :- padre_de(P, X), hermano_de(P, Q), padre_de(Q, Y).
es_prima_de(X, Y, [X, es, la, prima, de, Y]) :- madre_de(P, X), hermano_de(P, Q), padre_de(Q, Y).

% Relación de sobrinos
es_sobrino_de(X, Y, [X, es, el, sobrino, de, Y]) :- hijo_de(X, P), hermano_de(P, Y).
es_sobrina_de(X, Y, [X, es, la, sobrina, de, Y]) :- hija_de(X, P), hermano_de(P, Y).

% Relación de cuñados
es_cunado_de(X, Y, [X, es, el, cunado, de, Y]) :- cunado_de(X, Y).

% Relación de yernos y nueras
% Relación de hijos
es_hijo_de(X, Y, [X, es, el, hijo, de, Y]) :- hijo_de(X, Y).
es_hija_de(X, Y, [X, es, la, hija, de, Y]) :- hija_de(X, Y).

% Genera una respuesta sobre los hijos de una persona
familia(X, R) :- 
    findall(Y, padre_de(X, Y), Hijos), % Encuentra todos los hijos de X
    atomic_list_concat(Hijos, ', ', HijosStr), % Concatena los nombres de los hijos en una cadena
    format(atom(R), 'Los hijos de ~w son: ~w.', [X, HijosStr]). % Formatea la respuesta

% Verifica si dos listas coinciden
match([], []). % Caso base: dos listas vacías coinciden
match([], _) :- true. % Si el primer template es vacío, siempre coincide

% Coincide elementos de las listas
match([S|Stim], [I|Input]) :- 
    atom(S), % Si S es un átomo
    S == I, % Comprueba si S es igual a I
    match(Stim, Input), % Continúa comparando el resto de las listas
    !.

match([S|Stim], [_|Input]) :- 
    \+ atom(S), % Si S no es un átomo, ignora este elemento de Input
    match(Stim, Input), % Continúa comparando el resto de las listas
    !.

% Reemplaza elementos en la respuesta basándose en la entrada del usuario
replace0([], _, _, Resp, R) :- 
    append(Resp, [], R), % Si no hay más índices, termina la construcción de la respuesta
    !.

replace0([I|_], Input, _, Resp, R) :- 
    nth0(I, Input, Atom), % Obtiene el átomo en la posición I de la entrada
    nth0(0, Resp, X), % Obtiene el primer elemento de la respuesta
    X == flagfam, % Si es flagfam, genera una respuesta sobre la familia
    familia(Atom, R).

replace0([I|Index], Input, N, Resp, R) :- 
    length(Index, M), M =:= 0, % Si no hay más índices
    nth0(I, Input, Atom), % Obtiene el átomo en la posición I de la entrada
    select(N, Resp, Atom, R1), % Reemplaza el elemento N en la respuesta por el átomo
    append(R1, [], R), % Construye la nueva respuesta
    !.

replace0([I|Index], Input, N, Resp, R) :- 
    nth0(I, Input, Atom), % Obtiene el átomo en la posición I de la entrada
    length(Index, M), M > 0, % Si hay más índices
    select(N, Resp, Atom, R1), % Reemplaza el elemento N en la respuesta por el átomo
    N1 is N + 1, % Incrementa el índice N
    replace0(Index, Input, N1, R1, R), % Continúa reemplazando con los índices restantes
    !.

% Lista de funciones y sus explicaciones
% 1. `eliza/0`: Punto de entrada principal del programa. Inicia la interacción con el usuario.
% 2. `eliza/1`: Predicado recursivo que procesa la entrada del usuario y genera respuestas. Tiene diferentes cláusulas para manejar casos específicos (como "adios") y el procesamiento general.
% 3. `template/3`: Define patrones (templates) de entrada y las respuestas asociadas, junto con índices para reemplazo.
% 4. `padre/2`: Base de datos que define relaciones de paternidad.
% 5. `familia/2`: Genera una cadena que describe los hijos de una persona específica.
% 6. `match/2`: Comprueba si una lista (input del usuario) coincide con un patrón (template).
% 7. `replace0/5`: Reemplaza partes de un patrón con elementos de la entrada del usuario para generar una respuesta dinámica.
% 8. `writeln/1`: Escribe una línea en la salida estándar.
% 9. `readln/1`: Lee una línea de la entrada estándar.
% 10. `append/3`: Concatena dos listas.
% 11. `atomic_list_concat/3`: Concatena una lista de átomos en un solo átomo.
% 12. `format/3`: Formatea una cadena de texto.
% 13. `findall/3`: Encuentra todos los términos que satisfacen una meta y los almacena en una lista.
% 14. `nth0/3`: Accede al elemento en la posición N de una lista.
% 15. `select/4`: Sustituye un elemento en una lista por otro.

% Este desglose te ayudará a comprender mejor cómo funciona cada parte del código y cómo interactúan entre sí para crear el chatbot "Eliza".
