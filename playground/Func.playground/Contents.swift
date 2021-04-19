import UIKit


func printName(){
    print("---> My name is bae")
}

printName()

func printMulipleOfTen(value: Int){
    print("\(value) * 10 = \(value * 10)")
}
printMulipleOfTen(value: 5)

func p(price: Int, count: Int){
    
}
p(price: 1500, count: 0)

func printPrice(price: Int = 1500, count: Int){
    
}

func totalPrice(price: Int, count: Int) -> Int{//반환값
    let totalPrice = price * count
    return totalPrice
}

let calculatedPrice = totalPrice(price: 10000, count: 77)
calculatedPrice
