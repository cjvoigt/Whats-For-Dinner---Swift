//
//  Meal.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 8/9/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

class Meal: NSObject {
    
    //MARK: Properties
    
    var vegitarian: Bool!
    var vegan: Bool!
    var glutenFree: Bool!
    var dairyFree: Bool!
    var veryHealthy: Bool!
    var cheap: Bool!
    var veryPopular: Bool!
    var sustainable: Bool!
    var idNumber: Int!
    var servings: Int!
    var numberOfLikes: Int!
    var cookTime: Double!
    var title: String!
    var imageName: String!
    var sourceURL: String!
    var spoonacularSourceURL: String!
    var text: String!
    var instructions: String!
    var imageURLs: [String]!
    var ingredients: [Ingredient]!
    
    //MARK: Object Life Cycle
    
    init(json: JSON?) {
        if let _ = json {
            let results = json?.rawValue as! NSDictionary
            vegitarian = results["vegetarian"] as! Bool
            vegan = results["vegan"] as! Bool
            glutenFree = results["glutenFree"] as! Bool
            dairyFree = results["dairyFree"] as! Bool
            veryHealthy = results["veryHealthy"] as! Bool
            cheap = results["cheap"] as! Bool
            veryPopular = results["veryPopular"] as! Bool
            sustainable = results["sustainable"] as! Bool
            idNumber = results["id"] as! Int
            servings = results["servings"] as! Int
            numberOfLikes = results["aggregateLikes"] as! Int
            cookTime = results["readyInMinutes"] as! Double
            title = results["title"] as! String
            imageName = results["image"] as! String
            sourceURL = results["sourceUrl"] as! String
            spoonacularSourceURL = results["spoonacularSourceUrl"] as! String
            text = results["text"] as! String
            instructions = results["instructions"] as! String
            imageURLs = results["imageURLs"] as? Array
            super.init()
            ingredients = self.prepareIngredients(results["extendedIngredients"] as! [AnyObject])
        } else {
            super.init()
        }
    }
    
    convenience init(title: String, attributes: [String: Bool], cookTime: Double, ingredients: [Ingredient], text:String, servings: Int) {
        self.init(json: nil)
        vegitarian = attributes["vegetarian"]
        vegan = attributes["vegan"]
        glutenFree = attributes["glutenFree"]
        dairyFree = attributes["dairyFree"]
        veryHealthy = attributes["veryHealthy"]
        cheap = attributes["cheap"]
        veryPopular = attributes["veryPopular"]
        sustainable = attributes["sustainable"]
        idNumber = nil
        self.servings = servings
        numberOfLikes = nil
        self.cookTime = cookTime
        self.title =  title
        imageName = nil
        sourceURL = nil
        spoonacularSourceURL = nil
        self.text = text
        instructions = nil
        imageURLs = nil
        self.ingredients = ingredients
    }
    
    func prepareIngredients(ingredientsList: [AnyObject]) -> [Ingredient] {
        var recipeIngredients: [Ingredient] = []
        
        for var i = 0; i <= ingredientsList.count - 1; i++ {
            let ingredient = Ingredient(ingredientDictionary: ingredientsList[i] as! [String : AnyObject])
            recipeIngredients.append(ingredient)
        }
        
        return recipeIngredients
    }
}
