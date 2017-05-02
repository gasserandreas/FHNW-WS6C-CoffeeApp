//
//  SummaryTableViewController.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 10.03.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation
import Spruce

class SummaryTableViewController: UITableViewController {
    
    // MARK: - Animation properties
    var shouldPrepareAnimationOnFirstLoad: Bool = false
    var animations: [StockAnimation] = [.slide(.up, .severely), .fadeIn]
    var animationDuration = 0.5
    var animationInterObjectDelay = 0.05
    var animationTimerDelay = 0.5
    var animationTimer: Timer?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
        
        if (shouldPrepareAnimationOnFirstLoad) {
            prepareAnimation()
        } else {
            shouldPrepareAnimationOnFirstLoad = true
            callAnimation()
        }
    }
    
    lazy var dataManager: DataManager = {
        return DataManager.sharedInstance
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.Theme.BackgroundColor
        addObservers()
    }
    
    func addObservers() {
        let notificationCenter = NotificationCenter.default
        let mainQueue = OperationQueue.main
        
        // new data
        notificationCenter.addObserver(forName: NSNotification.Name(rawValue: Consts.Notification.DataManagerNewUsersData.rawValue), object: nil, queue: mainQueue, using: { _ in
            self.tableView.reloadData()
        })
    }
    
    // MARK: - Animation methods
    private func prepareAnimation() {
        self.tableView.spruce.prepare(with: animations)
        startAnimation()
    }
    
    func startAnimation() {
        animationTimer?.invalidate()
        animationTimer = Timer.scheduledTimer(timeInterval: animationTimerDelay, target: self, selector: #selector(callAnimation), userInfo: nil, repeats: false)
    }
    
    func callAnimation() {
        let sortFunction = LinearSortFunction(direction: .bottomToTop, interObjectDelay: animationInterObjectDelay)
        //        let sortFunction = DefaultSortFunction(interObjectDelay: 0.05)
        let animation = SpringAnimation(duration: animationDuration)
        DispatchQueue.main.async {
            self.tableView.spruce.animate(self.animations, animationType: animation, sortFunction: sortFunction)
        }
    }
    
    // MARK: - Table View
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.usersSortedArray().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SummaryTableViewControllerCell = tableView.dequeueReusableCell(withIdentifier: "SummaryTableViewControllerCell", for: indexPath) as! SummaryTableViewControllerCell
        
        let users: [User] = dataManager.usersSortedArray()
        let user = users[indexPath.row]
        
        // set tableViewCell
        cell.setView()
        cell.setUser(user: user)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
