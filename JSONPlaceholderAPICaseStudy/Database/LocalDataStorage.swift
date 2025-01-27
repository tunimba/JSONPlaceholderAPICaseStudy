//
//  LocalDataStorage.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import Foundation
import OSLog

/// Stores user data using UserDefaults.
class LocalDataStorage: LocalDataStorageProtocol {

  /// UserDefaults instance for data persistence.
  private let defaults = UserDefaults.standard
  /// Key for storing user data in UserDefaults.
  private let key = "saved_users"

  /// Gets all users from storage.
  /// - Returns: Dictionary of users with ID as key.
  func getAllUsers() -> [Int: User] {
    guard let data = defaults.data(forKey: key),
          let users = try? JSONDecoder().decode([Int: User].self, from: data)
    else {
      Logger.storage.notice("No users in storage")
      return [:]
    }
    Logger.storage.debug("Retrieved \(users.count) users")
    return users
  }
  
  /// Gets a single user by ID.
  /// - Parameter userId: The ID to look for.
  /// - Returns: The user if found, nil if not.
  func getSingleUser(userId: Int) -> User? {
    return getAllUsers()[userId]
  }

  /// Stores users in UserDefaults.
  /// - Parameter users: Dictionary of users to store.
  func saveUsers(users: [User]) {
    do {
      let userDictionary = Dictionary(uniqueKeysWithValues: users.map { ($0.id, $0) })
      let encoded = try JSONEncoder().encode(userDictionary)
      defaults.set(encoded, forKey: key)
      Logger.storage.debug("Saved \(users.count) users")
    } catch {
      Logger.storage.error("Save failed: \(error.localizedDescription)")
    }
  }
}
