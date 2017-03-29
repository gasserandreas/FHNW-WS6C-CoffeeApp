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
        static let DefaultColor = HelperMethods.uicolorFromHex(0x4D351D)
        static let TopBarBackgroundColor = HelperMethods.uicolorFromHex(0x2F445B)
        static let BackgroundColor = HelperMethods.uicolorFromHex(0xE4DDD9)
        static let DividerColor = HelperMethods.uicolorFromHex(0xBCB5B1)
        static let ImageBorderColor = UIColor.Theme.DefaultColor
        static let TextColor = UIColor.Theme.DefaultColor
        static let ShadowColor = UIColor.init(red: 77/255, green: 53/255, blue: 39/255, alpha: 0.3)
    }
}
