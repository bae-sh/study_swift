import UIKit


// URL
/*
let URLString = "https://my.speakypeaky.com/lesson-details/5c0dfb3d744d2614b1a53e53/false/false"
let url = URL(string: URLString)

url?.absoluteString
url?.scheme
url?.host
url?.path
url?.query
url?.baseURL

let baseURL = URL(string: "https://my.speakypeaky.com")
let relativeURL = URL(string: "lesson-details/5c0dfb3d744d2614b1a53e53/false/false", relativeTo: baseURL)

relativeURL?.absoluteString
relativeURL?.scheme
relativeURL?.host
relativeURL?.path
relativeURL?.query
relativeURL?.baseURL


//URLComponets

var urlComponets = URLComponents(string: <#T##String#>)*/

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

let dataTask = session.dataTask(with: requestURL) { (data, response, error) in
    guard error == nil else { return }
    
    guard let statusCode = ( response as? HTTPURLResponse)?.statusCode else { return }
    let successRange = 200..<300
    
    guard successRange.contains(statusCode) else {
        return
    }
    
    guard let resultData = data else { return }
    let resultString = String(data: resultData, encoding: .utf8)
    
    print("---> result:  \(resultString)" )
}

dataTask.resume()
