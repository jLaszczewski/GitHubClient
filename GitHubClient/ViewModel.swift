//
//  ViewModel.swift
//  GitHubClient
//
//  Created by Jakub Łaszczewski on 12/07/2018.
//  Copyright © 2018 Jakub Łaszczewski. All rights reserved.
//

import Foundation

class ViewModel {
    
}

protocol CellsDataSource {
    func numberOfSections() -> Int
    func numberOfRows(forSection section: Int) -> Int
    func tableViewCell(forIndexPath indexPath: IndexPath) -> TableViewCell<Any>
}
