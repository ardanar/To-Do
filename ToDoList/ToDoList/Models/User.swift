//
//  User.swift
//  ToDoList
//
//  Created by Arda Nar on 20.01.2024.
//

import Foundation

struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
