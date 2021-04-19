import UIKit

var evenNumber: [Int] = []
let evenNumber2: Array<Int> = [2, 4, 6, 8]

evenNumber.append(10)
evenNumber += [12, 14, 16]

evenNumber.append(contentsOf: [18, 20])


let isEmpty = evenNumber.isEmpty
evenNumber.count

print(evenNumber.first)

//let firstItem = evenNumber.first

if let firstElement = evenNumber.first {// 바인딩
    print(firstElement)
}

evenNumber.min()
evenNumber.max()

var firstItem = evenNumber[0]
var secondItem = evenNumber[1]

let firstThree = evenNumber[0...2]


evenNumber.contains(2)


evenNumber.insert(0, at: 0)
evenNumber


//evenNumber.removeAll()
evenNumber.remove(at: 0)
evenNumber

evenNumber[0] = -2
evenNumber

evenNumber[0...2] = [-2, 0, 2]
evenNumber


evenNumber.swapAt(0, 2)

for num in evenNumber {
    print(num)
}


let fir = evenNumber.dropFirst(3)
evenNumber


//Dictionary

//var scoreDic: [String: Int] = ["Jason": 80, "Jay": 95, "Jake": 90]
var scoreDic: Dictionary<String, Int> = ["Jason": 80, "Jay": 95, "Jake": 90]
if let score = scoreDic["Jason"]{
    score
} else {
    
}
scoreDic["Jason"]

scoreDic["Jarry"]

scoreDic.isEmpty
scoreDic.count


//기존사용자 업데이트
scoreDic["Jason"] = 99


//사용자 추가
scoreDic["Jack"] = 100
scoreDic

//for loop

for (name, score) in scoreDic {
    print("\(name), \(score)")
}

for key in scoreDic.keys{
    print(key)
}


var myDic: [String: String] = ["name": "Bae", "job": "student", "city": "Gumi"]
myDic["city"] = "Busan"
for (question, answer) in myDic {
    print("\(question): \(answer)")
}
func printNameAndCity(dic: [String: String]){
    if let name = dic["name"], let city = dic["city"]{
        print(name, city)
    } else{
        print("--> Cannot find")
    }
}

printNameAndCity(dic: myDic)

