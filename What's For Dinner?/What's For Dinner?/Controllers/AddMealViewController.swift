//
//  SecondViewController.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 6/11/15.
//  Copyright (c) 2015 Camden Voigt. All rights reserved.
//

import UIKit

class AddMealViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var nameTextBox: UITextField!
    @IBOutlet weak var descriptionTextBox: UITextView!
    @IBOutlet weak var caloriesTextBox: UITextField!
    @IBOutlet weak var priceTextBox: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Instance Variables
    
    var ingredientsList : [Ingredient] = Array();
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDescriptionTextField()
        addBarButtonItem()
        tableView.reloadData()
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
        
        nameTextBox.text = ""
        descriptionTextBox.text = ""
        caloriesTextBox.text = ""
        priceTextBox.text = ""
    }
    
    // MARK: UITableView Data Source
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : AnyObject? = tableView.dequeueReusableCellWithIdentifier("IngredientCells")
        if let cell: AnyObject = cell {
            let ingredientNameLabel = cell.viewWithTag(101) as! UILabel
            ingredientNameLabel.text = ingredientsList[indexPath.row].name
            
            let ingredientDetailsLabel = cell.viewWithTag(102) as! UILabel
            ingredientDetailsLabel.text = ingredientsList[indexPath.row].description
            
            let ingredientCaloriesLabel = cell.viewWithTag(103) as! UILabel
            ingredientCaloriesLabel.text = "\(ingredientsList[indexPath.row].calories)"
            
            let ingredientPriceLabel = cell.viewWithTag(104) as! UILabel
            ingredientPriceLabel.text = "\(ingredientsList[indexPath.row].price)"
            
            return cell as! UITableViewCell
        }
        return cell as! UITableViewCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientsList.count
    }
    
    //MARK: Private API
    
    func configureDescriptionTextField() {
        descriptionTextBox.layer.borderWidth = 1
        descriptionTextBox.layer.borderColor = UIColor.lightGrayColor().CGColor
    }
    
    //MARK: Bar Button Item
    
    func addBarButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Ingredient", style: .Plain, target: self, action: "moveToAddIngredientView")
    }
    
    func moveToAddIngredientView() {
        performSegueWithIdentifier("AddMealToAddIngredient", sender: self)
    }
    
    // MARK: Segue Methods
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddMealToAddIngredient" {
            var ingredientView = segue.destinationViewController as! AddIngredientViewController
            ingredientView.mealViewController = self
        }
    }
}

