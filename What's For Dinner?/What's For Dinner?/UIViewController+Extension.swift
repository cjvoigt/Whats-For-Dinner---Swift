//
//  UIViewController+Extension.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 8/11/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit
import ObjectiveC

private var xoAssociationKey: Int = 0

extension UIViewController {
    var pageIndex: Int {
        get {
            return (objc_getAssociatedObject(self, &xoAssociationKey) as? Int)!
        }
        
        set(newIndex) {
            objc_setAssociatedObject(self, &xoAssociationKey, newIndex, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}