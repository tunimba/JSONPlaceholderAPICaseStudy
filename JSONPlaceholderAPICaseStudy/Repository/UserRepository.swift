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
/// - Data fetching from network
/// - Local storage operations
/// - Caching logic
///
/// - Important: This class follows the Repository pattern to abstract data source implementation details.
///
/// - Note: Uses dependency injection for network and storage clients to support testing and flexibility.
class UserRepository: UserRepositoryProtocol {
  /// Network client for fetching user data
  private let apiClient: UserNetworkProtocol

  /// Storage client for local data persistence
  private let databaseClient: LocalDataStorageProtocol


  /// Initializes repository with network and storage implementations
  /// - Parameters:
  ///   - apiClient: Network client implementation
  ///   - databaseClient: Storage client implementation
  /// - Discussion: Uses default implementations if none provided
  init(apiClient: UserNetworkProtocol = NetworkService(),
       databaseClient: LocalDataStorageProtocol = LocalDataStorage()) {
    self.apiClient = apiClient
    self.databaseClient = databaseClient
  }

  /// Fetches all users from network and saves to storage
  /// - Returns: Array of User objects
  /// - Discussion: First attempts to fetch from network, then saves to local storage.
  /// On failure, returns empty array and logs error.
  func getAllUsers() async -> [User] {
    do {
      let users = try await apiClient.fetchUsers()
      databaseClient.saveUsers(users: users)
      return users
    } catch {
      Logger.networking.error("Failed to fetch users: \(error.localizedDescription)")
      return []
    }
  }

  /// Retrieves a single user by ID
  /// - Parameter userId: The unique identifier of the user
  /// - Returns: Optional User object
  /// - Discussion: Checks local storage first, then network if not found
  func getSingleUser(userId: Int) async -> User? {
    return databaseClient.getSingleUser(userId: userId)
  }
}
