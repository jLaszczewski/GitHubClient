//  
//  RepositoryListViewController.swift
//  GitHubClient
//
//  Created by Jakub Łaszczewski on 12/07/2018.
//  Copyright © 2018 Jakub Łaszczewski. All rights reserved.
//

import UIKit

final class RepositoryListViewController: View {

    // MARK: Properties
    var viewModel: RepositoryListViewModel!

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareViewController()
        setupRxObservers()
    }
}

// MARK: - Preparation
private extension RepositoryListViewController {
    func prepareViewController() {

    }
}


// MARK: - RxObservers
private extension RepositoryListViewController {
    func setupRxObservers() {
      configure(with: viewModel)

    }
}
