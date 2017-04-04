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

protocol SelectUserTableViewControllerCellDelegateMethods {
    func customDidSelectRowAt()
}

class SelectUserTableViewControllerCell: UITableViewCell {
    
    @IBOutlet weak var userNameLabel: UILabel!
//    @IBOutlet weak var userProfileShadowView: UIView!
    @IBOutlet weak var userProfileImageView: RoundedImageView!
    
    lazy var dataManager: DataManager = {
        return DataManager.sharedInstance
    }()
    
    private var user: User?
    var delegate: SelectUserTableViewController?
    
    func setView() {
        // set cell style
        backgroundColor = UIColor.Theme.BackgroundColor
        self.selectionStyle = UITableViewCellSelectionStyle.none
        
        userNameLabel.font = UIFont.Theme.DefaultTextFont
        userNameLabel.textColor = UIColor.Theme.TextColor
        
        userProfileImageView.layer.masksToBounds = false
        userProfileImageView.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        userProfileImageView.layer.shadowColor = UIColor.black.cgColor
        userProfileImageView.layer.shadowOpacity = 0.33
        userProfileImageView.layer.shadowRadius = 5
        
        /*
        //userProfileShadowView.layer.cornerRadius = radius
        userProfileShadowView.layer.masksToBounds = false
        userProfileShadowView.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        userProfileShadowView.layer.shadowColor = UIColor.black.cgColor
        userProfileShadowView.layer.shadowOpacity = 0.33
        userProfileShadowView.layer.shadowRadius = 5
         */
        
        userProfileImageView.borderColor = UIColor.Theme.ImageBorderColor
        
        // create gesture recognizers
        let selectUserTabRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.selectUser))
        selectUserTabRecognizer.cancelsTouchesInView = false
        
        self.addGestureRecognizer(selectUserTabRecognizer)
    }
    
    func selectUser() {
        
        if let user = user {
        
        UIView.animate(withDuration: 0.10, animations: {
            self.userProfileImageView.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
            self.layoutIfNeeded()
        }, completion: { (finished) in
            if finished {
                UIView.animate(withDuration: 0.05, delay: 0.05, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
                    self.userProfileImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
                }, completion: { (success) in
                    if success {
                        self.dataManager.setSelectedUser(user: user)
                        self.delegate!.customDidSelectRowAt()
                    }
                })
            }
        })
            
        }
    }
    
    func setUser(user: User) {
        self.user = user
        userNameLabel.text = "\(user.firstname) \(user.name)"
        
        // set image
        let url = URL(string: HelperMethods.getImageEndPointString(imageName: user.imageName))!
        userProfileImageView.af_setImage(withURL: url)
    }
}
