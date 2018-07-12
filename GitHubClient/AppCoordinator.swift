//
//  AppCoordinator.swift
//  GitHubClient
//
//  Created by Jakub Łaszczewski on 12/07/2018.
//  Copyright © 2018 Jakub Łaszczewski. All rights reserved.
//

import UIKit
import RxSwift

class AppCoordinator: Coordinator {

    var currentPresentedViewController: UIViewController?
    var presentation: CoordinatorPresentation

    fileprivate let disposeBag = DisposeBag()

    required init(presentation: CoordinatorPresentation) {
        self.presentation = presentation

    }

    func start() {
        // (WARNING) Remove the lines below. The initial controller should be replace by the one you're going to use in the app.
        guard let initialViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController() else { return }
        present(viewController: initialViewController)
    }
}
