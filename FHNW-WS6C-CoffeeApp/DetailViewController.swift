//
//  DetailViewController.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 07.03.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

class DetailViewController: UIViewController {
    
    lazy var dataManager: DataManager = {
        return DataManager.sharedInstance
    }()
    
    lazy var configManager: ConfigManager = {
        return ConfigManager.sharedInstance
    }()
    
    var delegate: MainViewController?
    var selectedUser: User?
    
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var userProfileImageView: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        initView()
        customLoadView()
    }
    
    func addObservers() {
        let notificationCenter = NotificationCenter.default
        let mainQueue = OperationQueue.main
        
        // new data
        notificationCenter.addObserver(forName: NSNotification.Name(rawValue: HelperConsts.DataManagerNewDataNotification), object: nil, queue: mainQueue, using: { _ in
            self.reloadView()
        })
    }
    
    // init view
    func initView() {
        // set background color
        view.backgroundColor = HelperConsts.backgroundColor
        
        // set color and fonts
        backLabel.textColor = HelperConsts.defaultColor
        
        userProfileImageView.layer.cornerRadius = userProfileImageView.frame.size.width / 2
        userProfileImageView.clipsToBounds = true
        userProfileImageView.layer.borderWidth = 1.0
        userProfileImageView.layer.borderColor = HelperConsts.imageBorderColor.cgColor
    }
    
    func customLoadView() {
        
    }
    
    // perform refresh of view
    func reloadView() {
        // reset all stored values
        customLoadView()
    }
}
