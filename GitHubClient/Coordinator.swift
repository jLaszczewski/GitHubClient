//
//  Coordinator.swift
//  GitHubClient
//
//  Created by Jakub Łaszczewski on 12/07/2018.
//  Copyright © 2018 Jakub Łaszczewski. All rights reserved.
//

import Foundation

import UIKit

enum CoordinatorPresentation {
    case push(navigationController: NavigationController)
    case present(presentingController: ViewController)
    case window(window: UIWindow)
    case tabBar
}

protocol Coordinator: class {
    var presentation: CoordinatorPresentation { get set }
    init(presentation: CoordinatorPresentation)
    
    var currentPresentedViewController: UIViewController? { get set }
    
    func start()
}

extension Coordinator {
    func present(viewController: UIViewController) {
        currentPresentedViewController = viewController
        
        switch presentation {
        case .present(let presentingController):
            presentingController.present(viewController, animated: true, completion: nil)
        case .push(let navigationController):
            if let navigationControllerToPush = viewController as? NavigationController, let topViewController = navigationControllerToPush.topViewController {
                currentPresentedViewController = topViewController
                navigationController.pushViewController(topViewController, animated: true)
            } else {
                navigationController.pushViewController(viewController, animated: true)
            }
        case .window(let window):
            window.replaceRootViewControllerWith(viewController, animated: true, completion: nil)
        case .tabBar: break
        }
    }
}
