//
//  Action.swift
//  GitHubClient
//
//  Created by Jakub Łaszczewski on 12/07/2018.
//  Copyright © 2018 Jakub Łaszczewski. All rights reserved.
//

import Foundation

struct Action<T> {
    private let action: (T) -> Void

    init(action: @escaping (T) -> Void) {
        self.action = action
    }

    func perform(param: T) {
        action(param)
    }
}
