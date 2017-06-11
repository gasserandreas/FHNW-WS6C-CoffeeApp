//
//  SummaryTableViewControllerCell.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Martin Luepold on 10.03.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

class SummaryTableViewControllerCell: UITableViewCell {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var coffeeCounterLabel: UILabel!
    
    func setView() {
        // set cell style
        backgroundColor = UIColor.Theme.BackgroundColor
        
        // set label
        userNameLabel.font = UIFont.Theme.DefaultTextFont
        userNameLabel.textColor = UIColor.Theme.TextColor
        
        coffeeCounterLabel.font = UIFont.Theme.DefaultTextFont
        coffeeCounterLabel.textColor = UIColor.Theme.TextColor
    }
    
    func setUser(user: User) {
        var coffees = 0
        for coffee in user.coffees {
            coffees += Int(coffee.value)!
        }
        coffeeCounterLabel.text = "\(coffees)"
        userNameLabel.text = "\(user.firstname) \(user.name)"
    }
}
