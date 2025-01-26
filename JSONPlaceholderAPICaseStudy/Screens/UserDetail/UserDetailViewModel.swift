//
//  UserDetailViewModel.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import Foundation

// Manages the logic for fetching and displaying details of a specific user.
// Utilizes UserRepositoryProtocol for fetching data from the network or local storage.
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
