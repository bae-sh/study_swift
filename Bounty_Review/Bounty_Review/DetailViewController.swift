//
//  DetailViewController.swift
//  Bounty_Review
//
//  Created by 배성현 on 2021/03/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MVVM
    
    // Model
    //- bountyInfo
    //> bountyInfo 만들기
    
    
    // View
    //- imgView, nameLabel, bountylabel
    //> view들은 viewModel를 통해서 구성되기?
    
    //ViewModel
    // - DetailViewModel
    // > BountyViewModel을 만들고 뷰레이어에서 필요한 메소드 만들기
    // > 모델 가지고 있기 .. BountyInfo 등
    
    let viewModel = DetailViewModel()
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var bountyLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }
    
    func updateUI(){
        
        if let bountyInfo = viewModel.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
            
    }
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

class DetailViewModel {
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?) {
        bountyInfo = model
    }
}
