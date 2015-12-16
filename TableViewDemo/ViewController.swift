//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Rahul Gupta on 12/12/15.
//  Copyright © 2015 Rahul gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // create task arrays
    var dailyTasks = [
        Task(name: "Check all windows",type: .Daily, completed: true, lastCompleted:nil),
        Task(name: "Check all doors", type: .Daily, completed: false, lastCompleted: nil),
        Task(name: "Check temperature of freeze",type: .Daily, completed: false, lastCompleted: nil),
        Task(name: "Check the mail box", type: .Daily, completed: true, lastCompleted: nil),
        Task(name: "Empty trash containers",type: .Daily, completed: false, lastCompleted: nil),
        Task(name: "If freezing, check water pipes out side",type: .Daily, completed: false, lastCompleted: nil)
    ]
    
    var weeklyTasks = [
        Task(name: "Check inside all unoccupied cabins",type: .Weekly, completed: false, lastCompleted: nil),
        Task(name: "Run all faucets for 30 seconds",type: .Daily, completed: true, lastCompleted: nil),
        Task(name: "Walk the perimeter of priority",type: .Daily, completed: false, lastCompleted: nil),
        Task(name: "Arrange for dumpster pickup",type: .Daily, completed: false, lastCompleted: nil)
    ]
    
    var monthlyTasks = [
        Task(name:"Run test on security alarm",type: .Daily, completed: false, lastCompleted: nil),
        Task(name: "Check all motion detectors",type: .Daily, completed: false, lastCompleted: nil),
        Task(name: "Test smoke alarms", type: .Daily, completed: true, lastCompleted: nil)
    ]
    
    
    @IBOutlet weak var taskTableView: UITableView!
    
    @IBAction func toggleDarkMode(sender: AnyObject) {
        let darkModeSwitch = sender as! UISwitch
        if darkModeSwitch.on{
            view.backgroundColor = UIColor.darkGrayColor()
        }else{
            view.backgroundColor = UIColor.whiteColor()
        }
    }
    @IBAction func resetList(sender: AnyObject) {
        
        let confirm = UIAlertController(title: "RESTE", message: "Are you sure you want to reset tasks list?", preferredStyle: .Alert)
        
        let yesAction = UIAlertAction(title: "YES", style: .Destructive, handler: {
            action in
            
            for i in 0..<self.dailyTasks.count{
                self.dailyTasks[i].completed = false
            }
            
            for i in 0..<self.weeklyTasks.count{
                self.weeklyTasks[i].completed = false
            }
            
            for i in 0..<self.monthlyTasks.count{
                self.monthlyTasks[i].completed = false
            }
            
            self.taskTableView.reloadData()
        })
        
        let noAction = UIAlertAction(title: "NO", style: .Default, handler: {
            action in
            print("No data changed!")
        })
        
        confirm.addAction(yesAction)
        confirm.addAction(noAction)
        
        presentViewController(confirm, animated: true, completion: nil)
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        tableView.backgroundColor = UIColor.clearColor()
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return dailyTasks.count
        case 1:
            return weeklyTasks.count
        case 2:
            return monthlyTasks.count
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        var currentTask: Task!
        
        switch indexPath.section{
        case 0:
            currentTask = dailyTasks[indexPath.row]
        case 1:
            currentTask = weeklyTasks[indexPath.row]
        case 2:
            currentTask = monthlyTasks[indexPath.row]
        default:
            break
        }
        cell.textLabel!.text = currentTask.name
        
        if currentTask.completed{
            cell.textLabel?.textColor = UIColor.lightGrayColor()
            cell.accessoryType = .Checkmark
        }else{
            cell.textLabel?.textColor = UIColor.blackColor()
            cell.accessoryType = .None
        }
        cell.backgroundColor = UIColor.clearColor()
        return cell
    }
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.grayColor()
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return "My Daily Tasks"
        case 1:
            return "My Weekly Tasks"
        case 2:
            return "My Monthly Tasks"
        default:
            return ""
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected row: \(indexPath.row) in section: \(indexPath.section)")
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let myAction = UITableViewRowAction(style: .Default, title: "DONE", handler: {
        action, indexPath in
            
            switch indexPath.section{
            case 0:
                self.dailyTasks[indexPath.row].completed = true
            case 1:
                self.weeklyTasks[indexPath.row].completed = true
            case 2:
                self.monthlyTasks[indexPath.row].completed = true
            default:
                break
            }
            
            tableView.reloadData()
            
            tableView.editing = false
            
        })
        
        let action = [myAction]
        
        return action
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

