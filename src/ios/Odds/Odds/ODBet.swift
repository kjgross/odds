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

    override init(objectData: JSON) {
        self.toUserId = objectData[ODToUserKey].int
        self.fromUserId = objectData[ODFromUserKey].int
        self.betDescription = objectData[ODDescriptionKey].string
        self.denominator = objectData[ODDenominatorKey].int

        let fromUserGuesses = objectData[ODFromUserGuessesKey].array
        if fromUserGuesses != nil {
            self.fromUserGuesses = (fromUserGuesses!).map { $0.int! }
        }

        let toUserGuesses = objectData[ODToUserGuessesKey].array
        if toUserGuesses != nil {
            self.toUserGuesses = (toUserGuesses!).map { $0.int! }
        }

        let state = objectData[ODStateKey].int
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
