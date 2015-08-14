//
//  PageViewController.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 8/11/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

class PageViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    //MARK: Properties
    
    var pageViewController: UIPageViewController!
    var indexOfCurrentView: Int = 0
    
    //MARK: View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageViewController()
        configureNavigationItem()
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
        return 4
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 1
    }
    
    //MARK: PageViewController Delegate
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let _ = pageViewController.viewControllers?[0] as? MealPictureViewController {
             navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Camera, target: self, action: "add")
        } else if let _ = pageViewController.viewControllers?[0] as? MealIngredeintsViewController {
             navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: MealIngredeintsViewController(), action: "add")
        } else if let _ = pageViewController.viewControllers?[0] as? MealDirectionsViewController {
             navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "add")
        } else {
            navigationItem.rightBarButtonItem = nil
        }
        
    }
    
    //MARK: Bar Button Actions
    
    func add() {
        if let _ = pageViewController.viewControllers?[0] as? MealIngredeintsViewController {
            performSegueWithIdentifier("MealIngredientsToCreateIngredient", sender: self)
            print("Went to Create an Ingredient")
        } else if let _ = pageViewController.viewControllers?[0] as? MealDirectionsViewController {
            performSegueWithIdentifier("MealDirectionsToCreateDirection", sender: self)
            print("Went To Create a Directions")
        } else {
          print("Could Not Go To View")
        }
    }
    
    func saveMeal() {
        //TODO: figure out how to do verification for saving
        print("saved")
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    //MARK: Private API
    
    private func configurePageViewController() {
        /* Getting the page View controller */
        pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        let startViewController = viewControllerAtIndex(0)!
        pageViewController.setViewControllers([startViewController], direction: .Forward, animated: true, completion: nil)
        
        pageViewController.view.frame = CGRectMake(0, 64, view.frame.width, view.frame.height)
        addChildViewController(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMoveToParentViewController(self)
    }
    
    private func configureNavigationItem() {
        navigationItem.title = pageViewController.viewControllers?[0].title
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: "saveMeal")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Camera, target: self, action: "add")
    }
    
    private func viewControllerAtIndex(index: Int) -> UIViewController? {
        if index < 0 || index > 3 {
            return nil
        }
        
        if index == 0 {
            return (storyboard?.instantiateViewControllerWithIdentifier("MealPictureView"))!
        } else if index == 1 {
            return (storyboard?.instantiateViewControllerWithIdentifier("MealBasicInfoView"))!
        } else if index == 2 {
            return(storyboard?.instantiateViewControllerWithIdentifier("MealIngredientsView"))!
        } else if index == 3 {
            return (storyboard?.instantiateViewControllerWithIdentifier("MealDirectionsView"))!
        } else {
           return nil
        }
    }
}