//
//  PostViewController.swift
//  Parkour
//
//  Created by Bradley Walsh on 2/10/18.
//  Copyright © 2018 Bradley Walsh. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class PostViewController: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var postButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLabel.text = Auth.auth().currentUser?.email
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        postButton.bindToKeyboard()
    }
   
    @IBAction func postButtonWasPressed(_ sender: Any) {
        if textView.text != nil && textView.text != "Write post..." {
            postButton.isEnabled = false
            DataService.instance.uploadPost(withMessage: textView.text, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil, sendComplete: { (isComplete) in
                if isComplete {
                    self.postButton.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.postButton.isEnabled = true
                    print("There was an error")
                }
            })
        }
    }
    
    @IBAction func closeButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension PostViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
