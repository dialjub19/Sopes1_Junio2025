package main

import (
	"fmt"
	"time"
)

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

