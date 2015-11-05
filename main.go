package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func main() {

	router := mux.NewRouter().StrictSlash(true)
	router.HandleFunc("/", Index)
	router.HandleFunc("/bets", BetIndex)
	router.HandleFunc("/bets/{betId}", BetShow)

	log.Fatal(http.ListenAndServe(":8080", router))
}

func Index(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "Welcome!\n")
}

func BetIndex(w http.ResponseWriter, r *http.Request) {
	bets := Bets{
		Bet{Name: "Write presentation"},
		Bet{Name: "Host meetup"},
	}

	if err := json.NewEncoder(w).Encode(bets); err != nil {
		panic(err)
	}
}

func BetShow(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	betId := vars["betId"]
	fmt.Fprintf(w, "Bet show: %s\n", betId)
}
