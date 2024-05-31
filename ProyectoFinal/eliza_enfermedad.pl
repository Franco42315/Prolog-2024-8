%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Sistema Experto Integrado con Eliza para tres enfermedades          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Base de conocimiento
% Declaraciones de enfermedades
enfermedad(tosferina).
enfermedad(tuberculosis).
enfermedad(sifilis).

% Declaraciones de síntomas, según enfermedad
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

% Declaraciones de medicamentos según enfermedad
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

% Declaraciones de especialistas según enfermedad
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
causa(sifilis, 'La sifilis tambien puede transmitirse de una madre a su hijo durante el embarazo.').

% Explicacion
explicacion(tosferina, 'La tosferina, tambien conocida como pertusis, es una infeccion bacteriana altamente contagiosa. Afecta principalmente a los pulmones y puede causar tos severa.').

explicacion(tuberculosis, 'La tuberculosis es una enfermedad infecciosa que afecta principalmente a los pulmones. Es causada por una bacteria y se propaga de persona a persona a traves del aire.').

explicacion(sifilis, 'La sifilis es una enfermedad de transmision sexual causada por una bacteria. Puede causar complicaciones a largo plazo o la muerte si no se trata adecuadamente.').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Seccion de Eliza
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

eliza :-
  writeln('Hola, soy Eliza, tu chatbot de enfermedades. Por favor, ingresa tu consulta en minusculas y sin punto al final:'),
  readln(Input),
  eliza(Input),
  !.

% - writeln/1: Escribe un mensaje de saludo.
% - readln/1: Lee la entrada del usuario.
% - eliza/1: Llama a la función eliza con la entrada del usuario.
% - !/0: Corte verde que evita retrocesos innecesarios.

eliza(['adios']) :-
  writeln('Adios. Espero haber podido ayudarte.'),
  !.

% Procesa la entrada del usuario y genera una respuesta
eliza(Input) :-
  % Encuentra una plantilla que coincida con la entrada del usuario
  template(Stim, Resp, IndStim),
  % Verifica si la entrada del usuario coincide con la plantilla
  match(Stim, Input),
  % Reemplaza las variables en la respuesta con la entrada del usuario
  replace0(IndStim, Input, 0, Resp, R),
  % Escribe la respuesta generada
  writeln(R),
  % Lee la siguiente entrada del usuario
  readln(Input1),
  % Llama recursivamente a la función eliza con la nueva entrada del usuario
  eliza(Input1),
  % Corte verde para evitar retroceso
  !.

% - template/3: Busca una plantilla que coincida con la entrada del usuario.
% - match/2: Verifica si la entrada del usuario coincide con la plantilla.
% - replace0/5: Reemplaza las variables en la respuesta usando la entrada del usuario.
% - writeln/1: Escribe la respuesta generada.
% - readln/1: Lee la siguiente entrada del usuario.
% - eliza/1: Llama recursivamente a eliza con la nueva entrada del usuario.
% - !/0: Corte verde que evita retrocesos innecesarios.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             Plantillas para respuestas             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Responde a "¿Qué es E?" ------------------------------------------------
template([que, es, E, '?'], [EXPLICACION], []) :-
  enfermedad(E),
  explicacion(E, EXPLICACION).

% - enfermedad/1: Verifica que E sea una enfermedad conocida.
% - explicacion/2: Encuentra la explicación para la enfermedad E.

% Responde a "¿Cuáles son los síntomas de E?" ------------------------------------------------
template([cuales, son, los, sintomas, de, E, '?'], ['Los sintomas de ', E, ' incluyen: ', SINTOMAS], []) :-
  enfermedad(E),
  findall(X, sintoma_de(E, X), SINTOMAS).

% - enfermedad/1: Verifica que E sea una enfermedad conocida.
% - findall/3: Encuentra todos los síntomas de la enfermedad E y los almacena en SINTOMAS.

% Responde a "¿Cuáles son las causas de E?" ------------------------------------------------
template([cuales, son, las, causas, de, E, '?'], ['Las causas de ', E, ' son: ', CAUSAS], []) :-
  enfermedad(E),
  findall(X, causa(E, X), CAUSAS).

% - enfermedad/1: Verifica que E sea una enfermedad conocida.
% - findall/3: Encuentra todas las causas de la enfermedad E y las almacena en CAUSAS.

% Responde a "¿Cómo se trata E?" ------------------------------------------------
template([como, se, trata, E, '?'], ['Los tratamientos para ', E, ' incluyen: ', MEDICINAS], []) :-
  enfermedad(E),
  findall(X, medicina_para(E, X), MEDICINAS).

% - enfermedad/1: Verifica que E sea una enfermedad conocida.
% - findall/3: Encuentra todos los tratamientos para la enfermedad E y los almacena en MEDICINAS.

% Responde a "¿Quién trata E?" ------------------------------------------------
template([quien, trata, E, '?'], ['Los especialistas que tratan ', E, ' son: ', ESPECIALISTAS], []) :-
  enfermedad(E),
  findall(X, especialista_para(E, X), ESPECIALISTAS).

% - enfermedad/1: Verifica que E sea una enfermedad conocida.
% - findall/3: Encuentra todos los especialistas que tratan la enfermedad E y los almacena en ESPECIALISTAS.

% Responde a consultas no reconocidas ------------------------------------------------
template(_, ['Por favor, explica un poco mas.'], []).

% Responde a "Si tengo S, ¿podría ser E?"
template([si, tengo, S, podria, ser, E, '?'], [flag_sintoma], [2]) :-
  sintoma_de(E, S).

% - enfermedad/1: Verifica que E sea una enfermedad conocida.
% - sintoma_de/2: Verifica que S sea un síntoma de la enfermedad E.

% Define cómo determinar si un síntoma es parte de una enfermedad 
es_sintoma(E, X, R) :-
  sintoma_de(E, X), 
  R = [X, ' es un sintoma de ', E, '.', ' Es probable que lo tenga, consulte a su medico.'].

es_sintoma(E, X, R) :-
  \+ sintoma_de(E, X), 
  R = [X, ' no es un sintoma de ', E, '.'].

% - sintoma_de/2: Verifica si X es un síntoma de E.
% - Respuesta afirmativa: Si X es un síntoma de E, genera una respuesta afirmativa.
% - Respuesta negativa: Si X no es un síntoma de E, genera una respuesta negativa.

% Reemplaza variables en la respuesta con la entrada del usuario
replace0([I|_], Input, _, Resp, R) :-
  % Obtiene el síntoma de la entrada del usuario
  nth0(I, Input, Sintoma),
  % Verifica que el primer elemento de la respuesta sea un flag_sintoma
  nth0(0, Resp, X),
  X == flag_sintoma,
  % Obtiene la enfermedad de la entrada del usuario
  nth0(5, Input, Enfermedad),
  % Genera una respuesta basada en si el síntoma es parte de la enfermedad
  es_sintoma(Enfermedad, Sintoma, R).

replace0([I|Index], Input, N, Resp, R) :-
  % Obtiene el átomo en la posición I de la entrada
  nth0(I, Input, Atom),
  % Reemplaza el N-ésimo elemento de la respuesta con el átomo de la entrada
  select(N, Resp, Atom, R1),
  % Incrementa el contador N
  N1 is N + 1,
  % Llama recursivamente a replace0 con el índice restante
  replace0(Index, Input, N1, R1, R).

replace0([], _, _, Resp, Resp).

% - replace0/5: Reemplaza partes de la respuesta (Resp) con elementos de la entrada del usuario (Input).
% - Parámetros:
% - [I|_]: Lista de índices que indica qué partes de la entrada del usuario deben ser reemplazadas en la respuesta.
% - Input: Lista de palabras ingresadas por el usuario.
% - N: Contador usado para rastrear la posición en la respuesta donde se debe hacer el reemplazo.
% - Resp: Plantilla de respuesta que contiene variables a reemplazar.
% - R: Respuesta final después de realizar todos los reemplazos necesarios.

% Funciones de coincidencia y reemplazo
match([], []).
match([], _) :- true.

match([S|Stim], [I|Input]) :-
    % Verifica si el elemento actual de Stim coincide con el de Input
    atom(S),
    S == I,
    % Llama recursivamente a match con los elementos restantes
    match(Stim, Input),
    % Corte verde para evitar retroceso
    !.

match([S|Stim], [_|Input]) :-
    % Si el elemento actual de Stim no es un átomo, sigue comparando
    \+ atom(S),
    match(Stim, Input),
    % Corte verde para evitar retroceso
    !.

% - match/2: Verifica si una lista (Stim) coincide con otra (Input).
% - Parámetros:
% - [S|Stim]: Lista que representa la estructura de la plantilla.
% - [I|Input]: Lista que representa la entrada del usuario.

















