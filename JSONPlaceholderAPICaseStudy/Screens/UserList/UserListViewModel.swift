//
//  UserListViewModel.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import Foundation
import SwiftUI
import OSLog

/// View model managing user list presentation logic.
///
/// Handles:
/// - Data fetching.
/// - List management.
/// - Navigation.
///
/// - Important: Uses `@Observable` for SwiftUI integration.
@Observable
class UserListViewModel {
  
  /// Formatted users for display.
  /// - Discussion: Contains only necessary fields for list display.
  var users: [UserListItem] = []
  
  /// Manages the app's navigation flow.
  /// Responsible for creating and showing different screens.
  /// Used for navigating to user detail screen.
  private let coordinator: AppCoordinator
  
  /// Handles all data operations for users.
  /// Acts as single source of truth for user data.
  /// Manages both network and local storage operations.
  private let repository: UserRepositoryProtocol
  
  /// Initializes view model with injected repository.
  /// - Parameter repository: Repository implementation for data operations.
  init(repository: UserRepositoryProtocol, coordinator: AppCoordinator) {
    self.repository = repository
    self.coordinator = coordinator
  }
  
  /// Fetches and formats users for display.
  /// - Discussion: Asynchronously loads users from repository and maps to list items.
  func fetchUsers() async {
    let rawUsers = await repository.getAllUsers()
    users = rawUsers.map { UserListItem(user: $0) }
  }
  
  /// Handles navigation when a user is selected.
  /// - Parameter userId: The ID of the selected user.
  /// - Returns: User detail view  for the selected user.
  func userTapped(userId: Int) -> some View {
    coordinator.showUserDetail(userId: userId)
  }
}
