//
//  Consts.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 27.02.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation
import QuartzCore

struct HelperConsts {
    // controller

    // segues
    static let showCoffeeTableViewControllerSeque = "showCoffeeTableViewControllerSeque"
    static let showSelectUserViewControllerSeque = "showSelectUserViewControllerSeque"
    static let showSelectUserTableViewControllerSeque = "showSelectUserTableViewControllerSeque"
    static let showSummaryViewControllerSeque = "showSummaryViewControllerSeque"
    static let showSummaryTableViewControllerSeque = "showSummaryTableViewControllerSeque"

    // notifications
    static let DataManagerNewCoffeeDataNotification = "DataManagerNewCoffeeDataNotification"
    static let DataManagerNewUserDataNotification = "DataManagerNewUserDataNotification"
    
    static let CommunicationManagerNewUserFileNotification = "CommunicationManagerNewUserFileNotification"
    static let CommunicationManagerNewCoffeeFileNotification = "CommunicationManagerNewCoffeeFileNotification"
    
    // colors
    static let topBarBackgroundColor = HelperMethods.uicolorFromHex(0x2F445B)
    static let backgroundColor = HelperMethods.uicolorFromHex(0xE4DDD9)
    static let defaultColor = HelperMethods.uicolorFromHex(0x4D351D)
    static let divicerColor = HelperMethods.uicolorFromHex(0xBCB5B1)
    static let imageBorderColor = HelperConsts.defaultColor
    
    // data pahts
    static let userJsonDataPathName = "user"
    static let coffeeJsonDataPathName = "coffee"
}
