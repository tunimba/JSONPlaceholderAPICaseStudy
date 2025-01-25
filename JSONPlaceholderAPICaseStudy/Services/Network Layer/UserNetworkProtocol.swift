//
//  UserNetworkProtocol.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 25.01.2025.
//

import Foundation

// Defines the blueprint for fetching user data from a network source.
// Ensures flexibility by allowing different implementations of network operations.
protocol UserNetworkProtocol {
  func fetchUsers() async throws -> [User]
}
