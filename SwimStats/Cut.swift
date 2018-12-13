//
//  Cut.swift
//  SwimStats
//
//  Created by Yvette Zhukovsky on 12/12/18.
//  Copyright © 2018 Yvette Zhukovsky. All rights reserved.
//

import Foundation

struct Cut {
    let stroke: String
    let distance: Int
    let age: (Int) -> Bool
    let male: Double
    let female: Double
    let course: String
    
    
    
    func timeMatches(time: Time)-> Bool {
        guard let c = time.course else {return false}
        guard let s = time.stroke else {return false}
        guard let d = time.distance else {return false}
        
        return c == course && s == stroke && Int(truncating: d) == distance
        
    }
 
}


struct Cuts {
    let name: String
    let cuts: [Cut]
    
    static let MRJO = Cuts(
        name: "Metro 2018-2019 SCY JO",
      cuts: [
        Cut(stroke: "FR", distance: 50, age: {$0<=9}, male: 0.0, female: parseTime("32.39")!, course: "SCY"),
        Cut(stroke: "FR", distance: 100, age: {$0<=9}, male: 0.0, female: parseTime("1:11.19")!, course: "SCY"),
        Cut(stroke: "FR", distance: 200, age: {$0<=9}, male: 0.0, female: parseTime("2:32.39")!, course: "SCY"),
        
        
      ]
    )
    
    static let Available = [MRJO, MRJO]

    
  private static func parseTime(_ enteredTime: String)-> Double? {
        
        let parts = enteredTime.components(separatedBy: ":")
        if parts.count == 1 {
            return Double(enteredTime)
            
        } else {
            let minutes = Int(parts.first ?? "") ?? 0
            let rest = Double(enteredTime.components(separatedBy: ":")[1]) ?? 0.0
            return (Double((minutes * 60)) + rest)
        }
    }
    
}
