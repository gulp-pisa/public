package main

import "fmt"

var g func()

func t(f func()) {
	g = f
}

func foo() func() {
	x := 1
	f := func() {
		x + 1
	}
	t(f)
}

func main() {
	x = func() {
		fmt.Println("hi")
	}

	x()

}

