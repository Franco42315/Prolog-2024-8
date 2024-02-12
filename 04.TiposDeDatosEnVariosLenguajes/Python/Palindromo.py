def es_palindromo(palabra):
    palabra = palabra.lower()  # Convertir a minúsculas
    palabra = palabra.replace(' ', '')  # Eliminar espacios
    return palabra == palabra[::-1]  # Comprobar si la palabra es igual a su reverso

print(es_palindromo("peep"))