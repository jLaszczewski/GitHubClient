//
//  UICollectionView+Extensions.swift
//  ios-extensions
//
//  Created by Piotr Gabryszak on 20.01.2017.
//  Copyright © 2017 Appchance. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    public func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView {
        self.register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    public func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView & NibLoadableView {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    public func register<T: UICollectionReusableView>(_: T.Type, forSupplementaryViewOfKind supplementaryViewOfKind: String) where T: ReusableView & NibLoadableView {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        self.register(nib, forSupplementaryViewOfKind: supplementaryViewOfKind, withReuseIdentifier: T.reuseIdentifier)
    }
    
    public func dequeueReusableView<T: UICollectionReusableView>(elementKind: String, forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let view = self.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue view with identifier: \(T.reuseIdentifier)")
        }
        return view
    }
}
