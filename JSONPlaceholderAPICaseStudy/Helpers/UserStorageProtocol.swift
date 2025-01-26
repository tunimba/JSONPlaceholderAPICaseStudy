//
//  UserStorageProtocol.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import Foundation

/// Protocol defining operations for persistent user data storage.
protocol UserStorageProtocol {
  /// Retrieves all users from storage
  /// - Returns: Dictionary of users with their IDs as keys
  func getAllUsers() -> [Int: User]

  /// Retrieves a specific user from storage
  /// - Parameter userId: Unique identifier of the user
  /// - Returns: Optional User object
  func getSingleUser(userId: Int) -> User?

  /// Saves users to persistent storage
  /// - Parameter users: Array of users to save
  func saveUsers(users: [User])
}
