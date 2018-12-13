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
       guard let t = time else {return}
        if (cut?.ifTimeIsBeaten(time:t) ?? false) {
        return self.backgroundColor = UIColor.green
        } else { return self.backgroundColor = UIColor.lightGray
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
            yourTIme?.text =  "Your time:\( time?.seconds ?? 0.00)"
            updateView()
        }
        
    }
    
    
    
    
    var cut: Cut? {
        didSet{
            if let t = time {
                if let needToDrop = cut?.needToDrop(time: t) {
                    timeDiff?.text = "Need to drop: \(needToDrop)" } else {
                        self.timeDiff?.text = ""
                    
                }
            }
            neededTime.text = "Needed time:\(cut?.female ?? 0.00)"
            stroke?.text = "Stroke:\(cut?.stroke ?? " ")"
            distance?.text = "Distance in yards: \(cut?.distance ?? 0)"
           updateView()
            
        }
        
    }
    
    
}
