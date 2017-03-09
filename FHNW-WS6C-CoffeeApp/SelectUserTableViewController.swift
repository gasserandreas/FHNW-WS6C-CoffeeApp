//
//  MainTableViewController.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 28.02.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

protocol SelectUserTableViewControllerDelegate {
    func selectUserTableViewControllerDelegateDidSelectUser(_ controller: SelectUserTableViewController, user: User)
}

class SelectUserTableViewController: UITableViewController {
    
    lazy var dataManager: DataManager = {
        return DataManager.sharedInstance
    }()
    
    var selectedUser: User? {
        get {
            return dataManager.selectedUser()
        }
    }
    
    var delegate: SelectUserViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = HelperConsts.backgroundColor
        addObservers()
    }
    
    func addObservers() {
        let notificationCenter = NotificationCenter.default
        let mainQueue = OperationQueue.main
        
        // new data
        notificationCenter.addObserver(forName: NSNotification.Name(rawValue: HelperConsts.DataManagerNewDataNotification), object: nil, queue: mainQueue, using: { _ in
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
        
        if (user.id == selectedUser?.id) {
            cell.setSelected(true, animated: false)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let users: [User] = dataManager.usersSortedArray()
        let user = users[indexPath.row]
        
        delegate!.selectUserTableViewControllerDelegateDidSelectUser(self, user: user)

    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }

}
