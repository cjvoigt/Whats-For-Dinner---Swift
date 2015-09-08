//
//  CreateMealRowPicker.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 9/5/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

//TODO: Make this generic some how using a protocol

import UIKit

class CreateMealRowPicker: RowPicker {
    
    //MARK: Object Life Cycle
    
    init(tableView: UITableView, meal: Meal) {
        super.init(tableView: tableView , imageObject: meal)
    }
    
    //MARK: Row Picker Override
    
    override func chooseRow(indexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch (indexPath.section, indexPath.row) {
            case (0,0):
                return super.imageObjectRow(indexPath, imageObject: super.imageObject)
            case (0,1):
                return super.textFieldRow(indexPath, titleLabel: "Name of Meal", placeHolderText: "Tap Here to Type")
            case (0,2):
                return super.textFieldRow(indexPath, titleLabel: "# of servings", placeHolderText: "Tap Here to Type")
            case (1,0...6):
                return super.switchRow(indexPath, titleLabel: titleForOtherInformationSection(indexPath))
            case (2,0):
                return super.labelRow(indexPath, titleLabel: "No Ingredients", descriptionLabel: "")
            case (3,0):
                return super.labelRow(indexPath, titleLabel: "No Directions", descriptionLabel: "")
            default:
                return UITableViewCell()
        }
    }
    
    //MARK: Private API
    
    private func titleForOtherInformationSection(indexPath: NSIndexPath) -> String {
        switch (indexPath.row) {
            case 0:
                return "Vegetarian"
                
            case 1:
                return "Vegan"
                
            case 2:
                return "Dairy Free"
                
            case 3:
                return "Gluten Free"
                
            case 4:
                return "Healthy"
                
            case 5:
                return "Cheap"
                
            default:
                return ""
        }
    }
    
}
