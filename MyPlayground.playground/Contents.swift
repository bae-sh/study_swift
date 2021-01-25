import UIKit

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
