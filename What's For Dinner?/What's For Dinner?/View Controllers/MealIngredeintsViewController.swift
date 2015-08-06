//
//  mealIngredeintsViewController.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 8/5/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

class MealIngredeintsViewController: UITableViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var viewSelctor: UISegmentedControl!

    //MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        viewSelctor.selectedSegmentIndex = 1
    }
    
    //MARK: IBActions
    
    @IBAction func switchToDirectionsView(sender: AnyObject) {
       navigationController?.popViewControllerAnimated(true)
        print("MealIngredientsToMealDiirections")
    }
    
    @IBAction func addIngredients(sender: AnyObject) {
        performSegueWithIdentifier("MealIngredientsToAddMealIngredient", sender: self)
    }
    
    //MARK: Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "MealIngredientsToMealDiirections" {
            print("MealIngredientsToMealDiirections")
        } else if segue.identifier == "MealIngredientsToAddMealIngredient" {
            print("MealIngredientsToAddMealIngredient")
        }
    }
}
