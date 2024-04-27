//
//  RecipeManagementApp.swift
//  RecipeManagement
//
//  Created by Nagarjun Mallesh on 10/04/24.
//

import SwiftUI
import Firebase

@main
struct RecipeManagementApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
        .modelContainer(for: [Recipe.self])
    }
}

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.user != nil {
                RecipeHomeView()
            } else {
                LoginView()
            }
        }
    }
}
