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
}
