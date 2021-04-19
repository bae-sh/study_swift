import UIKit



// Queue - Main, Global, Custom

// Main UI와 관련된건 메인 쓰레드 무조껀 async
DispatchQueue.main.async {
    //UI update
    let view = UIView()
    view.backgroundColor =  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
}

// Global
DispatchQueue.global(qos: .userInteractive).async {
    // 우선순위 1등
    
}
DispatchQueue.global(qos: .userInitiated).async {
    // 우선순위 2등
}

DispatchQueue.global(qos: .default).async {
    // 이건 굳이?? 3등 == global() 과 같음
}
DispatchQueue.global().async {
//    위와 같음
}
DispatchQueue.global(qos: .utility).async {
    //사용자가 당장 기다리지 않는것, 네트워킹, 디스크에서 큰파일 불러올때
}
DispatchQueue.global(qos: .background).async {
    //사용자 한테 당장 인식필요 없음, 뉴스데이터 미리받기, 위치업데이트, 항상 다운받는것
}

// Custom Queue
let concurentQueue = DispatchQueue(label: "concurrent", qos: .background, attributes: .concurrent)

// 복합적인 상황

func downloadImageFromServer() -> UIImage {
    //Heavy Task
    return UIImage()
}
func updateUI(image: UIImage){
    
}
DispatchQueue.global(qos: .background).async {
    let image = downloadImageFromServer()
    DispatchQueue.main.async {
        updateUI(image: image)
    }
}

//Sync, Async

// Async

DispatchQueue.global(qos: .background).sync {
    for i in 0...5{
        print("😘 \(i)")
    }
}

DispatchQueue.global(qos: .userInteractive).async {
    for i in 0...5{
        print("😈 \(i)")
    }
}
