//
//  AppDelegate.swift
//  SwimStats
//
//  Created by Yvette Zhukovsky on 12/8/18.
//  Copyright © 2018 Yvette Zhukovsky. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
//    let lsc = "MR"
//    let agua = "Asphalt Green Unified Aquatics"
//    var aguaID: String!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
//        let db = Firestore.firestore()
//
//        db
//            .collection("LSCs")
//            .document(lsc)
//            .collection("Clubs")
//            .whereField("name", isEqualTo: agua)
//            .getDocuments() { (querySnapshot, err) in
//                if let err = err {
//                    print("Error getting documents: \(err)")
//                } else {
//                    for document in querySnapshot!.documents {
//                        self.aguaID = document.documentID
//                        break
//                    }
//
//                    db
//                        .collection("LSCs")
//                        .document(self.lsc)
//                        .collection("Clubs")
//                        .document(self.aguaID)
//                        .collection("Swimmers")
//                        .order(by: "last_name")
//                        .start(at: ["J"])
//                        .end(at: ["J" + "\u{f8ff}"])
//                        .getDocuments { (ds, err) in
//                            if let err = err {
//                                print("Error getting documents: \(err)")
//                            } else {
//                                for document in ds!.documents {
//                                    print(document.data())
//                                }
//                            }
//                    }
//                }
//        }
        
        
        
        
        
        // Override point for customization after application launch.
        return true
    }
    
    
    
    
    
}

