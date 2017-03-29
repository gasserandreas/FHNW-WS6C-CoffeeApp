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
    
    @IBOutlet weak var coffeeTypeNameLabel: UILabel!
    @IBOutlet weak var coffeeCounterLabel: UILabel!
    @IBOutlet var coffeeCapsuleView: CoffeeCapsuleView!
    @IBOutlet weak var countUpCoffeeView:UIView!
    @IBOutlet weak var countDownCoffeeView:UIView!
    
    lazy var dataManager: DataManager = {
        return DataManager.sharedInstance
    }()
    
    var coffee: CoffeeType?
    
    func setView() {
        // set cell style
        backgroundColor = UIColor.Theme.BackgroundColor
        coffeeCapsuleView.backgroundColor = UIColor.Theme.BackgroundColor
        
        // set labels
        coffeeTypeNameLabel.font = UIFont.Theme.DefaultTextFont
        coffeeTypeNameLabel.textColor = UIColor.Theme.TextColor
        
        coffeeCounterLabel.font = UIFont.Theme.CoffeeCapsuleCounterFont
        coffeeCounterLabel.textColor = UIColor.Theme.BackgroundColor
        
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
        coffeeTypeNameLabel.text = coffeeType.name
        coffeeCapsuleView.capsuleColor = HelperMethods.uicolorFromString(coffeeType.color)
    }
    
    func countUpCoffee() {
        if let _ = coffee {
            dataManager.countUpCoffee(coffee: coffee!)
        }
    }
    
    func countDownCoffee() {
        if let _ = coffee {
            dataManager.countDownCoffee(coffee: coffee!)
        }
    }
}
