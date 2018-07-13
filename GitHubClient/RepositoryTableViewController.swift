//  
//  RepositoryTableViewController.swift
//  GitHubClient
//
//  Created by Jakub Łaszczewski on 12/07/2018.
//  Copyright © 2018 Jakub Łaszczewski. All rights reserved.
//

import UIKit
import RxSwift

final class RepositoryTableViewController: ViewController {

    // MARK: Properties
    var viewModel: RepositoryTableViewModel!
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareViewController()
        setupRxObservers()
    }
}

// MARK: - Preparation
private extension RepositoryTableViewController {
    func prepareViewController() {
        title = L10n.locListViewTitle
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RepositoryTableViewCell.self)
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
    }
}


// MARK: - RxObservers
private extension RepositoryTableViewController {
    func setupRxObservers() {
      

    }
}

// MARK: - UITableViewDataSource
extension RepositoryTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(forSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel.tableViewCell(forIndexPath: indexPath)
        switch cellViewModel {
        case let repositoryCellViewModel as RepositoryTableCellViewModel:
            let cell: RepositoryTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.configure(withViewModel: repositoryCellViewModel)
            return cell
        default:
            return tableView.dequeueReusableCell(forIndexPath: indexPath)
        }
    }
}

// MARK: - UITableViewDelegate
extension RepositoryTableViewController: UITableViewDelegate {
    
}
