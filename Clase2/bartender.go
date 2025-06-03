package main

import (
	"fmt"
	"time"
)

func barman(barra chan string) {
	bebidas := []string{"Jugo de naranja", "Limonada", "Piña colada", "Agua de coco"}
	for _, bebida := range bebidas {
		fmt.Println("🥤 Barman preparando:", bebida)
		time.Sleep(1 * time.Second)
		barra <- bebida
	}
	close(barra)
}

func main() {
	barra := make(chan string)

	go barman(barra)

	for bebida := range barra {
		fmt.Println("🧑 Cliente recibió:", bebida)
	}
}
