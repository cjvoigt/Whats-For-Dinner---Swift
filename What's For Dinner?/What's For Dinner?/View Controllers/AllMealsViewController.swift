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

        // Configure the cell...

        return cell
    }
    
    //MARK: IBActions
    
    @IBAction func addMeal(sender: AnyObject) {
        performSegueWithIdentifier("AllMealsToMealDirections", sender: self)
    }
}
