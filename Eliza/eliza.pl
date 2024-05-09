eliza:-	writeln('Hola , mi nombre es  Eliza tu  chatbot,
	por favor ingresa tu consulta,
	usar solo minusculas sin . al final:'),
	readln(Input),
	eliza(Input),!.
eliza(Input):- Input == ['Adios'],
	writeln('Adios. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['Adios', '.'],
	writeln('Adios. espero poder verte ayudado.'), !.
eliza(Input) :-
	template(Stim, Resp, IndStim),
	match(Stim, Input),
	% si he llegado aqui es que he
	% hallado el template correcto:
	replace0(IndStim, Input, 0, Resp, R),
	writeln(R),
	readln(Input1),
	eliza(Input1), !.

template([hola, mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [4]).
template([buendia, mi, nombre, es, s(_), '.'], ['buen dia', 'Como', estas, tu, 0, '?'], [4]).

template([hola, ',', mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [5]).
template([buendia, ',', mi, nombre, es, s(_), '.'], ['Buendia', 'Como', estas, tu, 0, '?'], [5]).

template([hola, _], ['Hola', 'como', estas, tu, '?'], []).
template([buendia, _], ['Buendia', 'Como', estas, tu, '?'], []).

template([yo, s(_), yo, soy, s(_),'.'], [por, que, 0, eres, 1, '?'], [1, 4]).
template([yo, s(_), tu, '.'], [why, do, you, 0, me ,'?'], [1]).
template([yo, soy, s(_),'.'], [porque, eres, tu, 0, '?'], [2]).

% pregunta algo que le gusta a eliza
template([te, gustan, las, s(_), _], [flagLike], [3]).
template([te, gustan, los, s(_), _], [flagLike], [3]).

% pregunta algo que hace eliza
template([tu, eres, s(_), _], [flagDo], [2]).
% pregunta algo que es eliza
template([que, eres, tu, s(_)], [flagIs], [2]).
template([eres, s(_), '?'], [flagIs], [2]).

template([como, estas, tu, '?'], [yo, estoy, bien, ',', gracias, por, preguntar, '.'], []).

template([yo, pienso, que, _], [no, son, tan, inutiles], []).
template([porque, _], [esa, no, es, una, buena, razon, '.'], []).
template([i, have, s(_), with, s(_), '.'], ['You', have, to, deal, with, your, 0, and, your, 1, in, a, mature, way, '.'], [2, 4]).
template([i, s(_),  _], [i, can, recommend, you, a, book, about, that, issue], []).
template([please, s(_), _], ['No', i, can, not, help, ',', i, am, just, a, machine], []). 
template([tell, me, a, s(_), _], ['No', i, can, not, ',', i, am, bad, at, that], []).

% template custom
template([como, ha, sido, tu, dia, hoy, '?'], ['Cuentame', un, poco, sobre, tu, dia], []).
template([que, planes, tienes, para, el, fin, de, semana, '?'], ['Me', gustaria, saber, que, tienes, planeado, para, el, fin, de, semana], [0]).
template([que, opinas, sobre, el, clima, de, hoy, '?'], ['El', clima, es, un, tema, interesante, '¿',no, crees,'?'], []).
template([has, escuchado, alguna, cancion, nueva, recientemente, '?'], ['Estoy', interesado, en, conocer, tu, opinion, sobre, musica], []).
template([has, visto, alguna, pelicula, interesante, ultimamente, '?'], ['Me', encantaria, escuchar, tu, recomendacion, de, pelicula], []).
template([que, has, estado, haciendo, ultimamente, '?'], ['Cuentame', un, poco, sobre, tus, actividades, recientes], []).
template([tienes, algun, pasatiempo, favorito, '?'], ['Me', gusta, aprender, sobre, los, intereses, de, las, personas], []).
template([has, probado, alguna, comida, nueva, ultimamente, '?'], ['La', comida, siempre, es, un, buen, tema, de, conversacion], []).
template([cual, es, tu, lugar, favorito, para, relajarte, '?'], ['Me', gusta, saber, donde, encuentras, tranquilidad], []).
template([te, gusta, viajar, '?'], ['Los', viajes, son, una, experiencia, maravillosa, '¿',no, crees,'?'], []).
template([que, te, motiva, todos, los, dias, '?'], ['Me', interesa, saber, que, te, impulsa, en, la, vida], []).
template([tienes, alguna, meta, que, te, gustaria, alcanzar, '?'], ['Las', metas, son, importantes, para, el, crecimiento, personal], []).
template([como, te, sientes, hoy, '?'], ['Tu', bienestar, es, importante, para, mi], []).
template([que, piensas, sobre, la, inteligencia, artificial, '?'], ['Es', ironico, hablar, de, inteligencia, artificial, conmigo], []).
template([has, tenido, alguna, experiencia, interesante, ultimamente, '?'], ['Me', encantaria, escuchar, tus, vivencias, recientes], []).
template([cual, es, tu, opinion, sobre, la, tecnologia, actual, '?'], ['La', tecnologia, siempre, esta, en, constante, cambio], []).
template([que, opinas, sobre, la, importancia, del, ejercicio, fisico, '?'], ['El', ejercicio, es, crucial, para, mantener, la, salud], []).
template([te, consideras, una, persona, optimista, '?'], ['La', actitud, optimista, puede, influir, positivamente, en, la, vida], []).
template([que, crees, que, nos, depara, el, futuro, '?'], ['El', futuro, es, un, misterio, que, nos, aguarda], []).
template([tienes, alguna, pregunta, para, mi, '?'], ['Estoy', aqui, para, responder, cualquier, pregunta, que, tengas], []).

template([me, siento, feliz, _], ['Eso', 'es', 'genial', '!', '¿Que', 'te', 'hizo', 'sentir', 'asi', '?'], []).
template([estoy, enojado, _], ['Lo', 'siento', 'que', 'te', 'sientas', 'asi', ',', '¿quieres', 'hablar', 'sobre', 'eso', '?'], []).
template([estoy, confundido, _], ['Puedo', 'intentar', 'ayudarte', 'a', 'entender', ',', '¿que', 'te', 'confunde', '?'], []).
template([necesito, un, consejo, _], ['Claro', ',', '¿sobre', 'que', 'necesitas', 'un', 'consejo', '?'], []).
template([no, puedo, dormir, _], ['Lo', 'siento', 'que', 'estas', 'teniendo', 'problemas', 'para', 'dormir', '.', 'A', 'veces', 'ayuda', 'leer', 'un', 'libro', '.'], []).
template([estoy, emocionado, _], ['¡Eso', 'suena', 'emocionante', '!', '¿Quieres', 'compartir', 'mas', 'sobre', 'eso', '?'], []).
template([me, siento, solo, _], ['Lo', 'siento', 'que', 'te', 'sientas', 'asi', ',', 'siempre', 'estoy', 'aqui', 'para', 'hablar', 'contigo', '.'], []).
template([estoy, aburrido, _], ['¿Has', 'considerado', 'leer', 'un', 'libro', 'o', 'ver', 'una', 'pelicula', '?'], []).
template([estoy, estresado, _], ['La', 'meditacion', 'puede', 'ayudarte', 'a', 'aliviar', 'el', 'estres', '.'], []).
template([me, siento, mal, _], ['Lo', 'siento', 'que', 'te', 'sientas', 'asi', ',', '¿hay', 'algo', 'que', 'quieras', 'hablar', '?'], []).
template([estoy, cansado, _], ['Parece', 'que', 'necesitas', 'descansar', '.', 'Asegurate', 'de', 'cuidarte', '.'], []).
template([estoy, triste, _], ['Lo', 'siento', 'que', 'te', 'sientas', 'asi', ',', 'siempre', 'estoy', 'aqui', 'para', 'escucharte', '.'], []).
template([estoy, preocupado, _], ['Entiendo', 'que', 'estes', 'preocupado', ',', '¿quieres', 'hablar', 'mas', 'sobre', 'eso', '?'], []).
template([me, siento, ansioso, _], ['Lo', 'siento', 'que', 'te', 'sientas', 'asi', ',', 'la', 'respiracion', 'profunda', 'puede', 'ayudar', '.'], []).

% 5 de 2 y 5 de 3
template([soy, s(), y, vivo, en,s()],['Interesante','eres',0,'y','vives','en',1],[1,5]).
template([que, es, mejor, s(), o, s()],['Yo','pienso','que','es','mejor',0,'que',1],[3,5]).
template([es, mejor, el, libro, de, s(), que, la, pelicula, actuada, por, s()],['Tienes','razon', 'la', 'pelicula', 'actuada', 'por', 1, 'es', 'peor', 'que', 'el', 'libro', 'de', 0],[5,11]).
template([estoy, buscando, informacion, sobre, s(), y, s()], ['Entiendo, estas buscando informacion sobre', 0, 'y', 1, '. Dejame ver que puedo encontrar.'], [4, 6]).
template([puedes, explicarme, la, diferencia, entre, s(), y, s()], ['Claro, quieres saber la diferencia entre', 0, 'y', 1, '. Permitime explicarte.'], [5, 7]).
template([cual, es, mejor, para, s(), s(), o, s()], ['Para', 0, ', creo que', 1, 'podria ser mejor que', 2, '.'], [4, 5, 7]).
template([tengo, dudas, sobre, s(), y, s()], ['Veo que tienes dudas sobre', 0, 'y', 1, '. ¿Como puedo ayudarte a aclararlas?'], [3, 5]).
template([necesito, ayuda, con, s(), y, s()], ['Claro, puedo ayudarte con', 0, 'y', 1, '. ¿Que necesitas saber exactamente?'], [3, 5]).

template([estoy, intentando, s(), pero, tengo, problemas, con, s(), y, s()], ['Veo que estas intentando', 0, 'pero tienes problemas con', 1, 'y', 2, '. ¿Has considerado alguna solucion?'], [2, 7, 9]).
template([como, puedo, s(), si, tengo, s(), y, s()], ['Para', 0, 'a pesar de tener', 1, 'y', 2, ', podrias intentar una estrategia diferente.'], [2, 5, 7]).
template([cual, es, la, diferencia, entre, s(), s(), y, s()], ['La diferencia entre', 0, ',', 1, 'y', 2, 'es que cada uno tiene caracteristicas unicas.'], [4, 5, 7]).
template([por, que, s(), cuando, tengo, s(), y, s()], ['El motivo por el que', 0, 'cuando tienes', 1, 'y', 2, 'puede ser debido a varias razones.'], [2, 5, 7]).
template([que, debo, hacer, si, tengo, s(), pero, tambien, tengo,

 s(), y, s()], ['Si tienes', 0, 'pero tambien tienes', 1, 'y', 2, ', te recomendaria que busques un equilibrio.'], [5, 9, 11]).

template(_, ['Please', explain, a, little, more, '.'], []). 
% Lo que le gusta a eliza : flagLike
elizaLikes(X, R):- likes(X), R = ['Yeah', i, like, X].
elizaLikes(X, R):- \+likes(X), R = ['Nope', i, do, not, like, X].
likes(apples).
likes(ponies).
likes(zombies).
likes(manzanas).
likes(computadoras).
like(carros).



% lo que hace eliza: flagDo
elizaDoes(X, R):- does(X), R = ['Yes', i, X, and, i, love, it].
elizaDoes(X, R):- \+does(X), R = ['No', i, do, not, X ,'.', it, is, too, hard, for, me].
does(study).
does(cook).
does(work).

% lo que es eliza: flagIs
elizaIs(X, R):- is0(X), R = ['Yes', yo, soy, X].
elizaIs(X, R):- \+is0(X), R = ['No', i, am, not, X].
is0(dumb).
is0(weird).
is0(nice).
is0(fine).
is0(happy).
is0(redundant).

match([],[]).
match([], _):- true.

match([S|Stim],[I|Input]) :-
	atom(S), % si I es un s(X) devuelve falso
	S == I,
	match(Stim, Input),!.

match([S|Stim],[_|Input]) :-
% I es un s(X), lo ignoro y continuo con el resto de la lista
	\+atom(S),
	match(Stim, Input),!.

replace0([], _, _, Resp, R):- append(Resp, [], R),!.

% Eliza likes:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagLike,
	elizaLikes(Atom, R).

% Eliza does:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagDo,
	elizaDoes(Atom, R).

% Eliza is:
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

