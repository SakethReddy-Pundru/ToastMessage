//
//  ToastStyle.swift
//  ToastMessage
//
//  Created by Saketh Reddy Pundru on 14/11/24.
//

import Foundation
import SwiftUICore

// MARK: - ToastStyle Enum
/// Defines the style of a toast notification with associated color and icon for each type.

enum ToastStyle {
    
    // MARK: - Cases
    case error
    case warning
    case success
    case info
    
    // MARK: - Theme Color
    
    /// Provides the theme color for each toast style.
    var themeColor: Color {
        switch self {
        case .error: return Color.red
        case .warning: return Color.orange
        case .success: return Color.green
        case .info: return Color.blue
        }
    }
    
    // MARK: - Icon
    
    /// Provides the SF Symbol icon file name for each toast style.
    var iconFileName: String {
        switch self {
        case .error: return "xmark.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .success: return "checkmark.circle.fill"
        case .info: return "info.circle.fill"
        }
    }
}
