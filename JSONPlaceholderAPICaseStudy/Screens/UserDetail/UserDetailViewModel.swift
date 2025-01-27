//
//  UserDetailViewModel.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import Foundation
import OSLog

/// View Model for user detail screen.
@Observable
class UserDetailViewModel {
  
  /// Formatted use itemr for detail display.
  var user: UserDetailItem?
  
  /// Fetches and format user for display.
  private let repository: UserRepositoryProtocol
  
  /// Initializes view model
  /// - Parameter repository: UserRepositoryProtocol implementation.
  init(repository: UserRepositoryProtocol) {
    self.repository = repository
  }
  
  /// Fetches and formats user details.
  /// - Parameter id: Target user's ID.
  func getUser(id: Int) {
    if let rawUser = repository.getSingleUser(userId: id) {
      user = UserDetailItem(user: rawUser)
    }
  }
}
