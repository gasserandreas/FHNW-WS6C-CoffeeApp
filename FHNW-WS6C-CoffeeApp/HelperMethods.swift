//
//  HelperMethods.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 27.02.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation
import QuartzCore

struct HelperMethods {
    
    // color helper method
    static func uicolorFromHex(_ rgbValue:UInt32) -> UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
    
    static func uicolorFromString(_ hexValue:String, alpha:CGFloat? = 1.0) -> UIColor {
        // Convert hex string to an integer
        var uiInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: hexValue)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = NSCharacterSet(charactersIn: "#") as CharacterSet
        // Scan hex value
        scanner.scanHexInt32(&uiInt)
        
        let hexInt = Int(uiInt)
        let red = CGFloat((hexInt & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexInt & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexInt & 0xff) >> 0) / 255.0
        let alpha = alpha!
        // Create color object, specifying alpha as well
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }
    
    static func setStatusBar(_ view: UIView) {
        // create view, set background add to parent view
        let newView = UIView()
        newView.backgroundColor = UIColor.black
        view.addSubview(newView)
        
        // pin view to left, right, top and set size to 30 (default)
        let leftPinConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutAttribute.leadingMargin, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.leadingMargin, multiplier: 1.0, constant: -16)
        
        let rightPinConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutAttribute.trailingMargin, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.trailingMargin, multiplier: 1.0, constant: 16)
        
        let topPinConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutAttribute.topMargin, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.topMargin, multiplier: 1.0, constant: 0)
        
        let heightConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 30)
        
        // when using autolayout with a view, setTranslatesAutoresizingMaskIntoConstraints have to be set to false
        //newView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // add constraints to view
        NSLayoutConstraint.activate([leftPinConstraint, rightPinConstraint, topPinConstraint, heightConstraint])
    }
    
    static func sortUserArray(_ users: [User]) -> Array<User> {
        return users.sorted(by: { $0.name < $1.name })
    }
    
    static func sortCoffeeTypeArray(_ coffeeTypes: [CoffeeType]) -> Array<CoffeeType> {
        return coffeeTypes.sorted(by: { $0.name < $1.name })
    }
    
    static func getUserApiEndPointString() -> String {
        return "\(getApiUrlString())\(HelperConsts.userEndPoint)"
    }
    
    static func getCoffeeApiEndPointString() -> String {
        return "\(getApiUrlString())\(HelperConsts.coffeeEndPoint)"
    }
    
    static func getImageEndPointString(imageName: String) -> String {
        return "\(getServerUrl())\(HelperConsts.imagesEndPoint)\(imageName).jpg"
    }
    
    static func postCountUpCoffee(user: User, coffee: CoffeeType) -> String {
        return "\(HelperMethods.getUserApiEndPointString())\(user.id)/countUpCoffee/\(coffee.id)"
    }
    
    static func postCountDownCoffee(user: User, coffee: CoffeeType) -> String {
        return "\(HelperMethods.getUserApiEndPointString())\(user.id)/countDownCoffee/\(coffee.id)"
    }
    
    // private funcs
    static func getServerUrl() -> String {
        return HelperConsts.testing ? HelperConsts.testServerUrl : HelperConsts.prodServerUrl
    }
    
    static func getApiUrlString() -> String {
        let url = "\(getServerUrl())\(HelperConsts.apiBase)\(HelperConsts.apiVersion)"
        return url
    }

}
