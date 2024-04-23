//
//  Recipe.swift
//  RecipeManagement
//
//  Created by Nagarjun Mallesh on 22/04/24.
//

import Foundation
import SwiftData  // Assuming this includes the @Model functionality.
import MarkdownUI

@Model
class Recipe {
    
    //MARK: Properties
    
    var title: String
    var author: String
    var isFavourite: Bool
    var date: Date
    var categories: [Category]
    var hours: Int
    var minutes: Int
    var skillLevel: String
    var servingSize: Int
    var ingredients: String
    var directions: String
    var notes: String
    
    // Enums can be directly included as properties if the framework supports it
    enum SkillLevel: String, CaseIterable {
        case Beginner
        case Intermediate
        case Advanced
    }
    //MARK: Initialization
    
    init(title: String, author: String, isFavourite: Bool = false, date: Date, categories: [Category], hours: Int, minutes: Int, skillLevel: SkillLevel, servingSize: Int, ingredients: String, directions: String, notes: String) {
        self.title = title
        self.author = author
        self.isFavourite = isFavourite
        self.date = date
        self.categories = categories
        self.hours = hours
        self.minutes = minutes
        self.skillLevel = skillLevel.rawValue
        self.servingSize = servingSize
        self.ingredients = ingredients
        self.directions = directions
        self.notes = notes
    }
}

