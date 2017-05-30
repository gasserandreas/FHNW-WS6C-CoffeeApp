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
        case ShowOnBoardingSelectUserTableViewControllerSeque = "showOnBoardingSelectUserTableViewControllerSeque"
        case ShowOnBoardingFinalizeViewControllerSeque = "showOnBoardingFinalizeViewControllerSeque"
        case UnwindToOnBoardingSelectUserViewController = "unwindToOnBoardingSelectUserViewControllerSegue"
    }
    enum Notification: String {
        case DataManagerNewCoffeeData = "DataManagerNewCoffeeDataNotification"
        case DataManagerNewUserData = "DataManagerNewUserDataNotification"
        case DataManagerNewUsersData = "DataManagerNewUsersDataNotification"
    }
    enum UserDefaults: String {
        case UserId = "UserId"
        case UserOnBoarded = "UserOnBoarded"
    }
    enum ViewControllerIdentifier: String {
        case OnBoardingViewController = "OnBoardingViewController"
    }
    enum StoryBoard: String {
        case Main = "Main"
        case OnBoarding = "OnBoarding"
    }
}
