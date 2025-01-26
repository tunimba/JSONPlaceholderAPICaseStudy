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
            ContactInfoRow(icon: "envelope.fill", value: user.email, color: .blue)
            ContactInfoRow(icon: "phone.fill", value: user.phone, color: .green)
            ContactInfoRow(icon: "globe", value: user.website, color: .purple)
          }
          .padding(24)
          .padding(.horizontal)
        }
        .padding(.bottom, 256)
      } else {
        ProgressView()
          .scaleEffect(1.5)
      }
    }
  }
    .task {
      await viewModel.fetchUser(id: userId)
    }
  }
}

/// ContactInfoRow component for UserDetailView
private struct ContactInfoRow: View {
  let icon: String
  let value: String
  let color: Color

  var body: some View {
    HStack(spacing: 16) {
      Image(systemName: icon)
        .font(.title2)
        .foregroundStyle(color)
        .frame(width: 32)

      Text(value)
        .foregroundStyle(.primary)
        .font(.headline)
        .fontWeight(.light)
    }
  }
}

#Preview {
  UserDetailView(
    userId: 2,
    viewModel: UserDetailViewModel(
      repository: UserRepository(
        apiClient: NetworkService(),
        databaseClient: LocalDataStorage()
      )
    )
  )
}
