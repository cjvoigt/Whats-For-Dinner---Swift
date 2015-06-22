//
//  Ingredient.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 6/19/15.
//  Copyright (c) 2015 Camden Voigt. All rights reserved.
//

import Foundation

class Ingredient{
    
    // MARK: Instance Variables
    
    let name:String
    let description:String
    let calories:Int
    let price:Double
    
    // MARK: Object Life Cycle
    
    init(name:String, description:String, price:Double, calories:Int){
        self.name = name
        self.description = description
        self.price = price
        self.calories = calories
    }
}