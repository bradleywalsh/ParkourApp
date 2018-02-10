//
//  ViewController.swift
//  Parkour
//
//  Created by Bradley Walsh on 2/7/18.
//  Copyright © 2018 Bradley Walsh. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    @IBAction func loginPressed(_ sender: Any) {
        if emailTextField.text != nil && passwordTextField.text != nil {
            AuthService.instance.loginUser(withEmail: emailTextField.text!, andPassword: passwordTextField.text!, loginComplete: { (success, loginError) in
                if success {
                    self.performSegue(withIdentifier: "goToMain", sender: self)
                } else {
                    print(String(describing: loginError?.localizedDescription))
                }
            })
        }
    }
}

extension LoginViewController: UITextFieldDelegate { }

