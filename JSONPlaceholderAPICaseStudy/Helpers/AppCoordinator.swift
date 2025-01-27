//
//  UserListCoordinator.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 26.01.2025.
//

import SwiftUI

/// Coordinator managing navigation and dependency injection for the user flow.
///
/// Responsibilities:
/// - Creates views.
/// - Sets up dependencies.
/// - Controls navigation.
final class AppCoordinator {
  
  /// Shared instance for singleton pattern.
  static let shared = AppCoordinator()

  /// Handles all data operations for users.
  /// Acts as single source of truth for user data.
  /// Manages both network and local storage operations.
  private let repository: UserRepositoryProtocol

  /// Private init for singleton.
  private init() {
    self.repository = UserRepository(
      networkClient: NetworkService(),
      databaseClient: LocalDataStorage()
    )
  }

  /// Composes user list related classes.
  /// - Returns: User List screen.
  @ViewBuilder
  func start() -> some View {
    let viewModel = UserListViewModel(repository: repository, coordinator: self)
    UserListView(viewModel: viewModel)
  }

  /// Composes user detail related classes.
  /// - Parameter userId: User's ID.
  /// - Returns: Detail screen for user.
  @ViewBuilder
  func showUserDetail(userId: Int) -> some View {
    let viewModel = UserDetailViewModel(repository: repository)
    UserDetailView(userId: userId, viewModel: viewModel)
  }
}
