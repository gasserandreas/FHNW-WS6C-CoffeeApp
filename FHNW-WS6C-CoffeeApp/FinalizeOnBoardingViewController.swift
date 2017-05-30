//
//  FinalizeOnBoardingViewController.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 02.05.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

class FinalizeOnBoardingViewController: UIViewController {
    
    lazy var dataManager: DataManager = {
        return DataManager.sharedInstance
    }()
    
    var selectedUser: User?
    
    let moveLeftRightAnimationController = MoveLeftRightViewControllerAnimatedTransitioning()
    
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var firstnameLabel: UILabel!
    @IBOutlet weak var coffeeCounterLabel: UILabel!
    @IBOutlet weak var finalizeLabel: UILabel!
    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var userProfileShadowView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        selectedUser = dataManager.selectedUser()
        initView()
    }
    
    func addObservers() {
        let notificationCenter = NotificationCenter.default
        let mainQueue = OperationQueue.main
        
        // new data
        notificationCenter.addObserver(forName: NSNotification.Name(rawValue: Consts.Notification.DataManagerNewUsersData.rawValue), object: nil, queue: mainQueue, using: { _ in
            self.reloadView()
        })
        
        notificationCenter.addObserver(forName: NSNotification.Name(rawValue: Consts.Notification.DataManagerNewCoffeeData.rawValue), object: nil, queue: mainQueue, using: { _ in
            self.reloadView()
        })
    }
    
    // init view
    func initView() {
        // set background color
        view.backgroundColor = UIColor.Theme.BackgroundColor
        
        // set image view
        let radius = userProfileImageView.frame.size.width / 2
        userProfileImageView.layer.cornerRadius = radius
        userProfileImageView.layer.masksToBounds = false
        userProfileImageView.clipsToBounds = true
        userProfileImageView.layer.borderWidth = 1.0
        userProfileImageView.layer.borderColor = UIColor.Theme.ImageBorderColor.cgColor
        
        userProfileShadowView.layer.cornerRadius = radius
        userProfileShadowView.clipsToBounds = false
        userProfileShadowView.layer.masksToBounds = false
        userProfileShadowView.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        userProfileShadowView.layer.shadowColor = UIColor.black.cgColor
        userProfileShadowView.layer.shadowOpacity = 0.33
        userProfileShadowView.layer.shadowRadius = 5
        
        
        // set label
        headingLabel.font = UIFont.Theme.HeaderTextFont
        headingLabel.textColor = UIColor.Theme.TextColor
        nameLabel.font = UIFont.Theme.HeaderTextFont
        nameLabel.textColor = UIColor.Theme.TextColor
        firstnameLabel.font = UIFont.Theme.HeaderTextFont
        firstnameLabel.textColor = UIColor.Theme.TextColor
        finalizeLabel.font = UIFont.Theme.HeaderTextFont
        finalizeLabel.textColor = UIColor.Theme.TextColor
        
        coffeeCounterLabel.font = UIFont.Theme.HeaderTextFont
        coffeeCounterLabel.textColor = UIColor.Theme.TextColor
        
        customLoadView()
    }
    
    func customLoadView() {
        if let user = selectedUser {
            let url = URL(string: HelperMethods.getImageEndPointString(imageName: user.imageName))!
            userProfileImageView.af_setImage(withURL: url)
            nameLabel.text = user.name
            firstnameLabel.text = user.firstname
            
            var coffees = 0
            for coffee in user.coffees {
                coffees += Int(coffee.value)!
            }
            coffeeCounterLabel.text = coffees > 0 ? "\(coffees) Coffees" : "No coffees"
        }
    }
    
    // perform refresh of view
    func reloadView() {
        // reset all stored values
        customLoadView()
    }
    
    @IBAction func userDidSelectBackButton() {
        performSegue(withIdentifier: Consts.Seques.UnwindToOnBoardingSelectUserViewController.rawValue, sender: self)
    }
    
    @IBAction func userDidSelectSave() {
        UserDefaults.standard.set(true, forKey: Consts.UserDefaults.UserOnBoarded.rawValue)
        UIApplication.shared.keyWindow?.rootViewController = UIStoryboard(name: Consts.StoryBoard.Main.rawValue, bundle: nil).instantiateInitialViewController() as! UINavigationController
    }
}
