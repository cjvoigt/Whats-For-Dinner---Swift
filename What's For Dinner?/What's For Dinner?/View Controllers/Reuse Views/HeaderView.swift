//
//  HeaderViewController.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 8/5/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

class HeaderView: UIView{
    
    //MARK: IBOutlets
    
    //View
    var view: UIView!
    
    //Image
    @IBOutlet weak var imageView: UIImageView!
    
    //TextFields
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var middleTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    //Labels
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var middleLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    
    //MARK: Properties
    
    var textFields = [UITextField]()
    var labels = [UILabel]()
    weak var dataSource = HeaderViewDataSource?()
    
    //MARK: Object Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        fillTextFields()
        fillLabels()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        fillTextFields()
        fillLabels()
    }
    
    //MARK: XIB Setup
    
    func xibSetup() {
        view = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "HeaderView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    //MARK: Fill Properties
    
    func fillTextFields() {
        textFields.append(topTextField)
        textFields.append(middleTextField)
        textFields.append(bottomTextField)
    }
    
    func fillLabels() {
        labels.append(topLabel)
        labels.append(middleLabel)
        labels.append(bottomLabel)
    }
    
    func reloadData() {
        if let mealImage = dataSource?.imageDataForHeaderView(self) {
            imageView.image = mealImage
        }
        
        for var i = 0; i < 3; i++ {
            labels[i].text = dataSource?.headerView2(self, index: i)
            textFields[i].text = dataSource?.headerView(self, textFieldDataForIndex: i)
        }
    }
}
