package main

import "fmt"

func foo() (int, int) {
	return 1, 2
}

func main() {
	x, y := foo()
	fmt.Println(x, y)
}

