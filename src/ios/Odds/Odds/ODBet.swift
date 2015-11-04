//
//  ODBet.swift
//  Odds
//
//  Created by Sean McQueen on 11/3/15.
//  Copyright © 2015 Sean McQueen. All rights reserved.
//

import UIKit

import SwiftyJSON

enum ODBetState : Int {
    case Invalid = 0
    // TODO: other states!
}

class ODBet: ODModel {
    private let ODToUserKey : String = "to_user"
    private let ODFromUserKey : String = "from_user"
    private let ODDescriptionKey : String = "description"
    private let ODDenominatorKey : String = "denominator"
    private let ODFromUserGuessesKey : String = "from_user_number"
    private let ODToUserGuessesKey : String = "to_user_number"
    private let ODStateKey : String = "state"

    var toUserId : Int?
    var fromUserId : Int?
    var betDescription : String?
    var denominator : Int?
    var fromUserGuesses: [Int]?
    var toUserGuesses: [Int]?
    var state: ODBetState?

    override init(objectData: Dictionary<String, JSON>) {
        let json = JSON(objectData)
        self.toUserId = json[ODToUserKey].int
        self.fromUserId = json[ODFromUserKey].int
        self.betDescription = json[ODDescriptionKey].string
        self.denominator = json[ODDenominatorKey].int

        let fromUserGuesses = json[ODFromUserGuessesKey].array
        if fromUserGuesses != nil {
            self.fromUserGuesses = (fromUserGuesses!).map { $0.int! }
        }

        let toUserGuesses = json[ODToUserGuessesKey].array
        if toUserGuesses != nil {
            self.toUserGuesses = (toUserGuesses!).map { $0.int! }
        }

        let state = json[ODStateKey].int
        if state != nil {
            self.state = ODBetState(rawValue: state!)
        } else {
            self.state = ODBetState.Invalid
        }

        super.init(objectData: objectData)
    }

    override func isValid() -> Bool {
        let valid: Bool = (self.toUserId != nil &&
            self.fromUserId != nil &&
            self.betDescription != nil &&
            self.denominator != nil &&
            self.fromUserGuesses != nil &&
            self.toUserGuesses != nil &&
            self.state != .Invalid)
        return super.isValid() && valid
    }

}
