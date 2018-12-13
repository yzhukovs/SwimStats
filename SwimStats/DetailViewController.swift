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
        swimmer?.ref?
            .collection("Times")
            .order(by: "date", descending: true)
            .getDocuments { (ds, err) in
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
    
    
    func getCategory(stroke: String?, course: String?, distance: Int?) {
        guard var q: Query = swimmer?.ref?.collection("Times") else {return}
        
        if let stroke = stroke {
            q = q.whereField("stroke", isEqualTo: stroke)
        }
        
        if let course = course {
            q = q.whereField("course", isEqualTo: course)
        }
        
        if let distance = distance {
            q = q.whereField("distance", isEqualTo: distance)
        }
 
        q.getDocuments { (ds, err) in
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
        
        
        if let cell = cell as? DetailTableViewCell {
            cell.times = times[indexPath.row]
        }
        
        return cell
    }
    
    var swimmers = [Swimmer]()
    var swimmer: Swimmer?
    var favSwimmer: Swimmer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        updateViews()
        getTimes()
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        User.isFavorite(
            swimmerRef: (swimmer?.ref!)!,
            completion: self.updateFavoriteButton
        )
    
  //segControlStroke.selectedSegmentIndex = segControlStroke
    
    }
    
    
    func updateViews(){
        
        guard let swim = swimmer else {return }
        self.title = swim.first_name! + " " + swim.last_name!
        

        
    }
    
    
    
   
    
    // MARK: - Navigation
    
   // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCuts" {
            let detailVC = segue.destination as! CutsTableViewController
            guard let index = tableView.indexPathForSelectedRow?.row else { return }
            detailVC.swimmer = swimmers[index]
        }
        
    }
    
    

    
    
    @IBOutlet weak var tblView_times: UITableView!
    
    
    @IBOutlet weak var addToFav: UIBarButtonItem!
    
    
    @IBAction func addToFavorites(_ sender: Any) {
        User.isFavorite(
            swimmerRef: (swimmer?.ref!)!,
            completion: self.addFavoritesCompletion
        )
    }
  
    private func updateFavoriteButton(isFavorite: Bool?, err: Error?) -> Void {
        if let _ = err {return}
        self.addToFav.title = isFavorite! ? "⭐️" : "✩"
    }
    
    private func addFavoritesCompletion(fav: Bool?, err: Error?) -> Void {
        if let _ = err {
            return
        }
        
        if fav! {
            User.removeFavorites(swimmerRef: (self.swimmer?.ref!)!)
        } else {
            User.addFavorite(swimmerRef: (self.swimmer?.ref!)!)
        }
        DispatchQueue.main.async {
            self.updateFavoriteButton(isFavorite: !fav!, err: nil)
        }
    }
    
 
    
    override func viewDidAppear(_ animated: Bool) {
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.yellow

    }
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
  

    @IBOutlet weak var segControlStroke: UISegmentedControl!
    
    
    
    
    var strokeIndex = 0
    var stroke: String? {
        if strokeIndex == 0 { return "FR"}
        if strokeIndex == 1 {return "BK" }
        if strokeIndex == 2 {return "BR"}
        if strokeIndex == 3 {return "FL" }
        if strokeIndex == 4 {return "IM"}
   return "FR"
    }

    var courseIndex = 0
    var course: String? {
        if courseIndex == 0 {return "SCY" }
        if courseIndex == 1 {return "LCM" }
        return "SCY"
    }


    var distanceIndex = 0
    var distance: Int? {
        if distanceIndex == 0 {return nil}
        if distanceIndex == 1 {return 25 }
        if distanceIndex == 2 {return 50 }
        if distanceIndex == 3 {return 100}
        if distanceIndex == 4 {return 200}
        if distanceIndex == 5 {return 400}
        if distanceIndex == 6{return 800}
        if distanceIndex == 7 {return 1000}
        if distanceIndex == 8 {return 1650}
          return nil
    }

    
    //25, 50, 100, 200, 400, 800, 1000, 1650
    
    
    @IBAction func segStroke(_ sender: Any) {
      strokeIndex = segControlStroke.selectedSegmentIndex
       getCategory(stroke: stroke, course: course, distance: distance)
        

    }
 
    
    @IBAction func courseSeg(_ sender: Any) {
        courseIndex = segCourse.selectedSegmentIndex
        getCategory(stroke: stroke, course: course, distance: distance)
    }
    
    @IBOutlet weak var segCourse: UISegmentedControl!
    
    
    
    @IBAction func distanceSeg(_ sender: Any) {
        distanceIndex = segDistance.selectedSegmentIndex
         getCategory(stroke: stroke, course: course, distance: distance)
    }
    
    
    @IBOutlet weak var segDistance: UISegmentedControl!
    
    
//
//    @IBAction func courseBarB(_ sender: Any) {
//        showAlertWithThreeButton()
//    }
//
//
//
//    func showAlertWithThreeButton() {
//        let alert = UIAlertController(title: "Course", message: "Please pick SCY(short course) or LCM (long course)", preferredStyle: .alert)
//
//        alert.addAction(UIAlertAction(title: "SCY", style: .default, handler: { (_) in
//            self.swimmer?.ref?
//                .collection("Times")
//                .whereField("course", isEqualTo: "SCY")
//                .getDocuments { (ds, err) in
//                    if let err = err {
//                        print("Error getting documents: \(err)")
//                    } else {
//                        self.times = [Time]()
//                        for document in ds!.documents {
//                            let time = Time()
//
//                            time.setValuesForKeys(document.data())
//                            self.times.append(time)
//
//                        }
//                        DispatchQueue.main.async {
//                            self.tableView?.reloadData()
//                        }
//
//                    }
//            }
//
//
//        }))
//
//        alert.addAction(UIAlertAction(title: "LCM", style: .default, handler: { (_) in
//            self.swimmer?.ref?
//                .collection("Times")
//                .whereField("course", isEqualTo: "LCM")
//                .getDocuments { (ds, err) in
//                    if let err = err {
//                        print("Error getting documents: \(err)")
//                    } else {
//                        self.times = [Time]()
//                        for document in ds!.documents {
//                            let time = Time()
//
//                            time.setValuesForKeys(document.data())
//                            self.times.append(time)
//
//                        }
//                        DispatchQueue.main.async {
//                            self.tableView?.reloadData()
//                        }
//
//                    }
//            }
//
//        }))
//
//        self.present(alert, animated: true, completion: nil)
//    }
   
    
    
    
    
    @IBAction func cuts(_ sender: Any) {
        
        
    }
    
    
    
    
}
