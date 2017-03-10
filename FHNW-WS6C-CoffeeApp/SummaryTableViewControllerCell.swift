//
//  SummaryTableViewControllerCell.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 10.03.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

class SummaryTableViewControllerCell: UITableViewCell {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var coffeeCounter: UILabel!
    
    func setView() {
        // set cell style
        backgroundColor = HelperConsts.backgroundColor
    }
    
    func setUser(user: User) {
        
        userName.text = "\(user.firstname) \(user.name)"
    }
}
