//
//  MockNetworkService.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 27.01.2025.
//

import Foundation

/// Mock data for network service.
class MockNetworkService: NetworkServiceProtocol {
  func fetchUsers() async throws -> [User] {
    return [
      User(
        id: 1,
        name: "John Doe",
        email: "johndoe@hotmail.com",
        phone: "+2125789864",
        website: "www.johndoe.com"
      ),
      User(
        id: 2,
        name: "Jane Doe",
        email: "janedoe@gmail.com",
        phone: "2168457694",
        website: "www.janedoe.com"
      )]
  }
}
