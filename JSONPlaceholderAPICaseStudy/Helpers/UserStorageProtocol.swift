//
//  UserStorageProtocol.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import Foundation

// Defines the operations for interacting with persistent user data storage.
// Enables saving, retrieving, and managing user data locally.
protocol UserStorageProtocol {
  func getAllUsers() -> [User]
  func getSingleUser(userId: Int) -> User?
  func saveUsers(users: [User])
}
