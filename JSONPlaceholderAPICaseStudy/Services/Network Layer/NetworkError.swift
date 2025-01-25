//
//  NetworkError.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 25.01.2025.
//

import Foundation

// Represents the potential errors that could occur while interacting with the network.
// Used to identify specific failure cases like invalid URLs or server responses.
enum NetworkError: Error {
  case invalidURL
  case invalidResponse
  case invalidStatusCode
}
