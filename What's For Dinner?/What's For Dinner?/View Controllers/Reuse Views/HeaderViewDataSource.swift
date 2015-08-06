//
//  HeaderViewDelegate.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 8/5/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

protocol HeaderViewDataSource: NSObjectProtocol {
    func imageDataForHeaderView(headerView: HeaderView) -> UIImage?
    
    func headerView(headerView: HeaderView, textFieldDataForIndex index: Int) -> String
    
    func headerView2(headerView: HeaderView, index: Int) -> String
}

