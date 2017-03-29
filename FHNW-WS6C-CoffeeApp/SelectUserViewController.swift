//
//  MainViewController.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 28.02.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

class SelectUserViewController: UIViewController {
    
    lazy var dataManager: DataManager = {
        return DataManager.sharedInstance
    }()
    
    var selectedUser: User? {
        get {
            return dataManager.selectedUser()
        }
    }
    
    @IBOutlet weak var fhnwTitleLabel: UILabel!
    @IBOutlet weak var coffeeTitelLabel: UILabel!
    @IBOutlet weak var headingLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        initView()
    }
    
    func addObservers() {
        let notificationCenter = NotificationCenter.default
        let mainQueue = OperationQueue.main
        
        // new data
        notificationCenter.addObserver(forName: NSNotification.Name(rawValue: Consts.Notification.DataManagerNewUserData.rawValue), object: nil, queue: mainQueue, using: { _ in
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
        
        // set color and fonts
        //fhnwTitleLabel.font = UIFont.Theme.HeaderTextFont
        fhnwTitleLabel.textColor = UIColor.Theme.TextColor
        
        coffeeTitelLabel.textColor = UIColor.Theme.TextColor
        
        headingLabel.font = UIFont.Theme.HeaderTextFont
        headingLabel.textColor = UIColor.Theme.TextColor
        
        customLoadView()
    }
    
    // reload view
    func customLoadView() {
        
    }
    
    // perform refresh of view
    func reloadView() {
        // reset all stored values
        customLoadView()
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == HelperConsts.showSelectUserTableViewControllerSeque {
            let destinationController: SelectUserTableViewController = segue.destination as! SelectUserTableViewController
            destinationController.delegate = self
        }
    }
    */
}
