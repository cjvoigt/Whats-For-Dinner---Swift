//
//  AddIngredientViewController.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 8/9/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

class CreateIngredientViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: Properties
    
    var ingredient: Ingredient!
    
    //MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredient = Ingredient(name: nil, amount: nil, unitOfMeasure: nil, fullDescription: nil, aisle: nil, metaInformation: nil)
        self.clearsSelectionOnViewWillAppear = false
    }
    
    //MARK: Table view Delegate
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let row = indexPath.row
        let section = indexPath.section
        
        if section == 0 {
            if row == 0 {
                return CGFloat(120)
            } else {
                return CGFloat(44)
            }
        } else {
            return CGFloat(44)
        }
    }

    //MARK: Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Ingredient Information"
        } else {
            return "Unknown Section"
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        if row == 0 {
            return rowWithImage(indexPath)
        } else if row == 1 {
            return rowWithText("Name", indexPath: indexPath)
        }
        
        return UITableViewCell()
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
        
        ingredient.imageName = imageName
        tableView.reloadData()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: IBActions
    
    @IBAction func saveIngredient(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func addPicture(sender: AnyObject) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        presentViewController(picker, animated: true, completion: nil)
    }
    
    //Private API
    
    private func rowWithImage(indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ImageViewCell", forIndexPath: indexPath)
        
        let imageView = cell.viewWithTag(103) as! UIImageView
        
        //TODO: Add Way to tak picture for the Ingredient
        if let imgName = ingredient.imageName {
            let path = getDocumentsDirectory().stringByAppendingPathComponent(imgName)
            imageView.image = UIImage(contentsOfFile: path)
        } else {
            imageView.image = UIImage(imageLiteral: "first")
        }
        
        return cell
    }
    
    private func rowWithText(text: String, indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TextFieldCell", forIndexPath: indexPath)
        
        let label = cell.viewWithTag(101) as! UILabel
        label.text = text
        
        return cell
    }
    
    private func getDocumentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
}
