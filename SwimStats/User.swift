//
//  User.swift
//  SwimStats
//
//  Created by Yvette Zhukovsky on 12/11/18.
//  Copyright © 2018 Yvette Zhukovsky. All rights reserved.
//

import UIKit
import Firebase

class User {
    
    private static let userId = UIDevice.current.identifierForVendor!.uuidString
    private static let db = Firestore.firestore()
    public var swimmers = [Swimmer]()
    
    static func addFavorite(swimmerRef: DocumentReference) {
        let ref = db
            .collection("Users")
            .document(userId)
            .collection("Favorites")
            .document()
        ref.setData(["swimmer_ref":swimmerRef])
        
    }
    
    
    static func getFavorites(completion: @escaping (Swimmer?, Error?) -> Void) {
        db
            .collection("Users")
            .document(userId)
            .collection("Favorites")
            .getDocuments { (favoriteDocs, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    completion(nil, err)
                    return
                }
                for favoriteDoc in favoriteDocs!.documents {
                    let swimmerRef = favoriteDoc.data()["swimmer_ref"]! as! DocumentReference
                    swimmerRef.getDocument(completion: { (swimmerDoc, err) in
                        if let err = err {
                            print("Error getting documents: \(err)")
                            completion(nil, err)
                            return
                        }
                        let swimmer = Swimmer()
                        swimmer.ref = swimmerDoc!.reference
                        swimmer.setValuesForKeys(swimmerDoc!.data()!)
                        completion(swimmer, nil)
                    })
                
                }
                
        }
        
        
        
        
        
        
      
    }
    
    
    static func removeFavorites(swimmerRef: DocumentReference){
        db
            .collection("Users")
            .document(userId)
            .collection("Favorites")
            .whereField("swimmer_ref", isEqualTo: swimmerRef)
            .getDocuments() {
                (ds, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in ds!.documents {
                 document.reference.delete()
                        
                       
                    }
                   
                    
                }
                
                
        }
        
    }
    
    
}





