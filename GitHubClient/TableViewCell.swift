//
//  TableViewCell.swift
//  GitHubClient
//
//  Created by Jakub Łaszczewski on 12/07/2018.
//  Copyright © 2018 Jakub Łaszczewski. All rights reserved.
//

import RxSwift

class TableViewCell<T>: UITableViewCell {
    var viewModel: T!

    var disposeBag = DisposeBag()

    func configure(withViewModel viewModel: T) {
        self.viewModel = viewModel
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
}
