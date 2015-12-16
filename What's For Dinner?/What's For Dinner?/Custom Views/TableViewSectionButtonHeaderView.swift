//
//  TableViewSectionButtonHeaderView.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 9/7/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

class TableViewSectionButtonHeaderView: UIView {
    
    var text: String?
    {
        didSet {
            label.text = text?.uppercaseString
        }
    }
    var btn: UIButton!
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
        configureLabel()
        self.addSubview(btn)
        self.addSubview(label)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButton() {
        btn = UIButton(type: UIButtonType.ContactAdd)
        btn.frame = CGRectMake(frame.size.width - 40, 25, 20, 20)
    }
    
    private func configureLabel() {
        //Create Label
        label = UILabel(frame: CGRectMake(15, 25, frame.size.width - 40, 20))
        label.text = text?.uppercaseString
        label.backgroundColor = UIColor.clearColor()
        label.textColor = UIColor.darkGrayColor()
        label.shadowColor = UIColor.whiteColor()
        label.shadowOffset = CGSizeMake(0.0, 1.0);
        label.font = UIFont.systemFontOfSize(14)
    }
}
