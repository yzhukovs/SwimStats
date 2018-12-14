//
//  CutsTableViewCell.swift
//  SwimStats
//
//  Created by Yvette Zhukovsky on 12/12/18.
//  Copyright © 2018 Yvette Zhukovsky. All rights reserved.
//

import UIKit

class CutsTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func updateView(){
        if ((cut?.ifTimeIsBeaten(time:time))!)  {
            //NSLog("time beaten: cut=\(cut), time=\(t.seconds), event=\(t.distance) \(t.stroke) \(t.course)")
            return self.backgroundColor = UIColor(hue: 0.1861, saturation: 1, brightness: 0.69, alpha: 1.0)
        } else {
            return self.backgroundColor = UIColor.lightGray
        }
    }
    
    @IBOutlet weak var stroke: UILabel!
    
    @IBOutlet weak var distance: UILabel!
    
    @IBOutlet weak var timeDiff: UILabel!
    
    @IBOutlet weak var yourTIme: UILabel!
    
    
    
    @IBAction func ageTextField(_ sender: Any) {
    }
    @IBOutlet weak var neededTime: UILabel!
    
    var time: Time? {
        didSet{
            if let time = time?.seconds {
                yourTIme?.text =  "Your time:\(Time.formatTime(time:time))"
            updateView()
        }
        }
    }
    
    
    
    
    var cut: Cut? {
        didSet{
            if let t = time {
                if let needToDrop = cut?.needToDrop(time: t) {
                    timeDiff?.text = "Need to drop: \(Time.formatTime(time:needToDrop))" } else {
                    self.timeDiff?.text = ""
                }
            }
            if let cutTime = cut?.female {
                neededTime.text = "Needed time:\(Time.formatTime(time: cutTime))"

            }
            stroke?.text = "Stroke:\(cut?.stroke ?? " ")"
            distance?.text = "Distance in yards: \(cut?.distance ?? 0)"
            updateView()
            
        }
        
    }
    
  
    
    
    
}
