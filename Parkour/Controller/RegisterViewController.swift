//
//  RegisterViewController.swift
//  Parkour
//
//  Created by Bradley Walsh on 2/9/18.
//  Copyright © 2018 Bradley Walsh. All rights reserved.
//
import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        if emailTextField.text != nil && passwordTextField.text != nil {
            SVProgressHUD.show()
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
                if error != nil {
                    SVProgressHUD.dismiss()
                    if let errCode = AuthErrorCode(rawValue: error!._code) {
                        switch errCode {
                        case .invalidEmail:
                            self.createAlert(title: "Error:", message: "Please enter a valid email address")
                        case .emailAlreadyInUse:
                            self.createAlert(title: "Error:", message: "Email address is already in use.")
                        case .weakPassword:
                            self.createAlert(title: "Error:", message: "Password must be 6 characters long.")
                        default:
                            break
                        }
                    }
                } else {
                    SVProgressHUD.dismiss()
                    self.performSegue(withIdentifier: "goToMain", sender: self)
                }
            })
        }
    }
}
