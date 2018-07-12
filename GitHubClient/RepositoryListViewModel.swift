//  
//  RepositoryListViewModel.swift
//  GitHubClient
//
//  Created by Jakub Łaszczewski on 12/07/2018.
//  Copyright © 2018 Jakub Łaszczewski. All rights reserved.
//

import Foundation

final class RepositoryListViewModel: ViewModel {
    struct Dependencies {

    }
    fileprivate let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - BlackBox
extension RepositoryListViewModel {
    struct Input {

    }

    struct Output {

    }
}
