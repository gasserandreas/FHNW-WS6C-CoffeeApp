//
//  UserImageView.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 28.03.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import UIKit
import Foundation

class UserImageView: UIView {
    var shouldSetupConstraints = true
    
    override func draw(_ rect: CGRect) {
        // manipulate layers
        
    }
    
    /*
    var imageView: UIImageView!
    var imageViewShadow: UIView!
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextAddRect(c, CGRectMake(10, 10, 80, 80))
        CGContextSetStrokeColorWithColor(c , UIColor.redColor().CGColor)
        CGContextStrokePath(c)
        /*
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(context, 4.0);
        CGContextSetStrokeColorWithColor(context, [[UIColor blueColor] CGColor]);
        CGContextAddRect(context, self.frame);
        CGContextStrokePath(context);
        */
    }
    */
    
    /*
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let radius = imageView.frame.size.width / 2
        
        imageView = UIImageView(frame: CGRect.zero)
        imageView.layer.cornerRadius = radius
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.Theme.ImageBorderColor.cgColor
        
        imageViewShadow = UIView(frame: CGRect.zero)
        imageViewShadow.layer.cornerRadius = radius
        imageViewShadow.layer.masksToBounds = false
        imageViewShadow.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        imageViewShadow.layer.shadowColor = UIColor.black.cgColor
        imageViewShadow.layer.shadowOpacity = 0.33
        imageViewShadow.layer.shadowRadius = 5
        
        // set image
        let url = URL(string: HelperMethods.getImageEndPointString(imageName: "15f09b9ab74340e0ac9e436fdc012b60"))!
        imageView.af_setImage(withURL: url)
        
        self.addSubview(imageView)
        self.addSubview(imageViewShadow)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func updateConstraints() {
        if(shouldSetupConstraints) {
            // AutoLayout constraints
            
            /*
            let imageViewTop = NSLaiyoutConstraint.init(item: imageView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)
            let imageViewRight = NSLayoutConstraint.init(item: imageView, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.right, multiplier: 1, constant: 0)
            let imageViewBottom = NSLayoutConstraint.init(item: imageView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0)
            let imageViewLeft = NSLayoutConstraint.init(item: imageView, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 0)
            
            let imageViewConstraints = [imageViewTop, imageViewRight, imageViewBottom, imageViewLeft]
            
            imageView.addConstraints(imageViewConstraints)
            
            //imageView.addConstraint(constraints: NSLayoutConstraint.)
            */
 
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    */
    
}
