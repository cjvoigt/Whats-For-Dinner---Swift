//
//  Ingredient.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 8/8/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

enum IngredientKeys: String {
    case aisle = "aisle"
    case name = "name"
    case amount = "amount"
    case fullDescription = "originalString"
    case unitOfMeasure = "unit"
    case unitOfMeasureLongForm = "unitLong"
    case unitOfMeauserAbbreviation = "unitShort"
    case metaInformation = "metaInformation"
}

class Ingredient: NSObject, NSCoding, ImageObject {
    
    //MARK: Properties
    
    var aisle: String!
    var name: String!
    var amount: Double!
    var unitOfMeasure: String!
    var unitOfMeasureAbbreviation: String!
    var unitOfMeasureLongForm: String!
    var fullDescription: String!
    var metaInformation: [String]!
    var imageName: String?
    
    //MARK: NSCoding Protocol
    
    required init(coder aDecoder: NSCoder) {
        aisle = aDecoder.decodeObjectForKey(IngredientKeys.aisle.rawValue) as? String
        name = aDecoder.decodeObjectForKey(IngredientKeys.name.rawValue) as? String
        amount = aDecoder.decodeObjectForKey(IngredientKeys.amount.rawValue) as? Double
        unitOfMeasure = aDecoder.decodeObjectForKey(IngredientKeys.unitOfMeasure.rawValue) as? String
        unitOfMeasureLongForm = aDecoder.decodeObjectForKey(IngredientKeys.unitOfMeasureLongForm.rawValue) as? String
        unitOfMeasureAbbreviation = aDecoder.decodeObjectForKey(IngredientKeys.unitOfMeauserAbbreviation.rawValue) as? String
        fullDescription = aDecoder.decodeObjectForKey(IngredientKeys.fullDescription.rawValue) as? String
        metaInformation = aDecoder.decodeObjectForKey(IngredientKeys.metaInformation.rawValue) as? [String]
        imageName = aDecoder.decodeObjectForKey("imageName") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(aisle, forKey: IngredientKeys.aisle.rawValue)
        aCoder.encodeObject(name, forKey: IngredientKeys.name.rawValue)
        aCoder.encodeObject(amount, forKey: IngredientKeys.amount.rawValue)
        aCoder.encodeObject(unitOfMeasure, forKey: IngredientKeys.unitOfMeasure.rawValue)
        aCoder.encodeObject(unitOfMeasureLongForm, forKey: IngredientKeys.unitOfMeasureLongForm.rawValue)
        aCoder.encodeObject(unitOfMeasureAbbreviation, forKey: IngredientKeys.unitOfMeauserAbbreviation.rawValue)
        aCoder.encodeObject(fullDescription, forKey: IngredientKeys.fullDescription.rawValue)
        aCoder.encodeObject(metaInformation, forKey: IngredientKeys.metaInformation.rawValue)
        aCoder.encodeObject(imageName, forKey: "imageName")
    }
    
    //MARK: Object Life Cycle
    
    init(ingredientDictionary: [String: AnyObject]) {
        self.aisle = ingredientDictionary[IngredientKeys.aisle.rawValue] as! String
        self.name = ingredientDictionary[IngredientKeys.name.rawValue] as! String
        self.amount = ingredientDictionary[IngredientKeys.amount.rawValue] as! Double
        self.fullDescription = ingredientDictionary[IngredientKeys.fullDescription.rawValue] as! String
        self.unitOfMeasure = ingredientDictionary[IngredientKeys.unitOfMeasure.rawValue] as! String
        self.unitOfMeasureLongForm = ingredientDictionary[IngredientKeys.unitOfMeasureLongForm.rawValue] as! String
        self.unitOfMeasureAbbreviation = ingredientDictionary[IngredientKeys.unitOfMeauserAbbreviation.rawValue] as! String
        self.metaInformation = ingredientDictionary[IngredientKeys.metaInformation.rawValue] as! [String]
        imageName = nil
    }
    
    init(name: String?, amount: Double?, unitOfMeasure: String?, fullDescription: String?, aisle: String?, metaInformation: [String]?) {
        self.aisle = aisle
        self.name = name
        self.amount = amount
        self.unitOfMeasure = unitOfMeasure
        self.fullDescription = fullDescription
        self.metaInformation = metaInformation

        //TDOO: Create formatters to help initialize these
        unitOfMeasureAbbreviation = ""
        unitOfMeasureLongForm = ""
    }
}
