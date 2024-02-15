package main

import (
    "fmt"
    "strings"
)

func es_palindromo(palabra string) bool {
    longitud := len(palabra)
    for i := 0; i < longitud / 2; i++ {
        if palabra[i] != palabra[longitud - i - 1] {
            return false
        }
    }
    return true
}

func main() {
    palabra := "anilina"
    if es_palindromo(strings.ToLower(palabra)) {
        fmt.Printf("'%s' es un palíndromo\n", palabra)
    } else {
        fmt.Printf("'%s' no es un palíndromo\n", palabra)
    }
}
