//
//  ViewController.swift
//  FirebaseCRUDDemo
//
//  Created by Admin on 03/02/23.
//

import UIKit

class ViewController: UITableViewController {
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let xavier = User(name: "Xavier", age: 25);   FIRFirebaseService.shared.create(for: xavier, in: users)
        //        FIRFirebaseService.shared.read()
        //        FIRFirebaseService.shared.update()
        //        FIRFirebaseService.shared.delete()
        let xavier = User(name: "xavier", age: 30)
        FIRFirebaseService.shared.create(for: xavier, in: .users)
        
    }
    
    @IBAction func onAddTapped () {
        
        AlertService.addUser(in: self) { user in
            print(user)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = String(user.age)
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        AlertService.update(user ,in: self) {  upadetedUser in
            print(upadetedUser)
            
        }
        
        
        //func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath ) {
        //        guard editingStyle == .delete else{return}
        //    }
        
//        func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//                guard editigstyle
//
//
//        }
        
        
        
    }
    
}
