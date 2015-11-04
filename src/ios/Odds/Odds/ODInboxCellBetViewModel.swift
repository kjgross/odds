//
//  ODInboxCellBetViewModel.swift
//  Odds
//
//  Created by Sean McQueen on 11/3/15.
//  Copyright © 2015 Sean McQueen. All rights reserved.
//

import UIKit

class ODInboxCellBetViewModel: ODInboxCellViewModel {

    var topLabelString : String
    var bottomLabelString : String

    init (bet: ODBet) {
        self.topLabelString = "User id " + String(bet.toUserId!) + " challenges user id " + String(bet.fromUserId!)
        self.bottomLabelString = "Odds are: " + bet.betDescription!
    }

}
