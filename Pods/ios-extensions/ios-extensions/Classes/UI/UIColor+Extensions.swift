//
//  UIColor+Extensions.swift
//  ios-extensions
//
//  Created by Mateusz Tylman on 23.01.2017.
//  Copyright © 2017 Appchance. All rights reserved.
//

import UIKit

extension UIColor {
    public func darkenByPercentage(_ percentage: CGFloat) -> UIColor? {
        var h :CGFloat = 0
        var s :CGFloat = 0
        var b :CGFloat = 0
        var a :CGFloat = 0
        
        if getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
            if percentage > 0 {
                b = min(b - percentage, 1.0)
            }
            return UIColor(hue: h, saturation: s, brightness: b, alpha: a)
        }
        return nil
    }
    
    public func lightenByPercentage(_ percentage: CGFloat) -> UIColor? {
        var h :CGFloat = 0
        var s :CGFloat = 0
        var b :CGFloat = 0
        var a :CGFloat = 0
        
        if getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
            if percentage > 0 {
                b = min(b + percentage, 1.0)
            }
            return UIColor(hue: h, saturation: s, brightness: b, alpha: a)
        }
        return nil
    }
}
