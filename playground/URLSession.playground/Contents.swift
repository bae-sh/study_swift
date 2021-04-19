import UIKit

//URLSession

//1. URLSessionConfiguration
//2. URLSession
//3. URLSessionTask 를 이용해서 서버와 네트워킹

// URLSessionTask

// -dataTask
// -uploadTask
// -downloadTask

let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)

// URL
// URL Components
var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")!
let mediaQuery = URLQueryItem(name: "media", value: "music")
let entityQuery = URLQueryItem(name: "entity", value: "song")
let termQuery = URLQueryItem(name: "term", value: "지드래곤")
urlComponents.queryItems?.append(mediaQuery)
urlComponents.queryItems?.append(entityQuery)
urlComponents.queryItems?.append(termQuery)
let requestURL = urlComponents.url!

struct Response: Codable {
    let resultCount: Int
    let tracks: [Track]
    
    enum CodingKeys: String, CodingKey {
        
        case resultCount
        case tracks = "results"
    }
}

struct Track: Codable {
    let title: String
    let artistName: String
    let thumbnailPath: String
    
    enum CodingKeys: String, CodingKey {
        
        case title = "trackName"
        case artistName
        case thumbnailPath = "artworkUrl30"
    }
}



let dataTask = session.dataTask(with: requestURL) { (data, response, error) in
    guard error == nil else { return }
    
    guard let statusCode = ( response as? HTTPURLResponse)?.statusCode else { return }
    let successRange = 200..<300
    
    guard successRange.contains(statusCode) else {
        return
    }
    
    guard let resultData = data else { return }
    //let resultString = String(data: resultData, encoding: .utf8)
    
    // 목표: 트랙리스트 오브젝트로 가져오기
    
    // 하고싶은 욕구 목록
    // - Data -> Track 목록으로 가저오고 싶다 [Track]
    // - Track 오브젝트를 만들어야 겠다
    // - Data에서 struct로 파싱하고 싶다 > Codable 이용해서 만들자
    // - Json 파일, 데이터 > 오브젝트 (Codable 이용)
    
    //해야할일
    // -Response, Track, struct
    // struct의 프로퍼티 이름 맞추기
    // 파싱하기
    // 트랙리스트 가저오기
    
    
    //파싱 및 트랙 가저오기
    do {
        let decoder = JSONDecoder()
        let response = try decoder.decode(Response.self, from: resultData)
        let tracks = response.tracks
        
        print("--> tracks: \(tracks.count) \(tracks.first?.title), \(tracks.first?.thumbnailPath)")
    } catch let error {
        print("---> error: \(error.localizedDescription)")
    }
}

dataTask.resume()
