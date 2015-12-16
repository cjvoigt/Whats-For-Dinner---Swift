//
//  AllMealsViewController.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 8/6/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

class AllMealsViewController: UITableViewController {

    //MARK: Properties
    
    var mealList = [Meal]()
    let defaults = NSUserDefaults.standardUserDefaults()
    
    //MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedMeals = defaults.objectForKey("MealList") as? NSData {
            mealList = NSKeyedUnarchiver.unarchiveObjectWithData(savedMeals) as! [Meal]
        }
        self.clearsSelectionOnViewWillAppear = false
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if let savedMeals = defaults.objectForKey("MealList") as? NSData {
            mealList = NSKeyedUnarchiver.unarchiveObjectWithData(savedMeals) as! [Meal]
        }
        tableView.reloadData()
    }

    //MARK:TableView data source
    //TODO: Make this view

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mealList.count > 0 {
            return mealList.count
        } else {
            return 1;
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("allMealsCell", forIndexPath: indexPath)
        
        if mealList.count > 0  {
            let row = indexPath.row
            let currentMeal = mealList[row]
            if let imageName = currentMeal.imageName {
                let path = getDocumentsDirectory().stringByAppendingPathComponent(imageName)
                cell.imageView!.image = UIImage(contentsOfFile: path)
                cell.textLabel!.text = "Yummy Meal"
            }
        } else {
            if indexPath.row == 0{
                cell.textLabel!.text = "No Meals"
                cell.imageView!.image = nil
                cell.detailTextLabel!.text = ""
            }
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if mealList.count > 0 {
            mealList.removeAtIndex(indexPath.row)
            let savedData = NSKeyedArchiver.archivedDataWithRootObject(mealList)
            defaults.setObject(savedData, forKey: "MealList")
            tableView.reloadData()
        } else {
            done(self)
        }
    }
    
    //MARK: TableView Delegate
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75;
    }
    
    //MARK: IBActions
    
    @IBAction func addMeal(sender: AnyObject) {
        showAlertView()
    }
    
    @IBAction func edit(sender: AnyObject) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "done:")
        navigationItem.rightBarButtonItem = nil
        tableView.setEditing(true, animated: true)
    }
    
    func done(sender: AnyObject) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addMeal:")
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: "edit:")
        tableView.setEditing(false, animated: true)
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
        performSegueWithIdentifier("AllMealsToCreateMeal", sender: self)
    }
}
