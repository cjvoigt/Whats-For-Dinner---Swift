//
//  File.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 9/5/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

protocol TableViewRowPicker: NSObjectProtocol {
    func chooseRow(indexPath indexPath: NSIndexPath) -> UITableViewCell
    func textFieldRow(indexPath: NSIndexPath, titleLabel: String, placeHolderText: String) -> UITableViewCell
    func labelRow(indexPath: NSIndexPath, titleLabel: String, descriptionLabel: String) -> UITableViewCell
    func imageRow(indexPath: NSIndexPath, image: UIImage) -> UITableViewCell
    func switchRow(indexPath: NSIndexPath, titleLabel: String) -> UITableViewCell
    func imageObjectRow(indexPath: NSIndexPath, imageObject: ImageObject?) -> UITableViewCell
}

protocol ImageObject: NSObjectProtocol {
    var imageName: String? {get set}
}

enum RowIdentifiers: String {
    case LabelRow = "DetailLabelCell"
    case imageRow = "ImageViewCell"
    case switchRow = "SwitchViewCell"
    case textFieldRow = "TextFieldCell"
}

