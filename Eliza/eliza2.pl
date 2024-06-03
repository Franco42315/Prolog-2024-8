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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plantillas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plantilla([que, es, s(_), '?'], [flagExplicacionEnfermedad], [2]).
plantilla([cuales, son, los, sintomas, de, s(_), '?'], [flagSintomasEnfermedad], [6]).
plantilla([cuales, son, las, causas, de, s(_), '?'], [flagCausasEnfermedad], [6]).
plantilla([como, se, trata, s(_), '?'], [flagTratamientosEnfermedad], [4]).
plantilla([quien, trata, s(_), '?'], [flagEspecialistasEnfermedad], [2]).
plantilla([si, tengo, s(_), podria, ser, s(_), '?'], [flagEsSintomaDeEnfermedad], [2, 5]).

% Plantillas para respuestas sobre Naruto
plantilla([a, que, aldea, pertenece, s(_), '?'], [flagAldeaNinja], [4]).
plantilla([cual, es, la, naturaleza, del, chakra, de, s(_), '?'], [flagNaturalezaChakra], [7]).
plantilla([cual, es, el, poder, de, s(_), '?'], [flagPoderNinja], [5]).
plantilla([cual, es, la, especialidad, de, s(_), '?'], [flagEspecialidadNinja], [5]).
plantilla([que, poder, visual, tiene, s(_), '?'], [flagPoderVisual], [4]).

% Plantillas para respuestas sobre árbol familiar


plantilla(_, ['Por favor explica un poco mas'], []).

% Predicado para coincidencia de patrones
coincide([], []).
coincide([S|RestoPatron], [I|RestoEntrada]) :-
    atom(S), % si S es un s(_) devuelve falso
    S == I,
    coincide(RestoPatron, RestoEntrada), !.
coincide([s(_)|RestoPatron], [_|RestoEntrada]) :-
    coincide(RestoPatron, RestoEntrada), !.

% Predicado para reemplazo en las respuestas
replace0([], _, _, Respuesta, Respuesta) :- !.

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



replace0([Indice|RestoIndices], Entrada, N, Respuesta, Resultado) :-
    nth0(Indice, Entrada, Atomo),
    select(N, Respuesta, Atomo, RespuestaTemporal),
    N1 is N + 1,
    replace0(RestoIndices, Entrada, N1, RespuestaTemporal, Resultado), !.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Base de conocimientos de Naruto
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Reglas de Naruto
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

aldea_de_ninja(Ninja, Respuesta) :-
    ninja_de(Ninja, Aldea),
    format(atom(Respuesta), '~w pertenece a la aldea de ~w.', [Ninja, Aldea]).

naturaleza_chakra_de(Ninja, Respuesta) :-
    naturaleza_chakra(Ninja, Naturaleza),
    format(atom(Respuesta), 'La naturaleza del chakra de ~w es ~w.', [Ninja, Naturaleza]).

poder_de_ninja(Ninja, Respuesta) :-
    poder(Ninja, Poder),
    format(atom(Respuesta), 'El poder de ~w es ~w.', [Ninja, Poder]).

especialidad_de_ninja(Ninja, Respuesta) :-
    especialidad(Ninja, Especialidad),
    format(atom(Respuesta), 'La especialidad de ~w es ~w.', [Ninja, Especialidad]).

poder_visual_de(Ninja, Respuesta) :-
    poder_visual(Ninja, PoderVisual),
    format(atom(Respuesta), '~w tiene el poder visual ~w.', [Ninja, PoderVisual]).

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
causa(sifilis, 'La sifilis tambien puede transmitirse de una madre a su hijo durante el embarazo.').

% Explicacion
explicacion(tosferina, 'La tosferina, tambien conocida como pertusis, es una infeccion bacteriana altamente contagiosa. Afecta principalmente a los pulmones y puede causar tos severa.').
explicacion(tuberculosis, 'La tuberculosis es una enfermedad infecciosa que afecta principalmente a los pulmones. Es causada por una bacteria y se propaga de persona a persona a traves del aire.').
explicacion(sifilis, 'La sifilis es una enfermedad de transmision sexual causada por una bacteria. Puede causar complicaciones a largo plazo o la muerte si no se trata adecuadamente.').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Logica enfermedades
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

es_sintoma_de(Enfermedad, Sintoma, Respuesta) :-
    sintoma_de(Enfermedad, Sintoma),
    format(atom(Respuesta), '~w es un sintoma de ~w. Es probable que lo tenga, consulte a su medico.', [Sintoma, Enfermedad]).
es_sintoma_de(Enfermedad, Sintoma, Respuesta) :-
    \+ sintoma_de(Enfermedad, Sintoma),
    format(atom(Respuesta), '~w no es un sintoma de ~w.', [Sintoma, Enfermedad]).

% Regla para explicar una enfermedad
explicacion_de_enfermedad(Enfermedad, Respuesta) :-
    enfermedad(Enfermedad),
    explicacion(Enfermedad, EXPLICACION),
    format(atom(Respuesta), 'Explicación de la enfermedad ~w: ~w', [Enfermedad, EXPLICACION]).

% Regla para encontrar los sintomas de una enfermedad
sintomas_de_enfermedad(Enfermedad, Respuesta) :-
    enfermedad(Enfermedad),
    findall(Sintoma, sintoma_de(Enfermedad, Sintoma), Lista),
    atomic_list_concat(Lista, ', ', ListaStr),
    format(atom(Respuesta), 'Los sintomas de ~w incluyen: ~w.', [Enfermedad, ListaStr]).

% Regla para encontrar las causas de una enfermedad
causas_de_enfermedad(Enfermedad, Respuesta) :-
    enfermedad(Enfermedad),
    findall(Causa, causa(Enfermedad, Causa), Lista),
    atomic_list_concat(Lista, ', ', ListaStr),
    format(atom(Respuesta), 'Las causas de ~w son: ~w.', [Enfermedad, ListaStr]).

% Regla para encontrar los tratamientos de una enfermedad
tratamientos_para_enfermedad(Enfermedad, Respuesta) :-
    enfermedad(Enfermedad),
    findall(Tratamiento, medicina_para(Enfermedad, Tratamiento), Lista),
    atomic_list_concat(Lista, ', ', ListaStr),
    format(atom(Respuesta), 'Los tratamientos para ~w incluyen: ~w.', [Enfermedad, ListaStr]).

% Regla para encontrar los especialistas que tratan una enfermedad
especialistas_para_enfermedad(Enfermedad, Respuesta) :-
    enfermedad(Enfermedad),
    findall(Especialista, especialista_para(Enfermedad, Especialista), Lista),
    atomic_list_concat(Lista, ', ', ListaStr),
    format(atom(Respuesta), 'Los especialistas que tratan ~w son: ~w.', [Enfermedad, ListaStr]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Base de conocimiento del árbol familiar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

% Familia de Serafín y Aurora
padre_de(serafin, ximena).
padre_de(serafin, josue).
madre_de(aurora, ximena).
madre_de(aurora, josue).
hermana_de(maria, serafin).
hermano_de(serafin, maria).
esposo_de(serafin, aurora).
esposa_de(aurora, serafin).

% Familia de Carlos y Irma
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

% Familia de Herminia y José
padre_de(jose, brianda).
madre_de(herminia, brianda).
hermana_de(maria, herminia).
hermana_de(herminia, maria).
esposo_de(jose, herminia).
esposa_de(herminia, jose).

% Familia de Jorge y Elizabeth
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

% Familia de Ulices_D y Atzimba
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

% Familia de Gil y Sandra
padre_de(gil, andres).
padre_de(gil, fernanda).
madre_de(sandra, andres).
madre_de(sandra, fernanda).
hermana_de(sandra, juvenal).
hermano_de(juvenal, sandra).
esposo_de(gil, sandra).
esposa_de(sandra, gil).

% Relaciones hijos
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

% Nuevas relaciones de cuñados
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


% hijo_de(Hijo, Padre) :- padre_de(Padre, Hijo).
% hijo_de(Hijo, Madre) :- madre_de(Madre, Hijo).

% esposo_de(Esposa, Esposo) :- esposa_de(Esposa, Esposo).
% esposa_de(Esposo, Esposa) :- esposo_de(Esposo, Esposa).

% hermano_de(Persona, Hermano) :- hermana_de(Hermano, Persona).
% hermana_de(Persona, Hermana) :- hermano_de(Hermana, Persona).

% cunado_de(Persona, Cunado) :- cunada_de(Cunado, Persona).
% cunada_de(Persona, Cunada) :- cunado_de(Cunada, Persona).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plantillas árbol familiar 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plantilla([quien, es, el, padre, de, X, '?'], [flagPadreDe], [5]) :-
    atom(X).

% plantilla([quien, es, la, madre, de, s(_), '?'], [flagMadreDe], [5]).
% plantilla([quien, es, el, esposo, de, s(_), '?'], [flagEsposoDe], [5]).
% plantilla([quien, es, la, esposa, de, s(_), '?'], [flagEsposaDe], [5]).
% plantilla([quien, es, el, hermano, de, s(_), '?'], [flagHermanoDe], [5]).
% plantilla([quien, es, la, hermana, de, s(_), '?'], [flagHermanaDe], [5]).
% plantilla([quien, es, el, cunado, de, s(_), '?'], [flagCunadoDe], [5]).
% plantilla([quien, es, la, cunada, de, s(_), '?'], [flagCunadaDe], [5]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Replace0 del árbol familiar 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

replace0([Indice|_], Entrada, _, [flagPadreDe], Resultado) :-
    nth0(Indice, Entrada, Persona),
    padre_de(Persona, Padre),
    format(atom(Resultado), '~w es el padre de ~w.', [Padre, Persona]), !.

% replace0([Indice|_], Entrada, _, [flagMadreDe], Resultado) :-
%     nth0(Indice, Entrada, Persona),
%     madre_de(Persona, Madre),
%     format(atom(Resultado), '~w es la madre de ~w.', [Madre, Persona]), !.

% replace0([Indice|_], Entrada, _, [flagEsposoDe], Resultado) :-
%     nth0(Indice, Entrada, Persona),
%     esposo_de(Persona, Esposo),
%     format(atom(Resultado), '~w es el esposo de ~w.', [Esposo, Persona]), !.

% replace0([Indice|_], Entrada, _, [flagEsposaDe], Resultado) :-
%     nth0(Indice, Entrada, Persona),
%     esposa_de(Persona, Esposa),
%     format(atom(Resultado), '~w es la esposa de ~w.', [Esposa, Persona]), !.

% replace0([Indice|_], Entrada, _, [flagHermanoDe], Resultado) :-
%     nth0(Indice, Entrada, Persona),
%     hermano_de(Persona, Hermano),
%     format(atom(Resultado), '~w es el hermano de ~w.', [Hermano, Persona]), !.

% replace0([Indice|_], Entrada, _, [flagHermanaDe], Resultado) :-
%     nth0(Indice, Entrada, Persona),
%     hermana_de(Persona, Hermana),
%     format(atom(Resultado), '~w es la hermana de ~w.', [Hermana, Persona]), !.

% replace0([Indice|_], Entrada, _, [flagCunadoDe], Resultado) :-
%     nth0(Indice, Entrada, Persona),
%     cunado_de(Persona, Cunado),
%     format(atom(Resultado), '~w es el cuñado de ~w.', [Cunado, Persona]), !.

% replace0([Indice|_], Entrada, _, [flagCunadaDe], Resultado) :-
%     nth0(Indice, Entrada, Persona),
%     cunado_de(Cunado, Persona),
%     format(atom(Resultado), '~w es la cuñada de ~w.', [Cunado, Persona]), !.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Reglas del árbol familiar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

padre_de(Persona, Padre) :-
    padre_de(Padre, Persona),
    format(atom(Respuesta), '~w es el padre de ~w.', [Padre, Persona]).

% madre_de(Persona, Madre) :-
%     madre_de(Madre, Persona),
%     format(atom(Respuesta), '~w es la madre de ~w.', [Madre, Persona]).

% esposo_de(Persona, Esposo) :-
%     esposo_de(Esposo, Persona),
%     format(atom(Respuesta), '~w es el esposo de ~w.', [Esposo, Persona]).

% esposa_de(Persona, Esposa) :-
%     esposa_de(Esposa, Persona),
%     format(atom(Respuesta), '~w es la esposa de ~w.', [Esposa, Persona]).

% hermano_de(Persona, Hermano) :-
%     hermano_de(Hermano, Persona),
%     format(atom(Respuesta), '~w es el hermano de ~w.', [Hermano, Persona]).

% hermana_de(Persona, Hermana) :-
%     hermana_de(Hermana, Persona),
%     format(atom(Respuesta), '~w es la hermana de ~w.', [Hermana, Persona]).

% cunado_de(Persona, Cunado) :-
%     cunado_de(Cunado, Persona),
%     format(atom(Respuesta), '~w es el cuñado de ~w.', [Cunado, Persona]).

% cunada_de(Persona, Cunada) :-
%     cunado_de(Persona, Cunada),
%     format(atom(Respuesta), '~w es la cuñada de ~w.', [Cunada, Persona]).
