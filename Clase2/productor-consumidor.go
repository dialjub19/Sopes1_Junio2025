package main

import (
	"fmt"
	"time"
)

/* 
		 Ejemplo de productor-consumidor con canales en Go.
		 1. En este ejemplo, las abejas producen miel y el oso consume esa miel.
		 2. Las abejas envían miel a través de un canal, y el oso consume esa miel.
		 3. Las abejas producen miel en intervalos de tiempo, y el oso consume la miel a medida que está disponible.
		 4. El canal tiene una capacidad de 5, lo que significa que puede almacenar hasta 5 tarros de miel antes de que el oso los consuma.
		 
		 Este ejemplo ilustra cómo las goroutines pueden trabajar juntas para producir y consumir datos de manera eficiente.
		
		 El productor (abejas) produce miel y la envía a través del canal, mientras que el consumidor (oso) consume la miel de ese canal.

*/

func abeja(miel chan string, id int) {
	for i := 0; i < 3; i++ {
		time.Sleep(500 * time.Millisecond)
		miel <- fmt.Sprintf("🍯 Miel %d de abeja %d", i, id)
	}
}

func oso(miel chan string) {
	for tarro := range miel {
		fmt.Println("🐻 Oso comió:", tarro)
		time.Sleep(1 * time.Second)
	}
}

func main() {
	miel := make(chan string, 5)

	for i := 1; i <= 3; i++ {
		go abeja(miel, i)
	}

	go func() {
		time.Sleep(5 * time.Second)
		close(miel)
	}()

	oso(miel)
}

