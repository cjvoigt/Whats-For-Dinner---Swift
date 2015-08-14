//
//  MealPictureViewController.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 8/13/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

class MealPictureViewController: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageIndex = 0
    }
    
}
