//
//  Logger.swift
//  JSONPlaceholderAPICaseStudy
//
//  Created by Tunahan Aktay on 26.01.2025.
//

import OSLog

/// Centralized logging configuration for the application.
extension Logger {
  private static let subsystem = Bundle.main.bundleIdentifier!

  static let networking = Logger(subsystem: subsystem, category: "Networking")
  static let storage = Logger(subsystem: subsystem, category: "Storage")
}
