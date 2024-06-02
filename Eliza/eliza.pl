% La regla principal del programa. Cuando se llama a `eliza`, se ejecutan las siguientes acciones:
eliza:-	
	% Imprime un mensaje de bienvenida al usuario.
	writeln('Hola , mi nombre es  Eliza tu  chatbot, por favor ingresa tu consulta, usar solo minusculas sin . al final:'),
	% Lee la entrada del usuario y la guarda en la variable `Input`.
	readln(Input),
	% Llama a la regla `eliza` con la entrada del usuario como argumento.
	eliza(Input),
	% Operador de corte, que evita que Prolog retroceda y busque otras soluciones una vez que ha encontrado una.
	!.

% Esta regla se activa cuando la entrada del usuario es `['Adios']`. En ese caso, imprime un mensaje de despedida y luego utiliza el operador de corte para terminar la ejecucion.
eliza(Input):- 
	Input == ['Adios'],
	writeln('Adios. espero poder verte ayudado.'), 
	!.

% Esta regla se activa cuando la entrada del usuario es `['Adios', '.']`. Al igual que la anterior, imprime un mensaje de despedida y termina la ejecucion.
eliza(Input):- 
	Input == ['Adios', '.'],
	writeln('Adios. espero poder verte ayudado.'), 
	!.

% Esta regla se activa cuando la entrada del usuario coincide con un patron definido en `template(Stim, Resp, IndStim)`.
eliza(Input) :-
	% `template(Stim, Resp, IndStim)` busca una plantilla que coincida con la entrada del usuario. `Stim` es el estimulo (la entrada del usuario), `Resp` es la respuesta de Eliza, e `IndStim` es una lista de indices que indican las partes de la entrada que deben ser reemplazadas en la respuesta.
	template(Stim, Resp, IndStim),
	% `match(Stim, Input)` verifica si la entrada del usuario coincide con el estimulo. Si coincide, la ejecucion continua.
	match(Stim, Input),
	% Si se llega a este punto, es porque se ha encontrado el patron correcto.
	% `replace0(IndStim, Input, 0, Resp, R)` reemplaza las partes de la respuesta que corresponden a los indices en `IndStim` con las partes correspondientes de la entrada del usuario. El resultado se guarda en `R`.
	replace0(IndStim, Input, 0, Resp, R),
	% `writeln(R)` imprime la respuesta.
	writeln(R),
	% `readln(Input1)` lee la proxima entrada del usuario y la guarda en `Input1`.
	readln(Input1),
	% `eliza(Input1)` llama a la regla `eliza` con la nueva entrada del usuario como argumento.
	eliza(Input1), 
	% `!` es el operador de corte, que evita que Prolog retroceda y busque otras soluciones una vez que ha encontrado una.
	!.

% ---- Templates ----
% Plantillas para manejar diferentes patrones de entrada del usuario y generar respuestas.
template([eliza, quien, es, el, hijo, de, s(_)], [flagfam], [6]).
template(_, ['Por favor, explica un poco mas.'], []).

padre(juan, luis).		 
padre(juan, antonio).
padre(luis, carlos). 
familia(X,R) :- padre(X,Y), R=["El  hijo de ", X, "es", Y].		

% ---- Nuevas plantillas con variables ----
% Plantillas que utilizan predicados binarios
template([soy, s(_), y, vivo, en, s(_)], ['Interesante, eres', 0, 'y vives en', 1], [1, 5]).
template([que, es, mejor, s(_), o, s(_)], ['Yo pienso que es mejor', 0, 'que', 1], [3, 5]).
template([es, mejor, el, libro, de, s(_), que, la, pelicula, actuada, por, s(_)], ['Tienes razon, la pelicula actuada por', 1, 'es peor que el libro de', 0], [5, 11]).
template([estoy, buscando, informacion, sobre, s(_), y, s(_)], ['Entiendo, estas buscando informacion sobre', 0, 'y', 1, '. Dejame ver que puedo encontrar.'], [4, 6]).
template([puedes, explicarme, la, diferencia, entre, s(_), y, s(_)], ['Claro, quieres saber la diferencia entre', 0, 'y', 1, '. Permiteme explicarte.'], [5, 7]).

% ---- Definiciones de respuestas ----
% Plantillas predefinidas y plantillas personalizadas.
template([hola, mi, nombre, es, s(_), '.'], ['Hola', 0, '¿Como estas?'], [4]).
template([buenos, dias, mi, nombre, es, s(_), '.'], ['Buenos dias', 0, '¿Como estas?'], [4]).
template([hola, ',', mi, nombre, es, s(_), '.'], ['Hola', 0, '¿Como estas?'], [5]).
template([buenos, dias, ',', mi, nombre, es, s(_), '.'], ['Buenos dias', 0, '¿Como estas?'], [5]).
template([hola, _], ['Hola, ¿Como estas?'], []).
template([buenos, dias, _], ['Buenos dias, ¿Como estas?'], []).

% ---- Respuestas para afirmaciones sobre el usuario mismo ----
template([yo, s(_), yo, soy, s(_), '.'], ['¿Por que', 0, 'eres', 1, '?'], [1, 4]).
template([yo, s(_), tu, '.'], ['¿Por que', 0, 'yo?'], [1]).
template([yo, soy, s(_), '.'], ['¿Por que eres', 0, '?'], [2]).

% ---- Respuestas para preguntas sobre gustos ----
template([te, gustan, las, s(_), _], [flagLike], [3]).
template([te, gustan, los, s(_), _], [flagLike], [3]).

% ---- Respuestas para preguntas sobre actividades ----
template([tu, haces, s(_), _], [flagDo], [2]).

% ---- Respuestas para preguntas sobre identidad ----
template([que, eres, tu, s(_)], [flagIs], [2]).
template([eres, s(_), '?'], [flagIs], [1]).

% ---- Respuesta a pregunta de como está Eliza ----
template([como, estas, tu, '?'], [yo, estoy, bien, ',', gracias, por, preguntar, '.'], []).

% ---- Respuestas a afirmaciones y preguntas generales ----
template([yo, pienso, que, _], [no, son, tan, inutiles], []).
template([porque, _], [esa, no, es, una, buena, razon, '.'], []).
template([yo, tengo, s(_), con, s(_), '.'], ['Tienes que lidiar con tu', 0, 'y tu', 1, 'de una manera madura.'], [2, 4]).
template([yo, s(_), _], [puedo, recomendarte, un, libro, sobre, ese, tema], []).
template([por, favor, s(_), _], ['No puedo ayudar, soy solo una maquina'], []).
template([dime, un, s(_), _], ['No puedo, soy malo en eso'], []).

% ---- Plantillas personalizadas ----
template([como, ha, sido, tu, dia, hoy, '?'], ['Cuentame un poco sobre tu dia'], []).
template([que, planes, tienes, para, el, fin, de, semana, '?'], ['Me gustaria saber que tienes planeado para el fin de semana'], []).
template([que, opinas, sobre, el, clima, de, hoy, '?'], ['El clima es un tema interesante, ¿no crees?'], []).
template([has, escuchado, alguna, cancion, nueva, recientemente, '?'], ['Estoy interesado en conocer tu opinion sobre musica'], []).
template([has, visto, alguna, pelicula, interesante, ultimamente, '?'], ['Me encantaria escuchar tu recomendacion de pelicula'], []).
template([que, has, estado, haciendo, ultimamente, '?'], ['Cuentame un poco sobre tus actividades recientes'], []).
template([tienes, algun, pasatiempo, favorito, '?'], ['Me gusta aprender sobre los intereses de las personas'], []).
template([has, probado, alguna, comida, nueva, ultimamente, '?'], ['La comida siempre es un buen tema de conversacion'], []).
template([cual, es, tu, lugar, favorito, para, relajarte, '?'], ['Me gusta saber donde encuentras tranquilidad'], []).
template([te, gusta, viajar, '?'], ['Los viajes son una experiencia maravillosa, ¿no crees?'], []).
template([que, te, motiva, todos, los, dias, '?'], ['Me interesa saber que te impulsa en la vida'], []).
template([tienes, alguna, meta, que, te, gustaria, alcanzar, '?'], ['Las metas son importantes para el crecimiento personal'], []).
template([como, te, sientes, hoy, '?'], ['Tu bienestar es importante para mi'], []).
template([cual, es, tu, recuerdo, mas, preciado, '?'], ['Los recuerdos son parte de quienes somos'], []).
template([tienes, algun, consejo, de, vida, que, quieras, compartir, '?'], ['Los consejos sabios siempre son bienvenidos'], []).

% ---- Definicion de reglas de combinacion de patrones y respuestas ----
match([], []).
match([H|T], [H|Rest]):- 
	match(T, Rest).
match([s(_)|T], [_|Rest]):- 
	match(T, Rest).

replace0([], _, _, [], []).
replace0([I|Is], S, I, [_|Ps], [W|Ws]):- 
	nth0(I, S, W), 
	Next is I + 1,
	replace0(Is, S, Next, Ps, Ws).
replace0([I|Is], S, J, [P|Ps], [P|Ws]):- 
	I \= J, 
	Next is J + 1,
	replace0([I|Is], S, Next, Ps, Ws).
replace0([], _, _, P, P).

% -/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
% Datos iniciales
% Relación de padres
% es_padre_de(X, Y, R) :- padre_de(X, Y), R = [X, es, el, padre, de, Y].
% es_madre_de(X, Y, R) :- madre_de(X, Y), R = [X, es, la, madre, de, Y].

% % Relación de esposos
% esposo_de(X, Y, R) :- esposo_de(X, Y), R = [X, es, el, esposo, de, Y].
% esposa_de(X, Y, R) :- esposa_de(X, Y), R = [X, es, la, esposa, de, Y].

% % Relación de hermanos
% es_hermano_de(X, Y, R) :- hermano_de(X, Y), R = [X, es, el, hermano, de, Y].
% es_hermana_de(X, Y, R) :- hermana_de(X, Y), R = [X, es, la, hermana, de, Y].

% % Relación de abuelos
% es_abuelo_de(X, Y, R) :- abuelo(X, Y), R = [X, es, el, abuelo, de, Y].
% es_abuela_de(X, Y, R) :- abuela(X, Y), R = [X, es, la, abuela, de, Y].

% % Relación de tíos
% es_tio_de(X, Y, R) :- tio_de(X, Y), R = [X, es, el, tio, de, Y].
% es_tia_de(X, Y, R) :- tia_de(X, Y), R = [X, es, la, tia, de, Y].

% % Relación de primos
% es_primo_de(X, Y, R) :- primo_de(X, Y), R = [X, es, el, primo, de, Y].
% es_prima_de(X, Y, R) :- prima_de(X, Y), R = [X, es, la, prima, de, Y].

% % Relación de sobrinos
% es_sobrino_de(X, Y, R) :- sobrino_de(X, Y), R = [X, es, el, sobrino, de, Y].
% es_sobrina_de(X, Y, R) :- sobrina_de(X, Y), R = [X, es, la, sobrina, de, Y].

% % Relación de cuñados
% es_cunado_de(X, Y, R) :- cunado_de(X, Y), R = [X, es, el, cunado, de, Y].
% es_cunada_de(X, Y, R) :- cunada_de(X, Y), R = [X, es, la, cunada, de, Y].

% % Relación de yernos y nueras
% es_yerno_de(X, Y, R) :- yerno_de(X, Y), R = [X, es, el, yerno, de, Y].
% es_nuera_de(X, Y, R) :- nuera_de(X, Y), R = [X, es, la, nuera, de, Y].

% % Relación de hijos
% es_hijo_de(X, Y, R) :- hijo_de(X, Y), R = [X, es, el, hijo, de, Y].
% es_hija_de(X, Y, R) :- hija_de(X, Y), R = [X, es, la, hija, de, Y].

% % Datos de la base de conocimiento
% padre_de(juvenal, leonardo).
% padre_de(juvenal, mauricio).
% padre_de(juvenal, paola).
% padre_de(ulices, juvenal).
% padre_de(serafin, maria).
% esposo_de(juvenal, maria).
% esposa_de(maria, juvenal).

% madre_de(maria, leonardo).
% madre_de(maria, mauricio).
% madre_de(maria, paola).
% madre_de(sabina, maria).
% madre_de(domitila, juvenal).

% % Familia de Serafín y Aurora
% padre_de(serafin, ximena).
% padre_de(serafin, josue).
% madre_de(aurora, ximena).
% madre_de(aurora, josue).
% hermana_de(maria, serafin).
% hermano_de(serafin, maria).
% esposo_de(serafin, aurora).
% esposa_de(aurora, serafin).

% % Familia de Carlos y Irma
% padre_de(carlos, omar).
% padre_de(carlos, citlali).
% padre_de(carlos, carina).
% madre_de(irma, omar).
% madre_de(irma, citlali).
% madre_de(irma, carina).
% hermana_de(maria, irma).
% hermana_de(irma, maria).
% esposo_de(carlos, irma).
% esposa_de(irma, carlos).

% % Familia de Herminia y José
% padre_de(jose, brianda).
% madre_de(herminia, brianda).
% hermana_de(maria, herminia).
% hermana_de(herminia, maria).
% esposo_de(jose, herminia).
% esposa_de(herminia, jose).

% % Familia de Jorge y Elizabeth
% padre_de(jorge, jorge_f).
% padre_de(jorge, eduardo).
% padre_de(jorge, rodrigo).
% madre_de(elizabeth, jorge_f).
% madre_de(elizabeth, eduardo).
% madre_de(elizabeth, rodrigo).
% hermana_de(elizabeth, juvenal).
% hermano_de(juvenal, elizabeth).
% esposo_de(jorge, elizabeth).
% esposa_de(elizabeth, jorge).

% % Familia de Ulices_D y Atzimba
% madre_de(atzimba, alicia).
% madre_de(atzimba, jorge_g).
% madre_de(atzimba, pedro).
% padre_de(ulices_d, alicia).
% padre_de(ulices_d, jorge_g).
% padre_de(ulices_d, pedro).
% hermana_de(atzimba, juvenal).
% hermano_de(juvenal, atzimba).
% esposo_de(ulices_d, atzimba).
% esposa_de(atzimba, ulices_d).

% % Familia de Gil y Sandra
% padre_de(gil, andres).
% padre_de(gil, fernanda).
% madre_de(sandra, andres).
% madre_de(sandra, fernanda).
% hermana_de(sandra, juvenal).
% hermano_de(juvenal, sandra).
% esposo_de(gil, sandra).
% esposa_de(sandra, gil).

% % Relaciones hijos
% hijo_de(leonardo, juvenal).
% hijo_de(mauricio, juvenal).
% hijo_de(paola, juvenal).
% hijo_de(juvenal, ulices).
% hijo_de(maria, sabina).
% hijo_de(maria, domitila).
% hijo_de(ximena, serafin).
% hijo_de(josue, serafin).
% hijo_de(ximena, aurora).
% hijo_de(josue, aurora).
% hijo_de(omar, carlos).
% hijo_de(citlali, carlos).
% hijo_de(carina, carlos).
% hijo_de(brianda, jose).
% hijo_de(jorge_f, jorge).
% hijo_de(eduardo, jorge).
% hijo_de(rodrigo, jorge).
% hijo_de(alicia, ulices_d).
% hijo_de(jorge_g, ulices_d).
% hijo_de(pedro, ulices_d).
% hijo_de(andres, gil).
% hijo_de(fernanda, gil).

% % Nuevas relaciones de cuñados
% cunado_de(serafin, carlos).
% cunado_de(carlos, serafin).
% cunado_de(serafin, jose).
% cunado_de(jose, serafin).
% cunado_de(serafin, jorge).
% cunado_de(jorge, serafin).
% cunado_de(carlos, jorge).
% cunado_de(jorge, carlos).
% cunado_de(serafin, gil).
% cunado_de(gil, serafin).
% cunado_de(carlos, gil).
% cunado_de(gil, carlos).
% cunado_de(jose, gil).
% cunado_de(gil, jose).

% % Relaciones abuelo/abuela
% abuelo(X, Y) :- padre_de(X, Z), (padre_de(Z, Y) ; madre_de(Z, Y)).
% abuela(X, Y) :- madre_de(X, Z), (padre_de(Z, Y) ; madre_de(Z, Y)).

% % Relaciones hermano/hermana
% hermano_de(X, Y) :- padre_de(Z, X), padre_de(Z, Y), madre_de(W, X), madre_de(W, Y), X \= Y.
% hermana_de(X, Y) :- padre_de(Z, X), padre_de(Z, Y), madre_de(W, X), madre_de(W, Y), X \= Y.

% % Relaciones tío/tía
% tio_de(X, Y) :- hermano_de(X, Z), (padre_de(Z, Y) ; madre_de(Z, Y)).
% tio_de(X, Y) :- hermana_de(W, Z), esposo_de(X, W), (padre_de(Z, Y) ; madre_de(Z, Y)).
% tia_de(X, Y) :- hermana_de(X, Z), (padre_de(Z, Y) ; madre_de(Z, Y)).
% tia_de(X, Y) :- hermano_de(W, Z), esposa_de(X, W), (padre_de(Z, Y) ; madre_de(Z, Y)).

% % Relaciones primo/prima
% primo_de(X, Y) :- (padre_de(Z, X) ; madre_de(Z, X)), (padre_de(W, Y) ; madre_de(W, Y)), hermano_de(Z, W).
% prima_de(X, Y) :- (padre_de(Z, X) ; madre_de(Z, X)), (padre_de(W, Y) ; madre_de(W, Y)), hermana_de(Z, W).

% % Relaciones sobrino/sobrina
% sobrino_de(X, Y) :- tio_de(Y, X).
% sobrino_de(X, Y) :- tia_de(Y, X).
% sobrina_de(X, Y) :- tio_de(Y, X).
% sobrina_de(X, Y) :- tia_de(Y, X).

% % Relaciones cuñado/cuñada
% cunado_de(X, Y) :- esposo_de(Z, Y), hermano_de(Z, X).
% cunado_de(X, Y) :- esposa_de(Z, Y), hermana_de(Z, X).
% cunada_de(X, Y) :- esposo_de(Z, Y), hermana_de(Z, X).
% cunada_de(X, Y) :- esposa_de(Z, Y), hermano_de(Z, X).

% % Relaciones yerno/nuera
% yerno_de(X, Y) :- esposo_de(X, Z), (padre_de(Y, Z) ; madre_de(Y, Z)).
% nuera_de(X, Y) :- esposa_de(X, Z), (padre_de(Y, Z) ; madre_de(Y, Z)).

% % Relación hijos
% hijo_de(X, Y) :- padre_de(Y, X).
% hijo_de(X, Y) :- madre_de(Y, X).
% hija_de(X, Y) :- padre_de(Y, X).
% hija_de(X, Y) :- madre_de(Y, X).

% % ---- Plantillas para preguntar sobre padres
% template([quien, es, el, padre, de, s(_), '?'], [0, 'es', el, padre, de, 5], [5]).
% % Cuando el usuario pregunta "¿Quién es el padre de X?", Eliza responde "X es el padre de Y".

% template([quien, es, la, madre, de, s(_), '?'], [0, 'es', la, madre, de, 5], [5]).
% % Cuando el usuario pregunta "¿Quién es la madre de X?", Eliza responde "X es la madre de Y".

% % ---- Plantillas para preguntar sobre esposos
% template([quien, es, el, esposo, de, s(_), '?'], [0, 'es', el, esposo, de, 5], [5]).
% % Cuando el usuario pregunta "¿Quién es el esposo de X?", Eliza responde "X es el esposo de Y".

% template([quien, es, la, esposa, de, s(_), '?'], [0, 'es', la, esposa, de, 5], [5]).
% % Cuando el usuario pregunta "¿Quién es la esposa de X?", Eliza responde "X es la esposa de Y".

% % ---- Plantillas para preguntar sobre hermanos
% template([quien, es, el, hermano, de, s(_), '?'], [0, 'es', el, hermano, de, 5], [5]).
% % Cuando el usuario pregunta "¿Quién es el hermano de X?", Eliza responde "X es el hermano de Y".

% template([quien, es, la, hermana, de, s(_), '?'], [0, 'es', la, hermana, de, 5], [5]).
% % Cuando el usuario pregunta "¿Quién es la hermana de X?", Eliza responde "X es la hermana de Y".

% % ---- Plantillas para preguntar sobre abuelos
% template([quien, es, el, abuelo, de, s(_), '?'], [0, 'es', el, abuelo, de, 5], [5]).
% % Cuando el usuario pregunta "¿Quién es el abuelo de X?", Eliza responde "X es el abuelo de Y".

% template([quien, es, la, abuela, de, s(_), '?'], [0, 'es', la, abuela, de, 5], [5]).
% % Cuando el usuario pregunta "¿Quién es la abuela de X?", Eliza responde "X es la abuela de Y".

% % ---- Plantillas para preguntar sobre tíos
% template([quien, es, el, tio, de, s(_), '?'], [0, 'es', el, tio, de, 5], [5]).
% % Cuando el usuario pregunta "¿Quién es el tío de X?", Eliza responde "X es el tío de Y".

% template([quien, es, la, tia, de, s(_), '?'], [0, 'es', la, tia, de, 5], [5]).
% % Cuando el usuario pregunta "¿Quién es la tía de X?", Eliza responde "X es la tía de Y".

% % ---- Plantillas para preguntar sobre primos
% template([quien, es, el, primo, de, s(_), '?'], [0, 'es', el, primo, de, 5], [5]).
% % Cuando el usuario pregunta "¿Quién es el primo de X?", Eliza responde "X es el primo de Y".

% template([quien, es, la, prima, de, s(_), '?'], [0, 'es', la, prima, de, 5], [5]).
% % Cuando el usuario pregunta "¿Quién es la prima de X?", Eliza responde "X es la prima de Y".

% % ---- Plantillas para preguntar sobre sobrinos
% template([quien, es, el, sobrino, de, s(_), '?'], [0, 'es', el, sobrino, de, 5], [5]).
% % Cuando el usuario pregunta "¿Quién es el sobrino de X?", Eliza responde "X es el sobrino de Y".

% template([quien, es, la, sobrina, de, s(_), '?'], [0, 'es', la, sobrina, de, 5], [5]).
% % Cuando el usuario pregunta "¿Quién es la sobrina de X?", Eliza responde "X es la sobrina de Y".

% % ---- Plantillas para preguntar sobre cuñados
% template([quien, es, el, cunado, de, s(_), '?'], [0, 'es', el, cunado, de, 5], [5]).
% % Cuando el usuario pregunta "¿Quién es el cuñado de X?", Eliza responde "X es el cuñado de Y".

% template([quien, es, la, cunada, de, s(_), '?'], [0, 'es', la, cuñada, de, 5], [5]).
% % Cuando el usuario pregunta "¿Quién es la cuñada de X?", Eliza responde "X es la cuñada de Y".

% % ---- Plantillas para preguntar sobre yernos y nueras
% template([quien, es, el, yerno, de, s(_), '?'], [0, 'es', el, yerno, de, 5], [5]).
% % Cuando el usuario pregunta "¿Quién es el yerno de X?", Eliza responde "X es el yerno de Y".

% template([quien, es, la, nuera, de, s(_), '?'], [0, 'es', la, nuera, de, 5], [5]).
% % Cuando el usuario pregunta "¿Quién es la nuera de X?", Eliza responde "X es la nuera de Y".

% % ---- Plantillas para preguntar sobre hijos
% template([quien, es, el, hijo, de, s(_), '?'], [0, 'es', el, hijo, de, 5], [5]).
% % Cuando el usuario pregunta "¿Quién es el hijo de X?", Eliza responde "X es el hijo de Y".

% template([quien, es, la, hija, de, s(_), '?'], [0, 'es', la, hija, de, 5], [5]).
% % Cuando el usuario pregunta "¿Quién es la hija de X?", Eliza responde "X es la hija de Y".



% place0([I|_], Input, _, Resp, R):-
% 	nth0(I, Input, Atom),
% 	nth0(0, Resp, X),

















% % Relaciones abuelo/abuela
% abuelo(X, Y) :- padre_de(X, Z), (padre_de(Z, Y) ; madre_de(Z, Y)).
% abuela(X, Y) :- madre_de(X, Z), (padre_de(Z, Y) ; madre_de(Z, Y)).

% % Relaciones hermano/hermana
% hermano_de(X, Y) :- padre_de(Z, X), padre_de(Z, Y), madre_de(W, X), madre_de(W, Y), X \= Y.
% hermana_de(X, Y) :- padre_de(Z, X), padre_de(Z, Y), madre_de(W, X), madre_de(W, Y), X \= Y.

% % Relaciones tío/tía
% tio_de(X, Y) :- hermano_de(X, Z), (padre_de(Z, Y) ; madre_de(Z, Y)).
% tio_de(X, Y) :- hermana_de(W, Z), esposo_de(X, W), (padre_de(Z, Y) ; madre_de(Z, Y)).
% tia_de(X, Y) :- hermana_de(X, Z), (padre_de(Z, Y) ; madre_de(Z, Y)).
% tia_de(X, Y) :- hermano_de(W, Z), esposa_de(X, W), (padre_de(Z, Y) ; madre_de(Z, Y)).

% % Relaciones primo/prima
% primo_de(X, Y) :- (padre_de(Z, X) ; madre_de(Z, X)), (padre_de(W, Y) ; madre_de(W, Y)), hermano_de(Z, W).
% prima_de(X, Y) :- (padre_de(Z, X) ; madre_de(Z, X)), (padre_de(W, Y) ; madre_de(W, Y)), hermana_de(Z, W).

% % Relaciones sobrino/sobrina
% sobrino_de(X, Y) :- tio_de(Y, X).
% sobrino_de(X, Y) :- tia_de(Y, X).
% sobrina_de(X, Y) :- tio_de(Y, X).
% sobrina_de(X, Y) :- tia_de(Y, X).

% % Relaciones cuñado/cuñada
% cunado_de(X, Y) :- esposo_de(Z, Y), hermano_de(Z, X).
% cunado_de(X, Y) :- esposa_de(Z, Y), hermana_de(Z, X).
% cunada_de(X, Y) :- esposo_de(Z, Y), hermana_de(Z, X).
% cunada_de(X, Y) :- esposa_de(Z, Y), hermano_de(Z, X).

% % Relaciones yerno/nuera
% yerno_de(X, Y) :- esposo_de(X, Z), (padre_de(Y, Z) ; madre_de(Y, Z)).
% nuera_de(X, Y) :- esposa_de(X, Z), (padre_de(Y, Z) ; madre_de(Y, Z)).

% % Relación hijos
% hijo_de(X, Y) :- padre_de(Y, X).
% hijo_de(X, Y) :- madre_de(Y, X).
% hija_de(X, Y) :- padre_de(Y, X).
% hija_de(X, Y) :- madre_de(Y, X).

% % plantilla arbol familiar

% % Plantillas para consultas familiares
% template([quien, es, el, padre, de, s(X), '?'], [0, 'es', el, padre, de, X], [4]).
% template([quien, es, la, madre, de, s(X), '?'], [0, 'es', la, madre, de, X], [4]).
% template([quienes, son, los, hijos, de, s(X), '?'], ['Los', hijos, de, X, 'son', Y], [4]).
% template([quienes, son, las, hijas, de, s(X), '?'], ['Las', hijas, de, X, 'son', Y], [4]).
% template([quien, es, el, hermano, de, s(X), '?'], [0, 'es', el, hermano, de, X], [4]).
% template([quien, es, la, hermana, de, s(X), '?'], [0, 'es', la, hermana, de, X], [4]).
% template([quien, es, el, tio, de, s(X), '?'], [0, 'es', el, tio, de, X], [4]).
% template([quien, es, la, tia, de, s(X), '?'], [0, 'es', la, tia, de, X], [4]).
% template([quien, es, el, abuelo, de, s(X), '?'], [0, 'es', el, abuelo, de, X], [4]).
% template([quien, es, la, abuela, de, s(X), '?'], [0, 'es', la, abuela, de, X], [4]).
% template([quien, es, el, sobrino, de, s(X), '?'], [0, 'es', el, sobrino, de, X], [4]).
% template([quien, es, la, sobrina, de, s(X), '?'], [0, 'es', la, sobrina, de, X], [4]).
% template([quien, es, el, primo, de, s(X), '?'], [0, 'es', el, primo, de, X], [4]).
% template([quien, es, la, prima, de, s(X), '?'], [0, 'es', la, prima, de, X], [4]).
% template([quien, es, el, cunado, de, s(X), '?'], [0, 'es', el, cunado, de, X], [4]).
% template([quien, es, la, cunada, de, s(X), '?'], [0, 'es', la, cunada, de, X], [4]).

% % Definiciones para encontrar relaciones en Prolog
% response_template([0, 'es', el, padre, de, X], [padre_de(0, X)]).
% response_template([0, 'es', la, madre, de, X], [madre_de(0, X)]).
% response_template(['Los', hijos, de, X, 'son', Y], [findall(N, hijo_de(N, X), Y)]).
% response_template(['Las', hijas, de, X, 'son', Y], [findall(N, hija_de(N, X), Y)]).
% response_template([0, 'es', el, hermano, de, X], [hermano_de(0, X)]).
% response_template([0, 'es', la, hermana, de, X], [hermana_de(0, X)]).
% response_template([0, 'es', el, tio, de, X], [tio_de(0, X)]).
% response_template([0, 'es', la, tia, de, X], [tia_de(0, X)]).
% response_template([0, 'es', el, abuelo, de, X], [abuelo(0, X)]).
% response_template([0, 'es', la, abuela, de, X], [abuela(0, X)]).
% response_template([0, 'es', el, sobrino, de, X], [sobrino_de(0, X)]).
% response_template([0, 'es', la, sobrina, de, X], [sobrina_de(0, X)]).
% response_template([0, 'es', el, primo, de, X], [primo_de(0, X)]).
% response_template([0, 'es', la, prima, de, X], [prima_de(0, X)]).
% response_template([0, 'es', el, cunado, de, X], [cunado_de(0, X)]).
% response_template([0, 'es', la, cunada, de, X], [cunada_de(0, X)]).

% % Función principal para procesar la entrada y devolver la respuesta
% eliza_response(Input, Output) :-
% 	parse(Input, Pattern),
% 	template(Pattern, Template, Vars),
% 	fill_template(Template, Vars, Response),
% 	format_response(Response, Output).

% % Rellenar el template con las variables
% fill_template(Template, Vars, Response) :-
% 	response_template(Template, PrologQuery),
% 	query_prolog(PrologQuery, Vars, Response).

% % Consultar Prolog para obtener las respuestas
% query_prolog([], _, []).
% query_prolog([Q|Qs], [Var|Vars], [Var|Response]) :-
% 	call(Q),
% 	query_prolog(Qs, Vars, Response).

% % Formatear la respuesta
% format_response(Response, Output) :-
% 	atomics_to_string(Response, ' ', Output).

% % Ejemplo de uso
% %:- eliza_response([quien, es, el, padre, de, juvenal, '?'], Output), writeln(Output).

% match([], []).
% match([H|T], [H1|T1]) :- H == H1, match(T, T1).
% match([s(_) |T], [_|T1]) :- match(T, T1).
% match([s(_)], [_]).

% replace0([], _, _, [], []).
% replace0([I|T], Input, I, [V|T2], [H|T3]) :- 
%     nth0(I, Input, V),
%     replace0(T, Input, I, T2, T3).
% replace0([H|T], Input, I, [H1|T2], [H1|T3]) :- 
%     replace0(T, Input, I, T2, T3).