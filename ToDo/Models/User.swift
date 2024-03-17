//
//  User.swift
//  ToDo
//
//  Created by Paul Grin on 15/03/2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joinedAt: TimeInterval
}
