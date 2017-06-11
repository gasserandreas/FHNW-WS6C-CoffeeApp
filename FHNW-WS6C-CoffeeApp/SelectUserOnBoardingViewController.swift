//
//  SelectUserOnBoardingViewController.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Martin Luepold on 02.05.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

class SelectUserOnBoardingViewController: UIViewController, SelectUserOnBoardingTableViewControllerDelegate {
    
    @IBOutlet weak var fhnwTitleLabel: UILabel!
    @IBOutlet weak var welcomelLabel: UILabel!
    @IBOutlet weak var headingLabel: UILabel!
    
    lazy var dataManager: DataManager = {
        return DataManager.sharedInstance
    }()
    
    var selectedUser: User? {
        get {
            return dataManager.selectedUser()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        initView()
    }
    
    func addObservers() {
        let notificationCenter = NotificationCenter.default
        let mainQueue = OperationQueue.main
        
        // new data
        notificationCenter.addObserver(forName: NSNotification.Name(rawValue: Consts.Notification.DataManagerNewUsersData.rawValue), object: nil, queue: mainQueue, using: { _ in
            self.reloadView()
        })
        
        notificationCenter.addObserver(forName: NSNotification.Name(rawValue: Consts.Notification.DataManagerNewCoffeeData.rawValue), object: nil, queue: mainQueue, using: { _ in
            self.reloadView()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Consts.Seques.ShowOnBoardingSelectUserTableViewControllerSeque.rawValue {
            let destinationController: SelectUserOnBoardingTableViewController = segue.destination as! SelectUserOnBoardingTableViewController
            destinationController.delegate = self
        }
    }
    
    // init view
    func initView() {
        // set background color
        view.backgroundColor = UIColor.Theme.BackgroundColor
        
        // set color and fonts
        fhnwTitleLabel.textColor = UIColor.Theme.TextColor
//        welcomelLabel.font = UIFont.Theme.HeaderTextFont
        welcomelLabel.textColor = UIColor.Theme.TextColor
        
        headingLabel.font = UIFont.Theme.HeaderTextFont
        headingLabel.textColor = UIColor.Theme.TextColor
        
        customLoadView()
    }
    
    // reload view
    func customLoadView() {
        
    }
    
    // perform refresh of view
    func reloadView() {
        // reset all stored values
        customLoadView()
    }
    
    @IBAction func unwindToOnBoardingSelectUserViewController(segue: UIStoryboardSegue) {}
    
    // delegate methods
    func customDidSelectRowAt(sender: SelectUserOnBoardingTableViewController) {
        performSegue(withIdentifier: Consts.Seques.ShowOnBoardingFinalizeViewControllerSeque.rawValue, sender: self)
    }
}
