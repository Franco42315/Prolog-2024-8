package main

import "fmt"

func factorial(n int) int {
    if n == 0 {
        return 1
    } else {
        return n * factorial(n - 1)
    }
}

func main() {
    num := 5
    fmt.Printf("El factorial de %d es %d\n", num, factorial(num))
}