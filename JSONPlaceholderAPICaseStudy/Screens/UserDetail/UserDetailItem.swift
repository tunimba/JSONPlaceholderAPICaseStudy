//
//  UserDetailItem.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 27.01.2025.
//

import Foundation

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
