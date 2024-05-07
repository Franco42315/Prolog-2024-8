## Planetas

planeta(mercurio).
planeta(venus).
planeta(tierra).
planeta(marte).
planeta(jupiter).
planeta(saturno).
planeta(urano).
planeta(neptuno).
planeta(pluton).

luna(luna).
luna(fobos).
luna(deimos).
luna(io).
luna(europa).
luna(ganimedes).
luna(callisto).
luna(titan).
luna(encelado).
luna(mimas).
luna(dione).
luna(japeto).
luna(hiperion).
luna(oberon).
luna(umbriel).
luna(proteo).
luna(caronte).

asteroide(ceres).
asteroide(pallas).
asteroide(juno).
asteroide(vesta).
asteroide(astraea).
asteroide(hebe).
asteroide(iris).

orbita(mercurio, sol).
orbita(venus, sol).
orbita(tierra, sol).
orbita(marte, sol).
orbita(jupiter, sol).
orbita(saturno, sol).
orbita(urano, sol).
orbita(neptuno, sol).
orbita(pluton, sol).

orbita(luna, tierra).
orbita(fobos, marte).
orbita(deimos, marte).
orbita(io, jupiter).
orbita(europa, jupiter).
orbita(ganimedes, jupiter).
orbita(callisto, jupiter).
orbita(titan, saturno).
orbita(encelado, saturno).
orbita(mimas, saturno).
orbita(dione, saturno).
orbita(japeto, saturno).
orbita(oberon, urano).
orbita(umbriel, urano).
orbita(triton, neptuno).
orbita(proteo, neptuno).
orbita(caronte, pluton).

orbita(ceres, sol).
orbita(pallas, sol).
orbita(juno, sol).
orbita(vesta, sol).
orbita(astraea, sol).
orbita(hebe, sol).
orbita(iris, sol).

%Pasar los satelites y que te regrese el planeta si todas los lunas le pertenecen
buscar([], E , 0). 
buscar(X , E , 1) :- orbita(X, E). 
buscar([X|Xs] , E , P) :- planeta(E) , buscar(X , E , S1) , buscar(Xs , E ,S2) , P is S1 + S2. 