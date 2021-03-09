import UIKit

//
//struct PersonStruct{
//    var firstName: String
//    var lastName: String
//
//    init(firstName: String, lastName: String){
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//
//    var fullName: String{
//        return "\(firstName) \(lastName)"
//    }
//
//    mutating  func uppercaseName(){
//        firstName = firstName.uppercased()
//        lastName = lastName.uppercased()
//    }
//}
//
//class PersonClass {
//    var firstName: String
//    var lastName: String
//
//    init(firstName: String, lastName: String){
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//    var fullName: String{
//        return "\(firstName) \(lastName)"
//    }
//
//    func uppercaseName(){
//        firstName = firstName.uppercased()
//        lastName = lastName.uppercased()
//    }
//}
//
//var personStruct1 = PersonStruct(firstName: "Jason", lastName: "Lee")
//var personStruct2 = personStruct1
//
//var personClass1 = PersonClass(firstName: "Jason", lastName: "Lee")
//var personClass2 = personClass1
//
//
//personStruct2.firstName = "Jay"
//personStruct1.firstName
//personStruct2.firstName
//
//personClass2.firstName = "Jay"
//personClass1.firstName
//personClass2.firstName
//
//personClass2 = PersonClass(firstName: "Bob", lastName: "Lee")
//personClass1.firstName
//personClass2.firstName
//
//personClass1 = personClass2
//personClass1.firstName
//personClass2.firstName// 일단 struct 로 만들고 class 로 변환
//
//struct Grade {
//    var letter: Character
//    var points: Double
//    var credits: Double
//}
//
//class Person{
//    var firstName: String
//    var lastName: String
//
//    init(firstName: String, lastName: String){
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//
//    func printMyName() {
//        print("My name is ")
//    }
//}
//
//class student: Person{
//    var grades: [Grade] = []
//}
//
//let jay = Person(firstName: "Jay", lastName: "lee")
//let jason = student(firstName: "jason", lastName: "lee")
//
//
//let math = Grade(letter: "B", points: 8.5, credits: 4)
//
//jason.grades.append(math)
//
//
//class StudentAthelete: student{
//    var minimunTrainingTime: Int = 2
//    var trainedTime: Int = 0
//
//    func train(){
//        trainedTime += 1
//    }
//}
//
//class FootballPlayer: StudentAthelete{
//    var footballTeam: String = "FC swift"
//
//    override func train() {
//        trainedTime += 2
//    }
//}
//
//var athelete1 = StudentAthelete(firstName: "Yina", lastName: "Kim")
//var athelete2 = FootballPlayer(firstName: "Heung", lastName: "Son")
//
//athelete1.firstName
//athelete2.firstName
//
//athelete1.grades.append(math)
//athelete2.grades.append(math)
//
//athelete1.minimunTrainingTime
//athelete2.minimunTrainingTime
//
//athelete2.footballTeam
//
//athelete1.train()
//athelete1.trainedTime
//
//athelete2.train()
//athelete2.trainedTime
//
//athelete1 = athelete2 as StudentAthelete
//athelete1.train()
//athelete1.trainedTime
//
//if let son = athelete1 as? FootballPlayer {
//    print("--> team \(son.footballTeam)")
struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}
class Person{
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String){
        self.firstName = firstName
        self.lastName = lastName
    }

    func printMyName() {
        print("My name is ")
    }
}
class student: Person{
    var grades: [Grade] = []
    
    override init(firstName: String, lastName: String) {
        super.init(firstName: firstName, lastName: lastName)
    }
    
    convenience init(st: student){
        self.init(firstName: st.firstName, lastName: st.lastName)
    }
}

let jay = Person(firstName: "Jay", lastName: "lee")
let jason = student(firstName: "jason", lastName: "lee")


let math = Grade(letter: "B", points: 8.5, credits: 4)

jason.grades.append(math)


class StudentAthelete: student{
    var minimunTrainingTime: Int = 2
    var trainedTime: Int = 0
    var sports: [String]
    
    init(firstName: String, lastName: String, sports: [String]){
        //phase 1
        self.sports = sports
        super.init(firstName: firstName, lastName: lastName)
        
        //phase 2
        self.train()
    }
    
    
    convenience init(name: String){
        self.init(firstName: name, lastName: "", sports: [])
    }
    
    
    func train(){
        trainedTime += 1
    }
}

class FootballPlayer: StudentAthelete{
    var footballTeam: String = "FC swift"
    
    override func train() {
        trainedTime += 2
    }
}
var student1 = student(firstName: "sh", lastName: "bae")
var student2 = StudentAthelete(firstName: "ss", lastName: "bae", sports: ["baseball"])
let student3 = StudentAthelete(name: "Mike")

