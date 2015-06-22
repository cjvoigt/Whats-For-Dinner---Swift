//
//  SecondViewController.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 6/11/15.
//  Copyright (c) 2015 Camden Voigt. All rights reserved.
//

import UIKit

class AddMealViewController: UIViewController : UITableViewDelegate {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var nameTextBox: UITextField!
    @IBOutlet weak var descriptionTextBox: UITextField!
    @IBOutlet weak var caloriesTextBox: UITextField!
    @IBOutlet weak var priceTextBox: UITextField!
    
    // MARK: Instance Variables
    
    var ingredientsList : [Ingredient] = Array();
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: IBActions
    
    @IBAction func addMeal(sender: AnyObject) {
        let meal = Meal(name: nameTextBox.text,
                 description: descriptionTextBox.text,
                       price: (priceTextBox.text as NSString).doubleValue,
                    calories: (caloriesTextBox.text as NSString).integerValue,
             ingredientsList: nil)
        var mealList = MealList()
        mealList.addMeal(meal)
    }
    
}

