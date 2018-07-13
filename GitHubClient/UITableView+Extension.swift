//
//  UITableView+Extension.swift
//  GitHubClient
//
//  Created by Jakub Łaszczewski on 13/07/2018.
//  Copyright © 2018 Jakub Łaszczewski. All rights reserved.
//

import UIKit
import ios_extensions

extension UITableView {
    public func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
