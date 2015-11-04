//
//  ODInboxCell.swift
//  Odds
//
//  Created by Sean McQueen on 11/3/15.
//  Copyright © 2015 Sean McQueen. All rights reserved.
//

import UIKit

protocol ODInboxCellViewModel : class {
    var topLabelString : String { get }
    var bottomLabelString : String { get }
}

class ODInboxCell: UITableViewCell {

    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        // TODO: styling
    }

    func configure(viewModel: ODInboxCellViewModel) {
        self.topLabel.text = viewModel.topLabelString
        self.bottomLabel.text = viewModel.bottomLabelString
    }

}
