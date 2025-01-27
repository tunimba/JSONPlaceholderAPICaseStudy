//
//  UserListItem.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 27.01.2025.
//

import Foundation

/// !tem to use in User List screen.
/// - Parameter user: Source User item.
struct UserListItem: Identifiable {
  let id: Int
  let name: String
  let email: String
  
  /// Initialize list item from User model.
  init(user: User) {
    self.id = user.id
    self.name = user.name
    self.email = user.email
  }
}
