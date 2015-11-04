//
//  Extensions.swift
//  Odds
//
//  Created by Sean McQueen on 11/3/15.
//  Copyright © 2015 Sean McQueen. All rights reserved.
//

import UIKit

extension NSObject {
    var className: String {
        return NSStringFromClass(self.dynamicType).componentsSeparatedByString(".").last!
    }
}
