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
    
    @IBOutlet weak var NameLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var BountyLabelCenterX: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        prepareAnimation()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
    }
    
    private func prepareAnimation() {
//        NameLabelCenterX.constant = view.bounds.width
//        BountyLabelCenterX.constant = view.bounds.width
        
        nameLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180);
        bountyLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180);
        
    }
    
    private func showAnimation() {
//        NameLabelCenterX.constant = 0
//        BountyLabelCenterX.constant = 0
//        
//        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
//            self.view.layoutIfNeeded()
//        }, completion: nil)
//        
//        UIView.transition(with: imgView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            
            self.nameLabel.transform = CGAffineTransform.identity
            self.nameLabel.alpha = 1;
               }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            
            self.bountyLabel.transform = CGAffineTransform.identity
            self.bountyLabel.alpha = 1 ;
               }, completion: nil)
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
