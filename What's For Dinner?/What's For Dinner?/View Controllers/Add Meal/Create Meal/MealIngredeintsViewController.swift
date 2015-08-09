//
//  mealIngredeintsViewController.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 8/5/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

class MealIngredeintsViewController: UITableViewController, HeaderViewDataSource {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var viewSelctor: UISegmentedControl!
    
    //MARK: Properties
    var headerView: HeaderView!

    //MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        createHeaderView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        viewSelctor.selectedSegmentIndex = 1
        headerView.reloadData()
    }
    
    //MARK: IBActions
    
    @IBAction func switchToDirectionsView(sender: AnyObject) {
       navigationController?.popViewControllerAnimated(false)
        print("MealIngredientsToMealDiirections", appendNewline: false)
    }
    
    @IBAction func addIngredients(sender: AnyObject) {
        performSegueWithIdentifier("MealIngredientsToAddMealIngredient", sender: self)
    }
    
    @IBAction func saveMeal(sender: AnyObject) {
        //TODO: save Meal
        navigationController?.popToRootViewControllerAnimated(true)
    }

    // MARK: - TableView data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: Number of Rows
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("mealIngredientCells", forIndexPath: indexPath)
        
        //TODO: Configure the cell...
        
        return cell
    }
    
    //MARK: HeaderView Data Source
    
    func imageDataForHeaderView(headerView: HeaderView) -> UIImage? {
        return UIImage(imageLiteral: "first")
    }
    
    func headerView(headerView: HeaderView, labelDataForIndex index: Int) -> String {
        if index == 0 {
            return "Name"
        } else if index == 1 {
            return "Price"
        } else if index == 2 {
            return "Calories"
        } else {
            return "Test"
        }
    }
    
    //MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "MealIngredientsToMealDirections" {
            print("MealIngredientsToMealDirections", appendNewline: true)
        } else if segue.identifier == "MealIngredientsToAddMealIngredient" {
            print("MealIngredientsToAddMealIngredient", appendNewline: true)
        }
    }
    
    //MARK: Private API
    
    private func createHeaderView() {
        headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width - 20, height: 150))
        headerView.dataSource = self
        tableView.tableHeaderView = headerView
        headerView.reloadData()
    }
}
