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
    
    var selectedUser: User?
    
    @IBOutlet weak var fhnwTitleLabel: UILabel!
    @IBOutlet weak var coffeeTitelLabel: UILabel!
    
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
        fhnwTitleLabel.textColor = HelperConsts.defaultColor
        coffeeTitelLabel.textColor = HelperConsts.defaultColor
    }
    
    func customLoadView() {
        
    }
    
    // perform refresh of view
    func reloadView() {
        // reset all stored values
        customLoadView()
    }
    
    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // set delegate of TechTableViewController to self, this is needed for proper event handling
        if segue.identifier == HelperConsts.showDetailViewControllerSegue {
            let destinationController: DetailViewController = segue.destination as! DetailViewController
            destinationController.delegate = self
            destinationController.selectedUser = selectedUser
        }
    }
    
    // MainTableViewControllerDelegate delegate methods
    func mainTableViewControllerDelegateDidSelectUser(_ controller: MainTableViewController, user: User) {
        selectedUser = user
        NSLog("minTableViewControllerDelegateDidSelectUser")
    }
    
    func mainTableViewControllerDelegateDidSelectCountUpCoffee(_ controller: MainTableViewController, user: User, coffee: CoffeeType) {
        NSLog("minTableViewControllerDelegateDidSelectCountUpCoffee")
    }

}
