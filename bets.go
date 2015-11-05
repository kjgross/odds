package main

// import "time"

/*
type Bet struct {
	Name      string    `json:"name"`
	Completed bool      `json:"completed"`
	Due       time.Time `json:"due"`
}
*/


type Bet struct {
	Id int `json:"id"`
	To_user int `json:"to_user"`
	From_user int `json:"from_user"`
	Description string `json:"description"`
	Denominator int `json:"denominator"`
	From_user_number int `json:"from_user_number"`
	To_user_number int `json:"to_user_number"`
	State string `json:"bet_state"`
}

type Bets []Bet

/*type State struct {
    id string `json:"id" bson:"id"`
    Cities []City
}

type City struct {
    id string `json:"id" bson:"id"`
}*/


/*
{
  "data": {
    "bet": {
      "id": 24,
      "to_user": 4,
      "from_user": 2,
      "description": "You chug all these beers",
      "denominator": 22,
      "from_user_number": [1, 2, 3],
      "to_user_number": [1, 2, 3],
      "state": "BET_STATE"
    },
    "users": {
      4: {
        "first_name": "Kelsey",
        "last_name": "Gross"
        // other fields
      },
      2: {
        "first_name": "Ben",
        "last_name": "Pyle"
      }
    }
  },
  "error": 0
}
*/