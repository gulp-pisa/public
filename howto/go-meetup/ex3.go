package main

import (
	"fmt"
	"log"
	"os"
)

func foo() (int, error) {
	if true {
		return 0, fmt.Errorf("errore xxx")
	}
	return 1, nil
}

func main() {
	x, err := foo()
	if err != nil {
		if os.IsNotExist(err) {
		}
		log.Fatal("oops", err)
	}
	fmt.Println(x)
}
