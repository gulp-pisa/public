package main

import "fmt"

func main() {
	done := make(chan bool)

	go func() {
		fmt.Println("fatto")
		done <- true
	}()

	<-done
	fmt.Println("exiting")
}

