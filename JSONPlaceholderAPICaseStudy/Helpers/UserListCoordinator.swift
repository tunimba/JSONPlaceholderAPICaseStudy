//
//  UserListCoordinator.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 26.01.2025.
//

import SwiftUI

protocol Coordinator: AnyObject {
  func start()
}

/// Coordinator managing navigation and dependency injection for the user flow.
///
/// Responsibilities:
/// - View instantiation
/// - Dependency injection
/// - Navigation flow management
///
/// - Important: Implemented as a singleton to maintain single source of truth
final class UserListCoordinator {
  /// Shared instance for singleton pattern
  static let shared = UserListCoordinator()

  /// Repository instance for data operations
  private let repository: UserRepositoryProtocol

  /// Private initializer for singleton pattern
  private init() {
    self.repository = UserRepository(
      apiClient: NetworkService(),
      databaseClient: LocalDataStorage()
    )
  }

  /// Creates and returns the initial view of the application
  /// - Returns: Configured UserListView instance
  @ViewBuilder
  func start() -> some View {
    let viewModel = UserListViewModel(repository: repository)
    UserListView(viewModel: viewModel, coordinator: self)
  }

  /// Creates and returns a detail view for a specific user
  /// - Parameter userId: Unique identifier of the user
  /// - Returns: Configured UserDetailView instance
  @ViewBuilder
  func showUserDetail(userId: Int) -> some View {
    let viewModel = UserDetailViewModel(repository: repository)
    UserDetailView(userId: userId, viewModel: viewModel)
  }
}
