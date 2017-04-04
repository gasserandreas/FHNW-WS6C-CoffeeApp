//
//  ColorExtension.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 28.03.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
    struct Theme {
        static let DefaultColor = UIColor.init(red: 106/255, green: 94/255, blue: 96/255, alpha: 1)
        static let TopBarBackgroundColor = HelperMethods.uicolorFromHex(0x2F445B)
        static let BackgroundColor = UIColor.init(red: 245/255, green: 243/255, blue: 240/255, alpha: 1)
        static let DividerColor = HelperMethods.uicolorFromHex(0xBCB5B1)
        static let ImageBorderColor = UIColor.Theme.DefaultColor
        static let TextColor = UIColor.Theme.DefaultColor
        static let ShadowColor = UIColor.init(red: 77/255, green: 53/255, blue: 39/255, alpha: 0.3)
    }
}
