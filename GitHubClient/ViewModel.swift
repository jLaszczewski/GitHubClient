//
//  ViewModel.swift
//  GitHubClient
//
//  Created by Jakub Łaszczewski on 12/07/2018.
//  Copyright © 2018 Jakub Łaszczewski. All rights reserved.
//

import Foundation
import RxSwift

class ViewModel {
    let disposeBag = DisposeBag()
}

class TableCellViewModel: ViewModel {
    
}

protocol CellsDataSource {
    func numberOfSections() -> Int
    func numberOfRows(forSection section: Int) -> Int
    func tableViewCell(forIndexPath indexPath: IndexPath) -> TableCellViewModel
}
