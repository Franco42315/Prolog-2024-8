% Base de conocimiento
enfermedad(tosferina).
enfermedad(tuberculosis).
enfermedad(sifilis).

sintomade(estornudos, tosferina).
sintomade(secrecion_nasal, tosferina).
sintomade(fiebre_leve, tosferina).
sintomade(tos_leve, tosferina).
sintomade(tos_intensa, tosferina).
sintomade(silbido_al_inspirar, tosferina).
sintomade(vomitos, tosferina).
sintomade(agotamiento, tosferina).

sintomade(tos_persistente, tuberculosis).
sintomade(dolor_en_el_pecho, tuberculosis).
sintomade(perdida_de_peso, tuberculosis).
sintomade(fatiga, tuberculosis).
sintomade(fiebre, tuberculosis).
sintomade(sudores_nocturnos, tuberculosis).
sintomade(perdida_de_apetito, tuberculosis).

sintomade(ulcera_indolora, sifilis).
sintomade(erupcion_cutanea, sifilis).
sintomade(fiebre, sifilis).
sintomade(inflamacion_de_ganglios, sifilis).
sintomade(problemas_cardiacos, sifilis).
sintomade(problemas_neurologicos, sifilis).

medicinade(eritromicina, tosferina).
medicinade(azitromicina, tosferina).
medicinade(claritromicina, tosferina).

medicinade(isoniazida, tuberculosis).
medicinade(rifampicina, tuberculosis).
medicinade(pirazinamida, tuberculosis).
medicinade(etambutol, tuberculosis).
medicinade(bedaquilina, tuberculosis_resistente).
medicinade(linezolid, tuberculosis_resistente).
medicinade(delamanid, tuberculosis_resistente).

medicinade(penicilina_G_benzatina, sifilis).
medicinade(doxiciclina, sifilis).
medicinade(azitromicina, sifilis).

especialistade(pediatra, tosferina).
especialistade(medico_atencion_primaria, tosferina).
especialistade(infectologo, tosferina).

especialistade(neumologo, tuberculosis).
especialistade(infectologo, tuberculosis).
especialistade(medico_salud_publica, tuberculosis).

especialistade(dermatologo, sifilis).
especialistade(infectologo, sifilis).
especialistade(urologo, sifilis).
especialistade(ginecologo, sifilis).

% Reglas de diagnóstico
buscar([], E, 0).
buscar(X, E, 1) :- sintomade(X, E).
buscar([X|Xs], E, P) :- enfermedad(E), buscar(X, E, S1), buscar(Xs, E, S2), P is S1 + S2.

cantSint(E, C) :- findall(X, sintomade(X, E), L), length(L, R), C is R.

diagnostico([X|Xs], E, K) :- buscar([X|Xs], E, P), cantSint(E, T), K is P * 100 / T.

recetade(M, S) :- sintomade(S, Z), medicinade(M, Z).
atiende_especialista(E, S) :- sintomade(S, Z), especialistade(E, Z).
mereceta(Es, M, E) :- medicinade(M, E), sintomade(S, E), atiende_especialista(Es, S).

% Chatbot Eliza adaptado
eliza :-
    writeln('Hola, mi nombre es Eliza tu chatbot,'),
    writeln('por favor ingresa tu consulta,'),
    writeln('usar solo minúsculas sin . al final:'),
    readln(Input),
    eliza(Input), !.

eliza(Input) :- Input == ['adios'],
    writeln('Adios. espero poder haberte ayudado.'), !.
eliza(Input) :- Input == ['adios', '.'],
    writeln('Adios. espero poder haberte ayudado.'), !.
eliza(Input) :-
    template(Stim, Resp, IndStim),
    match(Stim, Input),
    % si he llegado aquí es que he
    % hallado el template correcto:
    replace0(IndStim, Input, 0, Resp, R),
    writeln(R),
    readln(Input1),
    eliza(Input1), !.

% Templates
template([eliza, quien, trata, s(_)], ['Un especialista en ', flagesp], [3]).
template([eliza, que, medicamento, puedo, tomar, para, s(_)], ['Puedes tomar ', flagmed], [6]).
template([eliza, tengo, s(_)], ['Podrías tener ', flagenf], [2]).
template(_, ['Por favor, explica un poco más.'], []).

% Reglas auxiliares
familia(X, R) :- padre(X, Y), R = ["El hijo de ", X, " es ", Y].

especialista(X, R) :- especialistade(Y, X), R = [Y].
medicamento(X, R) :- medicinade(Y, X), R = [Y].
enfermedad_sintoma(X, R) :- sintomade(X, Y), R = [Y].

match([], []).
match([], _) :- true.

match([S|Stim], [I|Input]) :-
    atom(S), % si I es un s(X) devuelve falso
    S == I,
    match(Stim, Input), !.

match([S|Stim], [_|Input]) :-
    % I es un s(X), lo ignoro y continúo con el resto de la lista
    \+ atom(S),
    match(Stim, Input), !.

replace0([], _, _, Resp, R) :- append(Resp, [], R), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    (   
        Resp = [flagesp|_], especialista(Atom, R);
        Resp = [flagmed|_], medicamento(Atom, R);
        Resp = [flagenf|_], enfermedad_sintoma(Atom, R)
    ).

replace0([I|Index], Input, N, Resp, R) :-
    length(Index, M), M =:= 0,
    nth0(I, Input, Atom),
    select(N, Resp, Atom, R1), append(R1, [], R), !.

replace0([I|Index], Input, N, Resp, R) :-
    nth0(I, Input, Atom),
    length(Index, M), M > 0,
    select(N, Resp, Atom, R1),
    N1 is N + 1,
    replace0(Index, Input, N1, R1, R), !.

% Iniciar el chatbot

