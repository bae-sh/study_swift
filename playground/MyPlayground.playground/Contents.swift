import UIKit
import Foundation
var str = "Hello, playground"

let value = arc4random_uniform(100)
print("--> \(value)")

let coordinates = (4,6)

let x=coordinates.0;
let y=coordinates.1;

let coordinateNamed = (x: 2, y: 3)

let x2=coordinateNamed.x;
let y2=coordinateNamed.y;

let (x3, y3) = coordinateNamed;
x3
y3


let yes = true
let no = false


let isFourGreaterThanFive = 4 > 5

if isFourGreaterThanFive {
    print("---> 참")
}else{
    print("---> 거짓")
}

let a = 5
let b = 10

let name1 = "Jin"
let name2 = "Jason"

let isTwoNameSame = name1 == name2

if isTwoNameSame{
    print("---> 같다")
}

let greetingMessage = isFourGreaterThanFive ? "1" : "2"


var hours = 50
let payPerHour = 10000
var salary = 0

if hours > 40{
    let extraHours = hours - 40
    salary += extraHours * payPerHour * 2
    hours -= extraHours
}

salary += hours * payPerHour


var i = 0
repeat{
    print(i);
    i += 1
} while i < 10

let closedRange = 0...10
let halfCloseRange = 0..<10

var sum = 0
for i in closedRange {
    print("---> \(i)");
    sum += i
}
print("---> \(sum)")

var sinValue: CGFloat = 0
for i in closedRange {
    sinValue = sin(CGFloat.pi/4 * CGFloat(i))
}

for _ in closedRange {
    
}

for i in 1...3 where i % 2 == 0 {
}

//let num = 10

//case _ where num % 2 == 0:

let coordinate = (x: 0, y: 10)

switch coordinate {
case (0, 0):
    print("")
case (_, 0):
    print()
case (let y, 0):
    print("\(y)")
default:
    <#code#>
}
