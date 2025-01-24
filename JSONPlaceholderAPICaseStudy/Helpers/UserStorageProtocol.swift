//
//  UserStorageProtocol.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import Foundation

// MARK: Protocol
/// Abstracts local storage operations
protocol UserStorageProtocol {
  func getAllUsers() -> [User]
  func getSingleUser(userId: Int) -> User?
  func saveUsers(users: [User])
}
