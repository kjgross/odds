//
//  ODInboxViewController.swift
//  Odds
//
//  Created by Sean McQueen on 11/3/15.
//  Copyright © 2015 Sean McQueen. All rights reserved.
//

import UIKit

import SwiftyJSON
import Alamofire


class ODInboxViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let CellName : String = ODInboxCell().className

    // Xib vars
    @IBOutlet weak var tableView: UITableView!

    // vars
    var bets : [ODBet]

    // Initializers

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        bets = []
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }


    required init?(coder aDecoder: NSCoder) {
        bets = []
        super.init(coder: aDecoder)
    }

    // View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.getData()

        self.navigationItem.title = "Bets"

        self.tableView.delegate = self
        self.tableView.dataSource = self

        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 50

        self.tableView.registerNib(UINib.init(nibName: CellName, bundle: nil), forCellReuseIdentifier: CellName)
    }

    // UITableViewDataSource + UITableViewDelegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bets.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let viewModel = ODInboxCellBetViewModel(bet: self.bets[indexPath.row])
        let cell = tableView.dequeueReusableCellWithIdentifier(CellName, forIndexPath: indexPath) as! ODInboxCell
        cell.configure(viewModel)
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let bet = self.bets[indexPath.row]
        print(String(bet.id!))
    }


    func getData () {
        // TODO: not use localhost and also disallow this host at some point
        // TODO: loading indicator
        Alamofire.request(.GET, "http://localhost:8080/bets", parameters: nil)
            .responseJSON { response in
                if let json = response.result.value {
                    let bet : ODBet = ODBet(objectData: JSON(json[0]))
                    self.bets = [bet]
                    self.tableView.reloadData()
                }
        }
    }

}
