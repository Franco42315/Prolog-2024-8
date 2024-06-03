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

% Naruto
aldea(konoha).
aldea(suna).
aldea(kiri).
aldea(iwa).
aldea(kumo).

ninja_de(naruto, konoha).
ninja_de(sasuke, konoha).
ninja_de(sakura, konoha).
ninja_de(gaara, suna).
ninja_de(kisame, kiri).
ninja_de(deidara, iwa).
ninja_de(bee, kumo).

naturaleza_chakra(naruto, viento).
naturaleza_chakra(sasuke, fuego).
naturaleza_chakra(sasuke, rayo).
naturaleza_chakra(sakura, tierra).
naturaleza_chakra(gaara, tierra).
naturaleza_chakra(kisame, agua).
naturaleza_chakra(deidara, tierra).
naturaleza_chakra(bee, rayo).

poder(naruto, kyuubi).
poder(sasuke, sharingan).
poder(sasuke, rinnegan).
poder(sakura, super_fuerza).
poder(gaara, control_arena).
poder(kisame, fusion_con_samehada).
poder(deidara, explosiones).
poder(bee, hachibi).

especialidad(naruto, ninjutsu).
especialidad(sasuke, ninjutsu).
especialidad(sasuke, taijutsu).
especialidad(sakura, taijutsu).
especialidad(sakura, ninjutsu_medico).
especialidad(gaara, ninjutsu).
especialidad(kisame, ninjutsu).
especialidad(deidara, ninjutsu).
especialidad(bee, ninjutsu).
especialidad(bee, taijutsu).

poder_visual(sasuke, sharingan).
poder_visual(neji, byakugan).

% Función para determinar si un síntoma pertenece a una enfermedad
es_sintoma_de(Enfermedad, Sintoma, Respuesta) :-
  sintoma_de(Enfermedad, Sintoma),
  Respuesta = [Sintoma, ' es un síntoma de ', Enfermedad, '. Es probable que lo tenga, consulte a su médico.'].
es_sintoma_de(Enfermedad, Sintoma, Respuesta) :-
  \+ sintoma_de(Enfermedad, Sintoma),
  Respuesta = [Sintoma, ' no es un síntoma de ', Enfermedad, '.'].

% Plantillas para respuestas

% Responde a "¿Qué es Enfermedad?"
plantilla([que, es, Enfermedad, '?'], [EXPLICACION], []) :-
  enfermedad(Enfermedad),
  explicacion(Enfermedad, EXPLICACION).

% Responde a "¿Cuáles son los síntomas de Enfermedad?"
plantilla([cuales, son, los, sintomas, de, Enfermedad, '?'], ['Los síntomas de ', Enfermedad, ' incluyen: ', SINTOMAS], []) :-
  enfermedad(Enfermedad),
  findall(Sintoma, sintoma_de(Enfermedad, Sintoma), SINTOMAS).

% Responde a "¿Cuáles son las causas de Enfermedad?"
plantilla([cuales, son, las, causas, de, Enfermedad, '?'], ['Las causas de ', Enfermedad, ' son: ', CAUSAS], []) :-
  enfermedad(Enfermedad),
  findall(Causa, causa(Enfermedad, Causa), CAUSAS).

% Responde a "¿Cómo se trata Enfermedad?"
plantilla([como, se, trata, Enfermedad, '?'], ['Los tratamientos para ', Enfermedad, ' incluyen: ', TRATAMIENTOS], []) :-
  enfermedad(Enfermedad),
  findall(Tratamiento, medicina_para(Enfermedad, Tratamiento), TRATAMIENTOS).

% Responde a "¿Quién trata Enfermedad?"
plantilla([quien, trata, Enfermedad, '?'], ['Los especialistas que tratan ', Enfermedad, ' son: ', ESPECIALISTAS], []) :-
  enfermedad(Enfermedad),
  findall(Especialista, especialista_para(Enfermedad, Especialista), ESPECIALISTAS).

% Responde a "Si tengo Sintoma, ¿podría ser Enfermedad?"
plantilla([si, tengo, Sintoma, podria, ser, Enfermedad, '?'], [flagSintoma], [2, 5]) :-
  enfermedad(Enfermedad).

% Naruto
% Responde a "¿De qué aldea es Ninja?"
plantilla([de, que, aldea, es, Ninja, '?'], [Ninja, ' es de la aldea de ', Aldea], []) :-
  ninja_de(Ninja, Aldea).

% Responde a "¿Cuál es la naturaleza de chakra de Ninja?"
plantilla([cual, es, la, naturaleza, de, chakra, de, Ninja, '?'], [Ninja, ' tiene la naturaleza de chakra de ', NATURALEZA], []) :-
  naturaleza_chakra(Ninja, NATURALEZA).

% Plantilla para responder a "¿Qué poderes tiene Ninja?"
plantilla([que, poderes, tiene, Ninja, '?'], [Ninja, ' tiene los siguientes poderes: ', PODERES], []) :-  
  ninja_de(Ninja, _), % Asegurar que Ninja está en la base de datos
  findall(Poder, poder(Ninja, Poder), PODERES).

% Responde a "¿Cuál es la especialidad de Ninja?"
plantilla([cual, es, la, especialidad, de, Ninja, '?'], [Ninja, ' se especializa en ', ESPECIALIDADES], []) :-
  ninja_de(Ninja, _), % Asegurar que Ninja está en la base de datos
  findall(Especialidad, especialidad(Ninja, Especialidad), ESPECIALIDADES).

plantilla(_, ['Lo siento, explica un poco más.']).

% Función principal Eliza
eliza :-
  writeln('Hola, soy Eliza, tu chatbot de enfermedades y Naruto. Por favor, ingresa tu consulta en minúsculas y sin punto al final:'),
  readln(Entrada),
  eliza_procesar(Entrada),
  !.

% Responde a "adiós"
eliza_procesar(['adios']) :-
  writeln('Adiós. Espero haber podido ayudarte.'),
  !.

% Procesa la entrada del usuario y genera una respuesta
eliza_procesar(Entrada) :-
  plantilla(Estimulo, Respuesta, IndicesEstimulo),
  coincidencia(Estimulo, Entrada),
  reemplazar_variables(IndicesEstimulo, Entrada, 0, Respuesta, RespuestaFinal),
  writeln(RespuestaFinal),
  readln(NuevaEntrada),
  eliza_procesar(NuevaEntrada),
  !.
eliza_procesar(_) :-
  writeln('Por favor, explica un poco más.'),
  readln(NuevaEntrada),
  eliza_procesar(NuevaEntrada).

% Reemplaza variables en la respuesta con la entrada del usuario o aplica lógica especial
reemplazar_variables([], _, _, Respuesta, Respuesta).
reemplazar_variables([Indice|Indices], Entrada, N, Respuesta, RespuestaFinal) :-
  nth0(Indice, Entrada, Elemento),
  reemplazar(Respuesta, N, Elemento, RespuestaIntermedia),
  N1 is N + 1,
  reemplazar_variables(Indices, Entrada, N1, RespuestaIntermedia, RespuestaFinal).

% Coincidencia de patrones ajustada
coincidencia([], []).
coincidencia([S|Estimulo], [I|Entrada]) :-
  var(S),
  S = I,
  coincidencia(Estimulo, Entrada).
coincidencia([S|Estimulo], [I|Entrada]) :-
  nonvar(S),
  S == I,
  coincidencia(Estimulo, Entrada).

% Reemplazo de elementos en una lista
reemplazar([_|T], 0, X, [X|T]).
reemplazar([H|T], I, X, [H|R]) :-
  I > 0,
  I1 is I - 1,
  reemplazar(T, I1, X, R).
