//
//  Category.swift
//  RecipeManagement
//
//  Created by Nagarjun Mallesh on 22/04/24.
//

import Foundation
import SwiftData
import MarkdownUI

@Model
class Category {
    
    //MARK: Properties
    
    var name: String
    var isSelected: Bool
    @Relationship(inverse: \Recipe.categories) var recipes: Array<Recipe>
    
    
    //MARK: Initialization
    
    init(categoryName: String, recipes: Array<Recipe> = []) {
        self.name = categoryName
        self.isSelected = false
        self.recipes = recipes
    }
}
