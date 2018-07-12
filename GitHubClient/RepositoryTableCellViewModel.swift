//
//  RepositoryTableCellViewModel.swift
//  GitHubClient
//
//  Created by Jakub Łaszczewski on 12/07/2018.
//  Copyright © 2018 Jakub Łaszczewski. All rights reserved.
//

import RxSwift

final class RepositoryTableCellViewModel: ViewModel {

    struct Dependencies {

    }

    fileprivate let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()

    }
}
