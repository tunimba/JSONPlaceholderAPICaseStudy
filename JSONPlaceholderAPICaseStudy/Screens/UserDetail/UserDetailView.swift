//
//  UserDetailView.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import SwiftUI

/// View displaying detailed information about a specific user.
struct UserDetailView: View {
  let userId: Int
  let viewModel: UserDetailViewModel
  
  var body: some View {
    NavigationStack {
      Group {
        if let user = viewModel.user {
          VStack {
            Text(user.name)
              .font(.title)
            
            VStack(alignment: .leading, spacing: 24) {
              Label(user.email, systemImage: "envelope.fill")
              Label(user.phone, systemImage: "phone.fill")
              Label(user.website, systemImage: "globe")
            }
            .font(.headline)
            .fontWeight(.light)
            .padding(24)
          }
          Spacer()
        } else {
          ProgressView()
        }
      }
    }
    .task {
      viewModel.getUser(id: userId)
    }
  }
}

#Preview {
  UserDetailView(
    userId: 2,
    viewModel: UserDetailViewModel(
      repository: UserRepository(
        networkClient: MockNetworkService(),
        databaseClient: MockLocalDataStorage()
      )
    )
  )
}
