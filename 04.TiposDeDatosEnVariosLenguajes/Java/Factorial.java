public long Factorial(int n) {
  long fact = 1;
  for (int i = 2; i <= n; i++) {
      fact = fact * i;
  }
  return fact;
}