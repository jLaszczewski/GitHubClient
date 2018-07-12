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
        let repositoryTableCoordinator = RepositoryTableCoordinator(presentation: presentation)
        repositoryTableCoordinator.start()

    }
}
