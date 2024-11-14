//
//  ContentView.swift
//  ToastMessage
//
//  Created by Saketh Reddy Pundru on 14/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var toast: Toast? = nil
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Button {
//                toast = Toast(type: .error, title: "Oops", message: "Something went wrong")
//                toast = Toast(type: .success, title: "Success", message: "Success")
                toast = Toast(type: .info, title: "Success", message: "Success")
//                toast = Toast(type: .success, title: "Success", message: "Success")
            } label: {
                Text("Click Here to Check Toast")
            }
        }
        .padding()
        .toastView(toast: $toast)
    }
}

#Preview {
    ContentView()
}
