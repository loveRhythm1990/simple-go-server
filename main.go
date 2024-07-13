package main

import (
	"fmt"
	"net/http"
)

func indexHandler(w http.ResponseWriter, r *http.Request) {
	fprintf, err := fmt.Fprintf(w, "hello world")
	fmt.Printf("written bytes %d, err: %v", fprintf, err)
}

func main() {
	http.HandleFunc("/", indexHandler)
	if err := http.ListenAndServe(":8000", nil); err != nil {
		panic(err)
	}
}
