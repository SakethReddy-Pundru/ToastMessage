//
//  ToastModifier.swift
//  ToastMessage
//
//  Created by Saketh Reddy Pundru on 14/11/24.
//

import SwiftUI

// MARK: - ToastModifier
/// A view modifier that displays a toast message overlay with animation and auto-dismiss functionality.

struct ToastModifier: ViewModifier {
    
    // MARK: - Properties
    
    /// Binding to the `Toast` instance to display.
    @Binding var toast: Toast?
    /// Work item to manage the toast dismissal timing.
    @State private var workItem: DispatchWorkItem?
    
    // MARK: - Body
    
    func body(content: Content) -> some View {
        if #available(iOS 17.0, *) {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay {
                    ZStack {
                        toastView() // Display the toast view overlay
                            .offset(y: -30) // Position adjustment
                    }.animation(.spring(), value: toast)    // Animate toast appearance/disappearance
                }
                .onChange(of: toast, {
                    showToast() // Show the toast when `toast` changes
                })
        } else {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay {
                    ZStack {
                        toastView() // Display the toast view overlay
                            .offset(y: -30) // Position adjustment
                    }.animation(.spring(), value: toast)    // Animate toast appearance/disappearance
                }
                .onChange(of: toast) { value in
                    showToast() // Show the toast when `toast` changes
                }
        }
    }
    
    // MARK: - Toast View
    
    /// Generates the view for displaying the toast, if available.
    @ViewBuilder func toastView() -> some View {
        if let toast = toast {
            VStack {
                Spacer()
                ToastView(style: toast.type, message: toast.message, title: toast.title) {
                    dismissToast()  // Dismiss toast on user interaction
                }
            }
            .transition(.move(edge: .bottom))   // Animated transition for toast entry and exit
        }
    }
    
    // MARK: - Show Toast
    
    /// Shows the toast with vibration feedback and sets up an auto-dismiss timer.
    private func showToast() {
        guard let toast = toast else { return }
        
        UIImpactFeedbackGenerator(style: .light).impactOccurred()   // Trigger light feedback
        
        if toast.duration > 0 {
            workItem?.cancel()  // Cancel any existing dismiss work item
            
            // Set up a new dismissal task after the specified duration
            let task = DispatchWorkItem {
                dismissToast()
            }
            
            workItem = task
            DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration, execute: task)
        }
    }
    
    // MARK: - Dismiss Toast
    
    /// Dismisses the toast with animation and cancels any ongoing dismiss work item.
    private func dismissToast() {
        withAnimation {
            toast = nil
        }
        
        workItem?.cancel()
        workItem = nil
    }
}

// MARK: - View Extension

extension View {
    
    /// A helper function to apply the `ToastModifier` to a view.
    func toastView(toast: Binding<Toast?>) -> some View {
        self.modifier(ToastModifier(toast: toast))
    }
}
