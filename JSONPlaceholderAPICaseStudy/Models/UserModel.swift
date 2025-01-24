//
//  UserModel.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import Foundation

// MARK: - User Model for JSONPlaceholder API
struct User: Identifiable, Codable {
  let id: Int
  let name: String
  let email: String
  let phone: String
  let website: String
}

// MARK: - Sub-structs of User Model to only use necessary variables in Views
// Items for UserlistView & UserDetailView
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
