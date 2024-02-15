package main

import "fmt"

func fibonacci(n int) int {
    if n <= 1 {
        return n
    } else {
        return fibonacci(n - 1) + fibonacci(n - 2)
    }
}

func main() {
    num := 10
    fmt.Printf("El número Fibonacci en la posición %d es %d\n", num, fibonacci(num))
}