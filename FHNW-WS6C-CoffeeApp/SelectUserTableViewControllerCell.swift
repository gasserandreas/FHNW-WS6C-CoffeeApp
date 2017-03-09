//
//  MainTableViewControllerCell.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 28.02.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

class SelectUserTableViewControllerCell: UITableViewCell {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userProfileImageView: UIImageView!
    
    func setView() {
        // set cell style
        backgroundColor = HelperConsts.backgroundColor
        
        // set image style
        userProfileImageView.layer.cornerRadius = userProfileImageView.frame.size.width / 2
        userProfileImageView.clipsToBounds = true
        userProfileImageView.layer.borderWidth = 1.0
        userProfileImageView.layer.borderColor = HelperConsts.imageBorderColor.cgColor
    }
    
    func setUser(user: User) {
        userNameLabel.text = "\(user.firstname) \(user.name)"
    }
}
