package main

import (
	"fmt"
	"time"
)
/* 
	En este ejemplo, se simula un barman que prepara bebidas y las envía a través de un canal.
	1. El barman prepara una lista de bebidas y las envía a través del canal `barra`.
	2. Cada bebida se envía con un retraso de 1 segundo para simular el tiempo de preparación.
	3. El cliente recibe las bebidas del canal y las imprime en la consola.
	4. El canal se cierra una vez que todas las bebidas han sido enviadas, lo que permite al cliente saber que no habrá más bebidas.

*/

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
