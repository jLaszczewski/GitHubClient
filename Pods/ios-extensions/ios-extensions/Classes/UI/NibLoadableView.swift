//
//  NibLoadableView.swift
//
//  Created by Piotr Gabryszak on 20.01.2017.
//  Copyright © 2017 Appchance. All rights reserved.
//

import UIKit

public protocol NibLoadableView: class {
    static var nibName: String { get }
    static func fromNib() -> Self
}

extension NibLoadableView where Self: UIView {
    public static var nibName: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
    
    public static func fromNib() -> Self {
        return loadFromNibNamed(nibName)!
    }
    
    private static func loadFromNibNamed(_ nibNamed: String, bundle: Bundle? = nil) -> Self? {
        return UINib(nibName: nibNamed, bundle: bundle).instantiate(withOwner: nil, options: nil).first as? Self
    }
}
