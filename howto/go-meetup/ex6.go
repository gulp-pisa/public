package main

import "fmt"

func main() {
	done := make(chan bool, 1)

	for i := 0; i < 10; i++ {
		go func(j int) {
			fmt.Println("fatto", j)
			done <- true
		}(i)
	}

	<-done
	fmt.Println("exiting")
}

