//
//  CutsTableViewController.swift
//  SwimStats
//
//  Created by Yvette Zhukovsky on 12/12/18.
//  Copyright © 2018 Yvette Zhukovsky. All rights reserved.
//

import UIKit


class CutsTableViewController: UITableViewController {
    
    @IBOutlet var cutsDelegate: CutsPickerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.yellow
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        cutsDelegate.parent = self
        meetPicker.dataSource = cutsDelegate
        meetPicker.delegate = cutsDelegate
        
        
        cutsDelegate.pickerView(meetPicker, didSelectRow: 0, inComponent: 0)
        meetPicker.transform = CGAffineTransform(scaleX: 0.5, y: 0.8)
        
        // Adjust the firstPicker
        // self.meetPicker.frame = CGRect(0,0,theWidth,self.meetPicker.frame.size.height);
        
        // Adjust the secondPicker
        //self.agePicker.frame = CGRect(theWidth, 0, theWidth,self.agePicker.frame.size.height)
    }
    
    
    var swimmer: Swimmer?
    var times: [Time]?
    var pickedCuts = Cuts.Available[0].cuts
    //var age: Int?
    let age = 11
    // MARK: - Table view data source
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 0
    //    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pickedCuts.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cutsCell", for: indexPath)
        
        if let cell = cell as? CutsTableViewCell {
            let cut = pickedCuts[indexPath.row]
            cell.cut = cut
            cell.time = times?
                .filter({ cut.timeMatches(time: $0)  })
                .sorted(by: { (a, b) -> Bool in
                    Double(truncating: a.seconds!) < Double(truncating: b.seconds!)
                })
                .first
            
            /*if let t = cell.time {
                NSLog("matches: \(cut) -> \(t.distance) \(t.stroke) \(t.course) \(t.seconds)")
            }*/
            
        }
        
        return cell
    }
    
    
    
    
    @IBOutlet weak var meetPicker: UIPickerView!
    
    
    
    
    
    
    
    @IBOutlet weak var agePicker: UIPickerView!
    
    
    
    
}

class CutsPickerDelegate: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    var parent: CutsTableViewController?
    var cuts: Cuts?
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Cuts.Available.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cuts = Cuts.Available[row]
        updateViews()
        
    }
    
    func updateViews() {
        guard let cuts = cuts  else { return}
        parent?.pickedCuts = cuts.cuts.filter({$0.age(parent!.age)})
        parent?.tableView.reloadData()
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  Cuts.Available[row].name
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
   
    
    
    
    
    
}
