//
//  RepositoryTableCellViewModel.swift
//  GitHubClient
//
//  Created by Jakub Łaszczewski on 12/07/2018.
//  Copyright © 2018 Jakub Łaszczewski. All rights reserved.
//

import RxSwift

final class RepositoryTableCellViewModel: TableCellViewModel {

    struct Dependencies {
        var login: BehaviorSubject<String?>?
        var description: BehaviorSubject<String?>?
    }

    fileprivate let dependencies: Dependencies
    var output: Output?
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
        
        output = Output(login: dependencies.login!, description: dependencies.description!)
    }
}

// MARK: - BlackBox
extension RepositoryTableCellViewModel {
    struct Output {
        var login = BehaviorSubject<String?>(value: nil)
        var description = BehaviorSubject<String?>(value: nil)
    }
    
    struct Input {
        
    }
}
