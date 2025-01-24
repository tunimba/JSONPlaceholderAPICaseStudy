//
//  NetworkService.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import Foundation

// MARK: Protocol
///Abstracts API requests
protocol UserNetworkProtocol {
  func fetchUsers() async throws -> [User]
}

// MARK: - Network Layer
///Enum representing network errors
enum NetworkError: Error {
  case invalidURL
  case invalidResponse
  case invalidStatusCode
}

///Implementation for API calls
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
