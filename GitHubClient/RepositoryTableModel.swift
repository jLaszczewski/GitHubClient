//
//  RepositoryTableModel.swift
//  GitHubClient
//
//  Created by Jakub Łaszczewski on 12/07/2018.
//  Copyright © 2018 Jakub Łaszczewski. All rights reserved.
//

import Foundation

struct RepositoryTableModel: Codable {
    let id: Int?
    let name: String?
    let owner: Owner?
    let description: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case owner
        case description
    }
}

struct Owner: Codable {
    let name: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
    }
}
