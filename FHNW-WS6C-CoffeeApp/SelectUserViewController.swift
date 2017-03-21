//
//  MainViewController.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 28.02.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

protocol SelectUserViewControllerDelegate {
    func selectUserViewControllerDelegateDidSelectUser(_ controller: SelectUserViewController)
}

class SelectUserViewController: UIViewController, SelectUserTableViewControllerDelegate {
    
    lazy var dataManager: DataManager = {
        return DataManager.sharedInstance
    }()
    
    var selectedUser: User? {
        get {
            return dataManager.selectedUser()
        }
    }
    
    var delegate: CoffeeViewController?
    
    @IBOutlet weak var fhnwTitleLabel: UILabel!
    @IBOutlet weak var coffeeTitelLabel: UILabel!
    @IBOutlet weak var headingLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        initView()
        customLoadView()
    }
    
    func addObservers() {
        let notificationCenter = NotificationCenter.default
        let mainQueue = OperationQueue.main
        
        // new data
        // new data
        notificationCenter.addObserver(forName: NSNotification.Name(rawValue: HelperConsts.DataManagerNewUserDataNotification), object: nil, queue: mainQueue, using: { _ in
            self.reloadView()
        })
        
        notificationCenter.addObserver(forName: NSNotification.Name(rawValue: HelperConsts.DataManagerNewCoffeeDataNotification), object: nil, queue: mainQueue, using: { _ in
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
        headingLabel.textColor = HelperConsts.defaultColor
    }
    
    func customLoadView() {
        
    }
    
    // perform refresh of view
    func reloadView() {
        // reset all stored values
        customLoadView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == HelperConsts.showSelectUserTableViewControllerSeque {
            let destinationController: SelectUserTableViewController = segue.destination as! SelectUserTableViewController
            destinationController.delegate = self
        }
    }

    
    // MainTableViewControllerDelegate delegate methods
    func selectUserTableViewControllerDelegateDidSelectUser(_ controller: SelectUserTableViewController, user: User) {
        dataManager.setSelectedUser(user: user)
        delegate!.selectUserViewControllerDelegateDidSelectUser(self)
    }

}
