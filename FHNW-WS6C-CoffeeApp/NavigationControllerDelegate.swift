//
//  NavigationControllerDelegate.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 01.04.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    let animatedTransition = MoveLeftRightViewControllerAnimatedTransitioning()
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animatedTransition
    }
}
