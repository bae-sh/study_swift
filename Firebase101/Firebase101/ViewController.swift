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
    
    var customers: [Customer] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
    }
    
    func updateLabel() {
        db.child("firstData").observeSingleEvent(of: .value) { snapshot in
            var value = snapshot.value as? String ?? ""
            if value == "" {
                value = "Hello, Firebase!!!!"
                self.db.child("firstData").setValue(value)
            }
            DispatchQueue.main.async {//네트워크에서 불러올땐 async를 사용.
                self.dataLabel.text = value
            }
        }
        fetchCustomers()
    }
    
    @IBAction func creatCustomer(_ sender: Any) {
        saveCustomers()
        fetchCustomers()
    }
    
    @IBAction func fetchCustomer(_ sender: Any) {
        fetchCustomers()
    }
    
    func updateCustomer() {
        guard customers.isEmpty == false else { return }
        customers[0].name = "Min"
        
        let dictionary = customers.map { $0.toDic }
        db.updateChildValues(["customers": dictionary])
    }
    
    @IBAction func updateCustomer(_ sender: Any) {
        updateCustomer()
    }
    func deleteCustomer() {
        db.child("customers").removeValue()
        customers.removeAll()
        fetchCustomers()
        Customer.id = 0
    }
    
    @IBAction func deleteCustomer(_ sender: Any) {
        deleteCustomer()
    }
    
}

//MARK: read data
extension ViewController {
    
    func saveCustomers() {
        let books = [Book(title: "Good to Great", author: "Someone"), Book(title: "1234", author: "some")]
        
        let customer1 = Customer(id: "\(Customer.id)", name: "Son", books: books )
        Customer.id+=1
        let customer2 = Customer(id: "\(Customer.id)", name: "Kim", books: books )
        Customer.id+=1

        db.child("customers").child(customer1.id).setValue(customer1.toDic)
        db.child("customers").child(customer2.id).setValue(customer2.toDic)
    }
    
    func fetchCustomers(){
        db.child("customers").observeSingleEvent(of: .value) { snapshot in
            do{
                guard snapshot.exists() else {
                    DispatchQueue.main.async {
                        self.numberOfCustomers.text = "# of Customers: 0"
                    }
                    return
                }
                let data = try JSONSerialization.data(withJSONObject: snapshot.value, options: [])
                
                let decoder = JSONDecoder()
                let customers: [Customer] = try decoder.decode([Customer].self, from: data)
                self.customers = customers
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
    var name: String
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
