//
//  Meals.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 8/9/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

class Meals: NSObject {
    
    //MARK: Properties
    
    var meals: [Meal]
    
    //MARK: Object Life Cycle
    
    init(meals: [Meal]) {
        self.meals = meals
    }
}
