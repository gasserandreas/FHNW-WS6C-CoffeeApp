//
//  MainTableViewControllerCell.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 28.02.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

class MainTableViewControllerCell: UITableViewCell {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userFirstnameLabel: UILabel!
    @IBOutlet weak var coffeeCounterLabel: UILabel!
    @IBOutlet weak var userProfileImageView: UIImageView!
    
    func setUserNameLabel(name: String) {
        userNameLabel.text = name
    }
    
    func setUserFirstnameLabel(firstname: String) {
        userFirstnameLabel.text = firstname
    }
    
    func setCoffeeCounterLabel(coffeeCounter: String) {
        coffeeCounterLabel.text = coffeeCounter
    }
    
    func setUserCoffeeCounter(user: User) {
        let counter = Array(user.coffees.values)
            .map({
                (value: CoffeeType) -> Int in
                    return value.counter
            })
            .reduce(0, +)
        coffeeCounterLabel.text = "\(counter)"
    }
}
