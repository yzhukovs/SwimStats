//
//  Times.swift
//  SwimStats
//
//  Created by Yvette Zhukovsky on 12/11/18.
//  Copyright © 2018 Yvette Zhukovsky. All rights reserved.
//

import Foundation


class Time: NSObject {

    @objc var course: String?
    @objc var club: String?
    @objc var date: NSDate?
    @objc var distance: NSNumber?
    @objc  var lsc: String? = "MR"
    @objc var meet: String?
    @objc var seconds: NSNumber?
    @objc var stroke: String?

    static func formatTime(time: NSNumber)-> String{
        return formatTime(time: Double(truncating: time))
    }
    static func formatTime(time: Double)-> String{
        let oneMinute: Double = 60.00
        var minutes = 0
        var seconds: Double = time
        
        while seconds > oneMinute {
            minutes = minutes + 1
            seconds = seconds - oneMinute
        }
        let s = String(format: "%.2f", seconds)
        if minutes == 0 {
            return s
        }
        return String(describing: minutes) + ":" + s
    }
    
    
    
    
    
}

