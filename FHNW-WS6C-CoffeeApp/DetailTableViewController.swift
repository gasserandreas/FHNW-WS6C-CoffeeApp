//
//  DetailViewTableViewController.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 07.03.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

protocol DetailTableViewControllerDelegate {
//    func mainTableViewControllerDelegateDidSelectUser(_ controller: MainTableViewController, user: User)
//    func mainTableViewControllerDelegateDidSelectCountUpCoffee(_ controller: MainTableViewController, user: User, coffee: CoffeeType)
}

class DetailTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = HelperConsts.backgroundColor
        addObservers()
    }
    
    var delegate: DetailViewController?
    
    lazy var dataManager: DataManager = {
        return DataManager.sharedInstance
    }()
    
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
        let cell:DetailTableViewControllerCell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewControllerCell", for: indexPath) as! DetailTableViewControllerCell
        
        //let coffeeType: [CoffeeType] = dataManager.usersSortedArray()
        //var coffeeType
        
        // set tableViewCell
        //cell.coffeeCounterLabel.text =
        
        // set cell style
        cell.backgroundColor = HelperConsts.backgroundColor
        
        // set image style
        cell.coffeeTypeView.layer.cornerRadius = cell.coffeeTypeView.frame.size.width / 2
        cell.coffeeTypeView.clipsToBounds = true
        cell.coffeeTypeView.layer.borderWidth = 1.0
        cell.coffeeTypeView.layer.borderColor = HelperConsts.imageBorderColor.cgColor
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let users: [User] = dataManager.usersSortedArray()
        let user = users[indexPath.row]
        
        //delegate!.mainTableViewControllerDelegateDidSelectUser(self, user: user)
        
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
