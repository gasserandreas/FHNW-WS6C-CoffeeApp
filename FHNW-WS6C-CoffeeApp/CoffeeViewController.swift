//
//  DetailViewController.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 07.03.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

class CoffeeViewController: UIViewController, SelectUserViewControllerDelegate, SummaryViewControllerDelegate, CoffeeTableViewControllerDelegate {

    lazy var dataManager: DataManager = {
        return DataManager.sharedInstance
    }()
    
    var selectedUser: User?
    
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var userProfileImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        selectedUser = dataManager.selectedUser()
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
        
        notificationCenter.addObserver(forName: NSNotification.Name(rawValue: HelperConsts.DataManagerNewCoffeeDataNotification), object: nil, queue: mainQueue, using: { _ in
            self.reloadView()
        })
    }
    
    // init view
    func initView() {
        // set background color
        view.backgroundColor = HelperConsts.backgroundColor
        
        userProfileImageView.layer.cornerRadius = userProfileImageView.frame.size.width / 2
        userProfileImageView.clipsToBounds = true
        userProfileImageView.layer.borderWidth = 1.0
        userProfileImageView.layer.borderColor = HelperConsts.imageBorderColor.cgColor
    }
    
    func customLoadView() {
        // set name
        if let user = selectedUser {
            let url = URL(string: HelperMethods.getImageEndPointString(imageName: user.imageName))!
            NSLog("\(url)")
            userProfileImageView.af_setImage(withURL: url)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == HelperConsts.showSelectUserViewControllerSeque {
            let destinationController: SelectUserViewController = segue.destination as! SelectUserViewController
            destinationController.delegate = self
        } else if segue.identifier == HelperConsts.showSummaryViewControllerSeque {
            let destinationController: SummaryViewController = segue.destination as! SummaryViewController
            destinationController.delegate = self
        } else if segue.identifier == HelperConsts.showCoffeeTableViewControllerSeque {
            let destinationController: CoffeeTableViewController = segue.destination as! CoffeeTableViewController
            destinationController.delegate = self
        }

    }
    
    // perform refresh of view
    func reloadView() {
        // reset all stored values
        customLoadView()
    }
    
    // delegate methods
    internal func selectUserViewControllerDelegateDidSelectUser(_ controller: SelectUserViewController) {
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    
    internal func summaryViewControllerDelegateDidSelectBack(_ controller: SummaryViewController) {
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    
    internal func coffeeTableViewControllerDelegateCountUpCoffee(_ controller: CoffeeTableViewController, coffee: CoffeeType) {
        dataManager.countUpCoffee(coffee: coffee)
    }
    
    internal func coffeeTableViewControllerDelegateCountDownCoffee(_ controller: CoffeeTableViewController, coffee: CoffeeType) {
        dataManager.countDownCoffee(coffee: coffee)
    }
    
    @IBAction func userDidSelectShowSelectUserViewController(sender: UIImageView) {
        performSegue(withIdentifier: HelperConsts.showSelectUserViewControllerSeque, sender: self)
    }
}
