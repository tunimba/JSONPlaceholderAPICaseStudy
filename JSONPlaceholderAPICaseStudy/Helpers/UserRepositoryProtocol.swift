//
//  UserRepositoryProtocol.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import Foundation

// MARK: Protocol
/// Fetches all users asynchronously.
/// Fetches a single user with the specified ID asynchronously.
protocol UserRepositoryProtocol {
  func getAllUsers() async throws -> [User]
  func getSingleUser(userId: Int) async throws -> User
}
