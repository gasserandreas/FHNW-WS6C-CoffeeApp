//
//  DetailTableViewControllerCell.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 07.03.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

protocol CoffeeTableViewControllerCellDelegate {
    func coffeeTableViewControllerCellDelegateCoffeeCountUp(_ cell:CoffeeTableViewControllerCell, coffee: CoffeeType)
    func coffeeTableViewControllerCellDelegateCoffeeCountDown(_ cell:CoffeeTableViewControllerCell, coffee: CoffeeType)
}

class CoffeeTableViewControllerCell: UITableViewCell {
    
    @IBOutlet weak var coffeeTypeName: UILabel!
    @IBOutlet var coffeeCapsuleView: CoffeeCapsuleView!
    @IBOutlet weak var countUpCoffeeView:UIView!
    @IBOutlet weak var countDownCoffeeView:UIView!
    
    var coffee: CoffeeType?
    var delegate: CoffeeTableViewController?
    
    func setView() {
        // set cell style
        backgroundColor = HelperConsts.backgroundColor
        coffeeCapsuleView.backgroundColor = HelperConsts.backgroundColor
        
        // create gesture recognizers
        let countUpCoffeeTabRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.countUpCoffee))
        let countDownCoffeeTabRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.countDownCoffee))
        
        // configure recognizers
        countUpCoffeeTabRecognizer.cancelsTouchesInView = false
        countDownCoffeeTabRecognizer.cancelsTouchesInView = false
        
        // add to view
        countUpCoffeeView.addGestureRecognizer(countUpCoffeeTabRecognizer)
        countDownCoffeeView.addGestureRecognizer(countDownCoffeeTabRecognizer)
    }
    
    func setCoffeeType(coffeeType: CoffeeType) {
        coffee = coffeeType
        coffeeTypeName.text = coffeeType.name
        coffeeCapsuleView.capsuleColor = HelperMethods.uicolorFromString(coffeeType.color)
    }
    
    func countUpCoffee() {
        delegate!.coffeeTableViewControllerCellDelegateCoffeeCountUp(self, coffee: coffee!)
    }
    
    func countDownCoffee() {
        delegate!.coffeeTableViewControllerCellDelegateCoffeeCountDown(self, coffee: coffee!)
    }
}
