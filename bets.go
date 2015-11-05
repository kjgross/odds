package main

type Bet struct {
	Id int `json:"id"`
	To_user int `json:"to_user"`
	From_user int `json:"from_user"`
	Description string `json:"description"`
	Denominator int `json:"denominator"`
	From_user_number int `json:"from_user_number"` //needs to handle an array
	To_user_number int `json:"to_user_number"` //needs to handle an array
	State int `json:"bet_state"` //needs to handle proper enum
}

type Bets []Bet
