# Acertijo: De quien es el pez?


En una calle hay cinco casas, cada una de un color distinto. 
En cada casa vive una persona de distinta nacionalidad.
Cada dueño bebe un único tipo de bebida, fuma una sola marca de cigarrillos 
y tiene una mascota diferente a sus vecinos. 
A partir de las 15 pistas presentadas a continuación, 
la consigna que hay que responder es: "¿Quién es el dueño del pez?".

- El británico vive en la casa roja.
  - Tipo de predicado: Binario
  - Constantes de individuo: Britanico, casa roja
  - Variable de individuo: 
  - Propiedades: Vive en
  - Cuantificadores: 
  
- El sueco tiene un perro como mascota.
  - Tipo de predicado: Binario
  - Constantes de individuo: Sueco, perro
  - Variable de individuo: 
  - Propiedades: Es mascota
  - Cuantificadores: 

- El danés toma té.
  - Tipo de predicado: Binario
  - Constantes de individuo: Danes, te
  - Variable de individuo: 
  - Propiedades: Es tomado por
  - Cuantificadores:

- El noruego vive en la primera casa.
  - Tipo de predicado: Binario
  - Constantes de individuo: Noruego,
  - Variable de individuo: Casa
  - Propiedades: Vive en, posicion
  - Cuantificadores:

- El alemán fuma Prince.
  - Tipo de predicado: Binario
  - Constantes de individuo: Aleman, Prince
  - Variable de individuo: 
  - Propiedades: Fuma
  - Cuantificadores:

- La casa verde está inmediatamente a la izquierda de la blanca.
  - Tipo de predicado: Binario
  - Constantes de individuo:
  - Variable de individuo: Casa, 
  - Propiedades: Verde, blanca, al lado de
  - Cuantificadores:

- El dueño de la casa verde bebe café.
  - Tipo de predicado: Binario
  - Constantes de individuo: Café
  - Variable de individuo: Vive en, casa
  - Propiedades: Verde, es tomado por,
  - Cuantificadores:

- El propietario que fuma Pall Mall cría pájaros.
  - Tipo de predicado: Binario
  - Constantes de individuo: Pall Mall
  - Variable de individuo: Vive en
  - Propiedades: Fuma, es mascota de
  - Cuantificadores:

- El dueño de la casa amarilla fuma Dunhill.
  - Tipo de predicado: Binario
  - Constantes de individuo: Dunill
  - Variable de individuo: Vive en
  - Propiedades: Color, fuma
  - Cuantificadores:

- El hombre que vive en la casa del centro bebe leche.
  - Tipo de predicado: Binario
  - Constantes de individuo: Leche
  - Variable de individuo: Dueño
  - Propiedades: Color, fuma, vive en
  - Cuantificadores:

- El vecino que fuma Blends vive al lado del que tiene un gato.
  - Tipo de predicado: Binario
  - Constantes de individuo: Blends
  - Variable de individuo: Dueño, 
  - Propiedades: fuma, vive al lado, es mascota des
  - Cuantificadores:

- El hombre que tiene un caballo vive al lado del que fuma Dunhill.
  - Tipo de predicado: Binario
  - Constantes de individuo: Caballo, Dunhill
  - Variable de individuo: Dueño, 
  - Propiedades: fuma, vive al lado, es mascota des
  - Cuantificadores:

- El propietario que fuma Bluemaster toma cerveza.
  - Tipo de predicado: Binario
  - Constantes de individuo: Bluemaster, cerveza
  - Variable de individuo: Dueño, 
  - Propiedades: fuma, vive al lado, es mascota des
  - Cuantificadores:

- El vecino que fuma Blends vive al lado del que toma agua.
- El noruego vive al lado de la casa azul.




nacionalidad(britanico)
nacionalidad(sueco)
nacionalidad(danes)
nacionalidad(noruego)
nacionalidad(aleman)

color(roja)
color(verde)
color(blanca)
color(amarilla)
color(azul)


mascota(perro)
mascota(pajaro)
mascota(caballo)
mascota(gato)
mascota(pez)

bebida(te)
bebida(cafe)
bebida(leche)

cigarro(prince)
cigarro(dunhill)
cigarro(blends)
cigarro(bluemaster)
cigarro(pallmall)

altura(N) :- between(1, 5, N).

% Solucion = [casa(Altura, Color, Nacionalida, Bebida, Cigarro, Mascota)]%