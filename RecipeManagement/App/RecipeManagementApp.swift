//
//  RecipeManagementApp.swift
//  RecipeManagement
//
//  Created by Nagarjun Mallesh on 10/04/24.
//

import SwiftUI
import Firebase

//@main
//struct RecipeManagementApp: App {
//    @StateObject  var viewModel = AuthViewModel()
//    
//    init() {
//        FirebaseApp.configure()
//    }
//    
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//                .environmentObject(viewModel)
//        }
//    }
//}
@main
struct RecipeManagementApp: App {

    var body: some Scene {
        WindowGroup {
            RecipeHomeView()
        }
        .modelContainer(for: [Recipe.self])
    }
}
