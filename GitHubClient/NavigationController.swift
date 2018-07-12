//
//  NavigationController.swift
//  GitHubClient
//
//  Created by Jakub Łaszczewski on 12/07/2018.
//  Copyright © 2018 Jakub Łaszczewski. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    var output = Output()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
}

// MARK: - UINavigationControllerDelegate
extension NavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from), !navigationController.viewControllers.contains(fromViewController) else {
            return
        }
        log.info("Did back from \(type(of: fromViewController))")
        output.coordinator.didBackFromViewController?.perform(param: fromViewController)
    }
}


extension NavigationController {
    struct Output {
        var coordinator = CoordinatorOutput()
    }
    
    struct CoordinatorOutput {
        var didBackFromViewController: Action<UIViewController>?
    }
}
