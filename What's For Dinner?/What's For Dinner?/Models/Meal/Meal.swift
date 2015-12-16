//
//  Meal.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 8/9/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

enum MealKeys: String { 
    case vegetarian = "vegetarian"
    case vegan = "vegan"
    case glutenFree = "glutenFree"
    case dairyFree = "dairyFree"
    case veryHealthy = "veryHealthy"
    case cheap = "cheap"
    case servings = "servings"
    case cookTime = "readyInMinutes"
    case title = "title"
    case ingredients = "extendedIngredients"
}

class Meal: NSObject{
    
    //MARK: Properties
    
    var vegitarian: Bool!
    var vegan: Bool!
    var glutenFree: Bool!
    var dairyFree: Bool!
    var veryHealthy: Bool!
    var cheap: Bool!
    var servings: Int!
    var cookTime: Double!
    var name: String!
    var imageName: String!
    var ingredients: [Ingredient]!
    
}
