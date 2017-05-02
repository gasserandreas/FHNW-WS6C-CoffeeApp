//
//  Segues.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 28.03.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

struct Consts {
    enum Status {
        case Test
        case Prod
    }
    enum Seques: String {
        case ShowCoffeeTableViewController = "showCoffeeTableViewControllerSeque"
        case ShowSelectUserViewController = "showSelectUserViewControllerSeque"
        case ShowSelectUserTableViewController = "showSelectUserTableViewControllerSeque"
        case ShowSummaryViewController = "showSummaryViewControllerSeque"
        case ShowSummaryTableViewController = "showSummaryTableViewControllerSeque"
        case UnwindToCoffeeViewController = "unwindToCoffeeViewControllerSeque"
    }
    enum Notification: String {
        case DataManagerNewCoffeeData = "DataManagerNewCoffeeDataNotification"
        case DataManagerNewUserData = "DataManagerNewUserDataNotification"
        case DataManagerNewUsersData = "DataManagerNewUsersDataNotification"
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
    }
    */
}
