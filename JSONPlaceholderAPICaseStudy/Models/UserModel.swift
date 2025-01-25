//
//  UserModel.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import Foundation

// Represents a user object with all necessary details.
// Conforms to Identifiable and Codable for use in SwiftUI lists and easy encoding/decoding.
struct User: Identifiable, Codable {
  let id: Int
  let name: String
  let email: String
  let phone: String
  let website: String
}

// Represents a simplified version of the User object for list displays in the UI.
// Extracts only the necessary fields (id, name, email) for better performance and reduced data handling.
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

// Represents a detailed version of the User object for the detail view in the UI.
// Contains all user properties for comprehensive display.
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
