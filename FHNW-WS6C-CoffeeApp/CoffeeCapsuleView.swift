//
//  CoffeeCapsuleView.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 08.03.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit

@IBDesignable
class CoffeeCapsuleView: UIView {
    
    @IBInspectable var capsuleColor: UIColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
    
    override func draw(_ rect: CGRect) {
        CoffeeCapsule.drawCoffeeCapsule(frame: bounds, color: capsuleColor)
    }
}
