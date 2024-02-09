let islas = [
  [0,0,0,0,0,1,0],
  [0,0,0,0,0,1,0],
  [0,0,1,1,0,0,0],
  [1,0,1,1,0,0,0],
  [1,0,0,0,0,1,1],
  [1,0,0,0,0,1,1]
];

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

recorrerIslas(islas);
