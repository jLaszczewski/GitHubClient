//  
//  RepositoryTableViewCell.swift
//  GitHubClient
//
//  Created by Jakub Łaszczewski on 12/07/2018.
//  Copyright © 2018 Jakub Łaszczewski. All rights reserved.
//

import UIKit
import ios_extensions

final class RepositoryTableViewCell: TableViewCell<RepositoryTableCellViewModel> {

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func configure(withViewModel viewModel: RepositoryTableCellViewModel) {
        self.viewModel = viewModel

    }
}

extension RepositoryTableViewCell: NibLoadableView {}
