//
//  UserListView.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import SwiftUI

/// View displaying a list of users with navigation capabilities.
struct UserListView: View {
  let viewModel: UserListViewModel
  
  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.users) { user in
          NavigationLink(destination: viewModel.userTapped(userId: user.id)) {
            VStack(alignment: .leading, spacing: 8) {
              Text(user.name)
                .font(.subheadline)
                .fontWeight(.regular)
                .lineLimit(1)
              
              Text(user.email)
                .font(.footnote)
                .foregroundStyle(.secondary)
            }
            .padding(.vertical, 4)
          }
          .listRowBackground(Color.clear)
        }
      }
      .listStyle(PlainListStyle())
      .navigationTitle("Users")
      .task {
        await viewModel.fetchUsers()
      }
    }
  }
}

#Preview {
  UserListView(
    viewModel: UserListViewModel(
      repository: UserRepository(
        networkClient: MockNetworkService(),
        databaseClient: LocalDataStorage()
      ),
      coordinator: AppCoordinator.shared
    )
  )
}
