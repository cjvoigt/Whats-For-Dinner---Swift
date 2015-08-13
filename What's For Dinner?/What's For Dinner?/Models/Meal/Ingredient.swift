//
//  Ingredient.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 8/8/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

class Ingredient: NSObject {
    
    //MARK: Properties
    
    var asile: String!
    var name: String!
    var amount: Double!
    var unitOfMeasure: String!
    var unitOfMeasureAbbreviation: String!
    var unitOfMeasureLongForm: String!
    var fullDescription: String!
    var metaInformation: [String]!
    
    //MARK: Object Life Cycle
    
    init(ingredientDictionary: [String: AnyObject]) {
        self.asile = ingredientDictionary["aisle"] as! String
        self.name = ingredientDictionary["name"] as! String
        self.amount = ingredientDictionary["amount"] as! Double
        self.fullDescription = ingredientDictionary["originalString"] as! String
        self.unitOfMeasure = ingredientDictionary["unit"] as! String
        self.unitOfMeasureLongForm = ingredientDictionary["unitLong"] as! String
        self.unitOfMeasureAbbreviation = ingredientDictionary["unitShort"] as! String
        self.metaInformation = ingredientDictionary["metaInformation"] as! [String]
    }
    
    init(name: String, amount: Double, unitOfMeasure: String, fullDescription: String, asile: String, metaInformation: [String]) {
        self.asile = asile
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
