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
    
    @IBOutlet weak var countUpCoffeeView: UIView!
    @IBOutlet weak var countUpGestureRecognizerView: UIView!
    
    @IBOutlet weak var countDownCoffeeView: UIView!
    @IBOutlet weak var countDownGestureRecognizerView: UIView!
    
    lazy var dataManager: DataManager = {
        return DataManager.sharedInstance
    }()
    
    var model: TableViewCellModel?
    
    var coffee: CoffeeType? {
        get {
            return model?.data as? CoffeeType
        }
    }
    
    
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
        countUpGestureRecognizerView.addGestureRecognizer(countUpCoffeeTabRecognizer)
        countDownGestureRecognizerView.addGestureRecognizer(countDownCoffeeTabRecognizer)
        
    }
    
    func setModel(model: TableViewCellModel) {
        self.model = model
        coffeeTypeNameLabel.text = coffee!.name
        coffeeCapsuleView.capsuleColor = HelperMethods.uicolorFromString(coffee!.color)
    }
    
    func setCoffeeCounterLabel(counter: String) {
        coffeeCounterLabel.text = counter
    }
    
    func countUpCoffee() {
        if let _ = coffee {
            UIView.animate(withDuration: 0.1, delay: 0.0, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
                self.countUpCoffeeView.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
            }, completion: { (success) in
                UIView.animate(withDuration: 0.05, delay: 0.05, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
                    self.countUpCoffeeView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }, completion: { (success) in
                    self.dataManager.countUpCoffee(coffee: self.coffee!)
                })
            })
        }
    }
    
    func countDownCoffee() {
        if let _ = coffee {
            UIView.animate(withDuration: 0.1, delay: 0.0, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
                self.countDownCoffeeView.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
            }, completion: { (success) in
                UIView.animate(withDuration: 0.05, delay: 0.05, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
                    self.countDownCoffeeView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }, completion: { (success) in
                    self.dataManager.countDownCoffee(coffee: self.coffee!)
                })
            })

        }
    }
}
