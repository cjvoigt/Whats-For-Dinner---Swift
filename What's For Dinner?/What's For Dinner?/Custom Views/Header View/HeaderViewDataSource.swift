//
//  HeaderViewDelegate.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 8/5/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit


@objc protocol HeaderViewDataSource: NSObjectProtocol {
    func imageDataForHeaderView(headerView: HeaderView) -> UIImage?
    
    func headerView(headerView: HeaderView, labelDataForIndex index: Int) -> String

    optional func setHeaderView(headerView: HeaderView, textFieldDataForIndex index: Int) -> String
}

