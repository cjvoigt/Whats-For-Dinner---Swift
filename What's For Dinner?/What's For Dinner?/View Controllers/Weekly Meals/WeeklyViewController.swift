//
//  FirstViewController.swift
//  What's For Dinner?
//
//  Created by Camden Voigt on 6/11/15.
//  Copyright (c) 2015 Camden Voigt. All rights reserved.
//

import UIKit

enum Weekdays : Int {
    case Sunday = 1, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
}

//TODO: Redo this class to confrom to standards that you have made up in your head.

class WeeklyTableViewController: UITableViewController {

    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.reloadData()
    }
    
    // MARK: Date Methods

    func getIntegerForDayOfWeek(today:String)->Int? {
        let formatter  = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let todayDate = formatter.dateFromString(today) {
            let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
            let myComponents = myCalendar.components(.Weekday, fromDate: todayDate)
            let weekDay = myComponents.weekday
            return weekDay
        } else {
            return nil
        }
    }

    func getStringForDayOfWeek(date:NSDate)->String? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let stringOfDate = dateFormatter.stringFromDate(date)
        return stringOfDate
    }
    
    func getDateForDaysOfWeek(daysFromToday:Int) -> NSDate {
        return NSDate().xDays(daysFromToday)
    }
}

    // MARK: TableView Extension
    
extension WeeklyTableViewController {
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("WeeklyViewCells", forIndexPath: indexPath)
        
        cell.textLabel!.text = cellTextLabel(getIntegerForDayOfWeek(getStringForDayOfWeek(NSDate().xDays(indexPath.row))!)!)
        cell.detailTextLabel!.text = "Meal"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7;
    }
    
    func cellTextLabel(row: Int) -> String {
        if let weekDay = Weekdays(rawValue: row) {
            switch(weekDay){
            case .Sunday:
                return "Sunday"
            case .Monday:
                return "Monday"
            case .Tuesday:
                return "Tuesday"
            case .Wednesday:
                return "Wednesday"
            case .Thursday:
                return "Thursday"
            case .Friday:
                return "Friday"
            case .Saturday:
                return "Saturday"
            }
        }
        
        return "Day"
    }

}

// MARK: NSDate Extension

extension NSDate {
    func xDays(x:Int) -> NSDate {
        return NSCalendar.currentCalendar().dateByAddingUnit(.Day, value: x, toDate: self, options: [])!
    }
}


