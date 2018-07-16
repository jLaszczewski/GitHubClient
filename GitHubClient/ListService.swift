//
//  ListServiceProtocol.swift
//  GitHubClient
//
//  Created by Jakub Łaszczewski on 16/07/2018.
//  Copyright © 2018 Jakub Łaszczewski. All rights reserved.
//

import Foundation
import RxSwift
import ios_extensions_rx

protocol ListServiceProtocol {
    func getList() -> Observable<[RepositoryListModel]>
}

class ListService: ListServiceProtocol {
    func getList() -> Observable<[RepositoryListModel]> {
        return listProvider.rx.request(.getList)
            .asObservable()
            .map({ response -> [RepositoryListModel]? in
                guard let list = try? JSONDecoder().decode([RepositoryListModel].self, from: response.data) else { return nil }
                
                return list
            })
            .filterNil()
    }
}
