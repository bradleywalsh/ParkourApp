//
//  WelcomeViewController.swift
//  Parkour
//
//  Created by Bradley Walsh on 2/9/18.
//  Copyright © 2018 Bradley Walsh. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class WelcomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // check if user is already logged in from previous session
        if Auth.auth().currentUser != nil {
            performSegue(withIdentifier: "goToMain", sender: self)
        }
    }
    
    
}
