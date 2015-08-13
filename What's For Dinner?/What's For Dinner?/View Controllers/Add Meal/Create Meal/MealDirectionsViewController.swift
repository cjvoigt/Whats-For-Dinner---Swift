//
//  MealDirectionsViewController.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 8/5/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

class MealDirectionsViewController: UITableViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var viewSelector: UISegmentedControl!
    
    //MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageIndex = 1
        //createHeaderView()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        title = "Step 2: Create Directions"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "add:")
        //headerView.reloadData()
    }
    
    //MARK: IBActions
    
    @IBAction func switchToIngredientsView(sender: AnyObject) {
        performSegueWithIdentifier("MealDirectionsToMealIngredients", sender: self)
    }
    
    @IBAction func addDirections(sender: AnyObject) {
        performSegueWithIdentifier("MealDirectionsToAddMealDirection", sender: self)
    }
    
    @IBAction func saveMeal(sender: AnyObject) {
        //TODO: Save Meal
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    // MARK: - TableView data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //TODO: Number of Sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: Number Of Rows
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("mealDirectionCell", forIndexPath: indexPath)
        
        //TODO: Configure the cell...
        
        return cell
    }
}
