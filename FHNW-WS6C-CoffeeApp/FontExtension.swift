//
//  FontExtension.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 28.03.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

extension UIFont {
    struct Theme {
        static let DefaultTextFont = UIFont.init(name: "SFUIText-Light", size: 20)!
        static let DefaultTextFontBold = UIFont.init(name: "SFUIText-Medium", size: 20)!
        static let CoffeeCapsuleCounterFont = UIFont.init(name: "SFUIText-Medium", size: 16)!
        static let HeaderTextFont = UIFont.init(name: "SFUIText-Light", size: 24)!
    }
}

/*
 enum FontName {
 enum SFUIText: String {
 case Light = "SFUIText-Light"
 case Regular = "SFUIText-Regular"
 case Medium = "SFUIText-Medium"
 case Semibold = "SFUIText-Semibold"
 }
 enum Slabo: String {
 case Regular = "SlaboRegular"
 }
 }*/

/*
 // fonts
 static let defaultTextFont = UIFont.init(name: HelperConsts.defaultTextFontName, size: 20)!
 static let headerTextFont = UIFont.init(name: HelperConsts.headerTextFontName, size: 24)!
 */
