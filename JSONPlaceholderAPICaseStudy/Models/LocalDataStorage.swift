//
//  LocalDataStorage.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import Foundation
import OSLog


/// UserDefaults-based implementation of UserStorageProtocol.
class LocalDataStorage: UserStorageProtocol {
  /// UserDefaults instance for data persistence
  private let defaults = UserDefaults.standard
  /// Key for storing user data in UserDefaults
  private let key = "saved_users"

  /// Gets all stored users as dictionary
  /// - Returns: Dictionary of users with ID as key
  /// - Discussion: O(1) access time for individual users
  func getAllUsers() -> [Int: User] {
    guard let data = defaults.data(forKey: key),
          let users = try? JSONDecoder().decode([User].self, from: data)
    else {
      Logger.storage.notice("No users in storage")
      return [:]
    }
    let userDict = Dictionary(uniqueKeysWithValues: users.lazy.map { ($0.id, $0) })
    Logger.storage.debug("Retrieved \(users.count) users")
    return userDict
  }

  /// Gets user by ID with O(1) access
  /// - Parameter userId: Target user ID
  /// - Returns: User if found, nil otherwise
  func getSingleUser(userId: Int) -> User? {
    return getAllUsers()[userId]
  }

  /// Saves users to storage
  /// - Parameter users: Users to save
  func saveUsers(users: [User]) {
    do {
      let encoded = try JSONEncoder().encode(users)
      defaults.set(encoded, forKey: key)
      Logger.storage.debug("Saved \(users.count) users")
    } catch {
      Logger.storage.error("Save failed: \(error.localizedDescription)")
    }
  }
}
