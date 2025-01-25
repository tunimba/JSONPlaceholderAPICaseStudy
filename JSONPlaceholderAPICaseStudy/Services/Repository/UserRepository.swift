//
//  UserRepository.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import Foundation

// Manages the user data by acting as a bridge between the network layer and local storage.
// It uses apiClient to fetch data from the network and databaseClient to handle persistent storage.
class UserRepository: UserRepositoryProtocol {
  private let apiClient: UserNetworkProtocol
  private let databaseClient: UserStorageProtocol

  init(apiClient: UserNetworkProtocol = NetworkService(),
       databaseClient: UserStorageProtocol = LocalDataStorage()) {
    self.apiClient = apiClient
    self.databaseClient = databaseClient
  }
  
  func getAllUsers() async throws -> [User] {
    let users = try await apiClient.fetchUsers()
    databaseClient.saveUsers(users: users)
    return users
  }
  
  func getSingleUser(userId: Int) async throws -> User {
    if let localUser = databaseClient.getSingleUser(userId: userId) {
      return localUser
    }

    let users = try await getAllUsers()
    guard let user = users.first(where: { $0.id == userId }) else {
      throw NetworkError.invalidResponse
    }

    return user
  }
}
