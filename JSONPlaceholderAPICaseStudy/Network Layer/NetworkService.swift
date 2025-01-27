//
//  NetworkService.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import Foundation
import OSLog

/// Service handling network operations.
class NetworkService: NetworkServiceProtocol {
  
  /// Fetches users from the JSONPlaceholder API.
  /// - Returns: Array of User items.
  /// - Throws: NetworkError: invalidURL || invalidResponse || invalidStatusCode
  /// - Discussion: Makes async HTTP request to fetch users, handles response validation.
  ///   and JSON decoding. Logs all network operations and errors.
  func fetchUsers() async throws -> [User] {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
      Logger.networking.error("Invalid URL formed for fetching users")
      throw NetworkError.invalidURL
    }

    do {
      let (data, response) = try await URLSession.shared.data(from: url)
      guard let response = response as? HTTPURLResponse else {
        Logger.networking.error("Invalid response type received")
        throw NetworkError.invalidResponse
      }

      guard response.statusCode >= 200 && response.statusCode < 300 else {
        Logger.networking.error("Invalid status code received: \(response.statusCode)")
        throw NetworkError.invalidStatusCode
      }

      Logger.networking.debug("Successfully fetched users data")
      return try JSONDecoder().decode([User].self, from: data)
    } catch {
      Logger.networking.error("Network request failed: \(error.localizedDescription)")
      throw error
    }
  }
}
