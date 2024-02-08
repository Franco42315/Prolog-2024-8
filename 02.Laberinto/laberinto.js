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

function imprimirLaberinto(laberinto) {
  laberinto.forEach(fila => {
    console.log(fila.join(' '));
  });
  console.log('\n');
}

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

recorrerLaberinto(laberinto, x, y);
