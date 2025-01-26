//
//  UserNetworkProtocol.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 25.01.2025.
//

import Foundation

/// Protocol defining network operations for user data.
///
/// This protocol abstracts the network layer implementation details and
/// defines the contract for fetching user data from remote sources.
///
/// - Note: All methods are async and can throw errors
protocol UserNetworkProtocol {
  /// Fetches all users from the network.
  /// - Returns: Array of User objects
  /// - Throws: NetworkError if the request fails
  func fetchUsers() async throws -> [User]
}
