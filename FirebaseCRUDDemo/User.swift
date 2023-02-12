//
//  User.swift
//  FirebaseCRUDDemo
//
//  Created by Admin on 03/02/23.
//

import Foundation

struct User : Codable {
    var id: String? = nil
    var name: String
    var age: Int
    
    init(id: String? = nil, name: String, age: Int) {
        self.id = id
        self.name = name
        self.age = age
    }
}
