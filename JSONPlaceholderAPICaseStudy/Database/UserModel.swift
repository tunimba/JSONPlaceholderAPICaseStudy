//
//  UserModel.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import Foundation

/// Raw user item fetched from API.
struct User: Identifiable, Codable {
  let id: Int
  let name: String
  let email: String
  let phone: String
  let website: String
}
