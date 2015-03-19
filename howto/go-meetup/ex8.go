package main

import (
	"fmt"
	"sync"
)

func main() {
	var wg sync.WaitGroup

	wg.Add(10)

	for i := 0; i < 10; i++ {
		go func(i int) {
			fmt.Println("fatto", i)
			wg.Done()
		}(i)
	}

	wg.Wait()
	fmt.Println("exiting")
}

