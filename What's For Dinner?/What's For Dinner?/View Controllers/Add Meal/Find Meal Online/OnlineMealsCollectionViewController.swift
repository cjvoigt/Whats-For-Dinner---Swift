//
//  OnlineMealsCollectionViewController.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 8/7/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

private let reuseIdentifier = "onlineMealsCell"

class OnlineMealsCollectionViewController: UICollectionViewController {
    
    //MARK: Properties
    
    var json: JSON!

    //MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = false
        initJSON()
    }

    //MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! OnlineMealCollectionViewCell
        
        if let _ = json {
            let jsonDictionary = json.rawValue as! NSDictionary
            cell.label.text = jsonDictionary["title"]! as? String
        }
        
        return cell
    }
    
    //MARK: Private API
    
    private func initJSON() {
        let path = NSBundle.mainBundle().pathForResource("Recipe", ofType: "json")
        let data = NSData(contentsOfFile: path!)!
        json = JSON(data: data)
    }
}
