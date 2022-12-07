package main

import (
	"fmt"
	"github.com/sirupsen/logrus"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request)  {
	logrus.Infof("receive request: %s\n")
	fmt.Fprintf(w, "simple http server: %s", r.URL.Path[1:])
}

func main() {
	logrus.Infof("start a simple http server")
	http.HandleFunc("/", handler)
	http.ListenAndServe(":8080", nil)
}
