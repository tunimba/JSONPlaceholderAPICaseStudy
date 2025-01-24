//
//  LocalDataStorage.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import Foundation

class LocalDataStorage: UserStorageProtocol {
  private let defaults = UserDefaults.standard
  private let key = "saved_users"

  func getAllUsers() -> [User] {
    guard let data = defaults.data(forKey: key),
          let users = try? JSONDecoder().decode([User].self, from: data)
    else {
      return []
    }
    return users
  }

  func getSingleUser(userId: Int) -> User? {
    return getAllUsers().first { $0.id == userId }
  }

  func saveUsers(users: [User]) {
    if let encoded = try? JSONEncoder().encode(users) {
      defaults.set(encoded, forKey: key)
    }
  }
}
