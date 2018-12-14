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
 
    func ifTimeIsBeaten(time: Time?)-> Bool {
        guard let t = time else {return false}
        guard let s = t.seconds else {return false}
        return Double(truncating: s) <= female
        
    }
 
    
    func needToDrop(time: Time)->Double? {
        if ifTimeIsBeaten(time: time) {return nil}
        guard let s = time.seconds else {return nil}
       return Double(truncating: s) - female
    
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
        Cut(stroke: "FR", distance: 500, age: {$0<=9}, male: 0.0, female: parseTime("6:45.99")!, course: "SCY"),
        Cut(stroke: "BK", distance: 50, age: {$0<=9}, male: 0.0, female: parseTime("37.39")!, course: "SCY"),
        Cut(stroke: "BK", distance: 100, age: {$0<=9}, male: 0.0, female: parseTime("1:20.69")!, course: "SCY"),
        Cut(stroke: "BR", distance: 50, age: {$0<=9}, male: 0.0, female: parseTime("43.19")!, course: "SCY"),
        Cut(stroke: "BR", distance: 100, age: {$0<=9}, male: 0.0, female: parseTime("1:33.19")!, course: "SCY"),
        Cut(stroke: "FL", distance: 50, age: {$0<=9}, male: 0.0, female: parseTime("36.29")!, course: "SCY"),
        Cut(stroke: "FL", distance: 100, age: {$0<=9}, male: 0.0, female: parseTime("1:26.19")!, course: "SCY"),
        Cut(stroke: "IM", distance: 100, age: {$0<=9}, male: 0.0, female: parseTime("1:21.19")!, course: "SCY"),
        Cut(stroke: "IM", distance: 200, age: {$0<=9}, male: 0.0, female: parseTime("2:52.39")!, course: "SCY"),

        Cut(stroke: "FR", distance: 50, age: {$0==10}, male: 0.0, female: parseTime("31.19")!, course: "SCY"),
        Cut(stroke: "FR", distance: 100, age: {$0==10}, male: 0.0, female: parseTime("1:08.79")!, course: "SCY"),
        Cut(stroke: "FR", distance: 200, age: {$0==10}, male: 0.0, female: parseTime("2:27.59")!, course: "SCY"),
        Cut(stroke: "FR", distance: 500, age: {$0==10}, male: 0.0, female: parseTime("6:33.99")!, course: "SCY"),
        Cut(stroke: "BK", distance: 50, age: {$0==10}, male: 0.0, female: parseTime("36.19")!, course: "SCY"),
        Cut(stroke: "BK", distance: 100, age: {$0==10}, male: 0.0, female: parseTime("1:18.29")!, course: "SCY"),
        Cut(stroke: "BR", distance: 50, age: {$0==10}, male: 0.0, female: parseTime("41.99")!, course: "SCY"),
        Cut(stroke: "BR", distance: 100, age: {$0==10}, male: 0.0, female: parseTime("1:30.79")!, course: "SCY"),
        Cut(stroke: "FL", distance: 50, age: {$0==10}, male: 0.0, female: parseTime("35.09")!, course: "SCY"),
        Cut(stroke: "FL", distance: 100, age: {$0==10}, male: 0.0, female: parseTime("1:23.79")!, course: "SCY"),
        Cut(stroke: "IM", distance: 100, age: {$0==10}, male: 0.0, female: parseTime("1:18.79")!, course: "SCY"),
        Cut(stroke: "IM", distance: 200, age: {$0==10}, male: 0.0, female: parseTime("2:47.59")!, course: "SCY"),

        Cut(stroke: "FR", distance: 50, age: {$0==11}, male: 0.0, female: parseTime("28.59")!, course: "SCY"),
        Cut(stroke: "FR", distance: 100, age: {$0==11}, male: 0.0, female: parseTime("1:01.69")!, course: "SCY"),
        Cut(stroke: "FR", distance: 200, age: {$0==11}, male: 0.0, female: parseTime("2:14.29")!, course: "SCY"),
        Cut(stroke: "FR", distance: 500, age: {$0==11}, male: 0.0, female: parseTime("6:01.99")!, course: "SCY"),
        Cut(stroke: "BK", distance: 50, age: {$0==11}, male: 0.0, female: parseTime("32.59")!, course: "SCY"),
        Cut(stroke: "BK", distance: 100, age: {$0==11}, male: 0.0, female: parseTime("1:09.89")!, course: "SCY"),
        Cut(stroke: "BK", distance: 200, age: {$0==11}, male: 0.0, female: parseTime("2:32.39")!, course: "SCY"),
        Cut(stroke: "BR", distance: 50, age: {$0==11}, male: 0.0, female: parseTime("37.29")!, course: "SCY"),
        Cut(stroke: "BR", distance: 100, age: {$0==11}, male: 0.0, female: parseTime("1:20.19")!, course: "SCY"),
        Cut(stroke: "BR", distance: 200, age: {$0==11}, male: 0.0, female: parseTime("2:56.39")!, course: "SCY"),
        Cut(stroke: "FL", distance: 50, age: {$0==11}, male: 0.0, female: parseTime("31.29")!, course: "SCY"),
        Cut(stroke: "FL", distance: 100, age: {$0==11}, male: 0.0, female: parseTime("1:10.69")!, course: "SCY"),
        Cut(stroke: "FL", distance: 200, age: {$0==11}, male: 0.0, female: parseTime("2:42.39")!, course: "SCY"),
        Cut(stroke: "IM", distance: 100, age: {$0==11}, male: 0.0, female: parseTime("1:11.19")!, course: "SCY"),
        Cut(stroke: "IM", distance: 200, age: {$0==11}, male: 0.0, female: parseTime("2:30.39")!, course: "SCY"),
        Cut(stroke: "IM", distance: 400, age: {$0==11}, male: 0.0, female: parseTime("5:25.79")!, course: "SCY"),

        Cut(stroke: "FR", distance: 50, age: {$0==12}, male: 0.0, female: parseTime("27.59")!, course: "SCY"),
        Cut(stroke: "FR", distance: 100, age: {$0==12}, male: 0.0, female: parseTime("59.69")!, course: "SCY"),
        Cut(stroke: "FR", distance: 200, age: {$0==12}, male: 0.0, female: parseTime("2:10.29")!, course: "SCY"),
        Cut(stroke: "FR", distance: 500, age: {$0==12}, male: 0.0, female: parseTime("5:51.99")!, course: "SCY"),
        Cut(stroke: "BK", distance: 50, age: {$0==12}, male: 0.0, female: parseTime("31.59")!, course: "SCY"),
        Cut(stroke: "BK", distance: 100, age: {$0==12}, male: 0.0, female: parseTime("1:07.89")!, course: "SCY"),
        Cut(stroke: "BK", distance: 200, age: {$0==12}, male: 0.0, female: parseTime("2:28.39")!, course: "SCY"),
        Cut(stroke: "BR", distance: 50, age: {$0==12}, male: 0.0, female: parseTime("36.29")!, course: "SCY"),
        Cut(stroke: "BR", distance: 100, age: {$0==12}, male: 0.0, female: parseTime("1:18.19")!, course: "SCY"),
        Cut(stroke: "BR", distance: 200, age: {$0==12}, male: 0.0, female: parseTime("2:52.39")!, course: "SCY"),
        Cut(stroke: "FL", distance: 50, age: {$0==12}, male: 0.0, female: parseTime("30.29")!, course: "SCY"),
        Cut(stroke: "FL", distance: 100, age: {$0==12}, male: 0.0, female: parseTime("1:08.69")!, course: "SCY"),
        Cut(stroke: "FL", distance: 200, age: {$0==12}, male: 0.0, female: parseTime("2:38.39")!, course: "SCY"),
        Cut(stroke: "IM", distance: 100, age: {$0==12}, male: 0.0, female: parseTime("1:09.19")!, course: "SCY"),
        Cut(stroke: "IM", distance: 200, age: {$0==12}, male: 0.0, female: parseTime("2:26.39")!, course: "SCY"),
        Cut(stroke: "IM", distance: 400, age: {$0==12}, male: 0.0, female: parseTime("5:17.79")!, course: "SCY"),
        
        Cut(stroke: "FR", distance: 50, age: {$0==13}, male: 0.0, female: parseTime("26.69")!, course: "SCY"),
        Cut(stroke: "FR", distance: 100, age: {$0==13}, male: 0.0, female: parseTime("57.69")!, course: "SCY"),
        Cut(stroke: "FR", distance: 200, age: {$0==13}, male: 0.0, female: parseTime("2:05.19")!, course: "SCY"),
        Cut(stroke: "FR", distance: 500, age: {$0==13}, male: 0.0, female: parseTime("5:32.99")!, course: "SCY"),
        Cut(stroke: "FR", distance: 1000, age: {$0==13}, male: 0.0, female: parseTime("11:15.99")!, course: "SCY"),
        Cut(stroke: "BK", distance: 100, age: {$0==13}, male: 0.0, female: parseTime("1:05.19")!, course: "SCY"),
        Cut(stroke: "BK", distance: 200, age: {$0==13}, male: 0.0, female: parseTime("2:19.49")!, course: "SCY"),
        Cut(stroke: "BR", distance: 100, age: {$0==13}, male: 0.0, female: parseTime("1:14.59")!, course: "SCY"),
        Cut(stroke: "BR", distance: 200, age: {$0==13}, male: 0.0, female: parseTime("2:41.19")!, course: "SCY"),
        Cut(stroke: "FL", distance: 100, age: {$0==13}, male: 0.0, female: parseTime("1:04.09")!, course: "SCY"),
        Cut(stroke: "FL", distance: 200, age: {$0==13}, male: 0.0, female: parseTime("2:27.19")!, course: "SCY"),
        Cut(stroke: "IM", distance: 200, age: {$0==13}, male: 0.0, female: parseTime("2:21.19")!, course: "SCY"),
        Cut(stroke: "IM", distance: 400, age: {$0==13}, male: 0.0, female: parseTime("5:02.39")!, course: "SCY"),
        
        Cut(stroke: "FR", distance: 50, age: {$0==14}, male: 0.0, female: parseTime("26.09")!, course: "SCY"),
        Cut(stroke: "FR", distance: 100, age: {$0==14}, male: 0.0, female: parseTime("56.39")!, course: "SCY"),
        Cut(stroke: "FR", distance: 200, age: {$0==14}, male: 0.0, female: parseTime("2:02.79")!, course: "SCY"),
        Cut(stroke: "FR", distance: 500, age: {$0==14}, male: 0.0, female: parseTime("5:26.99")!, course: "SCY"),
        Cut(stroke: "FR", distance: 1000, age: {$0==14}, male: 0.0, female: parseTime("11:03.99")!, course: "SCY"),
        Cut(stroke: "BK", distance: 100, age: {$0==14}, male: 0.0, female: parseTime("1:03.99")!, course: "SCY"),
        Cut(stroke: "BK", distance: 200, age: {$0==14}, male: 0.0, female: parseTime("2:17.09")!, course: "SCY"),
        Cut(stroke: "BR", distance: 100, age: {$0==14}, male: 0.0, female: parseTime("1:13.39")!, course: "SCY"),
        Cut(stroke: "BR", distance: 200, age: {$0==14}, male: 0.0, female: parseTime("2:38.79")!, course: "SCY"),
        Cut(stroke: "FL", distance: 100, age: {$0==14}, male: 0.0, female: parseTime("1:02.89")!, course: "SCY"),
        Cut(stroke: "FL", distance: 200, age: {$0==14}, male: 0.0, female: parseTime("2:24.79")!, course: "SCY"),
        Cut(stroke: "IM", distance: 200, age: {$0==14}, male: 0.0, female: parseTime("2:18.79")!, course: "SCY"),
        Cut(stroke: "IM", distance: 400, age: {$0==14}, male: 0.0, female: parseTime("4:57.59")!, course: "SCY"),
        
        Cut(stroke: "FR", distance: 50, age: {$0>=15 && $0<=18}, male: 0.0, female: parseTime("26.59")!, course: "SCY"),
        Cut(stroke: "FR", distance: 100, age: {$0>=15 && $0<=18}, male: 0.0, female: parseTime("57.79")!, course: "SCY"),
        Cut(stroke: "FR", distance: 200, age: {$0>=15 && $0<=18}, male: 0.0, female: parseTime("2:04.49")!, course: "SCY"),
        Cut(stroke: "FR", distance: 500, age: {$0>=15 && $0<=18}, male: 0.0, female: parseTime("5:30.99")!, course: "SCY"),
        Cut(stroke: "FR", distance: 1000, age: {$0>=15 && $0<=18}, male: 0.0, female: parseTime("10:59.99")!, course: "SCY"),
        Cut(stroke: "BK", distance: 100, age: {$0>=15 && $0<=18}, male: 0.0, female: parseTime("1:05.49")!, course: "SCY"),
        Cut(stroke: "BK", distance: 200, age: {$0>=15 && $0<=18}, male: 0.0, female: parseTime("2:20.99")!, course: "SCY"),
        Cut(stroke: "BR", distance: 100, age: {$0>=15 && $0<=18}, male: 0.0, female: parseTime("1:15.19")!, course: "SCY"),
        Cut(stroke: "BR", distance: 200, age: {$0>=15 && $0<=18}, male: 0.0, female: parseTime("2:42.99")!, course: "SCY"),
        Cut(stroke: "FL", distance: 100, age: {$0>=15 && $0<=18}, male: 0.0, female: parseTime("1:04.99")!, course: "SCY"),
        Cut(stroke: "FL", distance: 200, age: {$0>=15 && $0<=18}, male: 0.0, female: parseTime("2:29.99")!, course: "SCY"),
        Cut(stroke: "IM", distance: 200, age: {$0>=15 && $0<=18}, male: 0.0, female: parseTime("2:19.99")!, course: "SCY"),
        Cut(stroke: "IM", distance: 400, age: {$0>=15 && $0<=18}, male: 0.0, female: parseTime("5:04.99")!, course: "SCY"),
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
