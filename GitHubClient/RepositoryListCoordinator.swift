//  
//  RepositoryListCoordinator.swift
//  GitHubClient
//
//  Created by Jakub Łaszczewski on 12/07/2018.
//  Copyright © 2018 Jakub Łaszczewski. All rights reserved.
//

import UIKit

final class RepositoryListCoordinator: Coordinator {
    var presentation: CoordinatorPresentation
    
    fileprivate let repositoryListController = StoryboardScene.Main.initialScene
    
    init(presentation: CoordinatorPresentation) {
        self.presentation = presentation
    }
    
    var currentPresentedViewController: UIViewController?
    
    func start() {

    }
}
