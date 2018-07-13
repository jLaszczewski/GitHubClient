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
    
    var repositoryTableData = Variable<[RepositoryTableModel]?>(nil)
    
    struct Dependencies {

    }
    fileprivate let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
        
        setupRxObserver()
        getRepositories()
    }
}

// MARK: - RxObservables
extension RepositoryTableViewModel {
    fileprivate func setupRxObserver() {
        setupRepositoryTableDataObserver()
    }
    
    private func setupRepositoryTableDataObserver() {
        repositoryTableData.asObservable()
            .subscribe(onNext: { _ in
                
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Tools
extension RepositoryTableViewModel {
    fileprivate func getRepositories() {
        if let path = Bundle.main.path(forResource: "dumbJSON", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let tableContent = try JSONDecoder().decode([RepositoryTableModel].self, from: data)
                
                for row in tableContent {
                    output.cellViewModels.value.append(
                        RepositoryTableCellViewModel(dependencies: RepositoryTableCellViewModel.Dependencies(login: BehaviorSubject<String?>(value: row.owner?.login), description: BehaviorSubject<String?>(value: row.description)))
                    )
                }
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
        return output.cellViewModels.value.count
    }

    func tableViewCell(forIndexPath indexPath: IndexPath) -> TableCellViewModel {
        let row = indexPath.row
        return output.cellViewModels.value[row]
    }
    
}

// MARK: - BlackBox
extension RepositoryTableViewModel {
    struct Input {

    }

    struct Output {
        fileprivate let cellViewModels = Variable<[RepositoryTableCellViewModel]>([])
    }
}
