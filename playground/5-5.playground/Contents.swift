import UIKit

func print_first(Last: String, First: String){
    print("\(Last) \(First)")
}
func print_Second(_ Last: String, _ First: String){
    print("\(Last) \(First)")
}
func print_Third(Last: String, First: String) -> String{
    return "\(Last) \(First)"
}
print_first(Last: "bae", First: "sh")
print_Second("bae", "sh")
let fullName = print_Third(Last: "bae", First: "sh")
