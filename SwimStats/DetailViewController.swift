//
//  DetailViewController.swift
//  SwimStats
//
//  Created by Yvette Zhukovsky on 12/11/18.
//  Copyright © 2018 Yvette Zhukovsky. All rights reserved.
//

import UIKit
import Firebase

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    func getTimes(){
     swimmer?.ref?.collection("Times").getDocuments { (ds, err) in
        if let err = err {
           print("Error getting documents: \(err)")
        } else {
            self.times = [Time]()
            for document in ds!.documents {
                let time = Time()
            
                time.setValuesForKeys(document.data())
                self.times.append(time)
                
            }
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
            
        }
        }
    }
    


var times = [Time]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        let time = times[indexPath.row]
        cell.textLabel?.text = "time:\(String(describing: time.date))"
        
        return cell
    }
    
    
    var swimmer: Swimmer?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        getTimes()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    func updateViews(){
        
      guard let swim = swimmer else {return }
        self.title = swim.first_name
        first_name?.text = swim.first_name
        last_name.text = swim.last_name
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBOutlet weak var first_name: UILabel!
    
    @IBOutlet weak var last_name: UILabel!
    
    
    @IBOutlet weak var tblView_times: UITableView!
    
    
    @IBAction func addToFavorites(_ sender: Any) {
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
}
