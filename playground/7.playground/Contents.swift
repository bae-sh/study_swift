import UIKit

/*struct Location{
    let x: Int
    let y: Int
}

func distance(current: Location, target: Location) -> Double {
    let distanceX = Double(target.x - current.x)
    let distanceY = Double(target.y - current.y)
    let distance = sqrt(distanceX * distanceX + distanceY * distanceY)
    return distance
}

struct Store{
    let loc: Location
    let name: String
    let deliverRange = 2.0
    func isDeliverable(userLoc: Location) -> Bool {
        let distanceToStore = distance(current: userLoc, target: loc)
        return distanceToStore < deliverRange
    
    }
}

let store1 = Store(loc: Location(x: 3, y: 5), name: "gs")
let store2 = Store(loc: Location(x: 4, y: 6), name: "seven")
let store3 = Store(loc: Location(x: 1, y: 7), name: "cu")


func printCloserStore(currentLocation: Location, stores:[Store]){
    var closestStoreName = " "
    var closestStoreDistance = Double.infinity
    
    for store in stores{
        let distanceToStore = distance(current: currentLocation, target: store.loc)
        closestStoreDistance = min(distanceToStore, closestStoreDistance)
        if closestStoreDistance == distanceToStore {
            closestStoreName = store.name
        }
    }
    print("Closest store: \(closestStoreName)")
}

let myLocation = Location(x: 2, y: 2)
let stores = [store1, store2, store3]

printCloserStore(currentLocation: myLocation, stores: stores)






struct Lecture: CustomStringConvertible {
    var description: String {
        return "Title: \(name), Instructor: \(subject)"
    }
    
    
    let subject: String;
    let name: String;
    let num: Int;
}
func printName(name: String, subject: [Lecture]) -> Void{
    for i in subject{
        if(i.name==name){
            print("\(i.subject)");
        }
    }
}
let teacher1 = Lecture(subject: "math", name: "bae", num: 20);
let teacher2 = Lecture(subject: "korean", name: "kim", num: 20);
let teacher3 = Lecture(subject: "english", name: "gun", num: 20);

let teacher = [teacher1, teacher2, teacher3]
printName(name: "bae", subject: teacher)

print(teacher1)


struct Person {
    var firstName: String {
        willSet {
            print("willSet: \(firstName) --> \(newValue)")
        }
        didSet {
            print("didSet: \(oldValue) --> \(firstName)")
        }
    }
    var lastName: String
    
    lazy var isPopular: Bool = {
        if(fullName == "Jay Park"){
            return true
        }else{
            return false;
        }
    }()
    
    var fullName: String
}*/


//Property 호출시 값을 하나 반환 Method 는 작업을 한다


struct Lecture {
    var title: String
    var maxStudents: Int = 10;
    var numOfRegistered: Int = 0;
    
    func remainSeats() -> Int{
        let remainSeats = maxStudents - numOfRegistered;
        return remainSeats
    }
    
    mutating func register(){// stored property 를 변경하려면 mutating을 사용
        numOfRegistered += 1;
    }
    static func academy() -> String{
        return "패캠"
    }
    static let target: String = "abcd"// lecture에 직접 프로퍼티나 메소드 실행할떄
}

var lec = Lecture(title: "Ios Basic")

lec.register();

Lecture.target
Lecture.academy()

struct Math{
    static func abs(value: Int) -> Int{
        if(value>0){
            return value
        }else{
            return -value;
        }
    }
}

Math.abs(value: -20)

extension Math{
    static func sqaure(value: Int) -> Int{
        return value * value
    }
}

extension Int {
    func sqaure() -> Int{
        return self * self
    }
}
