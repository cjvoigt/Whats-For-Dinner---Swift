//
//  MealOtherOptionsViewController.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 8/12/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

class MealOtherOptionsViewController: UITableViewController {
    
    //MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageIndex = 2
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        title = "Step 3: Fill in Other Information"
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //TODO: Number Of Sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("mealOtherOptionsCell", forIndexPath: indexPath)
        
        //TODO: Configure Cell...
        cell.textLabel?.text = "Options"
        
        return cell
    }
}
