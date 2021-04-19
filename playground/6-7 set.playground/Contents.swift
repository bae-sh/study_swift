import UIKit

var someArray: Array<Int> = [1,2,3,1]
var someSet: Set<Int> = [1,2,3,1]

someSet.isEmpty
someSet.count

someSet.contains(4)

someSet.insert(5)
someSet

//closure : 이름없는 메소드

var multipleyClosure: (Int, Int) -> Int = { $0 * $1 }
var multiply: (Int, Int) -> Int = { a, b in
    return a * b
}
let result = multipleyClosure(4, 2)

func operateTwoNum(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a,b)
    return result
}

operateTwoNum(a: 4, b: 2, operation: multiply)

var addClosure: (Int, Int) -> Int = { a, b in
    return a + b
}
operateTwoNum(a: 4, b: 2, operation: addClosure)

operateTwoNum(a: 4, b: 2){ a, b in
    return a / b
}

let voidClosure: () -> () = {
    print("ios 개발자 짱, 클로저 사랑해")
}
voidClosure()

//Capturing Values

var count = 0

let incrementer = {
    count += 1
}

incrementer()


//let choSimpleClosure: (String) -> String = { name in
//
//    let message = "ios developer, \(name) would get free for economic"
//    return message
//}

//let r = choSimpleClosure("성현")
//print(r)

func someSimpleFunction(message: String, choSimpleClosure: () -> Void){
    print("함수에서 호출이 되었어요 메세지는 \(message)")
    choSimpleClosure()
}

someSimpleFunction (message: "로나로나 메로나", choSimpleClosure: {
    print("1")
})
