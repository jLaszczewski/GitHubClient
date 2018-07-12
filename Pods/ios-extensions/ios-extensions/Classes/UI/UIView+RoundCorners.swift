//
//  UIView+RoundCorners.swift
//
//  Created by Mateusz Tylman on 26.08.2016.
//  Copyright © 2016 Appchance. All rights reserved.
//

import UIKit

extension UIView {
    public func prepareRoundCornersMask(_ corners: UIRectCorner, radius: Int) -> CAShapeLayer {
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        return maskLayer
    }
}
