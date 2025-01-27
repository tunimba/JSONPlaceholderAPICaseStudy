//
//  UserRepository.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import Foundation
import OSLog

/// Repository that manages users' data by coordinating between network and storage layers.
///
/// The repository acts as a single source of truth for user data, handling:
/// - Data fetching from network.
/// - Local storage operations.
/// - Caching logic.
class UserRepository: UserRepositoryProtocol {
  
  /// Network client for fetching user data.
  private let networkClient: NetworkServiceProtocol
  
  /// Storage client for local data persistence.
  private let databaseClient: LocalDataStorageProtocol
  
  /// Initializes repository with network and storage implementations.
  /// - Parameters:
  ///   - networkClient: NetworkServiceProtocol implementation.
  ///   - databaseClient: LocalDataStorageProtocol implementation.
  init(networkClient: NetworkServiceProtocol, databaseClient: LocalDataStorageProtocol) {
    self.networkClient = networkClient
    self.databaseClient = databaseClient
  }
  
  /// Fetches all users from network and saves to storage.
  /// - Returns: Array of User items.
  /// - Discussion: First attempts to fetch from network, then saves to local storage.
  /// On failure, returns empty array and logs error.
  func getAllUsers() async -> [User] {
    do {
      let users = try await networkClient.fetchUsers()
      let userDictionary = Dictionary(uniqueKeysWithValues: users.map { ($0.id, $0) })
      databaseClient.saveUsers(users: userDictionary)
      return users
    } catch {
      Logger.networking.error("Failed to fetch users: \(error.localizedDescription)")
      return []
    }
  }
  
  /// Retrieves a single user by ID.
  /// - Parameter userId: User's ID
  /// - Returns: User if found, nil if not
  func getSingleUser(userId: Int) -> User? {
    return databaseClient.getSingleUser(userId: userId)
  }
}
