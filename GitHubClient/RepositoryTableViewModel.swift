//  
//  RepositoryTableViewModel.swift
//  GitHubClient
//
//  Created by Jakub Łaszczewski on 12/07/2018.
//  Copyright © 2018 Jakub Łaszczewski. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class RepositoryTableViewModel: ViewModel {
    let output = Output()
    
    struct Dependencies {

    }
    fileprivate let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - CellDataSource
extension RepositoryTableViewModel: CellsDataSource {
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(forSection section: Int) -> Int {
        return 0
    }
    
    func tableViewCell(forIndexPath indexPath: IndexPath) -> TableViewCell<Any> {
        let row = indexPath.row
        return output.cellViewModels.value[row]
    }
    
    
}

// MARK: - BlackBox
extension RepositoryTableViewModel {
    struct Input {

    }

    struct Output {
        fileprivate let cellViewModels = Variable<[TableViewCell<Any>]>([])
    }
}
