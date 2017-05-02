//
//  RoundedImageView.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 04.04.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedImageView: UIImageView {
    
    @IBInspectable var borderColor: UIColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
    
    /// saved rendition of border layer
    
    private weak var borderLayer: CAShapeLayer?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // create path
        
        let width = min(bounds.width, bounds.height)
        let path = UIBezierPath(arcCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: width / 2, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        
        // update mask and save for future reference
        
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
        
        // create border layer
        
        let frameLayer = CAShapeLayer()
        frameLayer.path = path.cgPath
        frameLayer.lineWidth = 2
        frameLayer.strokeColor = borderColor.cgColor
        frameLayer.fillColor = nil
        
        // if we had previous border remove it, add new one, and save reference to new one
        
        borderLayer?.removeFromSuperlayer()
        layer.addSublayer(frameLayer)
        borderLayer = frameLayer
    }
}
