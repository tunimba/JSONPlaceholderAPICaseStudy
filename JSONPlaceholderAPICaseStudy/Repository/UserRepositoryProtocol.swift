//
//  UserRepositoryProtocol.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import Foundation

/// Protocol defining the contract for user data management operations.
///
/// Implementations of this protocol are responsible for coordinating data operations between.
/// different data sources (network, local storage, etc.)
protocol UserRepositoryProtocol {

  /// Gets all users from the data source.
  /// - Returns: Array of User items.
  func getAllUsers() async -> [User]

  /// Gets one user by ID
  /// - Parameter userId: User's ID
  /// - Returns: Optional User item, nil if not found.
  func getSingleUser(userId: Int) -> User?
}
