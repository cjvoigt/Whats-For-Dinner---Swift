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
    case veryPopular = "veryPopular"
    case sustainable = "sustainable"
    case idNumber = "id"
    case servings = "servings"
    case numberOfLikes = "aggregateLikes"
    case cookTime = "readyInMinutes"
    case title = "title"
    case imageName = "image"
    case sourceURL = "soucreUrl"
    case spoonacularSourceURL = "spoonacularSourceUrl"
    case text = "text"
    case instructions = "instructions"
    case imageURLs = "imageUrls"
    case ingredients = "extendedIngredients"
}

class Meal: NSObject, NSCoding, ImageObject {
    
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
    var imageName: String?
    var sourceURL: String!
    var spoonacularSourceURL: String!
    var text: String!
    var instructions: String!
    var imageURLs: [String]!
    var ingredients: [Ingredient]!
    
    //MARK: NSCoding Protocol
    
    required init(coder aDecoder: NSCoder) {
        vegitarian = aDecoder.decodeObjectForKey(MealKeys.vegetarian.rawValue) as! Bool
        vegan = aDecoder.decodeObjectForKey(MealKeys.vegan.rawValue) as! Bool
        glutenFree = aDecoder.decodeObjectForKey(MealKeys.glutenFree.rawValue) as! Bool
        dairyFree = aDecoder.decodeObjectForKey(MealKeys.dairyFree.rawValue) as! Bool
        veryHealthy = aDecoder.decodeObjectForKey(MealKeys.veryHealthy.rawValue) as! Bool
        cheap = aDecoder.decodeObjectForKey(MealKeys.cheap.rawValue) as! Bool
        veryPopular = aDecoder.decodeObjectForKey(MealKeys.veryPopular.rawValue) as! Bool
        sustainable = aDecoder.decodeObjectForKey(MealKeys.sustainable.rawValue) as! Bool
        idNumber = aDecoder.decodeObjectForKey(MealKeys.idNumber.rawValue) as! Int
        servings = aDecoder.decodeObjectForKey(MealKeys.servings.rawValue) as! Int
        numberOfLikes = aDecoder.decodeObjectForKey(MealKeys.numberOfLikes.rawValue) as! Int
        cookTime = aDecoder.decodeObjectForKey(MealKeys.cookTime.rawValue) as! Double
        title = aDecoder.decodeObjectForKey(MealKeys.title.rawValue) as! String
        imageName = aDecoder.decodeObjectForKey(MealKeys.imageName.rawValue) as? String
        sourceURL = aDecoder.decodeObjectForKey(MealKeys.sourceURL.rawValue) as! String
        spoonacularSourceURL = aDecoder.decodeObjectForKey(MealKeys.spoonacularSourceURL.rawValue) as! String
        text = aDecoder.decodeObjectForKey(MealKeys.text.rawValue) as! String
        instructions = aDecoder.decodeObjectForKey(MealKeys.instructions.rawValue) as! String
        imageURLs = aDecoder.decodeObjectForKey(MealKeys.imageURLs.rawValue) as! [String]
        ingredients = aDecoder.decodeObjectForKey(MealKeys.ingredients.rawValue) as! [Ingredient]
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(vegitarian, forKey: MealKeys.vegetarian.rawValue)
        aCoder.encodeObject(vegan, forKey: MealKeys.vegan.rawValue)
        aCoder.encodeObject(glutenFree, forKey:MealKeys.glutenFree.rawValue)
        aCoder.encodeObject(dairyFree, forKey:MealKeys.dairyFree.rawValue)
        aCoder.encodeObject(veryHealthy, forKey:MealKeys.veryHealthy.rawValue)
        aCoder.encodeObject(cheap, forKey:MealKeys.cheap.rawValue)
        aCoder.encodeObject(veryPopular, forKey:MealKeys.veryPopular.rawValue)
        aCoder.encodeObject(sustainable, forKey:MealKeys.sustainable.rawValue)
        aCoder.encodeObject(idNumber, forKey:MealKeys.idNumber.rawValue)
        aCoder.encodeObject(servings, forKey:MealKeys.servings.rawValue)
        aCoder.encodeObject(numberOfLikes, forKey:MealKeys.numberOfLikes.rawValue)
        aCoder.encodeObject(cookTime, forKey:MealKeys.cookTime.rawValue)
        aCoder.encodeObject(title, forKey:MealKeys.title.rawValue)
        aCoder.encodeObject(imageName, forKey:MealKeys.imageName.rawValue)
        aCoder.encodeObject(sourceURL, forKey:MealKeys.sourceURL.rawValue)
        aCoder.encodeObject(spoonacularSourceURL, forKey:MealKeys.spoonacularSourceURL.rawValue)
        aCoder.encodeObject(text, forKey:MealKeys.text.rawValue)
        aCoder.encodeObject(instructions, forKey:MealKeys.instructions.rawValue)
        aCoder.encodeObject(imageURLs, forKey:MealKeys.imageURLs.rawValue)
        aCoder.encodeObject(ingredients, forKey:MealKeys.ingredients.rawValue)
    }
    
    //MARK: Object Life Cycle
    
    init(json: JSON?) {
        if let _ = json {
            let results = json?.rawValue as! NSDictionary
            vegitarian = results[MealKeys.vegetarian.rawValue] as! Bool
            vegan = results[MealKeys.vegan.rawValue] as! Bool
            glutenFree = results[MealKeys.glutenFree.rawValue] as! Bool
            dairyFree = results[MealKeys.dairyFree.rawValue] as! Bool
            veryHealthy = results[MealKeys.veryHealthy.rawValue] as! Bool
            cheap = results[MealKeys.cheap.rawValue] as! Bool
            veryPopular = results[MealKeys.veryPopular.rawValue] as! Bool
            sustainable = results[MealKeys.sustainable.rawValue] as! Bool
            idNumber = results[MealKeys.idNumber.rawValue] as! Int
            servings = results[MealKeys.servings.rawValue] as! Int
            numberOfLikes = results[MealKeys.numberOfLikes.rawValue] as! Int
            cookTime = results[MealKeys.cookTime.rawValue] as! Double
            title = results[MealKeys.title.rawValue] as! String
            imageName = results[MealKeys.imageName.rawValue] as? String
            sourceURL = results[MealKeys.sourceURL.rawValue] as! String
            spoonacularSourceURL = results[MealKeys.spoonacularSourceURL.rawValue] as! String
            text = results[MealKeys.text.rawValue] as! String
            instructions = results[MealKeys.instructions.rawValue] as! String
            imageURLs = results[MealKeys.sourceURL.rawValue] as? Array
            super.init()
            ingredients = self.prepareIngredients(results[MealKeys.ingredients.rawValue] as! [AnyObject])
        } else {
            super.init()
        }
    }
    
    convenience init(title: String, attributes: [String: Bool], cookTime: Double, ingredients: [Ingredient], text:String, servings: Int) {
        self.init(json: nil)
        vegitarian = attributes[MealKeys.vegetarian.rawValue]
        vegan = attributes[MealKeys.vegan.rawValue]
        glutenFree = attributes[MealKeys.glutenFree.rawValue]
        dairyFree = attributes[MealKeys.dairyFree.rawValue]
        veryHealthy = attributes[MealKeys.veryHealthy.rawValue]
        cheap = attributes[MealKeys.cheap.rawValue]
        veryPopular = attributes[MealKeys.veryPopular.rawValue]
        sustainable = attributes[MealKeys.sustainable.rawValue]
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
    
    private func prepareIngredients(ingredientsList: [AnyObject]) -> [Ingredient] {
        var recipeIngredients: [Ingredient] = []
        
        for var i = 0; i <= ingredientsList.count - 1; i++ {
            let ingredient = Ingredient(ingredientDictionary: ingredientsList[i] as! [String : AnyObject])
            recipeIngredients.append(ingredient)
        }
        
        return recipeIngredients
    }
}
