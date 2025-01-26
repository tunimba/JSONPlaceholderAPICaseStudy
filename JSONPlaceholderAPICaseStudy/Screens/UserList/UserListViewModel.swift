//
//  UserListViewModel.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import Foundation
import OSLog

/// View model managing user list presentation logic.
///
/// Handles:
/// - Data fetching
/// - List management
/// - UI state updates
///
/// - Important: Uses `@Observable` for SwiftUI integration
@Observable
class UserListViewModel {
  /// Formatted users for display
  /// - Discussion: Contains only necessary fields for list display
  var users: [UserListItem] = []
  
  /// Fetches and formats users for display
  /// - Discussion: Transforms raw User objects into UserListItems
  private let repository: UserRepositoryProtocol

  /// Initializes view model with injected repository
  /// - Parameter repository: Repository implementation for data operations
  /// - Discussion: Repository must be provided by Coordinator
  init(repository: UserRepositoryProtocol) {
    self.repository = repository
  }

  /// Fetches and formats users for display
  /// - Discussion: Asynchronously loads users from repository and maps to list items
  /// - Important: Should be called when view appears
  func fetchUsers() async {
    let rawUsers = await repository.getAllUsers()
    users = rawUsers.map { UserListItem(user: $0) }
  }
}
