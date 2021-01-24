//
//  ViewController.swift
//  1
//
//  Created by 배성현 on 2021/01/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func hello(_ sender: Any) {
        let alert = UIAlertController(title: "hello", message: "hi", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    

}

