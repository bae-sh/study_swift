//
//  BountyInfo.swift
//  Bounty_Review
//
//  Created by 배성현 on 2021/03/22.
//

import UIKit

struct BountyInfo {
    let name: String
    let bounty: Int
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    init(name: String, bounty: Int){
        self.name = name
        self.bounty = bounty
    }
}
