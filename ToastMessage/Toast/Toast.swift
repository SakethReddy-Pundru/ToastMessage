//
//  Toast.swift
//  ToastMessage
//
//  Created by Saketh Reddy Pundru on 14/11/24.
//

import Foundation

// MARK: - Toast Struct
/// Represents a Toast notification with style, title, message, and duration

struct Toast: Equatable {
    
    // MARK: - Properties
    
    var type: ToastStyle
    var title: String
    var message: String
    var duration: Double = 3
}
