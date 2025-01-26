//
//  UserDetailViewModel.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import Foundation
import OSLog

/// View Model for user detail screen
@Observable
class UserDetailViewModel {
  /// Formatted user for detail display
  /// - Discussion: Contains all user fields formatted for detail view
  var user: UserDetailItem?

  /// Fetches and formats specific user
  /// - Parameter id: User's unique identifier
  /// - Discussion: Transforms raw User into UserDetailItem
  private let repository: UserRepositoryProtocol

  /// Initializes view model with injected repository
  /// - Parameter repository: Repository implementation for data operations
  /// - Discussion: Repository must be provided by Coordinator
  init(repository: UserRepositoryProtocol) {
    self.repository = repository
  }

  /// Fetches and formats user details
  /// - Parameter id: Target user's unique identifier
  /// - Discussion: Asynchronously loads user and converts to detail format
  /// - Important: Should be called when view appears
  func fetchUser(id: Int) async {
    if let rawUser = await repository.getSingleUser(userId: id) {
      user = UserDetailItem(user: rawUser)
    }
  }
}
