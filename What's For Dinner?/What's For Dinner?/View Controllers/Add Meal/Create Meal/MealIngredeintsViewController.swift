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
        pageIndex = 2
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        title = "Step 1: Create Ingredients"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "add:")
    }
    
    // MARK: - TableView data source
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Ingredients"
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //TODO: Figure out Sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("mealIngredientCells", forIndexPath: indexPath)
        
        //TODO: Configure the cell...
        
        cell.textLabel?.text = "Ingredients"
        
        return cell
    }
    
    func add() {
        performSegueWithIdentifier("MealIngredientsToCreateIngredient", sender: self)
    }
}
