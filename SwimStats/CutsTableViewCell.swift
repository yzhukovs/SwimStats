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

    
    
    @IBOutlet weak var stroke: UILabel!
    
    @IBOutlet weak var distance: UILabel!
    
    @IBOutlet weak var timeDiff: UILabel!
    
    @IBOutlet weak var yourTIme: UILabel!

    
    
    @IBAction func ageTextField(_ sender: Any) {
    }
    @IBOutlet weak var neededTime: UILabel!
    
    var time: Time? {
        didSet{
            yourTIme?.text = String(describing: time?.seconds)
        }
        
    }
    
    
    
    
    var cut: Cut? {
        didSet{
           stroke?.text = cut?.stroke
            distance?.text = String(describing: cut!.distance)
            
        }
        
    }
    
    
}
