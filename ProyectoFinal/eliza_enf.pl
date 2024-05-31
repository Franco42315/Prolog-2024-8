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

% Función para determinar si un síntoma pertenece a una enfermedad
es_sintoma_de(E, S, R) :-
  sintoma_de(E, S),
  R = [S, ' es un sintoma de ', E, '. Es probable que lo tenga, consulte a su medico.'].
es_sintoma_de(E, S, R) :-
  \+ sintoma_de(E, S),
  R = [S, ' no es un sintoma de ', E, '.'].

% Plantillas para respuestas

% Responde a "¿Qué es E?"
template([que, es, E, '?'], [EXPLICACION], []) :-
  enfermedad(E),
  explicacion(E, EXPLICACION).

% Responde a "¿Cuáles son los síntomas de E?"
template([cuales, son, los, sintomas, de, E, '?'], ['Los sintomas de ', E, ' incluyen: ', SINTOMAS], []) :-
  enfermedad(E),
  findall(X, sintoma_de(E, X), SINTOMAS).

% Responde a "¿Cuáles son las causas de E?"
template([cuales, son, las, causas, de, E, '?'], ['Las causas de ', E, ' son: ', CAUSAS], []) :-
  enfermedad(E),
  findall(X, causa(E, X), CAUSAS).

% Responde a "¿Cómo se trata E?"
template([como, se, trata, E, '?'], ['Los tratamientos para ', E, ' incluyen: ', MEDICINAS], []) :-
  enfermedad(E),
  findall(X, medicina_para(E, X), MEDICINAS).

% Responde a "¿Quién trata E?"
template([quien, trata, E, '?'], ['Los especialistas que tratan ', E, ' son: ', ESPECIALISTAS], []) :-
  enfermedad(E),
  findall(X, especialista_para(E, X), ESPECIALISTAS).

% Responde a "Si tengo S, ¿podría ser E?"
template([si, tengo, S, podria, ser, E, '?'], [flagSintoma], [2, 5]) :-
  enfermedad(E).

template(_,['Lo siento, explica un poco mas']).

% Función principal Eliza
eliza :-
  writeln('Hola, soy Eliza, tu chatbot de enfermedades. Por favor, ingresa tu consulta en minusculas y sin punto al final:'),
  readln(Input),
  eliza(Input),
  !.

% Responde a "adios"
eliza(['adios']) :-
  writeln('Adios. Espero haber podido ayudarte.'),
  !.

% Procesa la entrada del usuario y genera una respuesta
eliza(Input) :-
  % Encuentra una plantilla que coincida con la entrada del usuario
  template(Stim, Resp, IndStim),
  % Verifica si la entrada del usuario coincide con la plantilla
  match(Stim, Input),
  % Reemplaza las variables en la respuesta con la entrada del usuario o aplica lógica especial
  replace0(IndStim, Input, 0, Resp, R),
  % Escribe la respuesta generada
  writeln(R),
  % Lee la siguiente entrada del usuario
  readln(Input1),
  % Llama recursivamente a la función eliza con la nueva entrada del usuario
  eliza(Input1),
  % Corte verde para evitar retroceso
  !.
eliza(_) :-
  template(_, ['Por favor, explica un poco mas.'], []),
  writeln('Por favor, explica un poco mas.'),
  readln(Input1),
  eliza(Input1).

% Reemplaza variables en la respuesta con la entrada del usuario o aplica lógica especial
replace0([], _, _, Resp, Resp).
replace0([I|Index], Input, N, Resp, R) :-
  nth0(I, Input, Element),
  nth0(0, Resp, X),
  (X == flagSintoma ->
    eliza_does_sintoma(Element, Input, Resp, R);
    replace(Resp, N, Element, R1),
    N1 is N + 1,
    replace0(Index, Input, N1, R1, R)
  ).

eliza_does_sintoma(S, Input, Resp, R) :-
  nth0(5, Input, Enfermedad),
  es_sintoma_de(Enfermedad, S, R).

% Coincidencia de patrones ajustada
match([], []).
match([S|Stim], [I|Input]) :-
  var(S),
  S = I,
  match(Stim, Input).
match([S|Stim], [I|Input]) :-
  nonvar(S),
  S == I,
  match(Stim, Input).
