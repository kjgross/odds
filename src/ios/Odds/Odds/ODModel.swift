//
//  ODModel.swift
//  Odds
//
//  Created by Sean McQueen on 11/3/15.
//  Copyright © 2015 Sean McQueen. All rights reserved.
//

import UIKit

import SwiftyJSON


protocol ODModelProtocol {
    var id : Int? { get }
    func isValid () -> Bool
}


class ODModel: ODModelProtocol {
    private let ODIdKey : String = "id"

    var id : Int?

    init(objectData: JSON) {
        self.id = objectData[ODIdKey].int
    }

    func isValid () -> Bool {
        return self.id != nil
    }

}
