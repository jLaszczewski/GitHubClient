//
//  UIView+Shadow.swift
//
//  Created by Kamil Powałowski on 11.08.2016.
//  Copyright © 2016 Appchance. All rights reserved.
//

import UIKit

extension UIView {
    public func showShadow(_ opacity: Float, blur: CGFloat, offset: CGSize, shouldRasterize: Bool = true) {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = blur
        layer.shadowOffset = offset
        layer.shouldRasterize = shouldRasterize
        
        if shouldRasterize {
            layer.rasterizationScale = UIScreen.main.scale
        }
    }
    
    public func hideShadow() {
        layer.shadowColor = UIColor.clear.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 0
        layer.shadowOpacity = 0
        layer.shouldRasterize = false
    }
}
