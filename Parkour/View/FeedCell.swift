//
//  FeedCellTableViewCell.swift
//  Parkour
//
//  Created by Bradley Walsh on 2/10/18.
//  Copyright © 2018 Bradley Walsh. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var postLabel: UILabel!
    
    func configureCell(profileImage: UIImage, email: String, content: String) {
        self.profilePicture.image = profileImage
        self.usernameLabel.text = email
        self.postLabel.text = content
    }
    
}
