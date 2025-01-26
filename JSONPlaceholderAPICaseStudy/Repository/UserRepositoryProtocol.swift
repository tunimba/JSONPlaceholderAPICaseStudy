//
//  UserRepositoryProtocol.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import Foundation

/// Protocol defining the contract for user data management operations.
///
/// Implementations of this protocol are responsible for coordinating data operations between
/// different data sources (network, local storage, etc.)
///
/// - Important: This protocol is the main interface for accessing user data in the application.
protocol UserRepositoryProtocol {
  /// Fetches all users from the data source.
  /// - Returns: Array of User objects
  /// - Note: May return empty array if fetch fails
  func getAllUsers() async -> [User]
  
  /// Fetches a specific user by their ID.
  /// - Parameter userId: The unique identifier of the user
  /// - Returns: Optional User object, nil if not found
  func getSingleUser(userId: Int) async -> User?
}
