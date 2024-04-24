//
//  RecipesView.swift
//  RecipeManagement
//
//  Created by Nagarjun Mallesh on 22/04/24.
//

import SwiftUI
import SwiftData


struct RecipeHomeView: View {
    
    //MARK: Properties
    
    @Environment(\.modelContext) private var modelContext
    
    @Query private var recipes: Array<Recipe>
    @Query private var categories: Array<Category>
    @StateObject private var viewModel = AuthViewModel()
    
    @State private var showingSheet = false
    @State private var recipeExists: String?
    @State private var selectedFilter: Filter = .all
    @State private var searchText = ""
    @State private var showProfileView = false
    
    enum Filter: String {
        case all = "All"
        case categories = "Categories"
        case favourites = "Favorites"
        case search = "Search"
    }

    
    //MARK: Main View
    
    var body: some View {
        Group {
            if viewModel.user != nil {
                NavigationSplitView {
                    GeometryReader { geometry in
                        VStack(spacing: 20) {
                            SearchBarView(searchText: $searchText, selectedFilter: $selectedFilter)
                                .padding(.top, 10)
                            FilterButtonsView(searchText: $searchText, selectedFilter: $selectedFilter, geometryWidth: geometry.size.width)
                            ListView(selectedFilter: $selectedFilter, geometryWidth: geometry.size.width, recipes: recipes, categories: categories, searchString: searchText)
                        }
                        .sheet(isPresented: $showingSheet) {
                            FormView(recipe: nil)
                        }
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Text("Recipes")
                                    .font(.system(size: 25))
                                    .fontWeight(.bold)
                            }
                            ToolbarItem {
                                Button(action: initializeRecipes) {
                                    Image(systemName: "pencil.and.scribble")
                                }
                                .foregroundColor(Color(UIColor.darkGray))
                            }
                            ToolbarItem {
                                Button(action: {
                                    showProfileView.toggle()
                                }) {
                                    Image(systemName: "person.circle")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .foregroundColor(Color(UIColor.darkGray))
                                }
                                .sheet(isPresented: $showProfileView) {
                                    ProfileView()
                                }
                            }
                            ToolbarItem {
                                Button(action: {
                                    showingSheet.toggle()
                                }) {
                                    HStack {
                                        Image(systemName: "plus")
                                            .resizable()
                                            .frame(width: 10, height: 10)
                                        Text("Add Recipe")
                                            .font(.system(size: 18))
                                            .fontWeight(.semibold)
                                    }
                                    .padding(.vertical, 5)
                                    .padding(.leading, 10)
                                    .padding(.trailing, 20)
                                    .foregroundColor(Color.white)
                                    .background(Color.green)
                                    .cornerRadius(10)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                } detail: {
                    Text("Select a Recipe")
                }
            } else {
                LoginView()
            }
        }
        .onAppear {
            if viewModel.user == nil {
                do {
                    try viewModel.signOut()
                } catch {
                    // Handle the error appropriately
                    print("Failed to sign out: \(error)")
                }
            }
        }
    }
    
    
    //MARK: Methods
    
    private func initializeRecipes() {
        for recipe in sampleRecipes {
            modelContext.insert(recipe)
        }
        
        do {
            try modelContext.save()
        } catch {
            // Handle the error appropriately
            print("Failed to save recipes: \(error)")
        }
    }
}

struct SearchBarView: View {
    
    //MARK: Properties
    
    @Binding var searchText: String
    @Binding var selectedFilter: RecipeHomeView.Filter
    
    //MARK: Main View
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(UIColor.systemGray3))
                .cornerRadius(30)
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color(UIColor.systemGray3))
                TextField(
                    "Search Recipes",
                    text: $searchText
                )
                .foregroundColor(Color(UIColor.systemGray5))
            }
            .padding(.horizontal, 15)
            .onTapGesture {
                withAnimation(.easeIn(duration: 0.3)) {
                    selectedFilter = RecipeHomeView.Filter.search
                }
            }
        }
        .frame(height: 50)
    }
}

//#Preview {
//    RecipesView()
//}
