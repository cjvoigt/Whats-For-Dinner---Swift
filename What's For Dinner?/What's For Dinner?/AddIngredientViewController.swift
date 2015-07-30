//
//  AddIngredientViewController.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 6/22/15.
//  Copyright (c) 2015 Camden Voigt. All rights reserved.
//

import UIKit

class AddIngredientViewController: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var nameTextBox: UITextField!
    @IBOutlet weak var descriptionTextBox: UITextField!
    @IBOutlet weak var caloriesTextBox: UITextField!
    @IBOutlet weak var priceTextBox: UITextField!
    
    //MARK: Instance Variables
    
    var mealViewController: AddMealViewController? = nil
    
    //MARK: IBActions
    
    @IBAction func addIngredient(sender: AnyObject) {
        var ingredient = Ingredient(name: nameTextBox.text,
                             description: descriptionTextBox.text,
                                   price: (priceTextBox.text as NSString).doubleValue,
                                calories: (caloriesTextBox.text as NSString).integerValue)
        if let mealController = mealViewController {
            mealController.ingredientsList.append(ingredient)
        }
        nameTextBox.text = ""
        descriptionTextBox.text = ""
        caloriesTextBox.text = ""
        priceTextBox.text = ""
    }
}