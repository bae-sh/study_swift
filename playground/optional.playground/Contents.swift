import UIKit

//optional

var carName: String?
carName = nil
carName = "땡크"

var myFavoriteActor: String? = nil
let num = Int("10")


// 고급 기능 4가지

//Fored unwrapping > 억지로 박스를 까보기
//Optional binding (if let) > 부드럽게 박스를 까보자 1
//Optional binding (guard) > 부드럽게 박스를 까보자 2
//Nil coalescing > 박스를 까봤더니, 값이 없으면 디폴트 값을 까보자

//carName = nil
//print(carName!)

carName = nil
if let unwrappedCarName = carName{
    print(unwrappedCarName)
}else{
    print("Car Name 없다")
}

//func printParseInt(from: String){
//    if let parsedInt = Int(from){
//        print(parsedInt)
//    }else{
//        print("Int로 칸버팅 x")
//    }
//}

func printParseInt(from: String){
    guard let parsedInt = Int(from) else {
        print("Int로 칸버팅 x")
        return
    }
    
    print(parsedInt)
}
//printParseInt(from: "100")


let myCarName: String = carName ?? "모델 S"

// 도전과제

let favoriteFood: String? = nil

if let foodName = favoriteFood {
    print(foodName)
}else{
    print("없음")
}

func printNickName (nickName: String?){
    guard let name = nickName else {
        print("없음")
		return
    }
	print(name)
}

