//
//  UIImage+Color.swift
//
//  Created by Kamil Powałowski on 06.10.2016.
//  Copyright © 2016 Appchance. All rights reserved.
//

import UIKit

extension UIImage {
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1), scaled: Bool = false) {
        let scaledSize: CGSize
        
        if scaled {
            let scale = UIScreen.main.scale
            scaledSize = CGSize(width: size.width / scale, height: size.height / scale)
        } else {
            scaledSize = size
        }
        
        let rect = CGRect(origin: .zero, size: scaledSize)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
