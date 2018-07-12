//
//  CollectionViewCell.swift
//  GitHubClient
//
//  Created by Jakub Łaszczewski on 12/07/2018.
//  Copyright © 2018 Jakub Łaszczewski. All rights reserved.
//

import RxSwift

class CollectionViewCell<T>: UICollectionViewCell where T: ViewModel {
    var cellViewModel: T!

    var disposeBag = DisposeBag()

    func configure(withViewModel viewModel: T) {
        cellViewModel = viewModel
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
}
