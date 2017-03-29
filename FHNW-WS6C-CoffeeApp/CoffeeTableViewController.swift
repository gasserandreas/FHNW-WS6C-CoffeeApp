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
        cell.setCoffeeType(coffeeType: coffeeType)
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
