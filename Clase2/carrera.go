package main

import (
	"fmt"
	"math/rand"
	"time"
)

func corredor(nombre string, c chan string) {
	for i := 0; i < 10; i++ {
		fmt.Println(nombre)
		time.Sleep(time.Duration(rand.Intn(100)) * time.Millisecond)
	}
	c <- nombre
}

func main() {
	rand.Seed(time.Now().UnixNano())

	c := make(chan string)
	go corredor("🐢 Tortuga", c)
	go corredor("🐇 Liebre", c)
	go corredor("🐶 Perro", c)

	ganador := <-c
	fmt.Println("¡Ganador:", ganador, "!")
}
