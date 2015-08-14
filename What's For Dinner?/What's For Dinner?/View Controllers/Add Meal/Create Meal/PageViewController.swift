//
//  PageViewController.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 8/11/15.
//  Copyright © 2015 Camden Voigt. All rights reserved.
//

import UIKit

class PageViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate, HeaderViewDataSource {
    
    //MARK: Properties
    
    var pageViewController: UIPageViewController!
    var headerView: HeaderView!
    var indexOfCurrentView: Int = 0
    
    //MARK: View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageViewController()
        createHeaderView()
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
        return 3
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 1
    }
    
    //MARK: PageViewController Delegate
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let currentViewController = pageViewController.viewControllers?[0]
        navigationItem.title = currentViewController?.navigationItem.title
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
        
        pageViewController.view.frame = CGRectMake(0, 200, view.frame.width, view.frame.height)
        addChildViewController(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMoveToParentViewController(self)
    }
    
    private func createHeaderView() {
        headerView = HeaderView(frame: CGRect(x: 0, y: 64, width: view.bounds.size.width - 20, height: 150))
        headerView.dataSource = self
        view.addSubview(headerView)
        headerView.reloadData()
    }
    
    private func configureNavigationItem() {
        navigationItem.title = pageViewController.viewControllers?[0].title
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: "saveMeal")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "add")
    }
    
    private func viewControllerAtIndex(index: Int) -> UIViewController? {
        if index < 0 || index > 2 {
            return nil
        }
        
        if index == 0 {
            return (storyboard?.instantiateViewControllerWithIdentifier("MealIngredientsView"))!
        } else if index == 1 {
            return (storyboard?.instantiateViewControllerWithIdentifier("MealDirectionsView"))!
        } else if index == 2 {
            return(storyboard?.instantiateViewControllerWithIdentifier("OtherMealInformationView"))!
        }
        return (storyboard?.instantiateViewControllerWithIdentifier("MealIngredientsView"))!
    }
}