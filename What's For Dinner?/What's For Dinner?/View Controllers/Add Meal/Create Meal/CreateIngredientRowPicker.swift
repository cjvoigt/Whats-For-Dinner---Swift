//
//  CreateIngredientRowPicker.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 9/8/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

class CreateIngredientRowPicker: RowPicker {
    
    //MARK: Object Life Cycle
    
    init(tableView: UITableView, ingrediet: Ingredient) {
        super.init(tableView: tableView, imageObject: ingrediet)
    }
    
    //MARK: Row Picker
    
    override func chooseRow(indexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch (indexPath.section, indexPath.row) {
            case (0,0):
                return super.imageObjectRow(indexPath, imageObject: super.imageObject)
            case (0,1):
                return super.textFieldRow(indexPath, titleLabel: "Name of Ingredient", placeHolderText: "Tap Here to Type")
            case (0,2):
                return textFieldRow(indexPath, titleLabel: "Brand Name", placeHolderText: "Tap Here to type")
            case (1,0):
                return textFieldRow(indexPath, titleLabel: "Amount", placeHolderText: "Enter a number Here")
            case (1,1):
                return textFieldRow(indexPath, titleLabel: "Units", placeHolderText: "Tap Here to type")
            case (1, 2):
                return labelRow(indexPath, titleLabel: "Abbreviation", descriptionLabel: "T")
            case (1,3):
                return labelRow(indexPath, titleLabel: "Plural", descriptionLabel: "Tablespoon(s)")
            default:
                return UITableViewCell()
        }

    }
}
