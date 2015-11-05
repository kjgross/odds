//
//  ODLoginViewController.swift
//  Odds
//
//  Created by Sean McQueen on 11/4/15.
//  Copyright © 2015 Sean McQueen. All rights reserved.
//

import UIKit

class ODLoginViewController: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet weak var loginButton: FBSDKLoginButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        self.loginButton.delegate = self
    }

    // FBSDKLoginButtonDelegate methods

    func loginButton(loginButton: FBSDKLoginButton!,
        didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {

        if ((error) != nil) {
            // Process error
        } else if result.isCancelled {
            // Handle cancellations
        } else {

            let fields : String = "id, name, gender, picture.type(large), email"
            let graphRequest = FBSDKGraphRequest.init(graphPath: "me", parameters: ["fields": fields])
            graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
                if ((error) != nil) {
                    // Process error
                } else {
                    // Create our new user here with this resut data.
                    print(result)
                }
            })

            UIApplication.sharedApplication().keyWindow?.rootViewController =
                UINavigationController.init(rootViewController: ODInboxViewController())
        }
    }

    // TODO: Log out needs to be implemented somewhere else
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }

}
