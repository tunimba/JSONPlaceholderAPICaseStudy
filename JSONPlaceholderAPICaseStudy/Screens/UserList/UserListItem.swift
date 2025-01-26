//
//  UserListItem.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 27.01.2025.
//

import Foundation

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
