//
//  UserDetailView.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import SwiftUI

// Displays detailed information about a specific user.
// Uses UserDetailViewModel to fetch and manage the data.
struct UserDetailView: View {
  let userId: Int
  let viewModel = UserDetailViewModel()
  @Environment(\.colorScheme) var colorScheme
  let colors: [Color] = [.blue, .green, .orange, .purple, .red, .yellow]

  var body: some View {
    Group {
      if let user = viewModel.user {
        VStack(spacing: 32) {
          Spacer()
            .frame(height: 20)

          Image(systemName: "person.circle.fill")
            .font(.system(size: 100))
            .foregroundColor(colors[(userId - 1) % colors.count])

          Text(user.name)
            .font(.system(size: 28, weight: .bold))
            .textSelection(.enabled)

          VStack(alignment: .leading, spacing: 24) {
            ContactInfoRow(icon: "envelope.fill", value: user.email, color: .blue)
            ContactInfoRow(icon: "phone.fill", value: user.phone, color: .green)
            ContactInfoRow(icon: "globe", value: user.website, color: .purple)
          }
          .padding(24)
          .background(
            RoundedRectangle(cornerRadius: 16)
              .fill(colorScheme == .dark ? Color(UIColor.systemGray6) : .white)
              .shadow(radius: 4)
          )
          .padding(.horizontal)

          Spacer()
          Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(colorScheme == .dark ? Color.black : Color.white)
      } else {
        ProgressView()
          .scaleEffect(1.5)
      }
    }
    .task {
      await viewModel.fetchUser(id: userId)
    }
  }

  private struct ContactInfoRow: View {
    let icon: String
    let value: String
    let color: Color
    
    var body: some View {
      HStack(spacing: 16) {
        Image(systemName: icon)
          .font(.system(size: 24))
          .foregroundColor(color)
          .frame(width: 32)
        
        Text(value)
          .font(.system(size: 17))
          .textSelection(.enabled)
      }
    }
  }
}

#Preview {
  UserDetailView(userId: 2)
}
