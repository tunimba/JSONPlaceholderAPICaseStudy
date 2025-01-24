//
//  UserDetailViewModel.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import Foundation

@Observable
class UserDetailViewModel {
  var user: UserDetailItem?
  private let repository: UserRepositoryProtocol

  init(repository: UserRepositoryProtocol = UserRepository()) {
    self.repository = repository
  }

  func fetchUser(id: Int) async {
    do {
      let rawUser = try await repository.getSingleUser(userId: id)
      user = UserDetailItem(user: rawUser)
    } catch {
      print("Error fetching user: \(error)")
    }
  }
}
