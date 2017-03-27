//
//  SummaryViewController.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 10.03.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

protocol SummaryViewControllerDelegate {
    func summaryViewControllerDelegateDidSelectBack(_ controller: SummaryViewController)
}

class SummaryViewController: UIViewController, SelectUserTableViewControllerDelegate {
    
    lazy var dataManager: DataManager = {
        return DataManager.sharedInstance
    }()
    
    var delegate: CoffeeViewController?
    
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var totalCoffeeLabel: UILabel!
    @IBOutlet weak var coffeeCapsuleView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        initView()
        customLoadView()
    }
    
    func addObservers() {
        let notificationCenter = NotificationCenter.default
        let mainQueue = OperationQueue.main
        
        // new data
        notificationCenter.addObserver(forName: NSNotification.Name(rawValue: HelperConsts.DataManagerNewUserDataNotification), object: nil, queue: mainQueue, using: { _ in
            self.reloadView()
        })
    }
    
    // init view
    func initView() {
        // set background color
        view.backgroundColor = HelperConsts.backgroundColor
        coffeeCapsuleView.backgroundColor = HelperConsts.backgroundColor
        
        // set color and fonts
        headingLabel.textColor = HelperConsts.defaultColor
        totalCoffeeLabel.textColor = HelperConsts.defaultColor
    }
    
    func customLoadView() {
        var totalCoffee = 0
        for user in dataManager.usersSortedArray() {
            for coffeeObject in Array(user.coffees) {
                totalCoffee += Int(coffeeObject.value)!
            }
        }
        totalCoffeeLabel.text = "Total \(totalCoffee)"
    }
    
    // perform refresh of view
    func reloadView() {
        // reset all stored values
        customLoadView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == HelperConsts.showSummaryTableViewControllerSeque {
            let destinationController: SummaryTableViewController = segue.destination as! SummaryTableViewController
//            destinationController.delegate = self
        }
    }
    
    
    // MainTableViewControllerDelegate delegate methods
    func selectUserTableViewControllerDelegateDidSelectUser(_ controller: SelectUserTableViewController, user: User) {
        delegate!.summaryViewControllerDelegateDidSelectBack(self)
    }
    
    @IBAction func userDidSelectBackButton(sender: UILabel) {
        delegate!.summaryViewControllerDelegateDidSelectBack(self)
    }
    
}
