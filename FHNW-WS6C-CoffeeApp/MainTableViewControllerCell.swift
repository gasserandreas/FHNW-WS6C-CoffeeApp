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
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var coffeeCounter: UILabel!

    func setUserNameLabelText(_ user: User) {
        self.userName.text = String(format: "%@ %@", user.firstname, user.name)
    }
    
    func setUserCoffeeCounter(_ user: User) {
        let counter = Array(user.coffees.values)
            .map({
                (value: CoffeeType) -> Int in
                    return value.counter
            })
            .reduce(0, +)
        self.coffeeCounter.text = "\(counter)"
    }
}
