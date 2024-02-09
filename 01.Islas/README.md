# Documentación del Código de las Islas

Este código resuelve el problema de identificar y marcar “islas” en una matriz bidimensional. En este contexto, una “isla” se define como un grupo de '1’s adyacentes en la matriz. El código recorre la matriz y, cuando encuentra una isla, la marca con ‘x’. Además, el código marca las celdas de agua (representadas por ‘0’) que ha visitado con ‘-’.

El código consta de dos funciones principales: `marcarIsla` y `recorrerIslas`.

### Función `marcarIsla`

```javascript
function marcarIsla(islas, x, y) {
  if (x < 0 || y < 0 || x >= islas[0].length || y >= islas.length || islas[y][x] !== 1) {
    return;
  }
  islas[y][x] = 'x';
  marcarIsla(islas, x + 1, y);
  marcarIsla(islas, x - 1, y);
  marcarIsla(islas, x, y + 1);
  marcarIsla(islas, x, y - 1);
}
```

Esta función es una función recursiva que se utiliza para marcar una isla en la matriz. Toma como argumentos la matriz y las coordenadas (x, y) de la celda actual. Si la celda actual es parte de una isla (es decir, su valor es ‘1’), la función marca la celda con ‘x’ y luego llama a sí misma recursivamente para las celdas adyacentes. Si la celda actual no es parte de una isla o está fuera de los límites de la matriz, la función retorna y no hace nada.

### Función `recorrerIslas`

```javascript
function recorrerIslas(islas) {
  for (let y = 0; y < islas.length; y++) {
    for (let x = 0; x < islas[0].length; x++) {
      if (islas[y][x] === 1) {
        setTimeout(() => {
          marcarIsla(islas, x, y);
          console.log(islas.map(fila => fila.join(' ')).join('\n'));
          console.log('------------------------');
        }, 2000);
      } else if (islas[y][x] === 0) {
        islas[y][x] = '-';
      }
    }
  }
}
```
Esta función se utiliza para recorrer la matriz. Utiliza dos bucles `for` anidados para recorrer cada celda de la matriz. Si encuentra una isla (un ‘1’), llama a la función `marcarIsla` para marcar toda la isla y luego imprime la matriz. Si encuentra agua (un ‘0’), marca la celda con ‘-’ para indicar que ha sido visitada.

Para ejecutar el código, simplemente llama a la función `recorrerIslas` con la matriz de islas como argumento, como se muestra a continuación:
```javascript
recorrerIslas(islas);
```
Esto iniciará el proceso de recorrido de la matriz. Cuando el código encuentra una isla, la marca con ‘x’ y muestra la matriz. También marca las celdas de agua que ha visitado con ‘-’.

Por ejemplo, si la matriz de islas inicial es la siguiente:
```javascript
0 0 0 0 0 1 0
0 0 0 0 0 1 0
0 0 1 1 0 0 0
1 0 1 1 0 0 0
1 0 0 0 0 1 1
1 0 0 0 0 1 1
```
Después de ejecutar el código, la matriz se verá así:
```javascript
- - - - - x -
- - - - - x -
- - x x - - -
x - x x - - -
x - - - - x x
x - - - - x x

```
Esto muestra que el código ha identificado y marcado correctamente las islas en la matriz.