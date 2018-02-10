//
//  RegisterViewController.swift
//  Parkour
//
//  Created by Bradley Walsh on 2/9/18.
//  Copyright © 2018 Bradley Walsh. All rights reserved.
//
import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                if error != nil {
                    print(error!)
                } else {
                    print("registration successful")
                    self.performSegue(withIdentifier: "goToMain", sender: self)
                }
            })
        }
    }
    
    
}
