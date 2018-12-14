//
//  DetailTableViewCell.swift
//  SwimStats
//
//  Created by Yvette Zhukovsky on 12/11/18.
//  Copyright © 2018 Yvette Zhukovsky. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
   
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    var times: Time? {
        didSet {
            if let swimTime = times?.seconds {
                time?.text = Time.formatTime(time: swimTime)
            }
            distance?.text = "Distance: \(String(describing:times?.distance ?? 0))"
            stroke?.text = times?.stroke
            date?.text = toString(date:(times?.date)!)
            meet?.text = times?.meet
        }
        
    }
    
    func toString(date: NSDate)-> String{
       // let date = NSDate() // Get Todays Date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
       return  dateFormatter.string(from: date as Date)

    }
    
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var distance: UILabel!
    
    @IBOutlet weak var stroke: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var meet: UILabel!
}
