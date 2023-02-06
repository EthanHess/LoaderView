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
}
