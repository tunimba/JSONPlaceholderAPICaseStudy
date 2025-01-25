//
//  NetworkService.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import Foundation

// Handles the network operations for fetching user data from the JSONPlaceholder server.
// Implements UserNetworkProtocol to ensure compliance with the expected method signature.
class NetworkService: UserNetworkProtocol {

  func fetchUsers() async throws -> [User] {

    guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
      throw NetworkError.invalidURL
    }

    let (data, response) = try await URLSession.shared.data(from: url)
    guard let response = response as? HTTPURLResponse else {
      throw NetworkError.invalidResponse
    }

    guard response.statusCode >= 200 && response.statusCode < 300 else {
      throw NetworkError.invalidStatusCode
    }

    let users = try JSONDecoder().decode([User].self, from: data)
    return users
  }
}
