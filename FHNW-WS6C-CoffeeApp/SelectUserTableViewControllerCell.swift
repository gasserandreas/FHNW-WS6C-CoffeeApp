//
//  MainTableViewControllerCell.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 28.02.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation
import AlamofireImage

class SelectUserTableViewControllerCell: UITableViewCell {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userProfileShadowView: UIView!
    @IBOutlet weak var userProfileImageView: UIImageView!
    
    func setView() {
        // set cell style
        backgroundColor = UIColor.Theme.BackgroundColor
        
        userNameLabel.font = UIFont.Theme.DefaultTextFont
        userNameLabel.textColor = UIColor.Theme.TextColor
        
        // set same constraints for shadow view
        //userProfileShadowView.constraints.append(<#T##newElement: NSLayoutConstraint##NSLayoutConstraint#>)
        //userProfileShadowView.addConstraints(userProfileImageView.constraints)
        
        
        // set image style
        let radius = userProfileImageView.frame.size.width / 2
        userProfileImageView.layer.cornerRadius = radius
        userProfileImageView.clipsToBounds = true
        userProfileImageView.layer.masksToBounds = true
        userProfileImageView.layer.borderWidth = 1.0
        userProfileImageView.layer.borderColor = UIColor.Theme.ImageBorderColor.cgColor
        
        userProfileShadowView.layer.cornerRadius = radius
        userProfileShadowView.layer.masksToBounds = false
        userProfileShadowView.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        userProfileShadowView.layer.shadowColor = UIColor.black.cgColor
        userProfileShadowView.layer.shadowOpacity = 0.33
        userProfileShadowView.layer.shadowRadius = 5
        
//        // set shadow
////        userProfileImageView.layer.masksToBounds = false
//        userProfileImageView.layer.shadowColor = UIColor.black.cgColor
//        userProfileImageView.layer.shadowOpacity = 1
//        userProfileImageView.layer.shadowOffset = CGSize(width: -1, height: 1)
//        userProfileImageView.layer.shadowRadius = 1
//        userProfileImageView.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
//        userProfileImageView.layer.shouldRasterize = true
////        userProfileImageView.layer.shouldRasterize = true
    }
    
    func setUser(user: User) {
        userNameLabel.text = "\(user.firstname) \(user.name)"
        
        // set image
        let url = URL(string: HelperMethods.getImageEndPointString(imageName: user.imageName))!
        userProfileImageView.af_setImage(withURL: url)
    }
}
