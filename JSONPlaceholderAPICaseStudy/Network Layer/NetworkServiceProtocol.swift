//
//  NetworkServiceProtocol.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 25.01.2025.
//

import Foundation

/// Protocol defining network operations..
protocol NetworkServiceProtocol {
  
  /// Fetches all users from the network.
  /// - Returns: Array of User items.
  func fetchUsers() async throws -> [User]
}
