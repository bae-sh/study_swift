//
//  SearchViewController.swift
//  MyNetflix
//
//  Created by joonwon lee on 2020/04/02.
//  Copyright © 2020 com.joonwon. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var resultCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}


extension SearchViewController: UISearchBarDelegate {
    
    private func dismissKeyboard(){
        searchBar.resignFirstResponder()
    }
    //인스턴스 메소드
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //검색 시작
        
        //키보드가 올라와 있을떄 내려가게 처리
        dismissKeyboard()
        // 검색어가 있는지
        guard let searchTerm = searchBar.text, searchTerm.isEmpty == false else { return }
        //네트워킹을 통한 검색
        //- 서치텀을 가지고 네트워킹을 통해 영화 검색
        //- 검색 api가 필요
        //- 결과를 받아올 모델 Movie, Resonse
        //- 결과를 받아와서, CollectionView로 표현해주자
        
        SearchAPI.search(searchTerm) { movies in
            //CollectionView 로 표현하기
        }
        print("--> 검색어: \(searchTerm)")
    }
}

class SearchAPI {
    //타입 메소드
    static func search(_ term: String, completion: @escaping ([Movie]) -> Void) {
        let session = URLSession(configuration: .default)
        
        
        
        let dataTask = session.dataTask(with: URL) { data, response, error in
            let successRange = 200..<300
            
            guard error == nil, let statusCode = {response as? HTTPURLResponse}?.statusCode, successRange.contains(statusCode) else {
                completion([])
                return
            }
            
            
            
        }
    }
}

struct Response {
    
}

struct Movie {
    
}
