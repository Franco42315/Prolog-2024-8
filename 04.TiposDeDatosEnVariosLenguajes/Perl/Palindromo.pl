fn es_palindromo(s: &str) -> bool {
    let s = s.chars().collect::<String>();
    let rev = s.chars().rev().collect::<String>();
    s == rev
}
