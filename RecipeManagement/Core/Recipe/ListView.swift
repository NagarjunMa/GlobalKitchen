//
//  ListView.swift
//  RecipeManagement
//
//  Created by Nagarjun Mallesh on 22/04/24.
//

import SwiftUI

struct ListView: View {
    
    //MARK: Properties
    
    @State private var recipeExists: String?
    
    @Binding var selectedFilter: RecipeHomeView.Filter
    
    let geometryWidth: CGFloat
    var recipes: Array<Recipe>
    var categories: Array<Category>
    var searchString: String
    
    
    //MARK: Main View
    
    var body: some View {
        VStack {
            ScrollView {
                if selectedFilter == RecipeHomeView.Filter.all {
                    ForEach(recipes) { recipe in
                        NavigationLink {
                            RecipeView(recipe: recipe)
                        } label: {
                            RecipeListItem(recipeName: recipe.title, geometryWidth: geometryWidth)
                        }
                    }
                } else if selectedFilter == RecipeHomeView.Filter.categories {
                    ForEach(categories) { category in
                        CategoryListItemView(categoryName: category.name, recipesInCategory: category.recipes, geometryWidth: geometryWidth)
                    }
                } else if selectedFilter == RecipeHomeView.Filter.favourites {
                    ForEach(recipes) { recipe in
                        if recipe.isFavourite {
                            NavigationLink {
                                RecipeView(recipe: recipe)
                            } label: {
                                RecipeListItem(recipeName: recipe.title, geometryWidth: geometryWidth)
                            }
                        }
                    }
                } else {
                    ForEach(recipes) { recipe in
                        if recipe.title.contains(searchString) {
                            NavigationLink {
                                RecipeView(recipe: recipe)
                            } label: {
                                RecipeListItem(recipeName: recipe.title, geometryWidth: geometryWidth)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct RecipeListItem: View {
    
    //MARK: Properties
    
    let recipeName: String
    let geometryWidth: CGFloat
    
    
    //MARK: Main View
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(UIColor.lightGreen))
                .cornerRadius(10)
            HStack {
                Text(recipeName)
                    .foregroundStyle(Color(UIColor.darkGrey))
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(Color(UIColor.darkGrey))
            }
            .padding(15)
        }
    }
}

struct CategoryListItemView: View {
    
    //MARK: Properties
    
    let categoryName: String
    let recipesInCategory: Array<Recipe>
    let geometryWidth: CGFloat
    @State private var isSelected: Bool = false
    
    
    //MARK: Main View
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(UIColor.green))
                .cornerRadius(10)
            HStack {
                Text(categoryName)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: isSelected ? "chevron.up" : "chevron.down")
                    .foregroundColor(.white)
            }
            .padding(15)
        }
        .onTapGesture {
            withAnimation(.easeIn(duration: 0.3)) {
                isSelected.toggle()
            }
        }
        
        if isSelected {
            ForEach(recipesInCategory, id: \.self) { recipe in
                NavigationLink {
                    RecipeView(recipe: recipe)
                } label: {
                    RecipeListItem(recipeName: recipe.title, geometryWidth: geometryWidth)
                }
            }
        }
    }
}
