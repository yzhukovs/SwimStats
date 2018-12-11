//
//  SearchSwimmerTableViewController.swift
//  SwimStats
//
//  Created by Yvette Zhukovsky on 12/10/18.
//  Copyright © 2018 Yvette Zhukovsky. All rights reserved.
//

import UIKit
import Firebase


class SearchSwimmerViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate {
    
    
    let lsc = "MR"
    let agua = "Asphalt Green Unified Aquatics"
    var aguaID: String!
    let cell = "searchCell"
    var searchedSwimmers = [String]()
    var swimmers = [Swimmer]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
   UIsearch.delegate = self
    tableView.dataSource = self
  tableView.delegate = self
        
      
      

        tableView?.register(userCell.self, forCellReuseIdentifier: cell)

    }
    
    
    @objc func goBack() {
        
        dismiss(animated: true, completion: nil)
    }
   
    
    func fetchUser(searchText: String){
       
        let db = Firestore.firestore()
        db
            .collection("LSCs")
            .document(lsc)
            .collection("Clubs")
            .whereField("name", isEqualTo: agua)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        self.aguaID = document.documentID
                        break
                    }
                    
                    db
                        .collection("LSCs")
                        .document(self.lsc)
                        .collection("Clubs")
                        .document(self.aguaID)
                        .collection("Swimmers")
                        .order(by: "last_name")
                        .start(at: [searchText])
                        .end(at: [searchText + "\u{f8ff}"])
                        .getDocuments { (ds, err) in
                            if let err = err {
                                print("Error getting documents: \(err)")
                            } else {
                                self.swimmers = [Swimmer]()
                                for document in ds!.documents {
                                    let swimmer = Swimmer()
                                    swimmer.setValuesForKeys(document.data())
                                    self.swimmers.append(swimmer)
                                }
                                DispatchQueue.main.async {
                                    self.tableView?.reloadData()
                                }
                                
                            }
                            
                    }
                    
                }
                
        }
    }
    
    // MARK: - Table view data source
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 1
    //    }
   
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return swimmers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cell , for: indexPath)
        // let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "searchCell")
        let swimmer = swimmers[indexPath.row]
        cell.textLabel?.text = swimmer.last_name
        cell.detailTextLabel?.text = swimmer.first_name
        
        return cell
    }
    
    
    class userCell: UITableViewCell {
        override init(style: UITableViewCell.CellStyle , reuseIdentifier: String? ){
            super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        }
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
    }

    
    
    func searchBar(_ UIsearch: UISearchBar, textDidChange searchText: String) {
      
        fetchUser(searchText: searchText)
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ UIsearch: UISearchBar) {
        searching = false
        UIsearch.text = ""
        tableView.reloadData()
    }
    
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
    //}
    
   
    
    
    
    
    
    
    @IBOutlet weak var UIsearch: UISearchBar!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
}
