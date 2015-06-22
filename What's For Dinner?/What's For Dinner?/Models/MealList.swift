//
//  MealList.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 6/19/15.
//  Copyright (c) 2015 Camden Voigt. All rights reserved.
//

import Foundation

class MealList{
    
    // MARK: Instance Variables
    
    static var mealList:[Meal]?
   
    // MARK: Object Life Cycle
    
    init(){
        if let list = MealList.mealList {
            return
        } else {
            MealList.mealList = Array()
        }
    }
    
    init(mealList:[Meal]){
        if let list = MealList.mealList {
            return
        } else {
            MealList.mealList = mealList
        }
    }
    
    //MARK: Public Methods
    
    func addMeal(meal:Meal){
        if let list = MealList.mealList {
            MealList.mealList!.append(meal)
        }
    }
}