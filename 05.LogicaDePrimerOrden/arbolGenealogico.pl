padre_de(juvenal,leonardo)
padre_de(juvenal,mauricio)
padre_de(juvenal,paola)
padre_de(ulices,juvenal)
padre_de(serafin,maria)
esposo_de(juvenal, maria)
esposa_de(maria, juvenal)

madre_de(maria,leonardo)
madre_de(maria,mauricio)
madre_de(maria,paola)
madre_de(sabina,maria)
madre_de(domitila,juvenal)

tio(serafin_p)
tia(aurora)
prima(ximena)
primo(josue)
padre_de(serafin, ximena)
padre_de(serafin, josue)
madre_de(aurora, ximena)
madre_de(aurora, josue)
hermana_de(maria,serafin)
hermano_de(serafin, maria)
esposo_de(serafin, aurora)
esposa_de(aurora, serafin)

tio(carlos)
tia(irma)
primo(omar)
prima(citlali)
prima(carina)
esposo_de(carlos, irma)
esposa_de(irma, carlos)
padre_de(carlos, omar)
padre_de(carlos, citlali)
padre_de(carlos, carina)
madre_de(irma, omar)
madre_de(irma, citlali)
madre_de(irma, carina)
hermana_de(maria, irma)
hermana_de(irma, maria)

tia(herminia)
tio(jose)
prima(brianda)
esposa_de(herminia, jose)
esposo_de(jose, herminia)
padre_de(jose, brianda)
madre_de(herminia, brianda)
hermana_de(maria, herminia)
hermana_de(herminiam maria)

tio(jorge)
tia(elizabeth)
primo(jorge_f)
primo(eduardo)
primo(rodrigo)
esposo_de(jorge, elizabeth)
esposa_de(elizabeth, jorge)
padre_de(jorge,jorge_f)
padre_de(jorge, eduardo)
padre_de(jorge, rodrigo)
madre_de(elizabeth, jorge_f)
madre_de(elizabeth, eduardo)
madre_de(elizabeth, rodrigo)
hermana_de(elizabeth, juvenal)
hermano_de(juvenal, elizabeth)

tio(ulices_d)
tia(atzimba)
prima(alicia)
primo(jorge_g)
primo(pedro)
esposa_de(atzimba, ulices_d)
esposo_de(ulices_d, atzimba)
madre_de(atzimba, alicia)
madre_de(atzimba, jorge_g)
madre_de(atzimba, pedro)
padre_de(atzimba, alicia)
padre_de(atzimba, jorge_g)
padre_de(atzimba, pedro)
hermana_de(atzimba, juvenal)
hermano_de(juvenal, atzimba)

tio(gil)
tia(sandra)
primo(andres)
prima(fernanda)
esposo_de(gil, sandra)
esposa_de(sandra, gil)
padre_de(gil,andres)
padre_de(gil, fernanda)
madre_de(sandra, andres)
madre_de(sandra, fernanda)
hermana_de(sandra, juvenal)
hermano_de(juvenal, sandra)

hijo_de(leonardo, juvenal)
hijo_de(mauricio, juvenal)
hijo_de(paola, juvenal)
hijo_de(juvenal, ulices)
hijo_de(maria, sabina)
hijo_de(maria, domitila)
hijo_de(ximena, serafin)
hijo_de(josue, serafin)
hijo_de(ximena, aurora)
hijo_de(josue, aurora)
hijo_de(omar, carlos)
hijo_de(citlali, carlos)
hijo_de(carina, carlos)
hijo_de(brianda, jose)
hijo_de(jorge_f, jorge)
hijo_de(eduardo, jorge)
hijo_de(rodrigo, jorge)
hijo_de(alicia, ulices_d)
hijo_de(jorge_g, ulices_d)
hijo_de(pedro, ulices_d)
hijo_de(andres, gil)
hijo_de(fernanda, gil)

cuñado_de(serafin, carlos)
cuñado_de(carlos, serafin)
cuñado_de(serafin, jose)
cuñado_de(jose, serafin)
cuñado_de(serafin, jorge)
cuñado_de(jorge, serafin)
cuñado_de(carlos, jorge)
cuñado_de(jorge, carlos)
cuñado_de(serafin, gil)
cuñado_de(gil, serafin)
cuñado_de(carlos, gil)
cuñado_de(gil, carlos)
cuñado_de(jose, gil)
cuñado_de(gil, jose)


/*
Relaciones faltantes
- hijo_de
- primo_de
- cuñado_de
- cuñada_de
- sobrino_de
- tio_de
etc se que faltan varias pero ayudame a completar todas las faltantes
*/



abuelo(X, Y):-padrede(X, Z), padrede(Z, Y); madrede(X,Z), madrede(Z,Y).
abuela(X, Y):-madrede(X, Z), madrede(Z, Y); 


trace.
padre(X).


abuelo(X, W).

abuelo(X, _).

regla de los hermanos
regla de los tios
regla de los nietos

hermano(X, Y):-hijode(X, Z),

hermano_de(X, Y) :- padre_de(Z, X), padre_de(Z, Y), X \= Y.
  nieto_de(X, Y) :- abuelo_de(Y, X).















