package main

import (
	"fmt"
	"net/http"
	"os"
)

func handler(w http.ResponseWriter, r *http.Request)  {
	fmt.Fprintf(os.Stdout, "receive request: %s\n", r.URL)
	fmt.Fprintf(w, "simple http server: %s", r.URL.Path[1:])
}

func main() {
	fmt.Fprintf(os.Stdout, "start a simple http server")

	http.HandleFunc("/", handler)
	http.ListenAndServe(":8080", nil)
}
