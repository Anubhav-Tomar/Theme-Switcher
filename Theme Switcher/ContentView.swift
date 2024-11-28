//
//  ContentView.swift
//  Theme Switcher
//
//  Created by Anubhav Tomar on 27/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var changeTheme: Bool = false
    @AppStorage("userTheme") private var userTheme: Theme = .systemDefault
    @Environment(\.colorScheme) private var scheme
    
    var body: some View {
        NavigationStack {
            List {
                Section("Appearance") {
                    Button("Change Theme") {
                        changeTheme.toggle()
                    }
                }
            }
            .navigationTitle("Settings")
        }
        .preferredColorScheme(userTheme.colorScheme)
        .sheet(isPresented: $changeTheme, content: {
            ThemeChangeView(scheme: scheme)
                .presentationDetents([.height(410)])
                .presentationBackground(.clear)
        })
    }
}

#Preview {
    ContentView()
}
