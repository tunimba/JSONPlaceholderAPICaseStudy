//
//  NetworkError.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 25.01.2025.
//

import Foundation

/// Network operation errors.
enum NetworkError: Error {
  case invalidURL
  case invalidResponse
  case invalidStatusCode
}
