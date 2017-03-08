//
//  DetailTableViewControllerCell.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 07.03.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

class DetailTableViewControllerCell: UITableViewCell {
    
    @IBOutlet weak var coffeeTypeName: UILabel!
    @IBOutlet weak var coffeeCounterLabel: UILabel!
    @IBOutlet weak var coffeeTypeView: UIView!
    
    func coffeeTypeName(name: String) {
        coffeeTypeName.text = name
    }
    
    func setCoffeeCounterLabel(coffeeCounter: String) {
        coffeeCounterLabel.text = coffeeCounter
    }
}
