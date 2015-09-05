//
//  CreateMealViewController.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 8/13/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

enum CreateMealSectionNumbers: Int {
    case BasicMealInformation = 0, OtherMealInformation, Ingredients, Directions
}

class CreateMealViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: Properties
    
    var meal: Meal!
    
    //MARK: View Life Cycle
    
     override func viewDidLoad() {
        super.viewDidLoad()
        meal = Meal(json: nil)
        tableView.reloadData()
    }
    
    //MARK: TableView data source
    //TODO: Figure out if this and the delegate can be moved to its own class
    
     override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
     override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == CreateMealSectionNumbers.BasicMealInformation.rawValue {
            return 3
        } else if section == CreateMealSectionNumbers.OtherMealInformation.rawValue {
            return 6
        } else {
            return 1
        }
    }
    
     override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == CreateMealSectionNumbers.BasicMealInformation.rawValue {
            return "Basic Meal Information"
        } else if section == CreateMealSectionNumbers.OtherMealInformation.rawValue {
            return "Other Meal Information"
        } else if section == CreateMealSectionNumbers.Ingredients.rawValue {
            return "Ingredients"
        } else if section == CreateMealSectionNumbers.Directions.rawValue {
            return "Directions"
        } else {
            return ""
        }
    }
    
     override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section = indexPath.section
        
        if section == CreateMealSectionNumbers.BasicMealInformation.rawValue {
            return rowForBasicMealInfromationSection(indexPath)
        } else if section == CreateMealSectionNumbers.OtherMealInformation.rawValue {
            return rowForOtherInformationSection(indexPath)
        } else if section == CreateMealSectionNumbers.Ingredients.rawValue {
            rowForIngredientsSection(indexPath)
        } else if section == CreateMealSectionNumbers.Directions.rawValue {
            rowForDirectionsSection(indexPath)
        }
        
        return UITableViewCell()
    }
    
    //MARK: TableView Delegate
    
     override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let section = indexPath.section
        let row = indexPath.row
        
        if section == CreateMealSectionNumbers.BasicMealInformation.rawValue {
            if row == 0 {
                return CGFloat(120)
            } else {
                return CGFloat(44)
            }
        } else {
            return CGFloat(44)
        }
    }
    
     override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == CreateMealSectionNumbers.Ingredients.rawValue {
            return buttonHeaderView("Ingredients")
        } else if section == CreateMealSectionNumbers.Directions.rawValue {
           return buttonHeaderView("Directions")
        } else {
            return nil
        }
    }
    
     override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    //MARK: Image Picker Delegate 
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        var newImage: UIImage
        
        if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            newImage = possibleImage
        } else {
            return
        }
        
        let imageName = NSUUID().UUIDString
        let imagePath = getDocumentsDirectory().stringByAppendingPathComponent(imageName)
        let jpegData = UIImageJPEGRepresentation(newImage, 80)
        jpegData!.writeToFile(imagePath, atomically: true)
        
        meal.imageName = imageName
        tableView.reloadData()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: Action Methods
    
    func addItem(sender: UIView) {
        if sender.tag == CreateMealSectionNumbers.Ingredients.rawValue {
            performSegueWithIdentifier("CreateMealToCreateIngredient", sender: self)
        } else if sender.tag == CreateMealSectionNumbers.Directions.rawValue {
            performSegueWithIdentifier("CreateMealToCreateDirection", sender: self)
        }
    }
    
    @IBAction func saveMeal(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
        //TODO: Figure out how to save meal
        //TODO: Add verfication that meal was completely filled out
    }
    
    @IBAction func getPicture(sender: AnyObject) {
        let picker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            picker.sourceType = UIImagePickerControllerSourceType.Camera
        } else {
            picker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        }
        picker.allowsEditing = true
        picker.delegate = self
        picker.takePicture()
        presentViewController(picker, animated: true, completion: nil)
    }
    
    //MARK: Private API
    
    private func rowForBasicMealInfromationSection(indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        if row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("ImageViewCell", forIndexPath: indexPath)
            
            let imageView = cell.viewWithTag(103) as! UIImageView
            
            //TODO: Add Way to tak picture for the meal
            if let _ = meal.imageName {
                let path = getDocumentsDirectory().stringByAppendingPathComponent(meal.imageName)
                imageView.image = UIImage(contentsOfFile: path)
            } else {
                imageView.image = UIImage(imageLiteral: "first")
            }
            
            return cell
        } else if row == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("TextFieldCell", forIndexPath: indexPath)
            
            let label = cell.viewWithTag(101) as! UILabel
            let textBox = cell.viewWithTag(102) as! UITextField
            
            label.text = "Name"
            textBox.placeholder = "Tap Here to Type"
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("TextFieldCell", forIndexPath: indexPath)
            
            let label = cell.viewWithTag(101) as! UILabel
            let textBox = cell.viewWithTag(102) as! UITextField
            
            label.text = "Number of Servings"
            textBox.placeholder = "Tap Here to Type"
            
            return cell
        }
    }
    
    private func rowForOtherInformationSection(indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SwitchViewCell", forIndexPath: indexPath)
        
        let label = cell.viewWithTag(104) as! UILabel
        label.text = titleForOtherInformationSection(indexPath)
        
        let swt = cell.accessoryView as! UISwitch
        swt.on = false
        
        return cell
    }
    
    private func rowForIngredientsSection(indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DetailLabelCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = "No Ingredients"
        cell.detailTextLabel?.text = ""
        
        return cell
    }
    
    private func rowForDirectionsSection(indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DetailLabelCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = "No Directions"
        cell.detailTextLabel?.text = ""
        
        return cell
    }
    
    private func getDocumentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }

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
    
    private func buttonHeaderView(name: String) -> UIView {
        let view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 30))
        //Create Button
        let btn = UIButton(type: UIButtonType.ContactAdd)
        btn.frame = CGRectMake(tableView.frame.size.width - 40, 25, 20, 20)
        if name == "Ingredients" {
            btn.tag = CreateMealSectionNumbers.Ingredients.rawValue
        } else {
            btn.tag = CreateMealSectionNumbers.Directions.rawValue
        }
        btn.addTarget(self, action: "addItem:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(btn)
        //Create Label
        let label = UILabel(frame: CGRectMake(15, 25, tableView.frame.size.width - 40, 20))
        label.text = name.uppercaseString
        label.backgroundColor = UIColor.clearColor()
        label.textColor = UIColor.darkGrayColor()
        label.shadowColor = UIColor.whiteColor()
        label.shadowOffset = CGSizeMake(0.0, 1.0);
        label.font = UIFont.systemFontOfSize(14)
        view.addSubview(label)
        return view
    }
}
