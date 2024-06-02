% Datos iniciales
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

% Relaciones abuelo/abuela
abuelo(X, Y) :- padre_de(X, Z), (padre_de(Z, Y) ; madre_de(Z, Y)).
abuela(X, Y) :- madre_de(X, Z), (padre_de(Z, Y) ; madre_de(Z, Y)).

% Relaciones hermano/hermana
hermano_de(X, Y) :- padre_de(Z, X), padre_de(Z, Y), madre_de(W, X), madre_de(W, Y), X \= Y.
hermana_de(X, Y) :- padre_de(Z, X), padre_de(Z, Y), madre_de(W, X), madre_de(W, Y), X \= Y.

% Relaciones tío/tía
tio_de(X, Y) :- hermano_de(X, Z), (padre_de(Z, Y) ; madre_de(Z, Y)).
tio_de(X, Y) :- hermana_de(W, Z), esposo_de(X, W), (padre_de(Z, Y) ; madre_de(Z, Y)).
tia_de(X, Y) :- hermana_de(X, Z), (padre_de(Z, Y) ; madre_de(Z, Y)).
tia_de(X, Y) :- hermano_de(W, Z), esposa_de(X, W), (padre_de(Z, Y) ; madre_de(Z, Y)).

% Relaciones primo/prima
primo_de(X, Y) :- (padre_de(Z, X) ; madre_de(Z, X)), (padre_de(W, Y) ; madre_de(W, Y)), hermano_de(Z, W).
prima_de(X, Y) :- (padre_de(Z, X) ; madre_de(Z, X)), (padre_de(W, Y) ; madre_de(W, Y)), hermana_de(Z, W).

% Relaciones sobrino/sobrina
sobrino_de(X, Y) :- tio_de(Y, X).
sobrino_de(X, Y) :- tia_de(Y, X).
sobrina_de(X, Y) :- tio_de(Y, X).
sobrina_de(X, Y) :- tia_de(Y, X).

% Relaciones cuñado/cuñada
cunado_de(X, Y) :- esposo_de(Z, Y), hermano_de(Z, X).
cunado_de(X, Y) :- esposa_de(Z, Y), hermana_de(Z, X).
cunada_de(X, Y) :- esposo_de(Z, Y), hermana_de(Z, X).
cunada_de(X, Y) :- esposa_de(Z, Y), hermano_de(Z, X).

% Relaciones yerno/nuera
yerno_de(X, Y) :- esposo_de(X, Z), (padre_de(Y, Z) ; madre_de(Y, Z)).
nuera_de(X, Y) :- esposa_de(X, Z), (padre_de(Y, Z) ; madre_de(Y, Z)).

% Relación hijos
hijo_de(X, Y) :- padre_de(Y, X).
hijo_de(X, Y) :- madre_de(Y, X).
hija_de(X, Y) :- padre_de(Y, X).
hija_de(X, Y) :- madre_de(Y, X).









% Relaciones abuelo/abuela
abuelo(X, Y) :- padre_de(X, Z), (padre_de(Z, Y) ; madre_de(Z, Y)).
abuela(X, Y) :- madre_de(X, Z), (padre_de(Z, Y) ; madre_de(Z, Y)).

% Relaciones hermano/hermana
hermano_de(X, Y) :- padre_de(Z, X), padre_de(Z, Y), madre_de(W, X), madre_de(W, Y), X \= Y.
hermana_de(X, Y) :- padre_de(Z, X), padre_de(Z, Y), madre_de(W, X), madre_de(W, Y), X \= Y.

% Relaciones tío/tía
tio_de(X, Y) :- hermano_de(X, Z), (padre_de(Z, Y) ; madre_de(Z, Y)).
tio_de(X, Y) :- hermana_de(W, Z), esposo_de(X, W), (padre_de(Z, Y) ; madre_de(Z, Y)).
tia_de(X, Y) :- hermana_de(X, Z), (padre_de(Z, Y) ; madre_de(Z, Y)).
tia_de(X, Y) :- hermano_de(W, Z), esposa_de(X, W), (padre_de(Z, Y) ; madre_de(Z, Y)).

% Relaciones primo/prima
primo_de(X, Y) :- (padre_de(Z, X) ; madre_de(Z, X)), (padre_de(W, Y) ; madre_de(W, Y)), hermano_de(Z, W).
prima_de(X, Y) :- (padre_de(Z, X) ; madre_de(Z, X)), (padre_de(W, Y) ; madre_de(W, Y)), hermana_de(Z, W).

% Relaciones sobrino/sobrina
sobrino_de(X, Y) :- tio_de(Y, X).
sobrino_de(X, Y) :- tia_de(Y, X).
sobrina_de(X, Y) :- tio_de(Y, X).
sobrina_de(X, Y) :- tia_de(Y, X).

% Relaciones cuñado/cuñada
cunado_de(X, Y) :- esposo_de(Z, Y), hermano_de(Z, X).
cunado_de(X, Y) :- esposa_de(Z, Y), hermana_de(Z, X).
cunada_de(X, Y) :- esposo_de(Z, Y), hermana_de(Z, X).
cunada_de(X, Y) :- esposa_de(Z, Y), hermano_de(Z, X).

% Relaciones yerno/nuera
yerno_de(X, Y) :- esposo_de(X, Z), (padre_de(Y, Z) ; madre_de(Y, Z)).
nuera_de(X, Y) :- esposa_de(X, Z), (padre_de(Y, Z) ; madre_de(Y, Z)).

% Relación hijos
hijo_de(X, Y) :- padre_de(Y, X).
hijo_de(X, Y) :- madre_de(Y, X).
hija_de(X, Y) :- padre_de(Y, X).
hija_de(X, Y) :- madre_de(Y, X).

% plantilla arbol familiar

% Plantillas para consultas familiares
template([quien, es, el, padre, de, s(X), '?'], [0, 'es', el, padre, de, X], [4]).
template([quien, es, la, madre, de, s(X), '?'], [0, 'es', la, madre, de, X], [4]).
template([quienes, son, los, hijos, de, s(X), '?'], ['Los', hijos, de, X, 'son', Y], [4]).
template([quienes, son, las, hijas, de, s(X), '?'], ['Las', hijas, de, X, 'son', Y], [4]).
template([quien, es, el, hermano, de, s(X), '?'], [0, 'es', el, hermano, de, X], [4]).
template([quien, es, la, hermana, de, s(X), '?'], [0, 'es', la, hermana, de, X], [4]).
template([quien, es, el, tio, de, s(X), '?'], [0, 'es', el, tio, de, X], [4]).
template([quien, es, la, tia, de, s(X), '?'], [0, 'es', la, tia, de, X], [4]).
template([quien, es, el, abuelo, de, s(X), '?'], [0, 'es', el, abuelo, de, X], [4]).
template([quien, es, la, abuela, de, s(X), '?'], [0, 'es', la, abuela, de, X], [4]).
template([quien, es, el, sobrino, de, s(X), '?'], [0, 'es', el, sobrino, de, X], [4]).
template([quien, es, la, sobrina, de, s(X), '?'], [0, 'es', la, sobrina, de, X], [4]).
template([quien, es, el, primo, de, s(X), '?'], [0, 'es', el, primo, de, X], [4]).
template([quien, es, la, prima, de, s(X), '?'], [0, 'es', la, prima, de, X], [4]).
template([quien, es, el, cunado, de, s(X), '?'], [0, 'es', el, cunado, de, X], [4]).
template([quien, es, la, cunada, de, s(X), '?'], [0, 'es', la, cunada, de, X], [4]).

% Definiciones para encontrar relaciones en Prolog
response_template([0, 'es', el, padre, de, X], [padre_de(0, X)]).
response_template([0, 'es', la, madre, de, X], [madre_de(0, X)]).
response_template(['Los', hijos, de, X, 'son', Y], [findall(N, hijo_de(N, X), Y)]).
response_template(['Las', hijas, de, X, 'son', Y], [findall(N, hija_de(N, X), Y)]).
response_template([0, 'es', el, hermano, de, X], [hermano_de(0, X)]).
response_template([0, 'es', la, hermana, de, X], [hermana_de(0, X)]).
response_template([0, 'es', el, tio, de, X], [tio_de(0, X)]).
response_template([0, 'es', la, tia, de, X], [tia_de(0, X)]).
response_template([0, 'es', el, abuelo, de, X], [abuelo(0, X)]).
response_template([0, 'es', la, abuela, de, X], [abuela(0, X)]).
response_template([0, 'es', el, sobrino, de, X], [sobrino_de(0, X)]).
response_template([0, 'es', la, sobrina, de, X], [sobrina_de(0, X)]).
response_template([0, 'es', el, primo, de, X], [primo_de(0, X)]).
response_template([0, 'es', la, prima, de, X], [prima_de(0, X)]).
response_template([0, 'es', el, cunado, de, X], [cunado_de(0, X)]).
response_template([0, 'es', la, cunada, de, X], [cunada_de(0, X)]).






