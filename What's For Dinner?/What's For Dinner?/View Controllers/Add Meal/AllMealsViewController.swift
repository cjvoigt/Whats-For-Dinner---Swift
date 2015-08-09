//
//  AllMealsViewController.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 8/6/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

class AllMealsViewController: UITableViewController {


    //MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = false
    }

    // MARK: - TableView data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("allMealsCell", forIndexPath: indexPath)

        //TODO: Make Sure this works.
        
        return cell
    }
    
    //MARK: IBActions
    
    @IBAction func addMeal(sender: AnyObject) {
        showAlertView()
    }
    
    //MARK: Private API
    
    private func showAlertView() {
        let ac = UIAlertController(title: "Create a Meal", message: "Would you like to find a recipe online or create one manually?", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "Manual", style: .Default, handler: showCreateMealViewController))
        ac.addAction(UIAlertAction(title: "Online", style: .Default, handler: showOnlineMealsViewController))
        presentViewController(ac, animated: true, completion: nil)
    }
    
    private func showOnlineMealsViewController(action: UIAlertAction!) {
        performSegueWithIdentifier("AllMealsToOnlineMeals", sender: self)
    }
    
    private func showCreateMealViewController(action: UIAlertAction!) {
        performSegueWithIdentifier("AllMealsToMealDirections", sender: self)
    }
}
