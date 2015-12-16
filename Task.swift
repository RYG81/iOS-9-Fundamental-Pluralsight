//
//  Task.swift
//  TableViewDemo
//
//  Created by Rahul Gupta on 14/12/15.
//  Copyright © 2015 Rahul gupta. All rights reserved.
//

import Foundation

enum TaskType{
    case Daily, Weekly, Monthly
}

struct Task{
    var name: String
    var type: TaskType
    var completed: Bool
    var lastCompleted: NSDate?
}