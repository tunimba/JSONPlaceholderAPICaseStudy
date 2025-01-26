//
//  UserModel.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import Foundation

/// Model representing a user in the system.
///
/// This struct contains all necessary user information and conforms to both
/// Identifiable for SwiftUI list rendering and Codable for JSON serialization.
///
//
/// - Note: Used as the base model throughout the application
struct User: Identifiable, Codable {
  let id: Int
  let name: String
  let email: String
  let phone: String
  let website: String
}
