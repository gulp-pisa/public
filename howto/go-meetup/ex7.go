package main

import "fmt"

func main() {
	done := make(chan struct{}, 10)

	for i := 0; i < 10; i++ {
		go func(i int) {
			fmt.Println("fatto", i)
			done <- struct{}{}
		}(i)
	}

	for i := 0; i < 10; i++ {
		<-done
	}
	fmt.Println("exiting")
}

