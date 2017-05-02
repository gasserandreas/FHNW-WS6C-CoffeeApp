//
//  CustomAnimator.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 01.04.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

class MoveLeftRightViewControllerAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.35
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        
        let fromVCFrame = fromVC!.view.frame
        let width = toVC!.view.frame.size.width
        containerView.addSubview(toVC!.view)
        
        var moveTuple: (start: CGFloat, end: CGFloat)?
        var option = UIViewAnimationOptions.curveEaseOut
        
        if fromVC!.isKind(of: SelectUserViewController.self) {
            // go right
            moveTuple = goRightTuple(width: width)
        } else if fromVC!.isKind(of: SummaryViewController.self) {
            // go left
            moveTuple = goLeftTuple(width: width)
        } else {
            // start view controller, decide if left or right
            if toVC!.isKind(of: SelectUserViewController.self) {
                moveTuple = goLeftTuple(width: width)
            } else {
                moveTuple = goRightTuple(width: width)
            }
        }
        
        toVC!.view.frame = fromVCFrame.offsetBy(dx: moveTuple!.start, dy: 0)
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0.0, options: option, animations: {
            fromVC!.view.frame = fromVCFrame.offsetBy(dx: moveTuple!.end, dy: 0)
            toVC!.view.frame = fromVCFrame
        }, completion: { finished in
            fromVC!.view.frame = fromVCFrame
            let cancelled = transitionContext.transitionWasCancelled
            transitionContext.completeTransition(!cancelled)
        })
    }
    
    private func goLeftTuple(width: CGFloat) -> (start: CGFloat, end: CGFloat) {
        return (start: -width, end: width)
    }
    
    private func goRightTuple(width: CGFloat) -> (start: CGFloat, end: CGFloat) {
        return (start: width, end: -width)
    }
}
