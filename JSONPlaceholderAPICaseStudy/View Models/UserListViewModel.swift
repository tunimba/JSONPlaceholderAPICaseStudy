//
//  UserListViewModel.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import Foundation

@Observable
class UserListViewModel {
  var users: [UserListItem] = []
  private let repository: UserRepositoryProtocol

  init(repository: UserRepositoryProtocol = UserRepository()) {
    self.repository = repository
  }

  func fetchUsers() async {
    do {
      let rawUsers = try await repository.getAllUsers()
      users = rawUsers.map { UserListItem(user: $0) }
    } catch {
      print("Error fetching users: \(error)")
    }
  }
}