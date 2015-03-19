package main

import "fmt"

type token struct {
}

func a(in, out chan *token) {
	for {
		t := <-in
		fmt.Println("A")
		out <- t
	}
}

func b(in, out chan *token) {
	for {
		t := <-in
		fmt.Println("B")
		out <- t
	}
}

func c(in, out chan *token, done chan bool) {
	for i := 0; ; i++ {
		t := <-in
		fmt.Println("C")
		if i == 10 {
			done <- true
		} else {
			out <- t
		}
	}

}

func main() {
	ain := make(chan *token)
	bin := make(chan *token)
	cin := make(chan *token)
	done := make(chan bool)
	go a(ain, bin)
	go b(bin, cin)
	go c(cin, ain, done)

	ain <- &token{}
	<-done

	fmt.Println("exiting")
}

