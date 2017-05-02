//
//  DetailViewTableViewController.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 07.03.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

class CoffeeTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.Theme.BackgroundColor
        addObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    lazy var dataManager: DataManager = {
        return DataManager.sharedInstance
    }()
    
    func addObservers() {
        let notificationCenter = NotificationCenter.default
        let mainQueue = OperationQueue.main
        
        // new data
        notificationCenter.addObserver(forName: NSNotification.Name(rawValue: Consts.Notification.DataManagerNewCoffeeData.rawValue), object: nil, queue: mainQueue, using: { _ in
            self.tableView.reloadData()
        })
        
        notificationCenter.addObserver(forName: NSNotification.Name(rawValue: Consts.Notification.DataManagerNewUsersData.rawValue), object: nil, queue: mainQueue, using: { _ in
            self.tableView.reloadData()
        })
        
        notificationCenter.addObserver(forName: NSNotification.Name(rawValue: Consts.Notification.DataManagerNewUserData.rawValue), object: nil, queue: mainQueue, using: { notification in
            if let coffeeId = notification.userInfo?["coffeeId"] as? String {
                self.updateTableViewCell(id: coffeeId)
            }
            
        })
    }
    
    private func updateTableViewCell(id: String) {
        if let user = dataManager.selectedUser() {
            if let index = user.coffees.index(where: { (item) -> Bool in
                item.key == id
            }) {
                let indexPath: IndexPath = IndexPath(row: index, section: 0)
                tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.none)
            }
        }
    }
    
    // MARK: - Table View
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.coffeeTypesSortedArray().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CoffeeTableViewControllerCell = tableView.dequeueReusableCell(withIdentifier: "CoffeeTableViewControllerCell", for: indexPath) as! CoffeeTableViewControllerCell
        
        let coffeeTypes: [CoffeeType] = dataManager.coffeeTypesSortedArray()
        let coffeeType = coffeeTypes[indexPath.row]
        
        // calculate coffee counter
        var counter = "0"
        if let user = dataManager.selectedUser() {
            if let index = user.coffees.index(where: { (item) -> Bool in
                item.key == coffeeType.id
            }) {
                let coffeeCounter = user.coffees[index].value
                counter = coffeeCounter
            }
        }
        
        // set table view
        let model = TableViewCellModel(data: coffeeType, animate: false)
        cell.setModel(model: model)
        cell.setCoffeeCounterLabel(counter: counter)
        cell.setView()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }    
}
