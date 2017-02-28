//
//  MainViewController.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 28.02.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

class MainViewController: UIViewController, MainTableViewControllerDelegate {
    
    lazy var dataManager: DataManager = {
        return DataManager.sharedInstance
    }()
    
    lazy var configManager: ConfigManager = {
        return ConfigManager.sharedInstance
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
    func customLoadView() {
        
    }
    
    // perform refresh of view
    func reloadView() {
        // reset all stored values
        customLoadView()
    }
    
    // MainTableViewControllerDelegate delegate methods
    func mainTableViewControllerDelegateDidSelectUser(_ controller: MainTableViewController, user: User) {
        NSLog("minTableViewControllerDelegateDidSelectUser")
    }
    
    func mainTableViewControllerDelegateDidSelectCountUpCoffee(_ controller: MainTableViewController, user: User, coffee: CoffeeType) {
        NSLog("minTableViewControllerDelegateDidSelectCountUpCoffee")
    }

}
