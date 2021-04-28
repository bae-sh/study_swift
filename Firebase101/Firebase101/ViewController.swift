//
//  ViewController.swift
//  Firebase101
//
//  Created by 배성현 on 2021/04/28.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var numberOfCustomers: UILabel!
    let db = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
//        saveBasicTypes()
//        saveCustomers()
        fetchCustomers()
    }
    
    func updateLabel() {
        db.child("firstData").observeSingleEvent(of: .value) { snapshot in
            let value = snapshot.value as? String ?? ""
            
            DispatchQueue.main.async {
                self.dataLabel.text = value
            }
        }
    }

}


extension ViewController {
    func saveBasicTypes() {
        db.child("int").setValue(3)
        db.child("double").setValue(2.5)
        db.child("str").setValue("321")
        db.child("array").setValue(["a","b","c"])
        db.child("dict").setValue(["id": "anyId", "age": "10", "city": "seoul"])
    }
    
    func saveCustomers() {
        let books = [Book(title: "Good to Great", author: "Someone"), Book(title: "1234", author: "some")]
        
        let customer1 = Customer(id: "\(Customer.id)", name: "Son", books: books )
        Customer.id+=1
        let customer2 = Customer(id: "\(Customer.id)", name: "Son2", books: books )
        Customer.id+=1

        db.child("customers").child(customer1.id).setValue(customer1.toDic)
        db.child("customers").child(customer2.id).setValue(customer2.toDic)
    }
}

//MARK: read data
extension ViewController {
    func fetchCustomers(){
        db.child("customers").observeSingleEvent(of: .value) { snapshot in
            print("---> \(snapshot.value)")
            
            do{
                let data = try JSONSerialization.data(withJSONObject: snapshot.value, options: [])
                
                let decoder = JSONDecoder()
                let customers: [Customer] = try decoder.decode([Customer].self, from: data)
                DispatchQueue.main.async {
                    self.numberOfCustomers.text = "# of Customers: \(customers.count)"
                }
                
            }catch let error {
                print("---> error \(error.localizedDescription)")
            }
        }
    }
}
struct Customer: Codable{
    let id: String
    let name: String
    let books: [Book]
    
    var toDic: [String: Any] {
        let booksArray = books.map { $0.toDic }
        let dict: [String: Any] = ["id": id, "name": name, "books": booksArray]
        return dict
    }
    static var id: Int = 0
}

struct Book: Codable {
    let title: String
    let author: String
    
    var toDic: [String: Any] {
        let dict: [String: Any] = ["title": title, "author": author]
        return dict
    }
}
