//
//  UITableView+setAndLayoutHeader.swift
//
//  Created by Piotr Gabryszak on 17.08.2016.
//  Copyright © 2016 Appchance. All rights reserved.
//

import UIKit

extension UITableView {
    
    /**
     Sets the tableHeaderView so that the required height can be determined, updates the header's frame and sets it again. This method is a workaround for bug in iOS where it is
     impossible to set table view header with autolayouts where height is not known. 
     
     See: http://stackoverflow.com/a/28102175/237993
     
     IMPORTANT: Call this method in UIViewController.viewDidLayoutSubviews
     
     - parameter header: Header view to set
     */
    public func setAndLayoutTableHeaderView(_ header: UIView) {
        self.tableHeaderView = header
        header.setNeedsLayout()
        header.layoutIfNeeded()
        let height = header.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
        var frame = header.frame
        frame.size.height = height
        header.frame = frame
        self.tableHeaderView = header
    }
}
