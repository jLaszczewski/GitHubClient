//
//  UIWindow+RootViewController.swift
//
//  Created by Piotr Gabryszak on 05.07.2016.
//  Copyright © 2016 Appchance. All rights reserved.
//

import UIKit

extension UIWindow {
    
    // Fix for http://stackoverflow.com/a/27153956/849645
    // see http://stackoverflow.com/questions/26763020/leaking-views-when-changing-rootviewcontroller-inside-transitionwithview
    public func setRootViewController(_ newRootViewController: UIViewController, transition: CATransition? = nil) {
        
        let previousViewController = rootViewController
        
        if let transition = transition {
            // Add the transition
            layer.add(transition, forKey: kCATransition)
        }
        
        rootViewController = newRootViewController
        
        // Update status bar appearance using the new view controllers appearance - animate if needed
        if UIView.areAnimationsEnabled {
            UIView.animate(withDuration: CATransaction.animationDuration(), animations: {
                newRootViewController.setNeedsStatusBarAppearanceUpdate()
            }) 
        } else {
            newRootViewController.setNeedsStatusBarAppearanceUpdate()
        }
        
        // The presenting view controllers view doesn't get removed from the window as its currently transistioning and presenting a view controller
        if let transitionViewClass = NSClassFromString("UITransitionView") {
            for subview in subviews where subview.isKind(of: transitionViewClass) {
                subview.removeFromSuperview()
            }
        }
        if let previousViewController = previousViewController {
            // Allow the view controller to be deallocated
            previousViewController.dismiss(animated: false) {
                // Remove the root view in case its still showing
                previousViewController.view.removeFromSuperview()
            }
        }
    }
    
    // based on http://stackoverflow.com/questions/22882078/how-to-get-visible-viewcontroller-from-app-delegate-when-using-storyboard
    public func getVisibleViewController(_ aRootViewController: UIViewController? = nil) -> UIViewController? {
        var rootViewController = aRootViewController
        
        if rootViewController == nil {
            rootViewController = self.rootViewController
        }
        
        if let presented = rootViewController?.presentedViewController {
            return getVisibleViewController(presented)
        }
        
        if let navController = rootViewController as? UINavigationController {
            return navController.viewControllers.last!
        }
        
        if let tabBarController = rootViewController as? UITabBarController {
            return getVisibleViewController(tabBarController.selectedViewController!)
        }
        
        return rootViewController
    }
}
