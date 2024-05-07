# Reglas familiares

## Regla para identificar a los padres

padre_de(Padre, Hijo) :- hijo_de(Hijo, Padre).

## Regla para identificar a los hijos

hijo_de(Hijo, Padre) :- padre_de(Padre, Hijo).

## Regla para identificar a los hermanos

hermano_de(Persona1, Persona2) :- padre_de(Padre, Persona1), padre_de(Padre, Persona2), Persona1 \= Persona2.

## Regla para identificar a los nietos

nieto_de(Nieto, Abuelo) :- hijo_de(Nieto, Padre), hijo_de(Padre, Abuelo).

## Regla para identificar a los primos

primo_de(Primo1, Primo2) :- padre_de(Padre1, Primo1), padre_de(Padre2, Primo2), hermano_de(Padre1, Padre2).

## Regla para identificar a los sobrinos

sobrino_de(Sobrino, Tio) :- hijo_de(Sobrino, Padre), hermano_de(Padre, Tio).

## Regla para identificar a los tios

tio_de(Tio, Sobrino) :- sobrino_de(Sobrino, Tio).

## Regla para identificar a los abuelos

abuelo_de(Abuelo, Nieto) :- nieto_de(Nieto, Abuelo).
