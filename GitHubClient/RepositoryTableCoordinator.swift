//  
//  RepositoryTableCoordinator.swift
//  GitHubClient
//
//  Created by Jakub Łaszczewski on 12/07/2018.
//  Copyright © 2018 Jakub Łaszczewski. All rights reserved.
//

import UIKit

final class RepositoryTableCoordinator: Coordinator {
    var presentation: CoordinatorPresentation
    
    fileprivate let repositoryTableController = StoryboardScene.Main.initialScene
    
    init(presentation: CoordinatorPresentation) {
        self.presentation = presentation
        
        guard let repositoryTableNavigationController = UIStoryboard.init(name: "RepositoryTable", bundle: nil).instantiateInitialViewController() as? RepositoryTableNavigationController else { return }
        
        guard let repositoryTableViewController = repositoryTableNavigationController.topViewController as? RepositoryTableViewController else { return }
        let repositoryTableViewModel = RepositoryTableViewModel(dependencies: RepositoryTableViewModel.Dependencies(listService: ListService()))
        
        repositoryTableViewController.viewModel = repositoryTableViewModel
        
        present(viewController: repositoryTableNavigationController)
    }
    
    var currentPresentedViewController: UIViewController?
    
    func start() {
        
    }
}
