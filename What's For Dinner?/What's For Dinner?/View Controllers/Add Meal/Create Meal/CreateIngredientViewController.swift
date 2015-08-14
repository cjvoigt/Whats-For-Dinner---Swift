//
//  AddIngredientViewController.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 8/9/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

class CreateIngredientViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = false
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "Section Footer 1"
        } else {
            return "Section Footer 2"
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Section Header 1"
        } else {
            return "Section Header 2"
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("IngredientBasicInfo", forIndexPath: indexPath)
        
        let label = cell.viewWithTag(101) as! UILabel
        let textBox = cell.viewWithTag(102) as! UITextField
        
        label.text = "Name of Ingredient"
        textBox.text = "Yummy"
        
        return cell
    }
}
