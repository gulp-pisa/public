package main

import "fmt"

func test() int {
	return 10
}

type pippo struct {
	x int
	y int
}

type foo struct {
	x int
}

func x() *pippo {
	var p pippo
	return &p
}

func main() {
	var pp *pippo
	pp = x()

	m := map[string]int{}
	m["x"] = 12

	fmt.Println(m["x"], pp)
}

