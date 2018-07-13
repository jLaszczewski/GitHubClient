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
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func configure(withViewModel viewModel: RepositoryTableCellViewModel) {
        self.viewModel = viewModel
        
        guard let login = viewModel.output?.login, let description = viewModel.output?.description else { return }
        login.bind(to: loginLabel.rx.text).disposed(by: disposeBag)
        description.bind(to: descriptionLabel.rx.text).disposed(by: disposeBag)
    }
}

extension RepositoryTableViewCell: NibLoadableView {}
