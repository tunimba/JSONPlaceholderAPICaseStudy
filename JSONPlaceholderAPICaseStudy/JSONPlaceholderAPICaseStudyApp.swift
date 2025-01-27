//
//  JSONPlaceholderAPICaseStudyApp.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 24.01.2025.
//

import SwiftUI

@main
struct JSONPlaceholderAPICaseStudyApp: App {
  /// Main scene of the application
  /// - Returns: Initial view of the application using coordinator pattern
  var body: some Scene {
    WindowGroup {
      AppCoordinator.shared.start()
    }
  }
}
