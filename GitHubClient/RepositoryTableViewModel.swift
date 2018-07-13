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
        super.init()
        
        self.getRepositories()
    }
}

// MARK: - Tools
extension RepositoryTableViewModel {
    fileprivate func getRepositories() {
        if let path = Bundle.main.path(forResource: "dumbJSON", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let tableContent = try? JSONDecoder().decode([RepositoryTableModel].self, from: data)
                print(tableContent)
            } catch {
                print("Problem with json")
            }
        }
        
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
