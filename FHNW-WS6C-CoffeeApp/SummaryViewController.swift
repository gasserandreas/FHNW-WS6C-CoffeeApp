//
//  SummaryViewController.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Martin Luepold on 10.03.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

class SummaryViewController: UIViewController {
    
    lazy var dataManager: DataManager = {
        return DataManager.sharedInstance
    }()
    
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
        notificationCenter.addObserver(forName: NSNotification.Name(rawValue: Consts.Notification.DataManagerNewUsersData.rawValue), object: nil, queue: mainQueue, using: { _ in
            self.reloadView()
        })
    }
    
    // init view
    func initView() {
        // set background color
        view.backgroundColor = UIColor.Theme.BackgroundColor
        coffeeCapsuleView.backgroundColor = UIColor.Theme.BackgroundColor
        
        // set color and fonts
        headingLabel.font = UIFont.Theme.HeaderTextFont
        headingLabel.textColor = UIColor.Theme.TextColor
        
        totalCoffeeLabel.font = UIFont.Theme.DefaultTextFontBold
        totalCoffeeLabel.textColor = UIColor.Theme.TextColor
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
    
    @IBAction func userDidSelectBackButton(sender: UILabel) {
        performSegue(withIdentifier: Consts.Seques.UnwindToCoffeeViewController.rawValue, sender: self)
    }
    
}
