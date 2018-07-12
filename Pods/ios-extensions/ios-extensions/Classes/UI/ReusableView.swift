//
//  ReusableView.swift
//
//  Created by Piotr Gabryszak on 20.01.2017.
//  Copyright © 2017 Appchance. All rights reserved.
//

import UIKit

public protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    public static var reuseIdentifier: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
}

extension UITableViewCell: ReusableView {}
extension UICollectionReusableView: ReusableView {}
extension UITableViewHeaderFooterView: ReusableView {}
