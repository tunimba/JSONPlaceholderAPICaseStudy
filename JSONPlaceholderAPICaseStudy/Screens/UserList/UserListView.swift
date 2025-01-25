//
//  UserListView.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import SwiftUI

// Displays a list of users fetched from the server.
// Uses UserListViewModel to manage the data and navigation to the detail view.
struct UserListView: View {
  let viewModel = UserListViewModel()
  @Environment(\.colorScheme) var colorScheme
  let colors: [Color] = [.blue, .green, .orange, .purple, .red, .yellow]

  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.users) { user in
          NavigationLink(destination: UserDetailView(userId: user.id)) {
            HStack(spacing: 16) {
              Image(systemName: "person.circle.fill")
                .foregroundColor(colors[user.id % colors.count])
                .font(.largeTitle)

              VStack(alignment: .leading, spacing: 8) {
                Text(user.name)
                  .font(.subheadline)
                  .fontWeight(.regular)
                  .lineLimit(1)

                Text(user.email)
                  .font(.footnote)
                  .foregroundColor(.secondary)
              }
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
    UserListView()
}
