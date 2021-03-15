//
//  BountyViewController.swift
//  BountyList
//
//  Created by 배성현 on 2021/03/11.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
    let bountyList = [33000000, 50, 4400000, 30000000, 16000000, 80000000, 77000000000, 120000000]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    //UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else{
//            return UITableViewCell()
//        }
//
//        return cell
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell{
            let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
            cell.imgView.image = img
            cell.nameLabel.text = nameList[indexPath.row]
            cell.boutLabel.text = "\(bountyList[indexPath.row])"
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    //UITableViewDelegate : 클릭됐을때
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
    }
}

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var boutLabel: UILabel!
}
