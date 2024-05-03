% Definición del chatbot Eliza en Prolog

% Predicado principal que inicia la interacción con el usuario.
eliza:- writeln('Hola, mi nombre es Eliza, tu chatbot. Por favor, ingresa tu consulta y utiliza solo minúsculas sin punto al final: '),
        readln(Input),
        eliza(Input),!.

% Regla que maneja la despedida del usuario.
eliza(Input):- Input = ['Adios'],
                writeln('Adiós. Espero haberte ayudado.'), !.

% Regla que maneja la despedida del usuario (incluyendo punto al final).
eliza(Input):- Input = ['Adios', '.'],
                writeln('Adiós. Espero haberte ayudado.'), !.

% Regla que maneja la interacción de Eliza con el usuario.
eliza(Input) :- template(Stim, Resp, IndStim),
                match(Stim, Input),
                % Si llegué aquí es porque encontré la plantilla correcta:
                replace0(IndStim, Input, 0, Resp, R),
                writeln(R),
                readln(Input1),
                eliza(Input1), !.

% Definición de plantillas y respuestas de Eliza.
template([hola, ',', mi, nombre, es, s(_), '.'], ['Hola', 0, '¿Cómo', estás, tú, '?'], [5]).
template([buendia, ',', mi, nombre, es, s(_), '.'], ['Buen día', '¿Cómo', estás, tú, 0, '?'], [5]).

template([hola, _], ['Hola', '¿cómo', estás, tú, '?'], []).
template([buendia, _], ['Buen día', '¿Cómo', estás, tú, '?'], []).

template([yo, s(_), yo, soy, s(_),'.'], ['¿Por qué', eres, 1, '?'], [1, 4]).
template([yo, s(_), tu, '.'], ['¿Por qué', me, 0, '?'], [1]).
template([yo, soy, s(_),'.'], ['Porque', eres, tú, 0, '.'], [2]).

% Preguntar algo que le gusta a Eliza
template([te, gustan, las, s(_), _], [flagLike], [3]).
template([te, gustan, los, s(_), _], [flagLike], [3]).

% Preguntar algo que hace Eliza
template([tu, eres, s(_), _], [flagDo], [2]).

% Preguntar qué es Eliza
template([que, eres, tu, s(_)], [flagIs], [2]).
template([eres, s(_), '?'], [flagIs], [2]).

template([como, estas, tu, '?'], [yo, estoy, bien, ',', gracias, por, preguntar, '.'], []).

template([yo, pienso, que, _], ['Bueno, esa', es, tu, opinión], []).
template([porque, _], ['Esa', no, es, una, buena, razón, '.'], []).
template([i, have, s(_), with, s(_), '.'], ['Tienes', que, lidiar, con, tu, 0, y, tu, 1, de, una, manera, madura, '.'], [2, 4]).
template([i, s(_),  _], [Puedo, recomendarte, un, libro, sobre, ese, tema], []).
template([please, s(_), _], ['No', puedo, ayudarte, ',', solo, soy, una, máquina], []). 
template([tell, me, a, s(_), _], ['No', puedo, ',', soy, malo, en, eso], []).

% Regla para reemplazar partes de la respuesta con información específica.
replace0([], _, _, Resp, R):- append(Resp, [], R),!.

% Eliza le gusta algo:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagLike,
    elizaLikes(Atom, R).

% Eliza hace algo:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagDo,
    elizaDoes(Atom, R).

% Eliza es algo:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagIs,
    elizaIs(Atom, R).

% Regla para reemplazar partes de la respuesta con información específica (general).
replace0([I|Index], Input, N, Resp, R):-
    length(Index, M), M =:= 0,
    nth0(I, Input, Atom),
    select(N, Resp, Atom, R1), append(R1, [], R),!.

replace0([I|Index], Input, N, Resp, R):-
    nth0(I, Input, Atom),
    length(Index, M), M > 0,
    select(N, Resp, Atom, R1),
    N1 is N + 1,
    replace0(Index, Input, N1, R1, R),!.

% Definiciones de lo que le gusta a Eliza.
elizaLikes(X, R):- likes(X), R = ['Sí', me, gusta, X].
elizaLikes(X, R):- \+likes(X), R = ['No', me, gusta, X].
likes(manzanas).
likes(ponis).
likes(zombis).
likes(computadoras).
likes(carros).

% Definiciones de lo que hace Eliza.
elizaDoes(X, R):- does(X), R = ['Sí', X, y, me, encanta].
elizaDoes(X, R):- \+does(X), R = ['No', X, ',', es, demasiado, difícil, para, mí].
does(estudiar).
does(cocinar).
does(trabajar).

% Definiciones de lo que es Eliza.
elizaIs(X, R):- is0(X), R = ['Sí', yo, soy, X].
elizaIs(X, R):- \+is0(X), R = ['No', yo, no, soy, X].
is0(tonta).
is0(rara).
is0(amable).
is0(bien).
is0(feliz).
is0(redundante).

% Predicado para verificar si hay coincidencias entre las palabras de la entrada y las de la plantilla.
match([],[]).
match([], _):- true.

match([S|Stim],[I|Input]) :-
    atom(S), % Si I es un s(X) devuelve falso
    S == I,
    match(Stim, Input),!.

match([S|Stim],[_|Input]) :-
    % I es un s(X), lo ignoro y continuo con el resto de la lista
    \+atom(S),
    match(Stim, Input),!.
