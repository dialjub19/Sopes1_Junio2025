package main

import "fmt"


func hello() {
    fmt.Println("¡Hola desde goroutine!")
}
func main() {
    go hello()             // lanza goroutine
    fmt.Println("Hola desde main")
}

