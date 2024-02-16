public class Palindromo {
  public boolean esPalindromo(String s) {
    int longitud = s.length();
    for (int i = 0; i < longitud / 2; i++) {
        if (s.charAt(i) != s.charAt(longitud - i - 1)) {
            return false;
        }
    }
    return true;
}
}
