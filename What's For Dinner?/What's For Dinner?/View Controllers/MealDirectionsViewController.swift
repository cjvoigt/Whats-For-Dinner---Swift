//
//  MealDirectionsViewController.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 8/5/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

class MealDirectionsViewController: UITableViewController, HeaderViewDataSource {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var viewSelector: UISegmentedControl!
    
    //MARK: Properties
    var headerView :HeaderView!
    
    //MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 210))
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        viewSelector.selectedSegmentIndex = 0
        
        headerView.dataSource = self
        tableView.tableHeaderView = headerView
        headerView.reloadData()
    }
    
    //MARK: IBActions
    
    @IBAction func switchToIngredientsView(sender: AnyObject) {
        performSegueWithIdentifier("MealDirectionsToMealIngredients", sender: self)
    }
    
    @IBAction func addDirections(sender: AnyObject) {
        performSegueWithIdentifier("MealDirectionsToAddMealDirection", sender: self)
    }
    
    //MARK: Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "MealDirectionsToMealIngredients" {
            print("MealDirectionsToMealIngredients")
        } else if segue.identifier == "MealDirectionsToAddMealDirection" {
            print("MealDirectionsToAddMealDirection")
        }
    }
    
    //MARK: HeaderView Data Source
    
    func imageDataForHeaderView(headerView: HeaderView) -> UIImage? {
        return UIImage(imageLiteral: "Meal-50")
    }
    
    func headerView(headerView: HeaderView, textFieldDataForIndex index: Int) -> String {
        return "Test"
    }
    
    func headerView2(headerView: HeaderView, index: Int) -> String {
        return "Test"
    }
}
