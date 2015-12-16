//
//  CreateDirectionViewController.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 8/13/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

class CreateDirectionViewController: UITableViewController {

    //MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = false
    }
    
    // MARK: Table view data source
    //TODO: Might need to change this view into a different type of table view
    
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
        let cell = tableView.dequeueReusableCellWithIdentifier("TextFieldCell", forIndexPath: indexPath)
        
        let label = cell.viewWithTag(101) as! UILabel
        let textBox = cell.viewWithTag(102) as! UITextField
        
        label.text = "Name of Ingredient"
        textBox.text = "Yummy"
        
        return cell
    }
}
