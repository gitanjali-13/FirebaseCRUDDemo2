//
//  FIRFirestoreService.swift
//  FirebaseCRUDDemo
//
//  Created by Admin on 04/02/23.
//

import Foundation
import Firebase
import FirebaseFirestore

class FIRFirebaseService {
    
    private init() {}
 
//    let petRef = Firestore.firestore().collection("pets")
    static let shared = FIRFirebaseService()
   
 
    func configure() {
        FirebaseApp.configure()
    }
    
    private func reference(to collectionReference: CollectionReferences) -> CollectionReference {
        return Firestore.firestore().collection(collectionReference.rawValue)
    }
    
    func create < T: Codable > (for encodableObject: T, in collectionReference: CollectionReference) {
        
        do{
            let json = try encodableObject.toJson(excluding: ["id"])
            reference(to: .users).addDocument(data: json)
//            let parameters : [String : Any] = ["name": "kyle",
//                                               "age": 26]
    //        let userRef = Firestore.firestore().collection("users")
    //
           
            
        }catch {
            print(error)
        }
        
        
    }
    func read() {
        
        reference(to: .users).addSnapshotListener { (snapshot, _) in
            guard let snapshot = snapshot else{return}
            for documents in snapshot.documents {
                
                print(documents.data())
            }
        }
    }
    func update() {
        
        reference(to: .users).document("YuEElFCz3WgosyvpPvR3").setData(["age": 20, "name": "Xavier"])
        
    }
    func delete() {
        
//        let userRef = Firestore.firestore().collection("users")
//
        reference(to: .users).document("YuEElFCz3WgosyvpPvR3").delete()
    }
}
