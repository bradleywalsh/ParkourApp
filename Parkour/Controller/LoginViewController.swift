//
//  ViewController.swift
//  Parkour
//
//  Created by Bradley Walsh on 2/7/18.
//  Copyright © 2018 Bradley Walsh. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func loginPressed(_ sender: Any) {
        if emailTextField.text != nil && passwordTextField.text != nil {
            SVProgressHUD.show()
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                
                if error != nil {
                    SVProgressHUD.dismiss()
                    if let errCode = AuthErrorCode(rawValue: error!._code) {
                        switch errCode {
                        case .invalidEmail:
                            self.createAlert(title: "Error:", message: "Please enter a valid email address or password")
                        case .wrongPassword:
                            self.createAlert(title: "Error:", message: "Please enter a valid email address or password")
                        default:
                            break
                        }
                    }
                } else {
                    SVProgressHUD.dismiss()
                    self.performSegue(withIdentifier: "goToMain", sender: self)
                    
                }
                
            }
        }
    }
}

extension LoginViewController: UITextFieldDelegate { }

