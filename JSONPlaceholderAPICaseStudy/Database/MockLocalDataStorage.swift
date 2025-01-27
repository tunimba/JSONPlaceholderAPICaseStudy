//
//  MockLocalDataStorage.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 27.01.2025.
//

import Foundation

/// Mock data for data storage service.
class MockLocalDataStorage: LocalDataStorageProtocol {
  private var mockUsers: [Int: User] = [
    1: User(
      id: 1,
      name: "John Doe",
      email: "johndoe@hotmail.com",
      phone: "+2125789864",
      website: "www.johndoe.com"
    ),
    2: User(
      id: 2,
      name: "Jane Doe",
      email: "janedoe@gmail.com",
      phone: "2168457694",
      website: "www.janedoe.com"
    )
  ]
  
  func getAllUsers() -> [Int: User] {
    return mockUsers
  }
  
  func getSingleUser(userId: Int) -> User? {
    return mockUsers[userId]
  }
  
  func saveUsers(users: [Int: User]) {
    mockUsers = users
  }
}
