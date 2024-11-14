//
//  ToastView.swift
//  ToastMessage
//
//  Created by Saketh Reddy Pundru on 14/11/24.
//

import SwiftUI

// MARK: - ToastView
/// A view representing a toast notification with customizable style, title, message, and a cancel button.
struct ToastView: View {
    
    // MARK: - Properties
    var style: ToastStyle
    var message: String
    var title: String
    var width = CGFloat.infinity
    var onCancelTapped: (() -> Void)
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            
            // MARK: Icon
            /// Displays the icon based on the toast style.
            Image(systemName: style.iconFileName)
                .foregroundStyle(style.themeColor)
            
            VStack(alignment: .leading) {
                
                // MARK: Title Text
                /// Displays the title text in a bold font.
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                
                
                // MARK: Message Text
                /// Displays the main message with a slightly faded color.
                Text(message)
                    .font(.system(size: 12))
                    .foregroundColor(Color.black.opacity(0.6))
            }
            
            Spacer(minLength: 10)
            
            // MARK: Cancel Button
            /// Button to dismiss the toast.
            Button {
                onCancelTapped()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(style.themeColor)
            }
        }
        .padding(8)
        .background(Color.white)
        
        // MARK: Left Border
        /// A colored left border to indicate the toast style.
        .overlay(
            Rectangle()
                .fill(style.themeColor)
                .frame(width: 6)
                .clipped()
            , alignment: .leading
        )
        .frame(minWidth: 0, maxWidth: .infinity)
        .cornerRadius(8)
        
        // MARK: Shadow
        /// Adds a shadow to the toast for depth.
        .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 1)
        .padding()
    }
}

#Preview {
    VStack(spacing: 32) {
        ToastView(
            style: .success,
            message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", title: "ABC") {}
        ToastView(
            style: .error,
            message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", title: "ABC") {}
    }
}
