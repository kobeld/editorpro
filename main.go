package main

import (
	"fmt"
	"github.com/kobeld/gopandoc"
	"log"
	"net/http"
)

func main() {

	http.HandleFunc("/to_md", htmlToMarkdown)
	http.HandleFunc("/to_html", markdownToHtml)

	http.Handle("/", http.FileServer(http.Dir("pages/")))

	log.Println("Starting server on :8088")
	panic(http.ListenAndServe(":8088", nil))
}

func htmlToMarkdown(w http.ResponseWriter, r *http.Request) {

	htmlStr := r.FormValue("content")

	mdStr, err := gopandoc.ToMarkdown(htmlStr)
	if err != nil {
		panic(err)
	}
	fmt.Fprint(w, mdStr)
}

func markdownToHtml(w http.ResponseWriter, r *http.Request) {

	mdStr := r.FormValue("content")
	htmlStr, err := gopandoc.ToHtml(mdStr)
	if err != nil {
		panic(err)
	}
	fmt.Fprint(w, htmlStr)
}
