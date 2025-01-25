//
//  UserRepositoryProtocol.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import Foundation

// Defines the operations for managing user data.
// Abstracts the implementation details of user data retrieval and storage.
protocol UserRepositoryProtocol {
  func getAllUsers() async throws -> [User]
  func getSingleUser(userId: Int) async throws -> User
}
