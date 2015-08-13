//
//  PageViewController.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 8/11/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

class PageViewController: UIViewController, UIPageViewControllerDataSource, HeaderViewDataSource {
    
    //MARK: Properties
    
    var pageViewController: UIPageViewController!
    var headerView: HeaderView!
    
    //MARK: View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
        createHeaderView()
    }
    
    //MARK: PageViewController Data Source
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = viewController.pageIndex
        
        if index == NSNotFound {
            return nil
        }
        
        ++index
        
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = viewController.pageIndex
        
        if index == NSNotFound {
            return nil
        }
        
        --index
        
        return viewControllerAtIndex(index)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 3
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 1
    }
    
    //MARK: HeaderView Data Source
    
    func imageDataForHeaderView(headerView: HeaderView) -> UIImage? {
        return UIImage(imageLiteral: "first")
    }
    
    func headerView(headerView: HeaderView, labelDataForIndex index: Int) -> String {
        if index == 0 {
            return "Name"
        } else if index == 1 {
            return "Price"
        } else if index == 2 {
            return "Calories"
        } else {
            return "Test"
        }
    }
    
    //MARK: Private API
    
    private func createHeaderView() {
        headerView = HeaderView(frame: CGRect(x: 0, y: 64, width: view.bounds.size.width - 20, height: 150))
        headerView.dataSource = self
        view.addSubview(headerView)
        headerView.reloadData()
    }
    
    
    private func viewControllerAtIndex(index: Int) -> UIViewController? {
        if index < 0 || index > 2 {
            return nil
        }
        
        if index == 0 {
            return (self.storyboard?.instantiateViewControllerWithIdentifier("MealIngredientsView"))!
        } else if index == 1 {
            return (self.storyboard?.instantiateViewControllerWithIdentifier("MealDirectionsView"))!
        } else if index == 2 {
            return(self.storyboard?.instantiateViewControllerWithIdentifier("OtherMealInformationView"))!
        }
        return (self.storyboard?.instantiateViewControllerWithIdentifier("MealIngredientsView"))!
    }
    
    private func reset() {
        /* Getting the page View controller */
        pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        self.pageViewController.dataSource = self
        
        let startViewController = viewControllerAtIndex(0)!
        self.pageViewController.setViewControllers([startViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
        /* We are substracting 30 because we have a start again button whose height is 30*/
        self.pageViewController.view.frame = CGRectMake(0, 200, self.view.frame.width, self.view.frame.height - 30)
        self.addChildViewController(pageViewController)
        self.view.addSubview(pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
    }
    
    private func add(sender: AnyObject) {
        performSegueWithIdentifier("MealIngredientsToAddMealIngredient", sender: self)
    }
}


