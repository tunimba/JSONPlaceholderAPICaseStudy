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
/// - Note: Used as the base model throughout the application
struct User: Identifiable, Codable {
  let id: Int
  let name: String
  let email: String
  let phone: String
  let website: String
}

/// Initialize list item from User model
/// - Parameter user: Source User object
/// - Discussion: Extracts only fields needed for list display
struct UserListItem: Identifiable {
  let id: Int
  let name: String
  let email: String

  init(user: User) {
    self.id = user.id
    self.name = user.name
    self.email = user.email
  }
}

/// Initialize detail item from User model
/// - Parameter user: Source User object
/// - Discussion: Formats all user fields for detail display
struct UserDetailItem: Identifiable {
  let id: Int
  let name: String
  let email: String
  let phone: String
  let website: String

  init(user: User) {
    self.id = user.id
    self.name = user.name
    self.email = user.email
    self.phone = user.phone
    self.website = user.website
  }
}
