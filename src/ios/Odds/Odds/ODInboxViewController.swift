//
//  ODInboxViewController.swift
//  Odds
//
//  Created by Sean McQueen on 11/3/15.
//  Copyright © 2015 Sean McQueen. All rights reserved.
//

import UIKit

class ODInboxViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Bets"

        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = UITableViewCell.init()
        cell.backgroundColor = UIColor.redColor()
        cell.textLabel?.text = "Hello world"
        return cell
    }
}
