package main

import (
  "fmt"
  "net/http"
  "github.com/prometheus/client_golang/prometheus/promhttp"
)

func handler(w http.ResponseWriter, r *http.Request) {
  fmt.Fprintf(w, "Hello, DevOps Kata!")
}

func main() {
  http.HandleFunc("/", handler)
  http.Handle("/metrics", promhttp.Handler())
  http.ListenAndServe(":8080", nil)
}