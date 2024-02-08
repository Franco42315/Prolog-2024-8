const islas = [
  [0,0,0,0,0,1,0],
  [0,0,0,0,0,1,0],
  [0,0,1,1,0,0,0],
  [1,0,1,1,0,0,0],
  [1,0,0,0,0,1,1],
  [1,0,0,0,0,1,1]
]






imprimirIslas(islas)

function imprimirIslas(islas) {
  islas.forEach(fila => {
    console.log(fila.join(' '));
  });
  console.log('\n');
}