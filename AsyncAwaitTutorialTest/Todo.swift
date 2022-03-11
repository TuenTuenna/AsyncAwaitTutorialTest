//
//  Todo.swift
//  AsyncAwaitTutorialTest
//
//  Created by Jeff Jeong on 2022/03/12.
//

import Foundation

// MARK: - Todo
struct Todo: Codable {
    let userID, id: Int?
    let title: String?
    let completed: Bool?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}
