//
//  Extension.swift
//  LoadingView
//
//  Created by Ethan Hess on 2/6/23.
//

import UIKit

extension UIView {
    func addShadow(_ color: UIColor) {
        let layer = self.layer
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = 0.5 //alpha
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 2
        layer.shouldRasterize = false //rasterize means convert image into pixels (bitmap) (Causing blurrines here!, is really espensive)
        
        //A bitmap is an image file format which is used to store digital images. (a map of bits)
    }
    
    func addBackgroundGradient(_ add: Bool) {
        if add == true {
            let gradient = CAGradientLayer()
            gradient.frame = self.frame
            gradient.colors = [UIColor.white.cgColor, UIColor.gray.cgColor, UIColor.white.cgColor]
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
            gradient.locations = [0.0, 0.5, 1.0]
            self.layer.addSublayer(gradient)
                
            let animation = CABasicAnimation(keyPath: "transform.translation.x")
            animation.fromValue = -self.frame.width
            animation.toValue = self.frame.width
            animation.duration = 1.5
            animation.repeatCount = .infinity
                
            gradient.add(animation, forKey: "loadingAnimation")
        } else { //Remove when loading is done
                
        }
    }
}
