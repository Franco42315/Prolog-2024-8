[Volver](../README.md)

# Documentación del Código del Laberinto

Este código resuelve un laberinto representado como una matriz de números. 

## Variables Globales

```javascript
const laberinto = [
  [0, 1, 0, 0, 0, 0, 0, 0],
  [0, 1, 0, 1, 0, 1, 0, 0],
  [0, 1, 0, 1, 0, 1, 0, 0],
  [0, 1, 0, 1, 1, 1, 1, 0],
  [0, 0, 0, 1, 0, 1, 1, 0],
  [0, 1, 0, 1, 0, 1, 0, 0],
  [0, 1, 0, 0, 0, 1, 0, 9]
];

let x=0;
let y=0;
```

**laberinto**: Es una matriz 2D que representa el laberinto. Los ceros (0) representan los caminos libres, los unos (1) representan las paredes y el nueve (9) representa la salida del laberinto.
x, y: Son las coordenadas actuales en el laberinto.

### Funciones

```javascript
imprimirLaberinto(laberinto)
```

Esta función imprime el estado actual del laberinto. Recibe como parámetro la matriz `laberinto`.

```javascript
function imprimirLaberinto(laberinto) {
  laberinto.forEach(fila => {
    console.log(fila.join(' '));
  });
  console.log('\n');
}
```
***
`recorrerLaberinto(laberinto, x, y)`

Esta es la función principal que se encarga de recorrer el laberinto. Recibe como parámetros la matriz `laberinto` y las coordenadas `x` e `y`.

```javascript
function recorrerLaberinto(laberinto, x, y) {
  let solucion = "";
  if (x >= 0 && y >= 0 && y < laberinto.length && x < laberinto[0].length) {
    if (laberinto[y][x] === 9) {
      console.log("Laberinto finalizado");
    } else if (laberinto[y][x] === 0) {
      laberinto[y][x] = 2;
      imprimirLaberinto(laberinto);
      setTimeout(() => {solucion += recorrerLaberinto(laberinto, x + 1, y);}, 1000);
      setTimeout(() => {solucion += recorrerLaberinto(laberinto, x - 1, y);}, 1000);
      setTimeout(() => {solucion += recorrerLaberinto(laberinto, x, y + 1);}, 1000);
      setTimeout(() => {solucion += recorrerLaberinto(laberinto, x, y - 1);}, 1000);
    }
  }
  return solucion;
}
```
La función sigue el siguiente algoritmo:

Comprueba si las coordenadas actuales están dentro del laberinto.
1. Si la celda actual es la salida (9), imprime “Laberinto finalizado”.
2. Si la celda actual es un camino libre (0), la marca como visitada (2) e imprime el laberinto.
3. Luego, realiza una llamada recursiva a las celdas adyacentes (arriba, abajo, izquierda y derecha) con un retraso de 1 segundo entre cada llamada.

### Ejecución

Finalmente, se llama a la función recorrerLaberinto(laberinto, x, y) para iniciar el recorrido del laberinto desde las coordenadas iniciales (0, 0).
```javascript
recorrerLaberinto(laberinto, x, y);
```

[Volver](../README.md)