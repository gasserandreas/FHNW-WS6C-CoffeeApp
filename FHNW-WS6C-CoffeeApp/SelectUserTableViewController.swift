//
//  MainTableViewController.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 28.02.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

class SelectUserTableViewController: UITableViewController, SelectUserTableViewControllerCellDelegateMethods {
    
    lazy var dataManager: DataManager = {
        return DataManager.sharedInstance
    }()
    
    var selectedUser: User? {
        get {
            return dataManager.selectedUser()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.Theme.BackgroundColor
        addObservers()
    }
    
    func addObservers() {
        let notificationCenter = NotificationCenter.default
        let mainQueue = OperationQueue.main
        
        // new data
        // new data
        notificationCenter.addObserver(forName: NSNotification.Name(rawValue: Consts.Notification.DataManagerNewUserData.rawValue), object: nil, queue: mainQueue, using: { _ in
            self.tableView.reloadData()
        })
        
        notificationCenter.addObserver(forName: NSNotification.Name(rawValue: Consts.Notification.DataManagerNewCoffeeData.rawValue), object: nil, queue: mainQueue, using: { _ in
            self.tableView.reloadData()
        })
    }
    
    // MARK: - Table View
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.usersSortedArray().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SelectUserTableViewControllerCell = tableView.dequeueReusableCell(withIdentifier: "SelectUserTableViewControllerCell", for: indexPath) as! SelectUserTableViewControllerCell
       
        let users: [User] = dataManager.usersSortedArray()
        let user = users[indexPath.row]
        
        // set tableViewCell
        cell.setView()
        cell.setUser(user: user)
        cell.delegate = self
        
        if (user.id == selectedUser?.id) {
            cell.setSelected(true, animated: false)
        }
        
        return cell
    }
    
    func customDidSelectRowAt() {
        performSegue(withIdentifier: Consts.Seques.UnwindToCoffeeViewController.rawValue, sender: self)
    }
 
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }

}
