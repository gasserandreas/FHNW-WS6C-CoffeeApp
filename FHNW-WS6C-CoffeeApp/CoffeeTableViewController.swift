//
//  DetailViewTableViewController.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 07.03.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

protocol CoffeeTableViewControllerDelegate {
    func coffeeTableViewControllerDelegateCountUpCoffee(_ controller: CoffeeTableViewController, coffee: CoffeeType)
    func coffeeTableViewControllerDelegateCountDownCoffee(_ controller: CoffeeTableViewController, coffee: CoffeeType)
//    func mainTableViewControllerDelegateDidSelectUser(_ controller: MainTableViewController, user: User)
//    func mainTableViewControllerDelegateDidSelectCountUpCoffee(_ controller: MainTableViewController, user: User, coffee: CoffeeType)
}

class CoffeeTableViewController: UITableViewController, CoffeeTableViewControllerCellDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = HelperConsts.backgroundColor
        addObservers()
    }
    
    var delegate: CoffeeViewController?
    
    lazy var dataManager: DataManager = {
        return DataManager.sharedInstance
    }()
    
    func addObservers() {
        let notificationCenter = NotificationCenter.default
        let mainQueue = OperationQueue.main
        
        // new data
        notificationCenter.addObserver(forName: NSNotification.Name(rawValue: HelperConsts.DataManagerNewCoffeeDataNotification), object: nil, queue: mainQueue, using: { _ in
            self.tableView.reloadData()
        })
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
        
        // set table view
        cell.delegate = self
        cell.setCoffeeType(coffeeType: coffeeType)
        cell.setView()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    // CoffeeTableViewControllerCellDelegate methods
    func coffeeTableViewControllerCellDelegateCoffeeCountUp(_ cell:CoffeeTableViewControllerCell, coffee: CoffeeType) {
        delegate!.coffeeTableViewControllerDelegateCountUpCoffee(self, coffee: coffee)
    }
    
    func coffeeTableViewControllerCellDelegateCoffeeCountDown(_ cell:CoffeeTableViewControllerCell, coffee: CoffeeType) {
        delegate!.coffeeTableViewControllerDelegateCountDownCoffee(self, coffee: coffee)
    }
    
}
