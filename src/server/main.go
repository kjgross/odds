package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"

// local server
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
	fmt.Fprint(w, "Welcome to Odds!\n")
}

func BetIndex(w http.ResponseWriter, r *http.Request) {
	bets := Bets{
		Bet{Id: 1,
      To_user: 2,
      From_user: 3,
      Description: "Eat a jalapeno",
      Denominator: 10,
      From_user_number: 3,
      To_user_number: 2,
      State: 1},
		Bet{Id: 24,
      To_user: 4,
      From_user: 2,
      Description: "You chug all these beers",
      Denominator: 22,
      From_user_number: 2,
      To_user_number: 4,
      State: 2},
  }

	if err := json.NewEncoder(w).Encode(bets); err != nil {
		panic(err)
	}
}

func BetShow(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	betId := vars["betId"]
	bet_chosen := Bet{Id: 1,
      To_user: 2,
      From_user: 3,
      Description: "Eat a jalapeno",
      Denominator: 10,
      From_user_number: 3,
      To_user_number: 2,
      State: 1}
	fmt.Fprintf(w, "Bet show: %s\n", betId)
	fmt.Fprintf(w, "beets: %+v\n", bet_chosen)
}
