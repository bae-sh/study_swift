//
//  BountyViewController.swift
//  Bounty_Review
//
//  Created by 배성현 on 2021/03/19.
//

import UIKit

class BountyViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    
    // MVVM
    
    // Model
    //- bountyInfo
    //> bountyInfo 만들기
    
    
    // View
    //- ListCell
    //> ListCell 필요한 정보를 ViewModel한테서 받아야 겠다
    //> ListCell은 ViewModel로 부터 받은 정보로 뷰 업데이트 하기
    
    //ViewModel
    // - BountyViewModel
    // > BountyViewModel을 만들고 뷰레이어에서 필요한 메소드 만들기
    // > 모델 가지고 있기 .. BountyInfo 등
    
    
    
    let viewModel = BountyViewModel();
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                let bountyInfo = viewModel.bountyInfo(at: index)
                vc?.viewModel.update(model: bountyInfo)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfBountyInfoList;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as? GridCell else{
            return UICollectionViewCell()
        }
        let bountyInfo = viewModel.bountyInfo(at: indexPath.item)
        cell.update(info: bountyInfo)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.item)
    }
//    UICollectionViewDataSource,
//    몇개를 보여줄까요?
//    셀은 어떻게 표현할까요?
    
    
//    UICollectionViewDelegate,
//    셀이 클릭되었을때 어쩔까요?
    
    
//    UICollectionViewDelegateFlowLayout
//    cell size 를 계산할거다 (목표: 다향 디바이스에서 일관적인 디자인을 보여주기 위해)
    
//    //UITableViewDataSource
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.numOfBountyInfoList;
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else{
//            return UITableViewCell()
//        }
//
//        let bountyInfo = viewModel.bountyInfo(at: indexPath.row)
//        cell.update(info: bountyInfo)
//
//        return cell
//    }

    //UITableViewDelegate
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
//    }
}


class GridCell: UICollectionViewCell{
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var bountyLabel: UILabel!
    
    func update(info: BountyInfo) {
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
}



class BountyViewModel {
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 44000000),
        BountyInfo(name: "luffy", bounty: 300000000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "robin", bounty: 80000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "zoro", bounty: 120000000)
    ]
    
    var sortedList: [BountyInfo] {
        let sortedList = bountyInfoList.sorted {prev, next in
            return prev.bounty > next.bounty
        }
        
        return sortedList
    }
    var numOfBountyInfoList: Int {
        return bountyInfoList.count
    }
    
    func bountyInfo(at index: Int) -> BountyInfo{
        return sortedList[index]
    }
}
