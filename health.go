package main

import (
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
	})
	log.Println("Listening on port 8080")
	http.ListenAndServe(":8080", nil)
}
