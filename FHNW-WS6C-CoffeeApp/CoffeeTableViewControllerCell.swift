//
//  DetailTableViewControllerCell.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 07.03.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

class CoffeeTableViewControllerCell: UITableViewCell {
    
    @IBOutlet weak var coffeeTypeName: UILabel!
    @IBOutlet var coffeeCapsuleView: CoffeeCapsuleView!
    @IBOutlet weak var countUpCoffeeView:UIView!
    @IBOutlet weak var countDownCoffeeView:UIView!
    
    func setView() {
        // set cell style
        backgroundColor = HelperConsts.backgroundColor
        coffeeCapsuleView.backgroundColor = HelperConsts.backgroundColor
    }
    
    func setCoffeeType(coffeeType: CoffeeType) {
        coffeeTypeName.text = coffeeType.name
        coffeeCapsuleView.capsuleColor = HelperMethods.uicolorFromString(coffeeType.color)
    }
}
