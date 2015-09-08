//
//  RowPicker.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 9/5/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

class RowPicker: NSObject, TableViewRowPicker {
    
    let tableView: UITableView?
    let imageObject: ImageObject?
    
    init(tableView: UITableView, imageObject: ImageObject) {
        self.tableView = tableView
        self.imageObject = imageObject
    }
    
    func chooseRow(indexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        if row == 0 {
            return labelRow(indexPath, titleLabel: "Title", descriptionLabel: "Description")
        } else if row == 1 {
            return textFieldRow(indexPath, titleLabel: "Title", placeHolderText: "Type Here")
        } else if row == 2 {
            return imageObjectRow(indexPath, imageObject: imageObject)
        } else if row == 3 {
            return imageRow(indexPath, image: UIImage(imageLiteral: "first")!)
        } else if row == 4 {
            return switchRow(indexPath, titleLabel: "Title")
        } else {
            return UITableViewCell()
        }
    }
    
    func labelRow(indexPath: NSIndexPath, titleLabel: String, descriptionLabel: String) -> UITableViewCell {
        let cell = tableView!.dequeueReusableCellWithIdentifier(RowIdentifiers.LabelRow.rawValue, forIndexPath: indexPath)
        
        cell.textLabel?.text = titleLabel
        cell.detailTextLabel?.text = descriptionLabel
        
        return cell
    }
    
    func textFieldRow(indexPath: NSIndexPath, titleLabel: String, placeHolderText: String) -> UITableViewCell {
        let cell = tableView!.dequeueReusableCellWithIdentifier(RowIdentifiers.textFieldRow.rawValue, forIndexPath: indexPath)
        
        let label = cell.viewWithTag(101) as! UILabel
        let textBox = cell.viewWithTag(102) as! UITextField
        
        label.text = titleLabel
        textBox.placeholder = placeHolderText
        
        return cell
    }
    
    func imageObjectRow(indexPath: NSIndexPath, imageObject: ImageObject?) -> UITableViewCell {
        let cell = tableView!.dequeueReusableCellWithIdentifier(RowIdentifiers.imageRow.rawValue, forIndexPath: indexPath)
        
        let imageView = cell.viewWithTag(103) as! UIImageView
        
        if let name = imageObject?.imageName {
            let path = getDocumentsDirectory().stringByAppendingPathComponent(name)
            imageView.image = UIImage(contentsOfFile: path)
        } else {
            imageView.image = UIImage(imageLiteral: "first")
        }
        
        return cell
    }
    
    func imageRow(indexPath: NSIndexPath, image: UIImage) -> UITableViewCell {
        let cell = tableView!.dequeueReusableCellWithIdentifier(RowIdentifiers.imageRow.rawValue, forIndexPath: indexPath)
        
        let imageView = cell.viewWithTag(103) as! UIImageView
        
        imageView.image = image
        
        return cell
    }
    
    func switchRow(indexPath: NSIndexPath, titleLabel: String) -> UITableViewCell {
        let cell = tableView!.dequeueReusableCellWithIdentifier(RowIdentifiers.switchRow.rawValue, forIndexPath: indexPath)
        
        let label = cell.viewWithTag(104) as! UILabel
        label.text = titleLabel
        
        let swt = cell.viewWithTag(105) as! UISwitch
        swt.on = false
        
        return cell
    }
    
    func getDocumentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
}