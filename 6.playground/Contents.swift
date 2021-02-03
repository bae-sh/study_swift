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
