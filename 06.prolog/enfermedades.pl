enfermedad(gripe).
enfermedad(rubeola).
enfermedad(malaria).
enfermedad(hepatitis).
enfermedad(tuberculosis).
enfermedad(anemia).

sintomade(tos, gripe).
sintomade(cansancio, gripe).
sintomade(fiebre, gripe).
sintomade(dolorcabeza, gripe).
sintomade(nauseas, hepatitis).
sintomade(diarrea, hepatitis).
sintomade(ictericia, hepatitis).
sintomade(cansancio, anemia).
sintomade(apatia, anemia).
sintomade(nausea, anemia).
sintomade(tos, tuberculosis).
sintomade(cansancio, tuberculosis).
sintomade(fiebre, tuberculosis).
sintomade(escalofrios, tuberculosis).
sintomade(escalofrios, malaria).
sintomade(fiebre, malaria).
sintomade(diarrea, malaria).
sintomade(ictericia, malaria).
sintomade(fiebre, rubeola).
sintomade(jaqueca, rubeola).
sintomade(secrecion, rubeola).

buscar([], _, 0).
buscar([X|Xs], E, P) :- sintomade(X, E), buscar(Xs, E, S), P is S + 1.
buscar([_|Xs], E, P) :- buscar(Xs, E, P).

cantSint(E, C) :- findall(_, sintomade(_, E), L), length(L, R), C is R.

diagnostico(Sintomas, Enfermedad, Probabilidad) :- buscar(Sintomas, Enfermedad, P), cantSint(Enfermedad, T), Probabilidad is P * 100 / T.


medicinade(contrex, gripe).
medicinade(jarabe, gripe).
medicinade(pastillas, tuberculosis).
medicinade(vacuna, malaria).
medicinade(vacuna, rubeola).
medicinade(vitaminas, anemia).
medicinade(pastillas, hepatitis).

recetade(M, S) :- sintomade(S, Z), medicinade(M, Z).

especialistade(otorrino, gripe).
especialistade(nutricionista, anemia).
especialistade(endocrinologia, hepatitis).
especialistade(medicinageneral, rubeola).
especialistade(nutricionista, tuberculosis).
especialistade(medicinageneral, malaria).

% Reglas
atiende_especialista(E, S) :- sintomade(S, Z), especialistade(E, Z).

% sistema experto inicial con predicados monarios y binarios que hable del sistema solar
% buscar cual de los elementos son planetas y cuales no 